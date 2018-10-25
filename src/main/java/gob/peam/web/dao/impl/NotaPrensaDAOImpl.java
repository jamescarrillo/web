/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gob.peam.web.dao.impl;

import gob.peam.web.dao.NotaPrensaDAO;
import gob.peam.web.dao.SQLCloseable;
import gob.peam.web.model.NotaPrensa;
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
import java.util.logging.Logger;
import javax.sql.DataSource;

/**
 *
 * @author James Carrillo
 */
public class NotaPrensaDAOImpl implements NotaPrensaDAO {

    private static final Logger LOG = Logger.getLogger(NotaPrensaDAOImpl.class.getName());
    private final DataSource pool;

    public NotaPrensaDAOImpl(DataSource pool) {
        this.pool = pool;
    }

    @Override
    public BEAN_PAGINATION getPagination(HashMap<String, Object> parameters, Connection conn) throws SQLException {
        BEAN_PAGINATION beanpagination = new BEAN_PAGINATION();
        List<NotaPrensa> list = new ArrayList<>();
        PreparedStatement pst;
        ResultSet rs;
        try {
            pst = conn.prepareStatement("SELECT COUNT(ID) AS COUNT FROM WEB.F00021 WHERE "
                    + "LOWER(TITULO) LIKE CONCAT('%',?,'%') "
                    + parameters.get("SQL_ANIO"));
            pst.setString(1, String.valueOf(parameters.get("FILTER")));
            LOG.info(pst.toString());
            rs = pst.executeQuery();
            while (rs.next()) {
                beanpagination.setCOUNT_FILTER(rs.getInt("COUNT"));
                if (rs.getInt("COUNT") > 0) {
                    pst = conn.prepareStatement("SELECT * FROM WEB.F00021 WHERE "
                            + "LOWER(TITULO) LIKE CONCAT('%',?,'%') "
                            + parameters.get("SQL_ANIO")
                            + "ORDER BY "
                            + String.valueOf(parameters.get("SQL_ORDERS")) + " " + parameters.get("LIMIT"));
                    pst.setString(1, String.valueOf(parameters.get("FILTER")));
                    LOG.info(pst.toString());
                    rs = pst.executeQuery();
                    while (rs.next()) {
                        NotaPrensa obj = new NotaPrensa();
                        obj.setId(rs.getInt("ID"));
                        obj.setAnho(rs.getString("ANHO"));
                        obj.setTitulo(rs.getString("TITULO"));
                        obj.setFuente(rs.getString("FUENTE"));
                        obj.setContenido(rs.getString("CONTENIDO"));
                        obj.setFecha(rs.getDate("FECHA"));
                        obj.setFoto(rs.getString("FOTO"));
                        obj.setEstado(rs.getBoolean("ESTADO"));
                        Persona per = new Persona();
                        per.setPers_id(rs.getInt("SUBIDO_POR"));
                        obj.setSubido_por(per);
                        obj.setFecha_creacion(rs.getDate("FECHA_CREACION"));
                        obj.setFecha_actualizacion(rs.getDate("FECHA_ACTUALIZACION"));
                        list.add(obj);
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
    public BEAN_CRUD add(NotaPrensa obj, HashMap<String, Object> parameters) throws SQLException {
        BEAN_CRUD beancrud = new BEAN_CRUD();
        PreparedStatement pst;
        try (Connection conn = pool.getConnection();
                SQLCloseable finish = conn::rollback;) {
            conn.setAutoCommit(false);
            pst = conn.prepareStatement("INSERT INTO WEB.F00021 VALUES((select cast((max(id)+1) as integer) from web.f00021),"
                    + "(select extract(year from current_date)),?,?,?,?,?,?,?,current_date,current_date)");
            pst.setString(1, obj.getTitulo());
            pst.setString(2, obj.getContenido());
            pst.setString(3, obj.getFuente());
            pst.setDate(4, obj.getFecha());
            pst.setString(5, obj.getFoto());
            pst.setBoolean(6, obj.getEstado());
            pst.setInt(7, obj.getSubido_por().getPers_id());
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
    public BEAN_CRUD update(NotaPrensa obj, HashMap<String, Object> parameters) throws SQLException {
        BEAN_CRUD beancrud = new BEAN_CRUD();
        PreparedStatement pst;
        try (Connection conn = pool.getConnection();
                SQLCloseable finish = conn::rollback;) {
            conn.setAutoCommit(false);
            pst = conn.prepareStatement("UPDATE WEB.F00021 SET ANHO = ?, TITULO = ?, CONTENIDO = ?, FUENTE = ?, "
                    + "FECHA = ?, FOTO = ?, ESTADO = ?, SUBIDO_POR = ?, FECHA_CREACION = ?, FECHA_ACTUALIZACION = current_date "
                    + "WHERE ID = ?");
            pst.setString(1, obj.getAnho());
            pst.setString(2, obj.getTitulo());
            pst.setString(3, obj.getContenido());
            pst.setString(4, obj.getFuente());
            pst.setDate(5, obj.getFecha());
            pst.setString(6, obj.getFoto());
            pst.setBoolean(7, obj.getEstado());
            pst.setInt(8, obj.getSubido_por().getPers_id());
            pst.setDate(9, obj.getFecha_creacion());
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
            pst = conn.prepareStatement("DELETE FROM WEB.F00021 WHERE ID = ?");
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
    public NotaPrensa get(long id) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public BEAN_CRUD cambiarEstado(Integer id, Boolean estado, HashMap<String, Object> parameters) throws SQLException {
        BEAN_CRUD beancrud = new BEAN_CRUD();
        PreparedStatement pst;
        try (Connection conn = pool.getConnection();
                SQLCloseable finish = conn::rollback;) {
            conn.setAutoCommit(false);
            pst = conn.prepareStatement("UPDATE WEB.F00021 SET ESTADO = ? WHERE ID = ?");
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

}
