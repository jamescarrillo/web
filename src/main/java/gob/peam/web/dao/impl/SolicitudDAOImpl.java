/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gob.peam.web.dao.impl;

import gob.peam.web.dao.SQLCloseable;
import gob.peam.web.dao.SolicitudDAO;
import gob.peam.web.model.Solicitud;
import gob.peam.web.utilities.BEAN_CRUD;
import gob.peam.web.utilities.BEAN_PAGINATION;
import gob.peam.web.utilities.Utilities;
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
public class SolicitudDAOImpl implements SolicitudDAO{
    
    private static final Logger LOG = Logger.getLogger(DocumentoDAOImpl.class.getName());
    private final DataSource pool;

    public SolicitudDAOImpl(DataSource pool) {
        this.pool = pool;
    }

    @Override
    public BEAN_PAGINATION getPagination(HashMap<String, Object> parameters, Connection conn) throws SQLException {
        BEAN_PAGINATION beanpagination = new BEAN_PAGINATION();
        PreparedStatement pst;
        ResultSet rs;
        try {
            pst = conn.prepareStatement("SELECT COUNT(SOLI_ID) AS CANT FROM WEB.SOLICITUD WHERE "
                    + "(LOWER(USUARIO) LIKE CONCAT('%',?,'%'))"
                    + parameters.get("SQL_ESTADO") + " ");
            pst.setString(1, String.valueOf(parameters.get("FILTER")));
            LOG.info(pst.toString());
            rs = pst.executeQuery();
            while (rs.next()) {
                beanpagination.setCOUNT_FILTER(rs.getInt("CANT"));
            }
            pst = conn.prepareStatement("SELECT * FROM WEB.SOLICITUD WHERE "
                    + "(LOWER(USUARIO) LIKE CONCAT('%',?,'%'))"
                    + parameters.get("SQL_ESTADO") + " "
                    + String.valueOf(parameters.get("SQL_ANIO")) + " ORDER BY "
                    + String.valueOf(parameters.get("SQL_ORDERS")) + " " + parameters.get("LIMIT"));
            pst.setString(1, String.valueOf(parameters.get("FILTER")));
            LOG.info(pst.toString());
            rs = pst.executeQuery();
            List<Solicitud> list = new ArrayList<>();
            while (rs.next()) {
                Solicitud obj = new Solicitud();
                obj.setSoli_id(rs.getInt("SOLI_ID"));
                obj.setAnho(rs.getString("ANHO"));
                obj.setUsuario(rs.getString("USUARIO"));
                obj.setFecha_registro(Utilities.ConvertDateToView(rs.getString("FECHA_REGISTRO")));
                if (rs.getString("FECHA_ATENDIDO").equals("")) {
                    obj.setFecha_atendido("");
                }else{
                    obj.setFecha_atendido(Utilities.ConvertDateToView(rs.getString("FECHA_ATENDIDO")));
                }
                obj.setDni(rs.getString("DNI"));
                obj.setDependencia(rs.getString("DEPENDENCIA"));
                obj.setDescripcion(rs.getString("DESCRIPCION"));
                obj.setTelefono(rs.getString("TELEFONO"));
                obj.setCorreo(rs.getString("CORREO"));
                obj.setEstado(rs.getBoolean("ESTADO"));
                obj.setDomicilio(rs.getString("DOMICILIO"));
                obj.setForma(rs.getInt("FORMA"));
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
    public BEAN_CRUD add(Solicitud obj, HashMap<String, Object> parameters) throws SQLException {
        BEAN_CRUD beancrud = new BEAN_CRUD();
        PreparedStatement pst;
        try (Connection conn = pool.getConnection();
                SQLCloseable finish = conn::rollback;) {
            conn.setAutoCommit(false);
            Calendar cal = Calendar.getInstance();
            int year = cal.get(Calendar.YEAR);
            pst = conn.prepareStatement("INSERT INTO WEB.SOLICITUD (SOLI_ID, ANHO, USUARIO, DNI ,CORREO, DEPENDENCIA, "
                    +"DESCRIPCION, FECHA_REGISTRO, ESTADO, TELEFONO, DOMICILIO, FORMA, FECHA_ATENDIDO) VALUES((select case when max(soli_id) is null then 1 else cast((max(soli_id)+1) as integer) end soli_id  from web.solicitud),"
                    + "(select extract(year from current_date)),?,?,?,?,?,CURRENT_DATE,'true',?,?,?,'')");
            pst.setString(1, obj.getUsuario());
            pst.setString(2, obj.getDni());
            pst.setString(3, obj.getCorreo());
            pst.setString(4, obj.getDependencia());
            pst.setString(5, obj.getDescripcion());
            pst.setString(6, obj.getTelefono());
            pst.setString(7, obj.getDomicilio());
            pst.setInt(8, obj.getForma());
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
    public BEAN_CRUD update(Solicitud obj, HashMap<String, Object> parameters) throws SQLException {
        BEAN_CRUD beancrud = new BEAN_CRUD();
        PreparedStatement pst;
        try (Connection conn = pool.getConnection();
                SQLCloseable finish = conn::rollback;) {
            conn.setAutoCommit(false);
            pst = conn.prepareStatement("UPDATE WEB.SOLICITUD SET FECHA_ATENDIDO = CURRENT_DATE WHERE SOLI_ID = ?");
            pst.setInt(1, obj.getSoli_id());
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
            pst = conn.prepareStatement("DELETE FROM WEB.SOLICITUD WHERE SOLI_ID = ?");
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
    public Solicitud get(long id) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
