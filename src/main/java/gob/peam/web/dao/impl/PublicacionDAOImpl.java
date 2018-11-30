/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gob.peam.web.dao.impl;

import gob.peam.web.dao.PublicacionDAO;
import gob.peam.web.dao.SQLCloseable;
import gob.peam.web.model.Publicacion;
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
public class PublicacionDAOImpl implements PublicacionDAO {

    private static final Logger LOG = Logger.getLogger(DocumentoDAOImpl.class.getName());
    private final DataSource pool;

    public PublicacionDAOImpl(DataSource pool) {
        this.pool = pool;
    }

    @Override
    public BEAN_PAGINATION getPagination(HashMap<String, Object> parameters, Connection conn) throws SQLException {
        BEAN_PAGINATION beanpagination = new BEAN_PAGINATION();
        List<Publicacion> list = new ArrayList<>();
        PreparedStatement pst;
        ResultSet rs;
        try {
            pst = conn.prepareStatement("SELECT COUNT(ID) AS COUNT FROM WEB.PUBLICACION WHERE "
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
                    pst = conn.prepareStatement("SELECT * FROM WEB.PUBLICACION WHERE "
                            + "LOWER(DESCRIPCION) LIKE CONCAT('%',?,'%') "
                            + parameters.get("SQL_ANIO") + " "
                            + parameters.get("SQL_ESTADO") + " "
                            + parameters.get("SQL_TIPO") + " "
                            + "ORDER BY " + String.valueOf(parameters.get("SQL_ORDERS")) + " " + parameters.get("LIMIT"));
                    pst.setString(1, String.valueOf(parameters.get("FILTER")));
                    LOG.info(pst.toString());
                    rs = pst.executeQuery();
                    while (rs.next()) {
                        Publicacion obj = new Publicacion();
                        obj.setId(rs.getInt("ID"));
                        obj.setAnho(rs.getString("ANHO"));
                        obj.setTitulo(rs.getString("TITULO"));
                        obj.setDescripcion(rs.getString("DESCRIPCION"));
                        obj.setDireccion_archivo(rs.getString("DIRECCION_ARCHIVO"));
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
    public BEAN_CRUD add(Publicacion obj, HashMap<String, Object> parameters) throws SQLException {
        BEAN_CRUD beancrud = new BEAN_CRUD();
        PreparedStatement pst;
        try (Connection conn = pool.getConnection();
                SQLCloseable finish = conn::rollback;) {
            conn.setAutoCommit(false);
            pst = conn.prepareStatement("INSERT INTO WEB.PUBLICACION VALUES((select cast((max(id)+1) as integer)  from web.publicacion),?,?,?,' ',?,?,?)");
            pst.setString(1, obj.getAnho());
            pst.setString(2, obj.getTitulo());
            pst.setString(3, obj.getDescripcion());
            pst.setInt(4, obj.getTipo());
            pst.setBoolean(5, obj.getEstado());
            pst.setInt(6, obj.getDocu_id());
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
    public BEAN_CRUD update(Publicacion obj, HashMap<String, Object> parameters) throws SQLException {
        BEAN_CRUD beancrud = new BEAN_CRUD();
        PreparedStatement pst;
        try (Connection conn = pool.getConnection();
                SQLCloseable finish = conn::rollback;) {
            conn.setAutoCommit(false);
            pst = conn.prepareStatement("UPDATE WEB.PUBLICACION SET  ANHO=? , TITULO=? , DESCRIPCION=? , "
                    + "TIPO=? , ESTADO=? , DOCU_ID=? WHERE ID = ?");
            pst.setString(1, obj.getAnho());
            pst.setString(2, obj.getTitulo());
            pst.setString(3, obj.getDescripcion());
            pst.setInt(4, obj.getTipo());
            pst.setBoolean(5, obj.getEstado());
            pst.setInt(6, obj.getDocu_id());
            pst.setInt(7, obj.getId());
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
            pst = conn.prepareStatement("DELETE FROM WEB.PUBLICACION WHERE ID = ?");
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
    public Publicacion get(long id) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public BEAN_CRUD activate(long id, HashMap<String, Object> parameters) throws SQLException {
        BEAN_CRUD beancrud = new BEAN_CRUD();
        PreparedStatement pst;
        try (Connection conn = pool.getConnection();
                SQLCloseable finish = conn::rollback;) {
            conn.setAutoCommit(false);
            pst = conn.prepareStatement("UPDATE WEB.PUBLICACION SET ESTADO = ? WHERE ID = ?");
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

}
