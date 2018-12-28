/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gob.peam.web.dao.impl;

import gob.peam.web.dao.DestacadoDAO;
import gob.peam.web.dao.SQLCloseable;
import gob.peam.web.model.Destacado;
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
public class DestacadoDAOImpl implements DestacadoDAO {

    private static final Logger LOG = Logger.getLogger(DestacadoDAOImpl.class.getName());
    private final DataSource pool;

    public DestacadoDAOImpl(DataSource pool) {
        this.pool = pool;
    }

    @Override
    public BEAN_PAGINATION getPagination(HashMap<String, Object> parameters, Connection conn) throws SQLException {
        BEAN_PAGINATION beanpagination = new BEAN_PAGINATION();
        List<Destacado> list = new ArrayList<>();
        PreparedStatement pst;
        ResultSet rs;
        try {
            pst = conn.prepareStatement("SELECT COUNT(ID) AS COUNT FROM WEB.DESTACADO WHERE "
                    + "LOWER(TITULO) LIKE CONCAT('%',?,'%') "
                    + parameters.get("SQL_ESTADO") + " "
                    + parameters.get("SQL_ANIO"));
            pst.setString(1, String.valueOf(parameters.get("FILTER")));
            LOG.info(pst.toString());
            rs = pst.executeQuery();
            while (rs.next()) {
                beanpagination.setCOUNT_FILTER(rs.getInt("COUNT"));
                if (rs.getInt("COUNT") > 0) {
                    pst = conn.prepareStatement("SELECT * FROM WEB.DESTACADO WHERE "
                            + "LOWER(TITULO) LIKE CONCAT('%',?,'%') "
                            + parameters.get("SQL_ESTADO") + " "
                            + parameters.get("SQL_ANIO")
                            + "ORDER BY "
                            + String.valueOf(parameters.get("SQL_ORDERS")) + " " + parameters.get("LIMIT"));
                    pst.setString(1, String.valueOf(parameters.get("FILTER")));
                    LOG.info(pst.toString());
                    rs = pst.executeQuery();
                    while (rs.next()) {
                        Destacado obj = new Destacado();
                        obj.setId(rs.getInt("ID"));
                        obj.setAnho(rs.getString("ANHO"));
                        obj.setTitulo(rs.getString("TITULO"));
                        obj.setContenido(rs.getString("CONTENIDO"));
                        obj.setFecha(rs.getDate("FECHA"));
                        obj.setFoto(rs.getString("FOTO"));
                        obj.setEstado(rs.getBoolean("ESTADO"));
                        obj.setUrl(rs.getString("URL"));
                        Persona per = new Persona();
                        per.setPers_id(rs.getInt("CREADO_POR"));
                        obj.setCreado_por(per);
                        obj.setFecha_creado(rs.getDate("FECHA_CREADO"));
                        Persona per1 = new Persona();
                        per1.setPers_id(rs.getInt("EDITADO_POR"));
                        obj.setFecha_editado(rs.getDate("FECHA_EDITADO"));
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
    public BEAN_CRUD add(Destacado obj, HashMap<String, Object> parameters) throws SQLException {
        BEAN_CRUD beancrud = new BEAN_CRUD();
        PreparedStatement pst;
        try (Connection conn = pool.getConnection();
                SQLCloseable finish = conn::rollback;) {
            conn.setAutoCommit(false);
            pst = conn.prepareStatement("INSERT INTO WEB.DESTACADO VALUES((select cast((max(id)+1) as integer) from web.destacado),"
                    + "(select extract(year from current_date)),?,?,?,?,?,?,?,current_date,?,current_date)");
            //AÑO
            pst.setString(1, obj.getTitulo());
            pst.setString(2, obj.getContenido());
            pst.setDate(3, obj.getFecha());
            pst.setString(4, obj.getFoto());
            pst.setBoolean(5, obj.getEstado());
            pst.setString(6, obj.getUrl());
            pst.setInt(7, obj.getCreado_por().getPers_id());
            pst.setInt(8, obj.getEditado_por().getPers_id());
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
    public BEAN_CRUD update(Destacado obj, HashMap<String, Object> parameters) throws SQLException {
        BEAN_CRUD beancrud = new BEAN_CRUD();
        PreparedStatement pst;
        try (Connection conn = pool.getConnection();
                SQLCloseable finish = conn::rollback;) {
            conn.setAutoCommit(false);
            pst = conn.prepareStatement("UPDATE WEB.DESTACADO SET ANHO = ?, TITULO = ?, CONTENIDO = ?, "
                    + "FECHA = ?, FOTO = ?, ESTADO = ?, URL = ?, EDITADO_POR = ?, FECHA_EDITADO = current_date "
                    + "WHERE ID = ?");
            pst.setString(1, obj.getAnho());
            pst.setString(2, obj.getTitulo());
            pst.setString(3, obj.getContenido());
            pst.setDate(4, obj.getFecha());
            pst.setString(5, obj.getFoto());
            pst.setBoolean(6, obj.getEstado());
            pst.setString(7, obj.getUrl());
            pst.setInt(8, obj.getEditado_por().getPers_id());
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
            pst = conn.prepareStatement("DELETE FROM WEB.DESTACADO WHERE ID = ?");
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
    public Destacado get(long id) throws SQLException {
        Destacado obj = null;
        try (Connection conn = this.pool.getConnection()) {
            try (PreparedStatement pst = conn.prepareStatement("SELECT * FROM WEB.DESTACADO WHERE ID = ?")) {
                pst.setInt(1, (int) id);
                LOG.info(pst.toString());
                try (ResultSet rs = pst.executeQuery()) {
                    while (rs.next()) {
                        obj = new Destacado();
                        obj.setId(rs.getInt("ID"));
                        obj.setAnho(rs.getString("ANHO"));
                        obj.setTitulo(rs.getString("TITULO"));
                        obj.setContenido(rs.getString("CONTENIDO"));
                        obj.setFecha(rs.getDate("FECHA"));
                        obj.setFoto(rs.getString("FOTO"));
                        obj.setEstado(rs.getBoolean("ESTADO"));
                        obj.setUrl(rs.getString("URL"));
                        Persona per = new Persona();
                        per.setPers_id(rs.getInt("SUBIDO_POR"));
                        obj.setCreado_por(per);
                        obj.setFecha_creado(rs.getDate("FECHA_CREACION"));
                        obj.setFecha_editado(rs.getDate("FECHA_ACTUALIZACION"));
                    }
                }
            }
        } catch (SQLException e) {
            throw e;
        }
        return obj;
    }

    @Override
    public BEAN_CRUD cambiarEstado(Integer id, Boolean estado, HashMap<String, Object> parameters) throws SQLException {
        BEAN_CRUD beancrud = new BEAN_CRUD();
        PreparedStatement pst;
        try (Connection conn = pool.getConnection();
                SQLCloseable finish = conn::rollback;) {
            conn.setAutoCommit(false);
            pst = conn.prepareStatement("UPDATE WEB.DESTACADO SET ESTADO = ? WHERE ID = ?");
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
