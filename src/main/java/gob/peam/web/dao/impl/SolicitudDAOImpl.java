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
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.HashMap;
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
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public BEAN_PAGINATION getPagination(HashMap<String, Object> parameters) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
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
                    +"DESCRIPCION, FECHA_REGISTRO, ESTADO, TELEFONO, DOMICILIO, FORMA) VALUES((select case when max(soli_id) is null then 1 else cast((max(soli_id)+1) as integer) end soli_id  from web.solicitud),"
                    + "(select extract(year from current_date)),?,?,?,?,?,CURRENT_DATE,'true',?,?,?)");
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
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public BEAN_CRUD delete(long id, HashMap<String, Object> parameters) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Solicitud get(long id) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
