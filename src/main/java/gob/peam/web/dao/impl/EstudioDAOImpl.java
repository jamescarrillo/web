    /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gob.peam.web.dao.impl;

import gob.peam.web.dao.EstudioDAO;
import gob.peam.web.dao.SQLCloseable;
import gob.peam.web.model.Estudio;
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
public class EstudioDAOImpl implements EstudioDAO{
    
    private final Log logger = LogFactory.getLog(DirectivoDAOImpl.class);
    private final DataSource pool;

    public EstudioDAOImpl(DataSource pool) {
        this.pool = pool;
    }

    @Override
    public BEAN_PAGINATION getPagination(HashMap<String, Object> parameters, Connection conn) throws SQLException {
        BEAN_PAGINATION beanpagination = new BEAN_PAGINATION();
        PreparedStatement pst;
        ResultSet rs;
        try {
            pst = conn.prepareStatement("SELECT COUNT(ID) AS CANT FROM WEB.ESTUDIO WHERE "
                    + "(LOWER(TITULO) LIKE CONCAT('%',?,'%'))");
            pst.setString(1, String.valueOf(parameters.get("FILTER")));
            rs = pst.executeQuery();
            while (rs.next()) {
                beanpagination.setCOUNT_FILTER(rs.getInt("CANT"));
            }
            pst = conn.prepareStatement("SELECT * FROM WEB.ESTUDIO WHERE "
                    + "(LOWER(TITULO) LIKE CONCAT('%',?,'%'))"
                    + String.valueOf(parameters.get("SQL_ANIO")) + "ORDER BY "
                    + String.valueOf(parameters.get("SQL_ORDERS")) + " " + parameters.get("LIMIT"));
            pst.setString(1, String.valueOf(parameters.get("FILTER")));
            rs = pst.executeQuery();
            List<Estudio> list = new ArrayList<>();
            while (rs.next()) {
                Estudio obj = new Estudio();
                obj.setId(rs.getInt("ID"));
                obj.setAnho(rs.getString("ANHO"));
                obj.setTitulo(rs.getString("TITULO"));
                obj.setSnip(rs.getString("SNIP"));
                obj.setFecha(rs.getDate("FECHA"));
                obj.setFoto(rs.getString("FOTO"));
                obj.setObjetivo(rs.getString("OBJETIVO"));
                obj.setCantidad_beneficiarios(rs.getInt("CANTIDAD_BENEFICIARIOS"));
                obj.setCaracteristicas_beneficiarios(rs.getString("CARACTERISTICAS_BENEFICIARIOS"));
                obj.setLugar(rs.getString("LUGAR"));
                obj.setMapa(rs.getString("MAPA"));
                obj.setEstado(rs.getBoolean("ESTADO"));
                obj.setSeguimiento(rs.getString("SEGUIMIENTO"));
                Persona per = new Persona();
                per.setPers_id(rs.getInt("CREADO_POR"));
                obj.setCreado_por(per);
                obj.setFecha_creado(rs.getTimestamp("FECHA_CREADO"));
                obj.setFecha_editado(rs.getTimestamp("FECHA_EDITADO"));

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
    public BEAN_CRUD add(Estudio obj, HashMap<String, Object> parameters) throws SQLException {
        BEAN_CRUD beancrud = new BEAN_CRUD();
        PreparedStatement pst;
        try (Connection conn = pool.getConnection();
                SQLCloseable finish = conn::rollback;) {
            conn.setAutoCommit(false);
            pst = conn.prepareStatement("INSERT INTO WEB.ESTUDIO (ID, ANHO, TITULO, FECHA, FOTO, SEGUIMIENTO, SNIP, "
                    + "ESTADO, CREADO_POR, FECHA_CREADO, OBJETIVO, CANTIDAD_BENEFICIARIOS, CARACTERISTICAS_BENEFICIARIOS, LUGAR, MAPA) VALUES((select case when max(id) is null then 1 else cast((max(id)+1) as integer) end id  from web.estudio),"
                    + "?,?,?,?,?,?,?,?,CURRENT_TIMESTAMP,?,?,?,?,?)");
            pst.setString(1, obj.getAnho());
            pst.setString(2, obj.getTitulo());
            pst.setDate(3, obj.getFecha());
            pst.setString(4, obj.getFoto());
            pst.setString(5, obj.getSeguimiento());
            pst.setString(6, obj.getSnip());
            pst.setBoolean(7, obj.getEstado());
            pst.setInt(8, obj.getCreado_por().getPers_id());
            pst.setString(9, obj.getObjetivo());
            pst.setInt(10, obj.getCantidad_beneficiarios());
            pst.setString(11, obj.getCaracteristicas_beneficiarios());
            pst.setString(12, obj.getLugar());
            pst.setString(13, obj.getMapa());
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
    public BEAN_CRUD update(Estudio obj, HashMap<String, Object> parameters) throws SQLException {
        BEAN_CRUD beancrud = new BEAN_CRUD();
        PreparedStatement pst;
        try (Connection conn = pool.getConnection();
                SQLCloseable finish = conn::rollback;) {
            conn.setAutoCommit(false);
            pst = conn.prepareStatement("UPDATE WEB.ESTUDIO SET ANHO = ?,TITULO = ?, FECHA=?, FOTO=?, "
                    + " ESTADO=?, EDITADO_POR=?, FECHA_EDITADO = CURRENT_TIMESTAMP , SEGUIMIENTO=?, SNIP=?, OBJETIVO = ?,"
                    + "CANTIDAD_BENEFICIARIOS=?, CARACTERISTICAS_BENEFICIARIOS=?, LUGAR=?, MAPA=? WHERE ID = ?");
            pst.setString(1, obj.getAnho());
            pst.setString(2, obj.getTitulo());
            pst.setDate(3, obj.getFecha());
            pst.setString(4, obj.getFoto());
            pst.setBoolean(5, obj.getEstado());
            pst.setInt(6, obj.getEditado_por().getPers_id());
            pst.setString(7, obj.getSeguimiento());
            pst.setString(8, obj.getSnip());
            pst.setString(9, obj.getObjetivo());
            pst.setInt(10, obj.getCantidad_beneficiarios());
            pst.setString(11, obj.getCaracteristicas_beneficiarios());
            pst.setString(12, obj.getLugar());
            pst.setString(13, obj.getMapa());
            pst.setInt(14, obj.getId());
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
            pst = conn.prepareStatement("DELETE FROM WEB.ESTUDIO WHERE ID = ?");
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
    public Estudio get(long id) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public BEAN_CRUD activate(long id, HashMap<String, Object> parameters) throws SQLException {
        BEAN_CRUD beancrud = new BEAN_CRUD();
        PreparedStatement pst;
        try (Connection conn = pool.getConnection();
                SQLCloseable finish = conn::rollback;) {
            conn.setAutoCommit(false);
            pst = conn.prepareStatement("UPDATE WEB.ESTUDIO SET ESTADO = ? WHERE ID = ?");
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
