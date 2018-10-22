/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gob.peam.web.dao.impl;

import gob.peam.web.dao.PenalidadDAO;
import gob.peam.web.dao.SQLCloseable;
import gob.peam.web.model.Penalidad;
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
 * @author JamesCarrillo
 */
public class PenalidadDAOImpl implements PenalidadDAO {

    private final Log logger = LogFactory.getLog(DirectivoDAOImpl.class);
    private final DataSource pool;

    public PenalidadDAOImpl(DataSource pool) {
        this.pool = pool;
    }

    @Override
    public BEAN_PAGINATION getPagination(HashMap<String, Object> parameters, Connection conn) throws SQLException {
        BEAN_PAGINATION beanpagination = new BEAN_PAGINATION();
        PreparedStatement pst;
        ResultSet rs;
        try {
            pst = conn.prepareStatement("SELECT COUNT(ID) AS CANT FROM WEB.PENALIDAD WHERE "
                    + "CONTRATISTA LIKE CONCAT('%',?,'%')");
            pst.setString(1, String.valueOf(parameters.get("FILTER")));
            rs = pst.executeQuery();
            while (rs.next()) {
                beanpagination.setCOUNT_FILTER(rs.getInt("CANT"));
            }
            pst = conn.prepareStatement("SELECT * FROM WEB.PENALIDAD WHERE "
                    + "CONTRATISTA LIKE CONCAT('%',?,'%') "
                    + String.valueOf(parameters.get("SQL_ANIO")) + "ORDER BY "
                    + String.valueOf(parameters.get("SQL_ORDERS")) + " " + parameters.get("LIMIT"));
            pst.setString(1, String.valueOf(parameters.get("FILTER")));
            rs = pst.executeQuery();
            List<Penalidad> list = new ArrayList<>();
            while (rs.next()) {
                Penalidad obj = new Penalidad();
                obj.setId(rs.getInt("ID"));
                obj.setAnho(rs.getString("ANHO"));
                obj.setMonto_contrato(rs.getString("MONTO_CONTRATO"));
                obj.setContratista(rs.getString("CONTRATISTA"));
                obj.setRuc(rs.getString("RUC"));
                obj.setObjeto(rs.getString("OBJETO"));
                obj.setNro_proceso(rs.getString("NRO_PROCESO"));
                obj.setNro_contrato(rs.getString("NRO_CONTRATO"));
                obj.setTipo(rs.getString("TIPO"));
                obj.setMonto_penalidad(rs.getString("MONTO_PENALIDAD"));
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
    public BEAN_CRUD add(Penalidad obj, HashMap<String, Object> parameters) throws SQLException {
        BEAN_CRUD beancrud = new BEAN_CRUD();
        PreparedStatement pst;
        try (Connection conn = pool.getConnection();
                SQLCloseable finish = conn::rollback;) {
            conn.setAutoCommit(false);
            pst = conn.prepareStatement("INSERT INTO WEB.PENALIDAD (ID, ANHO, CONTRATISTA, "
                    + "RUC, OBJETO, NRO_PROCESO, NRO_CONTRATO, TIPO, MONTO_CONTRATO, MONTO_PENALIDAD) VALUES((select case when max(id) is null then 1 else cast((max(id)+1) as integer) end id  from web.penalidad),"
                    + "?,?,?,?,?,?,?,?, ?)");
            pst.setString(1, obj.getAnho());
            pst.setString(2, obj.getContratista());
            pst.setString(3, obj.getRuc());
            pst.setString(4, obj.getObjeto());
            pst.setString(5, obj.getNro_proceso());
            pst.setString(6, obj.getNro_contrato());
            pst.setString(7, obj.getTipo());
            pst.setString(8, obj.getMonto_contrato());
            pst.setString(9, obj.getMonto_penalidad());
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
    public BEAN_CRUD update(Penalidad obj, HashMap<String, Object> parameters) throws SQLException {
        BEAN_CRUD beancrud = new BEAN_CRUD();
        PreparedStatement pst;
        try (Connection conn = pool.getConnection();
                SQLCloseable finish = conn::rollback;) {
            conn.setAutoCommit(false);
            pst = conn.prepareStatement("UPDATE WEB.PENALIDAD SET ANHO = ?,CONTRATISTA = ?, RUC=?, OBJETO=?, "
                    + " NRO_PROCESO=?, NRO_CONTRATO=?, TIPO=?, MONTO_CONTRATO=?, MONTO_PENALIDAD=? WHERE ID = ?");
            pst.setString(1, obj.getAnho());
            pst.setString(2, obj.getContratista());
            pst.setString(3, obj.getRuc());
            pst.setString(4, obj.getObjeto());
            pst.setString(5, obj.getNro_proceso());
            pst.setString(6, obj.getNro_contrato());
            pst.setString(7, obj.getTipo());
            pst.setString(8, obj.getMonto_contrato());
            pst.setString(9, obj.getMonto_penalidad());
            pst.setInt(10, obj.getId());
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
            pst = conn.prepareStatement("DELETE FROM WEB.PENALIDAD WHERE ID = ?");
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
    public Penalidad get(long id) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
