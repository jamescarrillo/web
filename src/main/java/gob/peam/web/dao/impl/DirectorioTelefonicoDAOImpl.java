/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gob.peam.web.dao.impl;

import gob.peam.web.dao.DirectorioTelefonicoDAO;
import gob.peam.web.dao.SQLCloseable;
import gob.peam.web.model.DirectorioTelefonico;
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
public class DirectorioTelefonicoDAOImpl implements DirectorioTelefonicoDAO {

    private final Log logger = LogFactory.getLog(DirectivoDAOImpl.class);
    private final DataSource pool;

    public DirectorioTelefonicoDAOImpl(DataSource pool) {
        this.pool = pool;
    }

    @Override
    public BEAN_PAGINATION getPagination(HashMap<String, Object> parameters, Connection conn) throws SQLException {
        BEAN_PAGINATION beanpagination = new BEAN_PAGINATION();
        PreparedStatement pst;
        ResultSet rs;
        try {
            pst = conn.prepareStatement("SELECT COUNT(ID) AS CANT FROM WEB.f00003 WHERE "
                    + "((LOWER(ANEXO) LIKE CONCAT('%',?,'%')) OR (LOWER(SECCION) LIKE CONCAT('%',?,'%')))");
            pst.setString(1, String.valueOf(parameters.get("FILTER")));
            pst.setString(2, String.valueOf(parameters.get("FILTER")));
            rs = pst.executeQuery();
            while (rs.next()) {
                beanpagination.setCOUNT_FILTER(rs.getInt("CANT"));
            }
            pst = conn.prepareStatement("SELECT * FROM WEB.f00003 WHERE "
                    + "((LOWER(ANEXO) LIKE CONCAT('%',?,'%')) OR (LOWER(SECCION) LIKE CONCAT('%',?,'%')))"
                    + String.valueOf(parameters.get("SQL_ESTADO")) + "ORDER BY "
                    + String.valueOf(parameters.get("SQL_ORDERS")) + " " + parameters.get("LIMIT"));
            pst.setString(1, String.valueOf(parameters.get("FILTER")));
            pst.setString(2, String.valueOf(parameters.get("FILTER")));
            logger.info(pst);
            rs = pst.executeQuery();
            List<DirectorioTelefonico> list = new ArrayList<>();
            while (rs.next()) {
                DirectorioTelefonico obj = new DirectorioTelefonico();
                obj.setId(rs.getInt("ID"));
                obj.setOficina(rs.getString("OFICINA"));
                obj.setSeccion(rs.getString("SECCION"));
                obj.setAnexo(rs.getString("ANEXO"));
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
    public BEAN_CRUD add(DirectorioTelefonico obj, HashMap<String, Object> parameters) throws SQLException {
        BEAN_CRUD beancrud = new BEAN_CRUD();
        PreparedStatement pst;
        try (Connection conn = pool.getConnection();
                SQLCloseable finish = conn::rollback;) {
            conn.setAutoCommit(false);
            pst = conn.prepareStatement("INSERT INTO WEB.f00003 (ID, OFICINA, SECCION, "
                    + "ANEXO) VALUES((select case when max(id) is null then 1 else cast((max(id)+1) as integer) end id  from web.f00003),"
                    + "?,?,?)");
            pst.setString(1, obj.getOficina());
            pst.setString(2, obj.getSeccion());
            pst.setString(3, obj.getAnexo());
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
    public BEAN_CRUD update(DirectorioTelefonico obj, HashMap<String, Object> parameters) throws SQLException {
        BEAN_CRUD beancrud = new BEAN_CRUD();
        PreparedStatement pst;
        try (Connection conn = pool.getConnection();
                SQLCloseable finish = conn::rollback;) {
            conn.setAutoCommit(false);
            pst = conn.prepareStatement("UPDATE WEB.f00003 SET OFICINA = ?, SECCION = ?, ANEXO=? "
                    + " WHERE ID = ?");
            pst.setString(1, obj.getOficina());
            pst.setString(2, obj.getSeccion());
            pst.setString(3, obj.getAnexo());
            pst.setInt(4, obj.getId());
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
            pst = conn.prepareStatement("DELETE FROM WEB.f00003 WHERE ID = ?");
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
    public DirectorioTelefonico get(long id) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
