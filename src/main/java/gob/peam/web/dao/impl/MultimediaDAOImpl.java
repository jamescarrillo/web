/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gob.peam.web.dao.impl;

import gob.peam.web.dao.MultimediaDAO;
import gob.peam.web.dao.SQLCloseable;
import gob.peam.web.model.Multimedia;
import gob.peam.web.model.Persona;
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
public class MultimediaDAOImpl implements MultimediaDAO{
    
    private final Log logger = LogFactory.getLog(DirectivoDAOImpl.class);
    private final DataSource pool;

    public MultimediaDAOImpl(DataSource pool) {
        this.pool = pool;
    }


    @Override
    public BEAN_CRUD activate(long id, HashMap<String, Object> parameters) throws SQLException {
        BEAN_CRUD beancrud = new BEAN_CRUD();
            PreparedStatement pst;
            try (Connection conn = pool.getConnection();
                    SQLCloseable finish = conn::rollback;) {
                conn.setAutoCommit(false);
                pst = conn.prepareStatement("UPDATE WEB.MULTIMEDIA SET ESTADO = ? WHERE ID = ?");
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
    public BEAN_CRUD favorito(long id, HashMap<String, Object> parameters) throws SQLException {
        BEAN_CRUD beancrud = new BEAN_CRUD();
            PreparedStatement pst;
            try (Connection conn = pool.getConnection();
                    SQLCloseable finish = conn::rollback;) {
                conn.setAutoCommit(false);
                pst = conn.prepareStatement("UPDATE WEB.MULTIMEDIA SET default = ? WHERE ID = ?");
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
    public BEAN_PAGINATION getPagination(HashMap<String, Object> parameters, Connection conn) throws SQLException {
        BEAN_PAGINATION beanpagination = new BEAN_PAGINATION();
        PreparedStatement pst;
        ResultSet rs;
        try {
            pst = conn.prepareStatement("SELECT COUNT(ID) AS CANT FROM WEB.multimedia WHERE "
                    + "(LOWER(TITULO) LIKE CONCAT('%',?,'%'))");
            pst.setString(1, String.valueOf(parameters.get("FILTER")));
            rs = pst.executeQuery();
            while (rs.next()) {
                beanpagination.setCOUNT_FILTER(rs.getInt("CANT"));
            }
            pst = conn.prepareStatement("SELECT * FROM WEB.multimedia WHERE "
                    + "(LOWER(TITULO) LIKE CONCAT('%',?,'%'))"
                    + String.valueOf(parameters.get("SQL_ANIO")) + "ORDER BY "
                    + String.valueOf(parameters.get("SQL_ORDERS")) + " " + parameters.get("LIMIT"));
            pst.setString(1, String.valueOf(parameters.get("FILTER")));
            rs = pst.executeQuery();
            List<Multimedia> list = new ArrayList<>();
            while (rs.next()) {
                Multimedia obj = new Multimedia();
                obj.setId(rs.getInt("ID"));
                obj.setTitulo(rs.getString("TITULO"));
                obj.setFecha(rs.getDate("FECHA"));
                obj.setFuente(rs.getString("FUENTE"));
                obj.setEstado(rs.getBoolean("ESTADO"));
                Persona per = new Persona();
                per.setPers_id(rs.getInt("USUARIO"));
                obj.setUsuario(per);
                obj.setDefecto(rs.getBoolean("DEFAULT"));
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
    public BEAN_CRUD add(Multimedia obj, HashMap<String, Object> parameters) throws SQLException {
        BEAN_CRUD beancrud = new BEAN_CRUD();
        PreparedStatement pst;
        try (Connection conn = pool.getConnection();
                SQLCloseable finish = conn::rollback;) {
            conn.setAutoCommit(false);
            pst = conn.prepareStatement("INSERT INTO WEB.MULTIMEDIA (ID, TITULO, FUENTE, FECHA, USUARIO, "
                    + "ESTADO, default) VALUES((select case when max(id) is null then 1 else cast((max(id)+1) as integer) end id  from web.multimedia),"
                    + "?,?,?,?,?,?)");
            pst.setString(1, obj.getTitulo());
            pst.setString(2, obj.getFuente());
            pst.setDate(3, obj.getFecha());
            pst.setInt(4, obj.getUsuario().getPers_id());
            pst.setBoolean(5, obj.getEstado());
            pst.setBoolean(6, obj.getDefecto());
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
    public BEAN_CRUD update(Multimedia obj, HashMap<String, Object> parameters) throws SQLException {
        BEAN_CRUD beancrud = new BEAN_CRUD();
        PreparedStatement pst;
        try (Connection conn = pool.getConnection();
                SQLCloseable finish = conn::rollback;) {
            conn.setAutoCommit(false);
            pst = conn.prepareStatement("UPDATE WEB.MULTIMEDIA SET TITULO = ?, FUENTE=?, FECHA=?, "
                    + " ESTADO=?, USUARIO=? WHERE ID = ?");
            pst.setString(1, obj.getTitulo());
            pst.setString(2, obj.getFuente());
            pst.setDate(3, obj.getFecha());
            pst.setInt(4, obj.getUsuario().getPers_id());
            pst.setInt(5, obj.getId());
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
            pst = conn.prepareStatement("DELETE FROM WEB.MULTIMEDIA WHERE ID = ?");
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
    public Multimedia get(long id) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
