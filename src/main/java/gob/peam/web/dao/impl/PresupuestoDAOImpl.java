/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gob.peam.web.dao.impl;

import gob.peam.web.dao.PresupuestoDAO;
import gob.peam.web.dao.SQLCloseable;
import gob.peam.web.model.Presupuesto;
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
 * @author JhanxD
 */
public class PresupuestoDAOImpl implements PresupuestoDAO {

    private static final Logger LOG = Logger.getLogger(DocumentoDAOImpl.class.getName());
    private final DataSource pool;

    public PresupuestoDAOImpl(DataSource pool) {
        this.pool = pool;
    }

    @Override
    public BEAN_PAGINATION getPagination(HashMap<String, Object> parameters, Connection conn) throws SQLException {
        BEAN_PAGINATION beanpagination = new BEAN_PAGINATION();
        List<Presupuesto> list = new ArrayList<>();
        PreparedStatement pst;
        ResultSet rs;
        try {
            pst = conn.prepareStatement("SELECT COUNT(ID) AS COUNT FROM WEB.f00015 WHERE "
                    + "LOWER(DESCRIPCION) LIKE CONCAT('%',?,'%') "
                    + parameters.get("SQL_ANIO") + " "
                    + parameters.get("SQL_ESTADO") + " "
                    + parameters.get("SQL_TIDO_ID"));
            pst.setString(1, String.valueOf(parameters.get("FILTER")));
            LOG.info(pst.toString());
            rs = pst.executeQuery();
            while (rs.next()) {
                beanpagination.setCOUNT_FILTER(rs.getInt("COUNT"));
                if (rs.getInt("COUNT") > 0) {
                    pst = conn.prepareStatement("SELECT * FROM WEB.f00015 WHERE "
                            + "LOWER(DESCRIPCION) LIKE CONCAT('%',?,'%') "
                            + parameters.get("SQL_ANIO") + " "
                            + parameters.get("SQL_ESTADO") + " "
                            + parameters.get("SQL_TIDO_ID") + " "
                            + "ORDER BY " + String.valueOf(parameters.get("SQL_ORDERS")) + " " + parameters.get("LIMIT"));
                    pst.setString(1, String.valueOf(parameters.get("FILTER")));
                    LOG.info(pst.toString());
                    rs = pst.executeQuery();
                    while (rs.next()) {
                        Presupuesto obj = new Presupuesto();
                        obj.setId(rs.getInt("ID"));
                        obj.setAnho(rs.getString("ANHO"));
                        obj.setTitulo_formato(rs.getString("TITULO_FORMATO"));
                        obj.setDescripcion(rs.getString("DESCRIPCION"));
                        obj.setResolucion_aprobacion(rs.getString("RESOLUCION_APROBACION"));
                        obj.setFecha_aprobacion(rs.getDate("FECHA_APROBACION"));
                        obj.setUbicacion(rs.getString("UBICACION"));
                        obj.setTipo(rs.getInt("TIPO"));
                        obj.setEstado(rs.getBoolean("ESTADO"));
                        obj.setDocu_id(rs.getInt("DOCU_ID"));
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
    public BEAN_CRUD add(Presupuesto obj, HashMap<String, Object> parameters) throws SQLException {
        BEAN_CRUD beancrud = new BEAN_CRUD();
        PreparedStatement pst;
        try (Connection conn = pool.getConnection();
                SQLCloseable finish = conn::rollback;) {
            conn.setAutoCommit(false);
            pst = conn.prepareStatement("INSERT INTO WEB.f00015 VALUES((select cast((max(id)+1) as integer)  from web.f00015),?,?,?,?,?,?,?,?,?)");
            pst.setString(1, obj.getAnho());
            pst.setString(2, obj.getTitulo_formato());
            pst.setString(3, obj.getDescripcion());
            pst.setString(4, obj.getResolucion_aprobacion());
            pst.setDate(5, obj.getFecha_aprobacion());
            pst.setString(6, obj.getUbicacion());
            pst.setInt(7, obj.getTipo());
            pst.setBoolean(8, obj.getEstado());
            pst.setInt(9, obj.getDocu_id());
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
    public BEAN_CRUD update(Presupuesto obj, HashMap<String, Object> parameters) throws SQLException {
        BEAN_CRUD beancrud = new BEAN_CRUD();
        PreparedStatement pst;
        try (Connection conn = pool.getConnection();
                SQLCloseable finish = conn::rollback;) {
            conn.setAutoCommit(false);
            pst = conn.prepareStatement("UPDATE WEB.f00015 SET  ANHO=? , TITULO_FORMATO=? , DESCRIPCION=? , RESOLUCION_APROBACION=? ,  "
                    + "FECHA_APROBACION=? , UBICACION=? , TIPO=? , ESTADO=? , DOCU_ID=? WHERE ID = ?");
            pst.setString(1, obj.getAnho());
            pst.setString(2, obj.getTitulo_formato());
            pst.setString(3, obj.getDescripcion());
            pst.setString(4, obj.getResolucion_aprobacion());
            pst.setDate(5, obj.getFecha_aprobacion());
            pst.setString(6, obj.getUbicacion());
            pst.setInt(7, obj.getTipo());
            pst.setBoolean(8, obj.getEstado());
            pst.setInt(9, obj.getDocu_id());
            pst.setInt(10, obj.getId());
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
            pst = conn.prepareStatement("DELETE FROM WEB.f00015 WHERE ID = ?");
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
    public Presupuesto get(long id) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public BEAN_CRUD activate(long id, HashMap<String, Object> parameters) throws SQLException {
        BEAN_CRUD beancrud = new BEAN_CRUD();
        PreparedStatement pst;
        try (Connection conn = pool.getConnection();
                SQLCloseable finish = conn::rollback;) {
            conn.setAutoCommit(false);
            pst = conn.prepareStatement("UPDATE WEB.f00015 SET ESTADO = ? WHERE ID = ?");
            if (parameters.get("ESTADOP").equals("true")) {
                pst.setBoolean(1, true);
            } else {
                pst.setBoolean(1, false);
            }
            pst.setInt(2, (int) id);
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
        List<Presupuesto> list = new ArrayList<>();
        PreparedStatement pst;
        ResultSet rs;
        try {
            pst = conn.prepareStatement("SELECT COUNT(DISTINCT(ANHO)) AS COUNT FROM WEB.f00015 WHERE "
                    + "LOWER(DESCRIPCION) LIKE CONCAT('%',?,'%') "
                    + parameters.get("SQL_ESTADO") + " "
                    + parameters.get("SQL_TIDO_ID"));
            pst.setString(1, String.valueOf(parameters.get("FILTER")));
            LOG.info(pst.toString());
            rs = pst.executeQuery();
            while (rs.next()) {
                beanpagination.setCOUNT_FILTER(rs.getInt("COUNT"));
                if (rs.getInt("COUNT") > 0) {
                    pst = conn.prepareStatement("SELECT DISTINCT(ANHO) FROM WEB.f00015 WHERE "
                            + "LOWER(DESCRIPCION) LIKE CONCAT('%',?,'%') "
                            + parameters.get("SQL_ESTADO") + " "
                            + parameters.get("SQL_TIDO_ID") + " "
                            + "ORDER BY " + String.valueOf(parameters.get("SQL_ORDERS")));
                    pst.setString(1, String.valueOf(parameters.get("FILTER")));
                    LOG.info(pst.toString());
                    rs = pst.executeQuery();
                    while (rs.next()) {
                        Presupuesto obj = new Presupuesto();
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
