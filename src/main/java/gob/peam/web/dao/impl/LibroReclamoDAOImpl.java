/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gob.peam.web.dao.impl;

import gob.peam.web.dao.LibroReclamoDAO;
import gob.peam.web.dao.SQLCloseable;
import gob.peam.web.model.LibroReclamo;
import gob.peam.web.utilities.BEAN_CRUD;
import gob.peam.web.utilities.BEAN_PAGINATION;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.logging.Logger;
import javax.sql.DataSource;

/**
 *
 * @author JhanxD
 */
public class LibroReclamoDAOImpl implements LibroReclamoDAO {

    private static final Logger LOG = Logger.getLogger(DocumentoDAOImpl.class.getName());
    private final DataSource pool;

    public LibroReclamoDAOImpl(DataSource pool) {
        this.pool = pool;
    }

    @Override
    public BEAN_PAGINATION getPagination(HashMap<String, Object> parameters, Connection conn) throws SQLException {
        BEAN_PAGINATION beanpagination = new BEAN_PAGINATION();
        PreparedStatement pst;
        ResultSet rs;
        try {
            pst = conn.prepareStatement("SELECT COUNT(NUMERO) AS CANT FROM WEB.LIBRO_RECLAMACION WHERE "
                    + "(LOWER(USUARIO) LIKE CONCAT('%',?,'%'))"
                    + parameters.get("SQL_ESTADO") + " ");
            pst.setString(1, String.valueOf(parameters.get("FILTER")));
            LOG.info(pst.toString());
            rs = pst.executeQuery();
            while (rs.next()) {
                beanpagination.setCOUNT_FILTER(rs.getInt("CANT"));
            }
            pst = conn.prepareStatement("SELECT * FROM WEB.LIBRO_RECLAMACION WHERE "
                    + "(LOWER(USUARIO) LIKE CONCAT('%',?,'%'))"
                    + parameters.get("SQL_ESTADO") + " "
                    + String.valueOf(parameters.get("SQL_ANIO")) + " ORDER BY "
                    + String.valueOf(parameters.get("SQL_ORDERS")) + " " + parameters.get("LIMIT"));
            pst.setString(1, String.valueOf(parameters.get("FILTER")));
            LOG.info(pst.toString());
            rs = pst.executeQuery();
            List<LibroReclamo> list = new ArrayList<>();
            while (rs.next()) {
                LibroReclamo obj = new LibroReclamo();
                obj.setNumero(rs.getString("NUMERO"));
                obj.setAnho(rs.getString("ANHO"));
                obj.setUsuario(rs.getString("USUARIO"));
                obj.setFecha(rs.getDate("FECHA"));
                obj.setDocumento_identidad(rs.getString("DOCUMENTO_IDENTIDAD"));
                obj.setNumero_documento(rs.getString("NUMERO_DOCUMENTO"));
                obj.setDireccion(rs.getString("DIRECCION"));
                obj.setTelefono(rs.getString("TELEFONO"));
                obj.setE_mail(rs.getString("E_MAIL"));
                obj.setDescripcion_atencion(rs.getString("DESCRIPCION_ATENCION"));
                obj.setFirma_usuario(rs.getString("FIRMA_USUARIO"));
                obj.setDetalle_acciones(rs.getString("DETALLE_ACCIONES"));
                obj.setFecha_acciones(rs.getDate("FECHA_ACCIONES"));
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
    public BEAN_CRUD add(LibroReclamo obj, HashMap<String, Object> parameters) throws SQLException {
        BEAN_CRUD beancrud = new BEAN_CRUD();
        PreparedStatement pst;
        try (Connection conn = pool.getConnection();
                SQLCloseable finish = conn::rollback;) {
            conn.setAutoCommit(false);
            Calendar cal = Calendar.getInstance();
            int year = cal.get(Calendar.YEAR);
            pst = conn.prepareStatement("INSERT INTO WEB.LIBRO_RECLAMACION(NUMERO, ANHO, FECHA, USUARIO, DOCUMENTO_IDENTIDAD, NUMERO_DOCUMENTO,"
                    + "DIRECCION, TELEFONO, E_MAIL, DESCRIPCION_ATENCION, FIRMA_USUARIO, ESTADO)"
                    + "VALUES((select lpad(cast(((cast((max(numero)) as integer))+1) as varchar ), 10, '0') from web.libro_reclamacion where (anho ='"+year+"')),"
                    + "(select extract(year from current_date)), CURRENT_DATE,?,?,?,?,?,?,?,?,'false')");
            pst.setString(1, obj.getUsuario());
            pst.setString(2, obj.getDocumento_identidad());
            pst.setString(3, obj.getNumero_documento());
            pst.setString(4, obj.getDireccion());
            pst.setString(5, obj.getTelefono());
            pst.setString(6, obj.getE_mail());
            pst.setString(7, obj.getDescripcion_atencion());
            pst.setString(8, obj.getFirma_usuario());
            LOG.info(pst.toString());
            pst.executeUpdate();
            conn.commit();
            beancrud.setMESSAGE_SERVER("ok");
            pst.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return beancrud;
    }

    @Override
    public BEAN_CRUD update(LibroReclamo obj, HashMap<String, Object> parameters) throws SQLException {
        BEAN_CRUD beancrud = new BEAN_CRUD();
        PreparedStatement pst;
        try (Connection conn = pool.getConnection();
                SQLCloseable finish = conn::rollback;) {
            conn.setAutoCommit(false);
            pst = conn.prepareStatement("UPDATE WEB.LIBRO_RECLAMACION SET DESCRIPCION_ATENCION = ?, DETALLE_ACCIONES = ?, FECHA_ACCIONES = CURRENT_DATE "
                    + " WHERE (NUMERO = ? AND ANHO = ?)");
            pst.setString(1, obj.getDescripcion_atencion());
            pst.setString(2, obj.getDetalle_acciones());
            pst.setString(3, obj.getNumero());
            pst.setString(4, obj.getAnho());
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
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public LibroReclamo get(long id) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public BEAN_CRUD eliminar(String numero, String anho, HashMap<String, Object> parameters) throws SQLException {
        BEAN_CRUD beancrud = new BEAN_CRUD();
        PreparedStatement pst;
        try (Connection conn = pool.getConnection();
                SQLCloseable finish = conn::rollback;) {
            conn.setAutoCommit(false);
            pst = conn.prepareStatement("DELETE FROM WEB.LIBRO_RECLAMACION WHERE (NUMERO = ? AND ANHO = ?)");
            pst.setString(1, numero);
            pst.setString(2, anho);
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
    public BEAN_CRUD activate(String numero, String anho, HashMap<String, Object> parameters) throws SQLException {
        BEAN_CRUD beancrud = new BEAN_CRUD();
        PreparedStatement pst;
        try (Connection conn = pool.getConnection();
                SQLCloseable finish = conn::rollback;) {
            conn.setAutoCommit(false);
            pst = conn.prepareStatement("UPDATE WEB.LIBRO_RECLAMACION SET ESTADO = ? WHERE (NUMERO = ? AND ANHO = ?)");
            if (parameters.get("ESTADOP").equals("true")) {
                pst.setBoolean(1, true);
            } else {
                pst.setBoolean(1, false);
            }
            pst.setString(2, numero);
            pst.setString(3, anho);
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
