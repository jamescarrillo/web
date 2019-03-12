/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gob.peam.web.dao.impl;

import gob.peam.web.dao.FinanzaDAO;
import gob.peam.web.dao.SQLCloseable;
import gob.peam.web.model.Finanza;
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
public class FinanzaDAOImpl implements FinanzaDAO {

    private static final Logger LOG = Logger.getLogger(FinanzaDAOImpl.class.getName());
    private final DataSource pool;

    public FinanzaDAOImpl(DataSource pool) {
        this.pool = pool;
    }

    @Override
    public BEAN_PAGINATION getPagination(HashMap<String, Object> parameters, Connection conn) throws SQLException {
        BEAN_PAGINATION beanpagination = new BEAN_PAGINATION();
        List<Finanza> list = new ArrayList<>();
        PreparedStatement pst;
        ResultSet rs;
        try {
            pst = conn.prepareStatement("SELECT COUNT(DOCU_ID) AS COUNT FROM WEB.f00017 WHERE "
                    + "LOWER(DESCRIPCION) LIKE CONCAT('%',?,'%') "
                    + parameters.get("SQL_ANIO") + " "
                    + parameters.get("SQL_ESTADO") + " "
                    + parameters.get("SQL_TIPO"));
            pst.setString(1, String.valueOf(parameters.get("FILTER")));
            LOG.info(pst.toString());
            rs = pst.executeQuery();
            while (rs.next()) {
                beanpagination.setCOUNT_FILTER(rs.getInt("COUNT"));
                if (rs.getInt("COUNT") > 0) {
                    pst = conn.prepareStatement("SELECT * FROM WEB.f00017 WHERE "
                            + "LOWER(DESCRIPCION) LIKE CONCAT('%',?,'%') "
                            + parameters.get("SQL_ANIO") + " "
                            + parameters.get("SQL_ESTADO") + " "
                            + parameters.get("SQL_TIPO") + " "
                            + "ORDER BY " + String.valueOf(parameters.get("SQL_ORDERS")) + " " + parameters.get("LIMIT"));
                    pst.setString(1, String.valueOf(parameters.get("FILTER")));
                    LOG.info(pst.toString());
                    rs = pst.executeQuery();
                    while (rs.next()) {
                        Finanza obj = new Finanza();
                        obj.setId(rs.getInt("id"));
                        obj.setTipo(rs.getInt("tipo"));
                        obj.setAnho(rs.getString("ANHO"));
                        obj.setMes(rs.getString("MES"));
                        obj.setTitulo_formato(rs.getString("TITULO_FORMATO"));
                        obj.setDocumento(rs.getString("DOCUMENTO"));
                        obj.setDescripcion(rs.getString("DESCRIPCION"));
                        obj.setUbicacion(rs.getString("UBICACION"));
                        obj.setEstado(rs.getBoolean("ESTADO"));
                        obj.setDocu_id(rs.getInt("DOCU_ID"));
                        obj.setFecha(rs.getString("FECHA"));
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
    public BEAN_CRUD add(Finanza obj, HashMap<String, Object> parameters) throws SQLException {
        BEAN_CRUD beancrud = new BEAN_CRUD();
        PreparedStatement pst;
        try (Connection conn = pool.getConnection();
                SQLCloseable finish = conn::rollback;) {
            conn.setAutoCommit(false);
            pst = conn.prepareStatement("INSERT INTO WEB.f00017 VALUES("
                    + "(select case when max(id) is null then 1 else cast((max(id)+1) as integer) end id  from web.f00017)"
                    + ",?,?,?,?,?,?,?,?,?,?)");
            pst.setInt(1, obj.getTipo());
            pst.setString(2, obj.getAnho());
            pst.setString(3, obj.getMes());
            pst.setString(4, obj.getTitulo_formato());
            pst.setString(5, obj.getDocumento());
            pst.setString(6, obj.getDescripcion());
            pst.setString(7, obj.getUbicacion());
            pst.setBoolean(8, obj.getEstado());
            pst.setInt(9, obj.getDocu_id());
            pst.setString(10, obj.getFecha());
            LOG.info(pst.toString());
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
    public BEAN_CRUD update(Finanza obj, HashMap<String, Object> parameters) throws SQLException {
        BEAN_CRUD beancrud = new BEAN_CRUD();
        PreparedStatement pst;
        try (Connection conn = pool.getConnection();
                SQLCloseable finish = conn::rollback;) {
            conn.setAutoCommit(false);
            pst = conn.prepareStatement("UPDATE WEB.f00017 SET DESCRIPCION = ?, FECHA = ? WHERE ID = ?");
            pst.setString(1, obj.getDescripcion());
            pst.setString(2, obj.getFecha());
            pst.setInt(3, obj.getId());
            LOG.info(pst.toString());
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
            pst = conn.prepareStatement("DELETE FROM WEB.f00017 WHERE ID = ?");
            pst.setInt(1, (int) id);
            LOG.info(pst.toString());
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
    public Finanza get(long id) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public BEAN_CRUD cambiarEstado(Integer id, Boolean estado, HashMap<String, Object> parameters) throws SQLException {
        BEAN_CRUD beancrud = new BEAN_CRUD();
        PreparedStatement pst;
        try (Connection conn = pool.getConnection();
                SQLCloseable finish = conn::rollback;) {
            conn.setAutoCommit(false);
            pst = conn.prepareStatement("UPDATE WEB.f00017 SET ESTADO = ? WHERE ID = ?");
            pst.setBoolean(1, estado);
            pst.setInt(2, id);
            LOG.info(pst.toString());
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
    public BEAN_PAGINATION getAnhos(HashMap<String, Object> parameters, Connection conn) throws SQLException {
        BEAN_PAGINATION beanpagination = new BEAN_PAGINATION();
        List<Finanza> list = new ArrayList<>();
        PreparedStatement pst;
        ResultSet rs;
        try {
            pst = conn.prepareStatement("SELECT COUNT(DOCU_ID) AS COUNT FROM WEB.f00017 WHERE "
                    + "LOWER(DESCRIPCION) LIKE CONCAT('%',?,'%') "
                    + parameters.get("SQL_ESTADO") + " "
                    + parameters.get("SQL_TIPO"));
            pst.setString(1, String.valueOf(parameters.get("FILTER")));
            LOG.info(pst.toString());
            rs = pst.executeQuery();
            while (rs.next()) {
                beanpagination.setCOUNT_FILTER(rs.getInt("COUNT"));
                if (rs.getInt("COUNT") > 0) {
                    pst = conn.prepareStatement("SELECT * FROM WEB.f00017 WHERE "
                            + "LOWER(DESCRIPCION) LIKE CONCAT('%',?,'%') "
                            + parameters.get("SQL_ESTADO") + " "
                            + parameters.get("SQL_TIPO") + " "
                            + "ORDER BY " + String.valueOf(parameters.get("SQL_ORDERS")));
                    pst.setString(1, String.valueOf(parameters.get("FILTER")));
                    LOG.info(pst.toString());
                    rs = pst.executeQuery();
                    while (rs.next()) {
                        Finanza obj = new Finanza();
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
                beansPagination = getAnhos(parameters, conn);//años
        } catch (SQLException e) {
            throw e;
        }
        return beansPagination;
    }

}
