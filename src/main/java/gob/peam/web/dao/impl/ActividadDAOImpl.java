/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gob.peam.web.dao.impl;

import gob.peam.web.dao.ActividadDAO;
import gob.peam.web.dao.SQLCloseable;
import gob.peam.web.model.Actividad;
import gob.peam.web.utilities.BEAN_CRUD;
import gob.peam.web.utilities.BEAN_PAGINATION;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.logging.Logger;
import javax.sql.DataSource;

/**
 *
 * @author Juan Jose
 */
public class ActividadDAOImpl implements ActividadDAO {

    private static final Logger LOG = Logger.getLogger(ActividadDAOImpl.class.getName());
    private final DataSource pool;
    
    

    public ActividadDAOImpl(DataSource pool) {
        this.pool = pool;
    }

    @Override
    public BEAN_PAGINATION getPagination(HashMap<String, Object> parameters, Connection conn) throws SQLException {
        BEAN_PAGINATION beanpagination = new BEAN_PAGINATION();
        PreparedStatement pst;
        ResultSet rs;
        try {
            pst = conn.prepareStatement("SELECT COUNT(ACTI_ID) AS CANT FROM WEB.ACTIVIDAD WHERE " + parameters.get("ATIPO")
                    + parameters.get("TIPO"));
            rs = pst.executeQuery();
            while (rs.next()) {
                beanpagination.setCOUNT_FILTER(rs.getInt("CANT"));
            }
            pst = conn.prepareStatement("SELECT * FROM WEB.ACTIVIDAD WHERE " + parameters.get("ATIPO")
                    + parameters.get("TIPO"));
            rs = pst.executeQuery();
            List<Actividad> list = new ArrayList<>();
            while (rs.next()) {
                Actividad obj = new Actividad();
                obj.setActi_id(rs.getInt("ACTI_ID"));
                obj.setActi_tipo(rs.getInt("ACTI_TIPO"));
                obj.setDescripcion(rs.getString("DESCRIPCION"));
                obj.setEstado(rs.getBoolean("ESTADO"));
                list.add(obj);
            }
            beanpagination.setLIST(list);
            rs.close();
            pst.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return beanpagination;
    }

    @Override
    public BEAN_PAGINATION getPagination(HashMap<String, Object> parameters) throws SQLException {
        BEAN_PAGINATION beansPagination = null;
        try (Connection conn = pool.getConnection()) {
            beansPagination = getPagination(parameters, conn);
        } catch (SQLException e) {
            throw e;
        }
        return beansPagination;
    }

    @Override
    public BEAN_CRUD add(Actividad obj, HashMap<String, Object> parameters) throws SQLException {
        BEAN_CRUD beancrud = new BEAN_CRUD();
        PreparedStatement pst;
        try (Connection conn = pool.getConnection();
                SQLCloseable finish = conn::rollback;) {
            conn.setAutoCommit(false);
            pst = conn.prepareStatement("INSERT INTO WEB.ACTIVIDAD (ACTI_ID, DESCRIPCION, "
                    + "ESTADO, ACTI_TIPO) VALUES((select case when max(acti_id) is null then 1 else cast((max(acti_id)+1) as integer) end id  from web.actividad),"
                    + "?,?,?)");
            pst.setString(1, obj.getDescripcion());
            pst.setBoolean(2, obj.getEstado());
            pst.setInt(3, obj.getActi_tipo());
            pst.executeUpdate();
            conn.commit();
            beancrud.setMESSAGE_SERVER("ok");
            beancrud.setBEAN_PAGINATION(getPagination(parameters, conn));
            pst.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return beancrud;
    }

    @Override
    public BEAN_CRUD update(Actividad obj, HashMap<String, Object> parameters) throws SQLException {
        BEAN_CRUD beancrud = new BEAN_CRUD();
        PreparedStatement pst;
        try (Connection conn = pool.getConnection();
                SQLCloseable finish = conn::rollback;) {
            conn.setAutoCommit(false);
            pst = conn.prepareStatement("UPDATE WEB.ACTIVIDAD SET DESCRIPCION = ?"
                    + " WHERE ACTI_ID = ?");
            pst.setString(1, obj.getDescripcion());
            pst.setInt(2, obj.getActi_id());
            pst.executeUpdate();
            conn.commit();
            beancrud.setMESSAGE_SERVER("ok");
            beancrud.setBEAN_PAGINATION(getPagination(parameters, conn));
            pst.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return beancrud;
    }

    @Override
    public BEAN_CRUD delete(long id, HashMap<String, Object> parameters) throws SQLException {
        BEAN_CRUD beancrud = new BEAN_CRUD();
        PreparedStatement pst;
        ResultSet rs;
        try (Connection conn = pool.getConnection();
                SQLCloseable finish = conn::rollback;) {
            conn.setAutoCommit(false);
            pst = conn.prepareStatement("SELECT COUNT(ACTI_ID) AS CANT FROM WEB.CALENDARIO_CONV WHERE ACTI_ID = ?");
            pst.setInt(1, (int) id);
            rs = pst.executeQuery();
            while (rs.next()) {
                if (rs.getInt("CANT") <= 0) {
                    pst = conn.prepareStatement("DELETE FROM WEB.ACTIVIDAD WHERE ACTI_ID = ?");
                    pst.setInt(1, (int) id);
                    pst.executeUpdate();
                    conn.commit();
                    beancrud.setMESSAGE_SERVER("ok");
                } else {
                    beancrud.setMESSAGE_SERVER("No se puede eliminar, existen calendarios que usan esta actividad");
                }
            }
            beancrud.setBEAN_PAGINATION(getPagination(parameters, conn));
            rs.close();
            pst.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return beancrud;
    }

    @Override
    public Actividad get(long id) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
