/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gob.peam.web.dao.impl;

import gob.peam.web.dao.DocumentCalDAO;
import gob.peam.web.dao.SQLCloseable;
import gob.peam.web.model.CalendarioConv;
import gob.peam.web.model.DocumentCal;
import gob.peam.web.model.Penalidad;
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
public class DocumentCalDAOImpl implements DocumentCalDAO {

    private final Log logger = LogFactory.getLog(DirectivoDAOImpl.class);
    private final DataSource pool;

    public DocumentCalDAOImpl(DataSource pool) {
        this.pool = pool;
    }

    @Override
    public BEAN_PAGINATION getPagination(HashMap<String, Object> parameters, Connection conn) throws SQLException {
        BEAN_PAGINATION beanpagination = new BEAN_PAGINATION();
        PreparedStatement pst;
        ResultSet rs;
        try {
            pst = conn.prepareStatement("SELECT COUNT(DOCO_ID) AS CANT FROM WEB.DOCUMENT_CONV WHERE "
                    + String.valueOf(parameters.get("IDCALENDARIO")));
            rs = pst.executeQuery();
            while (rs.next()) {
                beanpagination.setCOUNT_FILTER(rs.getInt("CANT"));
            }
            pst = conn.prepareStatement("SELECT * FROM WEB.DOCUMENT_CONV WHERE "
                    + String.valueOf(parameters.get("IDCALENDARIO")));
            rs = pst.executeQuery();
            List<DocumentCal> list = new ArrayList<>();
            while (rs.next()) {
                DocumentCal obj = new DocumentCal();
                obj.setDoco_id(rs.getInt("DOCO_ID"));
                obj.setNombre(rs.getString("NOMBRE"));
                obj.setUrl_file(rs.getString("URL_FILE"));
                obj.setEstado(rs.getBoolean("ESTADO"));
                obj.setId(new CalendarioConv (rs.getInt("ID")));
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
    public BEAN_CRUD add(DocumentCal obj, HashMap<String, Object> parameters) throws SQLException {
        BEAN_CRUD beancrud = new BEAN_CRUD();
        PreparedStatement pst;
        try (Connection conn = pool.getConnection();
                SQLCloseable finish = conn::rollback;) {
            conn.setAutoCommit(false);
            pst = conn.prepareStatement("INSERT INTO WEB.DOCUMENT_CONV (DOCO_ID, NOMBRE, URL_FILE, "
                    + "ESTADO, ID) VALUES((select case when max(doco_id) is null then 1 else cast((max(doco_id)+1) as integer) end id  from web.document_conv),"
                    + "?,?,?,?)");
            pst.setString(1, obj.getNombre());
            pst.setString(2, obj.getUrl_file());
            pst.setBoolean(3, obj.getEstado());
            pst.setInt(4, obj.getId().getId());
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
    public BEAN_CRUD update(DocumentCal obj, HashMap<String, Object> parameters) throws SQLException {
        BEAN_CRUD beancrud = new BEAN_CRUD();
        PreparedStatement pst;
        try (Connection conn = pool.getConnection();
                SQLCloseable finish = conn::rollback;) {
            conn.setAutoCommit(false);
            pst = conn.prepareStatement("UPDATE WEB.DOCUMENT_CONV SET NOMBRE = ?,URL_FILE = ?, ESTADO=?, ID=? "
                    + " WHERE DOCO_ID = ?");
            pst.setString(1, obj.getNombre());
            pst.setString(2, obj.getUrl_file());
            pst.setBoolean(3, obj.getEstado());
            pst.setInt(4, obj.getId().getId());
            pst.setInt(5, obj.getDoco_id());
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
            pst = conn.prepareStatement("DELETE FROM WEB.DOCUMENT_CONV WHERE DOCO_ID = ?");
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
    public DocumentCal get(long id) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
