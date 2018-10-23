/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gob.peam.web.dao.impl;

import gob.peam.web.dao.ActividadDAO;
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
        List<Actividad> list = new ArrayList<>();
        PreparedStatement pst;
        ResultSet rs;
        try {
            /*ACTI_TIPO = 1 -> PARA ACTIVIDADES DESDE CONVOCATORIAS*/
            pst = conn.prepareStatement("SELECT COUNT(ACTI_ID) AS COUNT FROM WEB.ACTIVIDAD WHERE "
                    + "LOWER(DESCRIPCION) LIKE CONCAT('%',?,'%') " + parameters.get("SQL_ESTADO"));
            pst.setString(1, String.valueOf(parameters.get("FILTER")));
            LOG.info(pst.toString());
            rs = pst.executeQuery();
            while (rs.next()) {
                beanpagination.setCOUNT_FILTER(rs.getInt("COUNT"));
                if (rs.getInt("COUNT") > 0) {
                    pst = conn.prepareStatement("SELECT * FROM WEB.ACTIVIDAD WHERE "
                            + "LOWER(DESCRIPCION) LIKE CONCAT('%',?,'%') " + parameters.get("SQL_ESTADO")
                            + "ORDER BY " + String.valueOf(parameters.get("SQL_ORDERS")) + " " + parameters.get("LIMIT"));
                    pst.setString(1, String.valueOf(parameters.get("FILTER")));
                    LOG.info(pst.toString());
                    rs = pst.executeQuery();
                    while (rs.next()) {
                        Actividad obj = new Actividad();
                        obj.setActi_id(rs.getInt("ACTI_ID"));
                        obj.setDescripcion(rs.getString("DESCRIPCION"));
                        obj.setEstado(rs.getBoolean("ESTADO"));
                        obj.setActi_tipo(rs.getInt("ACTI_TIPO"));
                        list.add(obj);
                    }
                }
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
        ResultSet rs;
        try (Connection conn = this.pool.getConnection()) {
            pst = conn.prepareStatement("SELECT COUNT(ACTI_ID) AS COUNT FROM WEB.ACTIVIDAD WHERE DESCRIPCION = ? AND ACTI_TIPO = ?");
            pst.setString(1, obj.getDescripcion());
            pst.setInt(2, obj.getActi_tipo());
            rs = pst.executeQuery();
            while (rs.next()) {
                if (rs.getInt("COUNT") == 0) {
                    pst = conn.prepareStatement("INSERT INTO WEB.ACTIVIDAD "
                            + "VALUES((select case when max(ACTI_ID) is null then 1 else cast((max(ACTI_ID)+1) as integer) end idACTI_ID FROM WEB.ACTIVIDAD),?,TRUE,?)");
                    pst.setString(1, obj.getDescripcion());
                    pst.setInt(2, obj.getActi_tipo());
                    LOG.info(pst.toString());
                    pst.executeUpdate();
                    conn.commit();
                    beancrud.setMESSAGE_SERVER("ok");
                    beancrud.setBEAN_PAGINATION(getPagination(parameters, conn));
                } else {
                    beancrud.setMESSAGE_SERVER("No se registró, ya existe una actividad con el nombre ingresado");
                }
            }
            rs.close();
            pst.close();
        } catch (SQLException e) {
            throw e;
        }
        return beancrud;
    }

    @Override
    public BEAN_CRUD update(Actividad obj, HashMap<String, Object> parameters) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public BEAN_CRUD delete(long id, HashMap<String, Object> parameters) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Actividad get(long id) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
