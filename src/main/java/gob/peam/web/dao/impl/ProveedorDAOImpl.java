/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gob.peam.web.dao.impl;

import gob.peam.web.dao.SQLCloseable;
import gob.peam.web.model.Proveedor;
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
public class ProveedorDAOImpl implements gob.peam.web.dao.ProveedorDAO {

    private static final Logger LOG = Logger.getLogger(ProveedorDAOImpl.class.getName());
    private final DataSource pool;

    public ProveedorDAOImpl(DataSource pool) {
        this.pool = pool;
    }

    @Override
    public BEAN_PAGINATION getPagination(HashMap<String, Object> parameters, Connection conn) throws SQLException {
        BEAN_PAGINATION beanpagination = new BEAN_PAGINATION();
        List<Proveedor> list = new ArrayList<>();
        PreparedStatement pst;
        ResultSet rs;
        try {
            pst = conn.prepareStatement("SELECT COUNT(ID) AS COUNT FROM WEB.F00006 WHERE "
                    + "LOWER(PROVEEDOR) LIKE CONCAT('%',?,'%') " + parameters.get("SQL_ESTADO"));
            pst.setString(1, String.valueOf(parameters.get("FILTER")));
            LOG.info(pst.toString());
            rs = pst.executeQuery();
            while (rs.next()) {
                beanpagination.setCOUNT_FILTER(rs.getInt("COUNT"));
                if (rs.getInt("COUNT") > 0) {
                    pst = conn.prepareStatement("SELECT * FROM WEB.F00006 WHERE "
                            + "LOWER(PROVEEDOR) LIKE CONCAT('%',?,'%') " + parameters.get("SQL_ESTADO")
                            + "ORDER BY " + String.valueOf(parameters.get("SQL_ORDERS")) + " " + parameters.get("LIMIT"));
                    pst.setString(1, String.valueOf(parameters.get("FILTER")));
                    LOG.info(pst.toString());
                    rs = pst.executeQuery();
                    while (rs.next()) {
                        Proveedor proveedor = new Proveedor();
                        proveedor.setId(rs.getInt("ID"));
                        proveedor.setAnho(rs.getString("ANHO"));
                        proveedor.setTrimestre(rs.getString("TRIMESTRE"));
                        proveedor.setRuc(rs.getString("RUC"));
                        proveedor.setProveedor(rs.getString("PROVEEDOR"));
                        proveedor.setImporte(rs.getDouble("IMPORTE"));
                        proveedor.setEstado(rs.getBoolean("ESTADO"));
                        list.add(proveedor);
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
    public BEAN_CRUD add(Proveedor obj, HashMap<String, Object> parameters) throws SQLException {
        BEAN_CRUD beancrud = new BEAN_CRUD();
        PreparedStatement pst;
        ResultSet rs;
        try (Connection conn = pool.getConnection();
                SQLCloseable finish = conn::rollback;) {
            conn.setAutoCommit(false);
            pst = conn.prepareStatement("SELECT COUNT(ID) AS COUNT FROM WEB.F00006 WHERE RUC = ?");
            pst.setString(1, obj.getRuc());
            LOG.info(pst.toString());
            rs = pst.executeQuery();
            while (rs.next()) {
                if (rs.getInt("COUNT") == 0) {
                    pst = conn.prepareStatement("INSERT INTO WEB.F00006(ID,ANHO,TRIMESTRE,RUC,"
                            + "PROVEEDOR,IMPORTE,ESTADO)"
                            + "VALUES((select case when max(id) is null then 1 else cast((max(id)+1) as integer) end id  from web.f00006),"
                            + "?,?,?,?,?,?)");
                    pst.setString(1, obj.getAnho());
                    pst.setString(2, obj.getTrimestre());
                    pst.setString(3, obj.getRuc());
                    pst.setString(4, obj.getProveedor());
                    pst.setDouble(5, obj.getImporte());
                    pst.setBoolean(6, obj.getEstado());
                    LOG.info(pst.toString());
                    pst.executeUpdate();
                    conn.commit();
                    beancrud.setMESSAGE_SERVER("ok");
                    beancrud.setBEAN_PAGINATION(getPagination(parameters, conn));
                } else {
                    beancrud.setMESSAGE_SERVER("No se registró, ya existe una Proveedor con el N° de ruc ingresado");
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
    public BEAN_CRUD update(Proveedor obj, HashMap<String, Object> parameters) throws SQLException {
        BEAN_CRUD beancrud = new BEAN_CRUD();
        PreparedStatement pst;
        ResultSet rs;
        try (Connection conn = pool.getConnection();
                SQLCloseable finish = conn::rollback;) {
            conn.setAutoCommit(false);
            pst = conn.prepareStatement("SELECT COUNT(ID) AS COUNT FROM WEB.F00006 WHERE RUC = ? AND ID != ?");
            pst.setString(1, obj.getRuc());
            pst.setInt(2, obj.getId());
            LOG.info(pst.toString());
            rs = pst.executeQuery();
            while (rs.next()) {
                if (rs.getInt("COUNT") == 0) {
                    pst = conn.prepareStatement("UPDATE WEB.F00006 SET ANHO = ?, TRIMESTRE = ?, RUC = ?,"
                            + "PROVEEDOR = ?, IMPORTE = ?, ESTADO = ? WHERE ID = ?");
                    pst.setString(1, obj.getAnho());
                    pst.setString(2, obj.getTrimestre());
                    pst.setString(3, obj.getRuc());
                    pst.setString(4, obj.getProveedor());
                    pst.setDouble(5, obj.getImporte());
                    pst.setBoolean(6, obj.getEstado());
                    pst.setInt(7, obj.getId());
                    LOG.info(pst.toString());
                    pst.executeUpdate();
                    conn.commit();
                    beancrud.setMESSAGE_SERVER("ok");
                    beancrud.setBEAN_PAGINATION(getPagination(parameters, conn));
                } else {
                    beancrud.setMESSAGE_SERVER("No se modificó, ya existe una Proveedor con el N° de ruc ingresado");
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
            pst = conn.prepareStatement("DELETE FROM WEB.F00006 WHERE ID = ?");
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
    public Proveedor get(long id) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
