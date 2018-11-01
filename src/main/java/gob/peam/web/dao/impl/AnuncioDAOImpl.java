/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gob.peam.web.dao.impl;

import gob.peam.web.dao.AnuncioDAO;
import gob.peam.web.dao.SQLCloseable;
import gob.peam.web.model.Anuncio;
import gob.peam.web.utilities.BEAN_CRUD;
import gob.peam.web.utilities.BEAN_PAGINATION;
import gob.peam.web.utilities.Utilities;
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
public class AnuncioDAOImpl implements AnuncioDAO {

    private static final Logger LOG = Logger.getLogger(DocumentoDAOImpl.class.getName());
    private final DataSource pool;

    public AnuncioDAOImpl(DataSource pool) {
        this.pool = pool;
    }

    @Override
    public BEAN_PAGINATION getPagination(HashMap<String, Object> parameters, Connection conn) throws SQLException {
        BEAN_PAGINATION beanpagination = new BEAN_PAGINATION();
        List<Anuncio> list = new ArrayList<>();
        PreparedStatement pst;
        ResultSet rs;
        try {
            pst = conn.prepareStatement("SELECT COUNT(ANU_ID) AS COUNT FROM WEB.ANUNCIO WHERE "
                    + "(LOWER(TITULO) LIKE CONCAT('%',?,'%') OR LOWER(CONTENIDO) LIKE CONCAT('%',?,'%')) "
                    + parameters.get("SQL_ESTADO") + " "
                    + parameters.get("SQL_TIPO"));
            pst.setString(1, String.valueOf(parameters.get("FILTER")));
            pst.setString(2, String.valueOf(parameters.get("FILTER")));
            LOG.info(pst.toString());
            rs = pst.executeQuery();
            while (rs.next()) {
                beanpagination.setCOUNT_FILTER(rs.getInt("COUNT"));
                if (rs.getInt("COUNT") > 0) {
                    pst = conn.prepareStatement("SELECT * FROM WEB.ANUNCIO WHERE "
                            + "(LOWER(TITULO) LIKE CONCAT('%',?,'%') OR LOWER(CONTENIDO) LIKE CONCAT('%',?,'%')) "
                            + parameters.get("SQL_ESTADO") + " "
                            + parameters.get("SQL_TIPO") + " "
                            + "ORDER BY " + parameters.get("SQL_ORDERS") + " " + parameters.get("LIMIT"));
                    pst.setString(1, String.valueOf(parameters.get("FILTER")));
                    pst.setString(2, String.valueOf(parameters.get("FILTER")));
                    LOG.info(pst.toString());
                    rs = pst.executeQuery();
                    while (rs.next()) {
                        Anuncio obj = new Anuncio();
                        obj.setAnu_id(rs.getInt("ANU_ID"));
                        obj.setAnu_fecha_ini(Utilities.ConvertDateToView(rs.getString("ANU_FECHA_INI")));
                        obj.setAnu_fecha_fin(Utilities.ConvertDateToView(rs.getString("ANU_FECHA_FIN")));
                        obj.setTipo(rs.getInt("TIPO"));
                        obj.setTitulo(rs.getString("TITULO"));
                        obj.setContenido(rs.getString("CONTENIDO"));
                        obj.setEstado(rs.getBoolean("ESTADO"));
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
    public BEAN_CRUD add(Anuncio obj, HashMap<String, Object> parameters) throws SQLException {
        BEAN_CRUD beancrud = new BEAN_CRUD();
        PreparedStatement pst;
        try (Connection conn = pool.getConnection();
                SQLCloseable finish = conn::rollback;) {
            conn.setAutoCommit(false);
            pst = conn.prepareStatement("INSERT INTO WEB.ANUNCIO VALUES((select case when max(anu_id) is null then 1 else cast((max(anu_id)+1) as integer) end id  from web.anuncio),"
                    + "?,?,?,?,?,?)");
            pst.setString(1, obj.getAnu_fecha_ini());
            pst.setString(2, obj.getAnu_fecha_fin());
            pst.setInt(3, obj.getTipo());
            pst.setString(4, obj.getTitulo());
            pst.setString(5, obj.getContenido());
            pst.setBoolean(6, obj.getEstado());
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
    public BEAN_CRUD update(Anuncio obj, HashMap<String, Object> parameters) throws SQLException {
        BEAN_CRUD beancrud = new BEAN_CRUD();
        PreparedStatement pst;
        try (Connection conn = pool.getConnection();
                SQLCloseable finish = conn::rollback;) {
            conn.setAutoCommit(false);
            pst = conn.prepareStatement("UPDATE WEB.ANUNCIO SET ANU_FECHA_INI = ?, ANU_FECHA_FIN = ?, TIPO=?, "
                    + " TITULO=?, CONTENIDO = ?, ESTADO = ? WHERE ANU_ID = ?");
            pst.setString(1, obj.getAnu_fecha_ini());
            pst.setString(2, obj.getAnu_fecha_fin());
            pst.setInt(3, obj.getTipo());
            pst.setString(4, obj.getTitulo());
            pst.setString(5, obj.getContenido());
            pst.setBoolean(6, obj.getEstado());
            pst.setInt(7, obj.getAnu_id());
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
            pst = conn.prepareStatement("DELETE FROM WEB.ANUNCIO WHERE ANU_ID = ?");
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
    public Anuncio get(long id) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Anuncio> getAnunciosDia(Integer cantidad) throws SQLException {
        List<Anuncio> list = new ArrayList<>(cantidad);
        try (Connection conn = pool.getConnection()) {
            try (PreparedStatement pst = conn.prepareStatement("SELECT TITULO, CONTENIDO FROM WEB.ANUNCIO WHERE "
                    + "CURRENT_DATE BETWEEN TO_DATE(ANU_FECHA_INI,'YYYY-MM-DD') AND TO_DATE(ANU_FECHA_FIN,'YYYY-MM-DD') "
                    + "LIMIT ? OFFSET 0")) {
                pst.setInt(1, cantidad);
                try (ResultSet rs = pst.executeQuery()) {
                    while (rs.next()) {
                        Anuncio anuncio = new Anuncio();
                        anuncio.setTitulo(rs.getString("TITULO"));
                        anuncio.setContenido(rs.getString("CONTENIDO"));
                        list.add(anuncio);
                    }
                }
            }
        } catch (SQLException e) {
            throw e;
        }
        return list;
    }

    @Override
    public BEAN_CRUD activate(long id, HashMap<String, Object> parameters) throws SQLException {
        BEAN_CRUD beancrud = new BEAN_CRUD();
        PreparedStatement pst;
        try (Connection conn = pool.getConnection();
                SQLCloseable finish = conn::rollback;) {
            conn.setAutoCommit(false);
            pst = conn.prepareStatement("UPDATE WEB.ANUNCIO SET ESTADO = ? WHERE ANU_ID = ?");
            if (parameters.get("ESTADOP").equals("true")) {
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

}
