/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gob.peam.web.dao.impl;

import gob.peam.web.dao.ProcesoExoneradoDAO;
import gob.peam.web.dao.SQLCloseable;
import gob.peam.web.model.ProcesoExonerado;
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
public class ProcesoExoneradoDAOImpl implements ProcesoExoneradoDAO {

    private final Log logger = LogFactory.getLog(DirectivoDAOImpl.class);
    private final DataSource pool;

    public ProcesoExoneradoDAOImpl(DataSource pool) {
        this.pool = pool;
    }

    @Override
    public BEAN_PAGINATION getPagination(HashMap<String, Object> parameters, Connection conn) throws SQLException {
        BEAN_PAGINATION beanpagination = new BEAN_PAGINATION();
        PreparedStatement pst;
        ResultSet rs;
        try {
            pst = conn.prepareStatement("SELECT COUNT(ID) AS CANT FROM WEB.EXONERADO WHERE "
                    + "(LOWER(CONTRATISTA) LIKE CONCAT('%',?,'%') OR LOWER(DESCRIPCION) LIKE CONCAT('%',?,'%'))");
            pst.setString(1, String.valueOf(parameters.get("FILTER")));
            pst.setString(2, String.valueOf(parameters.get("FILTER")));
            logger.info(pst.toString());
            rs = pst.executeQuery();
            while (rs.next()) {
                beanpagination.setCOUNT_FILTER(rs.getInt("CANT"));
            }
            pst = conn.prepareStatement("SELECT * FROM WEB.EXONERADO WHERE "
                    + "(LOWER(CONTRATISTA) LIKE CONCAT('%',?,'%') OR LOWER(DESCRIPCION) LIKE CONCAT('%',?,'%'))"
                    + String.valueOf(parameters.get("SQL_ANIO")) + " ORDER BY "
                    + String.valueOf(parameters.get("SQL_ORDERS")) + " " + parameters.get("LIMIT"));
            pst.setString(1, String.valueOf(parameters.get("FILTER")));
            pst.setString(2, String.valueOf(parameters.get("FILTER")));
            logger.info(pst.toString());
            rs = pst.executeQuery();
            List<ProcesoExonerado> list = new ArrayList<>();
            while (rs.next()) {
                ProcesoExonerado obj = new ProcesoExonerado();
                obj.setId(rs.getInt("ID"));
                obj.setNro_exonerado(rs.getString("NRO_EXONERADO"));
                obj.setAnho(rs.getString("ANHO"));
                obj.setFecha(rs.getDate("FECHA"));
                obj.setCausa(rs.getString("CAUSA"));
                obj.setObjeto(rs.getString("OBJETO"));
                obj.setDescripcion(rs.getString("DESCRIPCION"));
                obj.setMonto(rs.getString("MONTO"));
                obj.setContratista(rs.getString("CONTRATISTA"));
                obj.setRuc(rs.getString("RUC"));
                obj.setUrl(rs.getString("URL"));
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
    public BEAN_CRUD add(ProcesoExonerado obj, HashMap<String, Object> parameters) throws SQLException {
        BEAN_CRUD beancrud = new BEAN_CRUD();
        PreparedStatement pst;
        try (Connection conn = pool.getConnection();
                SQLCloseable finish = conn::rollback;) {
            conn.setAutoCommit(false);
            pst = conn.prepareStatement("INSERT INTO WEB.EXONERADO (ID, NRO_EXONERADO, ANHO, "
                    + "FECHA, CAUSA, OBJETO, DESCRIPCION, MONTO, CONTRATISTA, RUC, URL) VALUES((select case when max(id) is null then 1 else cast((max(id)+1) as integer) end id  from web.exonerado),"
                    + "?,?,?,?,?,?,?,?,?,?)");
            pst.setString(1, obj.getNro_exonerado());
            pst.setString(2, obj.getAnho());
            pst.setDate(3, obj.getFecha());
            pst.setString(4, obj.getCausa());
            pst.setString(5, obj.getObjeto());
            pst.setString(6, obj.getDescripcion());
            pst.setString(7, obj.getMonto());
            pst.setString(8, obj.getContratista());
            pst.setString(9, obj.getRuc());
            pst.setString(10, obj.getUrl());
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
    public BEAN_CRUD update(ProcesoExonerado obj, HashMap<String, Object> parameters) throws SQLException {
        BEAN_CRUD beancrud = new BEAN_CRUD();
        PreparedStatement pst;
        try (Connection conn = pool.getConnection();
                SQLCloseable finish = conn::rollback;) {
            conn.setAutoCommit(false);
            pst = conn.prepareStatement("UPDATE WEB.EXONERADO SET NRO_EXONERADO = ?, ANHO = ?, FECHA=?, CAUSA=?,"
                    + " OBJETO=?, DESCRIPCION=?, MONTO=?, CONTRATISTA=?, RUC=?, URL=? WHERE ID = ?");
            pst.setString(1, obj.getNro_exonerado());
            pst.setString(2, obj.getAnho());
            pst.setDate(3, obj.getFecha());
            pst.setString(4, obj.getCausa());
            pst.setString(5, obj.getObjeto());
            pst.setString(6, obj.getDescripcion());
            pst.setString(7, obj.getMonto());
            pst.setString(8, obj.getContratista());
            pst.setString(9, obj.getRuc());
            pst.setString(10, obj.getUrl());
            pst.setInt(11, obj.getId());
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
            pst = conn.prepareStatement("DELETE FROM WEB.EXONERADO WHERE ID = ?");
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
    public ProcesoExonerado get(long id) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    @Override
    public BEAN_PAGINATION getAnhos(HashMap<String, Object> parameters, Connection conn) throws SQLException {
        BEAN_PAGINATION beanpagination = new BEAN_PAGINATION();
        List<ProcesoExonerado> list = new ArrayList<>();
        PreparedStatement pst;
        ResultSet rs;
        try {
            pst = conn.prepareStatement("SELECT COUNT(distinct(ANHO)) AS COUNT FROM WEB.EXONERADO WHERE "
                    + "LOWER(descripcion) LIKE CONCAT('%',?,'%') ");
            pst.setString(1, String.valueOf(parameters.get("FILTER")));
            logger.info(pst.toString());
            rs = pst.executeQuery();
            while (rs.next()) {
                beanpagination.setCOUNT_FILTER(rs.getInt("COUNT"));
                if (rs.getInt("COUNT") > 0) {
                    pst = conn.prepareStatement("SELECT distinct(ANHO) as ANHO FROM WEB.EXONERADO WHERE "
                            + "LOWER(descripcion) LIKE CONCAT('%',?,'%') "
                            + String.valueOf(parameters.get("SQL_ESTADO")) + " "
                            + String.valueOf(parameters.get("SQL_ORDERS")));
                    pst.setString(1, String.valueOf(parameters.get("FILTER")));
                    rs = pst.executeQuery();
                    logger.info(pst.toString());
                    while (rs.next()) {
                        ProcesoExonerado obj = new ProcesoExonerado();
                        obj.setAnho(rs.getString("ANHO"));
                        list.add(obj);
                    }
                    beanpagination.setLIST(list);
                }
            }
            rs.close();
            pst.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return beanpagination;
    }

    @Override
    public BEAN_PAGINATION getAnhos(HashMap<String, Object> parameters) throws SQLException {
        BEAN_PAGINATION beansPagination = null;
        try (Connection conn = pool.getConnection()) {
            beansPagination = getAnhos(parameters, conn);
        } catch (SQLException e) {
            throw e;
        }
        return beansPagination;
    }

}
