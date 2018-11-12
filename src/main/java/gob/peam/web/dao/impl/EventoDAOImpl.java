/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gob.peam.web.dao.impl;

import gob.peam.web.dao.EventoDAO;
import gob.peam.web.dao.SQLCloseable;
import gob.peam.web.model.Evento;
import gob.peam.web.model.LineaAccion;
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
public class EventoDAOImpl implements EventoDAO{
    
    private final Log logger = LogFactory.getLog(DirectivoDAOImpl.class);
    private final DataSource pool;

    public EventoDAOImpl(DataSource pool) {
        this.pool = pool;
    }

    @Override
    public BEAN_PAGINATION getPagination(HashMap<String, Object> parameters, Connection conn) throws SQLException {
        BEAN_PAGINATION beanpagination = new BEAN_PAGINATION();
        PreparedStatement pst;
        ResultSet rs;
        try {
            pst = conn.prepareStatement("SELECT COUNT(ID) AS CANT FROM WEB.EVENTO WHERE "
                    + "(LOWER(TITULO) LIKE CONCAT('%',?,'%'))");
            pst.setString(1, String.valueOf(parameters.get("FILTER")));
            rs = pst.executeQuery();
            while (rs.next()) {
                beanpagination.setCOUNT_FILTER(rs.getInt("CANT"));
            }
            pst = conn.prepareStatement("SELECT * FROM WEB.EVENTO WHERE "
                    + "(LOWER(TITULO) LIKE CONCAT('%',?,'%'))"
                    + String.valueOf(parameters.get("SQL_ANIO")) + "ORDER BY "
                    + String.valueOf(parameters.get("SQL_ORDERS")) + " " + parameters.get("LIMIT"));
            pst.setString(1, String.valueOf(parameters.get("FILTER")));
            rs = pst.executeQuery();
            List<Evento> list = new ArrayList<>();
            while (rs.next()) {
                Evento obj = new Evento();
                obj.setId(rs.getInt("ID"));
                obj.setAnho(rs.getString("ANHO"));
                obj.setTitulo(rs.getString("TITULO"));
                obj.setFecha(rs.getDate("FECHA"));
                obj.setFoto(rs.getString("FOTO"));
                obj.setEstado(rs.getBoolean("ESTADO"));
                Persona per = new Persona();
                per.setPers_id(rs.getInt("CREADO_POR"));
                obj.setCreado_por(per);
                obj.setFecha_creado(rs.getTimestamp("FECHA_CREADO"));
                obj.setFecha_editado(rs.getTimestamp("FECHA_EDITADO"));
                obj.setArea(new LineaAccion(rs.getInt("AREA")));
                obj.setLink(rs.getString("LINK"));
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
    public BEAN_CRUD add(Evento obj, HashMap<String, Object> parameters) throws SQLException {
        BEAN_CRUD beancrud = new BEAN_CRUD();
        PreparedStatement pst;
        try (Connection conn = pool.getConnection();
                SQLCloseable finish = conn::rollback;) {
            conn.setAutoCommit(false);
            pst = conn.prepareStatement("INSERT INTO WEB.EVENTO (ID, ANHO, TITULO, FECHA, FOTO, "
                    + "ESTADO, CREADO_POR, FECHA_CREADO, AREA, LINK) VALUES((select case when max(id) is null then 1 else cast((max(id)+1) as integer) end id  from web.evento),"
                    + "?,?,?,?,?,?,CURRENT_TIMESTAMP,?,?)");
            pst.setString(1, obj.getAnho());
            pst.setString(2, obj.getTitulo());
            pst.setDate(3, obj.getFecha());
            pst.setString(4, obj.getFoto());
            pst.setBoolean(5, obj.getEstado());
            pst.setInt(6, obj.getCreado_por().getPers_id());
            pst.setInt(7, obj.getArea().getId());
            pst.setString(8, obj.getLink());
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
    public BEAN_CRUD update(Evento obj, HashMap<String, Object> parameters) throws SQLException {
        BEAN_CRUD beancrud = new BEAN_CRUD();
        PreparedStatement pst;
        try (Connection conn = pool.getConnection();
                SQLCloseable finish = conn::rollback;) {
            conn.setAutoCommit(false);
            pst = conn.prepareStatement("UPDATE WEB.EVENTO SET ANHO = ?,TITULO = ?, FECHA=?, FOTO=?, "
                    + " ESTADO=?, EDITADO_POR=?, FECHA_EDITADO = CURRENT_TIMESTAMP , AREA=?, LINK=? WHERE ID = ?");
            pst.setString(1, obj.getAnho());
            pst.setString(2, obj.getTitulo());
            pst.setDate(3, obj.getFecha());
            pst.setString(4, obj.getFoto());
            pst.setBoolean(5, obj.getEstado());
            pst.setInt(6, obj.getEditado_por().getPers_id());
            pst.setInt(7, obj.getArea().getId());
            pst.setString(8, obj.getLink());
            pst.setInt(9, obj.getId());
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
            pst = conn.prepareStatement("DELETE FROM WEB.EVENTO WHERE ID = ?");
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
    public BEAN_CRUD activate(long id, HashMap<String, Object> parameters) throws SQLException {
        BEAN_CRUD beancrud = new BEAN_CRUD();
        PreparedStatement pst;
        try (Connection conn = pool.getConnection();
                SQLCloseable finish = conn::rollback;) {
            conn.setAutoCommit(false);
            pst = conn.prepareStatement("UPDATE WEB.EVENTO SET ESTADO = ? WHERE ID = ?");
            if (parameters.get("ESTADOP").equals("true")) {
                pst.setBoolean(1, true);
            } else {
                pst.setBoolean(1, false);
            }
            pst.setInt(2, (int) id);
            logger.info(pst);
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
    public Evento get(long id) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
