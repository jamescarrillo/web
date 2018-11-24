/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gob.peam.web.dao.impl;

import gob.peam.web.dao.SQLCloseable;
import gob.peam.web.model.OrdenCompra;
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
 * @author JamesCarrillo
 */
public class OrdenCompraDAOImpl implements gob.peam.web.dao.OrdenCompraDAO {

    private static final Logger LOG = Logger.getLogger(OrdenCompraDAOImpl.class.getName());
    private final DataSource pool;

    public OrdenCompraDAOImpl(DataSource pool) {
        this.pool = pool;
    }

    @Override
    public BEAN_PAGINATION getPagination(HashMap<String, Object> parameters, Connection conn) throws SQLException {
        BEAN_PAGINATION beanpagination = new BEAN_PAGINATION();
        List<OrdenCompra> list = new ArrayList<>();
        PreparedStatement pst;
        ResultSet rs;
        try {
            pst = conn.prepareStatement("SELECT COUNT(ID) AS COUNT FROM WEB.F00007 WHERE "
                    + "LOWER(PROVEEDOR) LIKE CONCAT('%',?,'%') " + parameters.get("SQL_ESTADO"));
            pst.setString(1, String.valueOf(parameters.get("FILTER")));
            LOG.info(pst.toString());
            rs = pst.executeQuery();
            while (rs.next()) {
                beanpagination.setCOUNT_FILTER(rs.getInt("COUNT"));
                if (rs.getInt("COUNT") > 0) {
                    pst = conn.prepareStatement("SELECT * FROM WEB.F00007 WHERE "
                            + "LOWER(PROVEEDOR) LIKE CONCAT('%',?,'%') " + parameters.get("SQL_ESTADO")
                            + "ORDER BY " + String.valueOf(parameters.get("SQL_ORDERS")) + " " + parameters.get("LIMIT"));
                    pst.setString(1, String.valueOf(parameters.get("FILTER")));
                    LOG.info(pst.toString());
                    rs = pst.executeQuery();
                    while (rs.next()) {
                        OrdenCompra orden = new OrdenCompra();
                        orden.setId(rs.getInt("ID"));
                        orden.setMes(rs.getString("MES"));
                        orden.setAnho(rs.getString("ANHO"));
                        orden.setOrden_compra(rs.getString("ORDEN_COMPRA"));
                        orden.setFecha_compra(rs.getDate("FECHA_COMPRA"));
                        orden.setFuente_financiamiento(rs.getString("FUENTE_FINANCIAMIENTO"));
                        orden.setProveedor(rs.getString("PROVEEDOR"));
                        orden.setMonto(rs.getDouble("MONTO"));
                        orden.setFinanciamiento(rs.getString("FINANCIAMIENTO"));
                        orden.setEstado(rs.getBoolean("ESTADO"));
                        orden.setNro_siaf(rs.getString("NRO_SIAF"));
                        list.add(orden);
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
    public BEAN_CRUD add(OrdenCompra obj, HashMap<String, Object> parameters) throws SQLException {
        BEAN_CRUD beancrud = new BEAN_CRUD();
        PreparedStatement pst;
        ResultSet rs;
        try (Connection conn = pool.getConnection();
                SQLCloseable finish = conn::rollback;) {
            conn.setAutoCommit(false);
            pst = conn.prepareStatement("SELECT COUNT(ID) AS COUNT FROM WEB.F00007 WHERE ORDEN_COMPRA = ?");
            pst.setString(1, obj.getOrden_compra());
            LOG.info(pst.toString());
            rs = pst.executeQuery();
            while (rs.next()) {
                if (rs.getInt("COUNT") == 0) {
                    pst = conn.prepareStatement("INSERT INTO WEB.F00007(ID,MES,ANHO,ORDEN_COMPRA, FECHA_COMPRA,"
                            + "FUENTE_FINANCIAMIENTO,PROVEEDOR,MONTO,FINANCIAMIENTO,ESTADO,NRO_SIAF)"
                            + "VALUES((select case when max(id) is null then 1 else cast((max(id)+1) as integer) end id  from web.f00007),"
                            + "?,?,?,?,?,?,?,?,?,?)");
                    pst.setString(1, obj.getMes());
                    pst.setString(2, obj.getAnho());
                    pst.setString(3, obj.getOrden_compra());
                    pst.setDate(4, obj.getFecha_compra());
                    pst.setString(5, obj.getFuente_financiamiento());
                    pst.setString(6, obj.getProveedor());
                    pst.setDouble(7, obj.getMonto());
                    pst.setString(8, obj.getFinanciamiento());
                    pst.setBoolean(9, obj.getEstado());
                    pst.setString(10, obj.getNro_siaf());
                    LOG.info(pst.toString());
                    pst.executeUpdate();
                    conn.commit();
                    beancrud.setMESSAGE_SERVER("ok");
                    beancrud.setBEAN_PAGINATION(getPagination(parameters, conn));
                } else {
                    beancrud.setMESSAGE_SERVER("No se registró, ya existe una Orden de Compra con el N° de orden ingresado");
                }
            }
            pst.close();
            rs.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return beancrud;
    }

    @Override
    public BEAN_CRUD update(OrdenCompra obj, HashMap<String, Object> parameters) throws SQLException {
        BEAN_CRUD beancrud = new BEAN_CRUD();
        PreparedStatement pst;
        ResultSet rs;
        try (Connection conn = pool.getConnection();
                SQLCloseable finish = conn::rollback;) {
            conn.setAutoCommit(false);
            pst = conn.prepareStatement("SELECT COUNT(ID) AS COUNT FROM WEB.F00007 WHERE ORDEN_COMPRA = ? AND ID != ?");
            pst.setString(1, obj.getOrden_compra());
            pst.setInt(2, obj.getId());
            LOG.info(pst.toString());
            rs = pst.executeQuery();
            while (rs.next()) {
                if (rs.getInt("COUNT") == 0) {
                    pst = conn.prepareStatement("UPDATE WEB.F00007 SET MES = ?,ANHO = ?,ORDEN_COMPRA = ?, FECHA_COMPRA = ?,"
                            + "FUENTE_FINANCIAMIENTO = ?,PROVEEDOR = ?,MONTO = ?,FINANCIAMIENTO = ?,ESTADO = ?,NRO_SIAF = ? "
                            + "WHERE ID = ?");
                    pst.setString(1, obj.getMes());
                    pst.setString(2, obj.getAnho());
                    pst.setString(3, obj.getOrden_compra());
                    pst.setDate(4, obj.getFecha_compra());
                    pst.setString(5, obj.getFuente_financiamiento());
                    pst.setString(6, obj.getProveedor());
                    pst.setDouble(7, obj.getMonto());
                    pst.setString(8, obj.getFinanciamiento());
                    pst.setBoolean(9, obj.getEstado());
                    pst.setString(10, obj.getNro_siaf());
                    pst.setInt(11, obj.getId());
                    LOG.info(pst.toString());
                    pst.executeUpdate();
                    conn.commit();
                    beancrud.setMESSAGE_SERVER("ok");
                    beancrud.setBEAN_PAGINATION(getPagination(parameters, conn));
                } else {
                    beancrud.setMESSAGE_SERVER("No se modificó, ya existe una Orden de Compra con el N° de orden ingresado");
                }
            }
            pst.close();
            rs.close();
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
            pst = conn.prepareStatement("DELETE FROM WEB.F00007 WHERE ID = ?");
            pst.setInt(1, (int) id);
            LOG.info(pst.toString());
            pst.executeUpdate();
            conn.commit();
            beancrud.setMESSAGE_SERVER("ok");
            beancrud.setBEAN_PAGINATION(getPagination(parameters, conn));
        } catch (SQLException ex) {
            throw ex;
        }
        return beancrud;
    }

    @Override
    public OrdenCompra get(long id) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
