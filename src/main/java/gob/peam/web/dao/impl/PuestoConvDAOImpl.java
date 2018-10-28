/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gob.peam.web.dao.impl;

import gob.peam.web.dao.PuestoConvDAO;
import gob.peam.web.dao.SQLCloseable;
import gob.peam.web.model.Convocatoria_Pers;
import gob.peam.web.model.PuestoConv;
import gob.peam.web.utilities.BEAN_CRUD;
import gob.peam.web.utilities.BEAN_PAGINATION;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import javax.sql.DataSource;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 *
 * @author JhanxD
 */
public class PuestoConvDAOImpl implements PuestoConvDAO{
    
    private final Log logger = LogFactory.getLog(DirectivoDAOImpl.class);
    private final DataSource pool;

    public PuestoConvDAOImpl(DataSource pool) {
        this.pool = pool;
    }

    @Override
    public BEAN_PAGINATION getPagination(HashMap<String, Object>  parameters, Connection conn) throws SQLException {
        BEAN_PAGINATION beanpagination = new BEAN_PAGINATION();
        PreparedStatement pst;
        ResultSet rs;
        try {
            pst = conn.prepareStatement("SELECT COUNT(PUES_ID) AS CANT FROM WEB.PUESTO_CONV WHERE "
                    + "(LOWER(CARGO) LIKE CONCAT('%',?,'%')) "+String.valueOf(parameters.get("IDCONVO")));
            pst.setString(1, String.valueOf(parameters.get("FILTER")));
            rs = pst.executeQuery();
            while (rs.next()) {
                beanpagination.setCOUNT_FILTER(rs.getInt("CANT"));
            }
            pst = conn.prepareStatement("SELECT * FROM WEB.PUESTO_CONV WHERE "
                    + "(LOWER(CARGO) LIKE CONCAT('%',?,'%')) "+String.valueOf(parameters.get("IDCONVO")));
            pst.setString(1, String.valueOf(parameters.get("FILTER")));
            rs = pst.executeQuery();
            List<PuestoConv> list = new ArrayList<>();
            while (rs.next()) {
                PuestoConv obj = new PuestoConv();
                obj.setPues_id(rs.getInt("PUES_ID"));
                obj.setCargo(rs.getString("CARGO"));
                obj.setEntidad(rs.getString("ENTIDAD"));
                obj.setModaidad(rs.getString("MODALIDAD"));
                obj.setNroplaza(rs.getInt("NROPLAZA"));
                obj.setIngre_mensual(rs.getString("INGRE_MENSUAL"));
                obj.setEstado(rs.getBoolean("ESTADO"));
                obj.setCoper_id(new Convocatoria_Pers (rs.getInt("COPER_ID")));
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
    public BEAN_PAGINATION getPagination(HashMap<String, Object>  parameters) throws SQLException {
        BEAN_PAGINATION beansPagination = null;
        try (Connection conn = pool.getConnection()) {
            beansPagination = getPagination(parameters, conn);
        } catch (SQLException e) {
            throw e;
        }
        return beansPagination;
    }

    @Override
    public BEAN_CRUD add(PuestoConv obj, HashMap<String, Object> parameters) throws SQLException {
        BEAN_CRUD beancrud = new BEAN_CRUD();
        PreparedStatement pst;
        try (Connection conn = pool.getConnection();
                SQLCloseable finish = conn::rollback;) {
            conn.setAutoCommit(false);
            pst = conn.prepareStatement("INSERT INTO WEB.PUESTO_CONV (PUES_ID, CARGO, ENTIDAD, "
                    + "MODALIDAD, NROPLAZA, INGRE_MENSUAL, ESTADO, COPER_ID) VALUES((select case when max(pues_id) is null then 1 else cast((max(pues_id)+1) as integer) end id  from web.puesto_conv),"
                    + "?,?,?,?,?,?,?)");
            pst.setString(1, obj.getCargo());
            pst.setString(2, obj.getEntidad());
            pst.setString(3, obj.getModaidad());
            pst.setInt(4, obj.getNroplaza());
            pst.setString(5, obj.getIngre_mensual());
            pst.setBoolean(6, obj.getEstado());
            pst.setInt(7, obj.getCoper_id().getCoper_id());
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
    public BEAN_CRUD update(PuestoConv obj, HashMap<String, Object> parameters) throws SQLException {
        BEAN_CRUD beancrud = new BEAN_CRUD();
        PreparedStatement pst;
        try (Connection conn = pool.getConnection();
                SQLCloseable finish = conn::rollback;) {
            conn.setAutoCommit(false);
            pst = conn.prepareStatement("UPDATE WEB.PUESTO_CONV SET CARGO = ?,ENTIDAD = ?, MODALIDAD=?, NROPLAZA=?, "
                    + " INGRE_MENSUAL=?, ESTADO=?, COPER_ID=? WHERE PUES_ID = ?");
            pst.setString(1, obj.getCargo());
            pst.setString(2, obj.getEntidad());
            pst.setString(3, obj.getModaidad());
            pst.setInt(4, obj.getNroplaza());
            pst.setString(5, obj.getIngre_mensual());
            pst.setBoolean(6, obj.getEstado());
            pst.setInt(7, obj.getCoper_id().getCoper_id());
            pst.setInt(8, obj.getPues_id());
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
        try (Connection conn = pool.getConnection();
                SQLCloseable finish = conn::rollback;) {
            conn.setAutoCommit(false);
            pst = conn.prepareStatement("DELETE FROM WEB.PUESTO_CONV WHERE PUES_ID = ?");
            pst.setInt(1, (int) id);
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
    public PuestoConv get(long id) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }


}
