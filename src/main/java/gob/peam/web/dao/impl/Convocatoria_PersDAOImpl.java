/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gob.peam.web.dao.impl;

import gob.peam.web.dao.Convocatoria_PersDAO;
import gob.peam.web.dao.SQLCloseable;
import gob.peam.web.model.Convocatoria_Pers;
import gob.peam.web.utilities.BEAN_CRUD;
import gob.peam.web.utilities.BEAN_PAGINATION;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import javax.sql.DataSource;

/**
 *
 * @author JamesCarrillo
 */
public class Convocatoria_PersDAOImpl implements Convocatoria_PersDAO {

    private final Log logger = LogFactory.getLog(DirectivoDAOImpl.class);
    private final DataSource pool;

    public Convocatoria_PersDAOImpl(DataSource pool) {
        this.pool = pool;
    }

    @Override
    public BEAN_PAGINATION getPagination(HashMap<String, Object> parameters, Connection conn) throws SQLException {
        BEAN_PAGINATION beanpagination = new BEAN_PAGINATION();
        PreparedStatement pst;
        ResultSet rs;
        try {
            pst = conn.prepareStatement("SELECT COUNT(COPER_ID) AS CANT FROM WEB.CONVOCATORIA_PERS WHERE "
                    + "(LOWER(CONVOCATORIA) LIKE CONCAT('%',?,'%'))"
                    + String.valueOf(parameters.get("SQL_ANIO")));
            pst.setString(1, String.valueOf(parameters.get("FILTER")));
            rs = pst.executeQuery();
            logger.info(pst.toString());
            while (rs.next()) {
                beanpagination.setCOUNT_FILTER(rs.getInt("CANT"));
            }
            pst = conn.prepareStatement("SELECT * FROM WEB.CONVOCATORIA_PERS WHERE "
                    + "(LOWER(CONVOCATORIA) LIKE CONCAT('%',?,'%'))"
                    + String.valueOf(parameters.get("SQL_ESTADO"))
                    + String.valueOf(parameters.get("SQL_ANIO")) + "ORDER BY "
                    + String.valueOf(parameters.get("SQL_ORDERS")) + " " + parameters.get("LIMIT"));
            pst.setString(1, String.valueOf(parameters.get("FILTER")));
            rs = pst.executeQuery();
            logger.info(pst.toString());
            List<Convocatoria_Pers> list = new ArrayList<>();
            while (rs.next()) {
                Convocatoria_Pers obj = new Convocatoria_Pers();
                obj.setCoper_id(rs.getInt("COPER_ID"));
                obj.setFecha(rs.getDate("FECHA"));
                obj.setConvocatoria(rs.getString("CONVOCATORIA"));
                obj.setDescripcion(rs.getString("DESCRIPCION"));
                obj.setAnho(rs.getString("ANHO"));
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
    public BEAN_CRUD add(Convocatoria_Pers obj, HashMap<String, Object> parameters) throws SQLException {
        BEAN_CRUD beancrud = new BEAN_CRUD();
        PreparedStatement pst;
        try (Connection conn = pool.getConnection();
                SQLCloseable finish = conn::rollback;) {
            conn.setAutoCommit(false);
            pst = conn.prepareStatement("INSERT INTO WEB.CONVOCATORIA_PERS (COPER_ID, CONVOCATORIA, DESCRIPCION, "
                    + "FECHA, ESTADO, ANHO) VALUES((select case when max(coper_id) is null then 1 else cast((max(coper_id)+1) as integer) end id  from web.convocatoria_pers),"
                    + "?,?, current_date,?, (select extract(year from current_date)))");
            pst.setString(1, obj.getConvocatoria());
            pst.setString(2, obj.getDescripcion());
            pst.setBoolean(3, obj.getEstado());
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
    public BEAN_CRUD update(Convocatoria_Pers obj, HashMap<String, Object> parameters) throws SQLException {
        BEAN_CRUD beancrud = new BEAN_CRUD();
        PreparedStatement pst;
        try (Connection conn = pool.getConnection();
                SQLCloseable finish = conn::rollback;) {
            conn.setAutoCommit(false);
            pst = conn.prepareStatement("UPDATE WEB.CONVOCATORIA_PERS SET CONVOCATORIA = ?,DESCRIPCION = ? "
                    + " WHERE COPER_ID = ?");
            pst.setString(1, obj.getConvocatoria());
            pst.setString(2, obj.getDescripcion());
            pst.setInt(3, obj.getCoper_id());
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
            pst = conn.prepareStatement("SELECT COUNT(COPER_ID) AS CANT FROM WEB.PUESTO_CONV WHERE COPER_ID = ?");
            pst.setInt(1, (int) id);
            rs = pst.executeQuery();
            while (rs.next()) {
                if (rs.getInt("CANT") <= 0) {
                    pst = conn.prepareStatement("SELECT COUNT(CONVO_ID) AS CANT FROM WEB.CALENDARIO_CONV WHERE CONVO_ID = ? AND TIPO = 2");
                    pst.setInt(1, (int) id);
                    rs = pst.executeQuery();
                    while (rs.next()) {
                        if (rs.getInt("CANT") <= 0) {
                            pst = conn.prepareStatement("DELETE FROM WEB.CONVOCATORIA_PERS WHERE COPER_ID = ?");
                            pst.setInt(1, (int) id);
                            pst.executeUpdate();
                            conn.commit();
                            beancrud.setMESSAGE_SERVER("ok");
                        } else {
                            beancrud.setMESSAGE_SERVER("No se puede eliminar, existen un calendario de actividades que dependen de esta convocatoria");
                        }
                    }
                } else {
                    beancrud.setMESSAGE_SERVER("No se puede eliminar, existen puestos que dependen de esta convocatoria");
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
    public Convocatoria_Pers get(long id) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public BEAN_CRUD activate(long id, HashMap<String, Object> parameters) throws SQLException {
        BEAN_CRUD beancrud = new BEAN_CRUD();
        PreparedStatement pst;
        try (Connection conn = pool.getConnection();
                SQLCloseable finish = conn::rollback;) {
            conn.setAutoCommit(false);
            pst = conn.prepareStatement("UPDATE WEB.CONVOCATORIA_PERS SET ESTADO = ? WHERE COPER_ID = ?");
            if (parameters.get("ESTADO").equals("true")) {
                pst.setBoolean(1, true);
            } else {
                pst.setBoolean(1, false);
            }
            pst.setInt(2, (int) id);
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
        PreparedStatement pst;
        ResultSet rs;
        try {
            pst = conn.prepareStatement("SELECT COUNT(DISTINCT(ANHO)) AS CANT FROM WEB.CONVOCATORIA_PERS WHERE "
                    + "(LOWER(CONVOCATORIA) LIKE CONCAT('%',?,'%'))");
            pst.setString(1, String.valueOf(parameters.get("FILTER")));
            logger.info(pst.toString());
            rs = pst.executeQuery();
            while (rs.next()) {
                beanpagination.setCOUNT_FILTER(rs.getInt("CANT"));
            }
            pst = conn.prepareStatement("SELECT DISTINCT(ANHO) FROM WEB.CONVOCATORIA_PERS WHERE "
                    + "(LOWER(CONVOCATORIA) LIKE CONCAT('%',?,'%'))"
                    + String.valueOf(parameters.get("SQL_ESTADO"))
                    + String.valueOf(parameters.get("SQL_ORDERS")));
            pst.setString(1, String.valueOf(parameters.get("FILTER")));
            logger.info(pst.toString());
            rs = pst.executeQuery();
            List<Convocatoria_Pers> list = new ArrayList<>();
            while (rs.next()) {
                Convocatoria_Pers obj = new Convocatoria_Pers();
                obj.setAnho(rs.getString("ANHO"));
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
