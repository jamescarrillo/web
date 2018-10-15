/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gob.peam.web.dao;

import gob.peam.web.model.Directorio;
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

/**
 *
 * @author James Carrillo
 */
public class DirectorioDAO {

    private DataSource pool;

    private BEAN_PAGINATION getPagination(HashMap<String, Object> parametros, Connection conn) throws SQLException {
        BEAN_PAGINATION beanpagination = new BEAN_PAGINATION();
        PreparedStatement pst;
        ResultSet rs;
        try {
            pst = conn.prepareStatement("SELECT COUNT(ID) AS CANT FROM WEB.F00003 WHERE "
                    + String.valueOf(parametros.get("FIELD_FILTER")) + " LIKE CONCAT('%',?,'%')");
            pst.setString(1, String.valueOf(parametros.get("FILTER")));
            rs = pst.executeQuery();
            while (rs.next()) {
                beanpagination.setCOUNT_FILTER(rs.getInt("CANT"));
            }
            pst = conn.prepareStatement("SELECT * FROM WEB.F00003 WHERE "
                    + String.valueOf(parametros.get("FIELD_FILTER")) + " LIKE CONCAT('%',?,'%') ORDER BY "
                    + String.valueOf(parametros.get("SQL_ORDERS")) + " " + parametros.get("LIMIT"));
            pst.setString(1, String.valueOf(parametros.get("FILTER")));
            rs = pst.executeQuery();
            List list = new ArrayList<>();
            while (rs.next()) {
                Directorio obj = new Directorio();
                obj.setId(rs.getInt("ID"));
                obj.setOficina(rs.getString("OFICINA"));
                obj.setSeccion(rs.getString("SECCION"));
                obj.setSeccion(rs.getString("ANEXO"));
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

    public BEAN_PAGINATION getPagination(HashMap<String, Object> parametros) throws SQLException {
        BEAN_PAGINATION beansPagination = null;
        try (Connection conn = pool.getConnection()) {
            beansPagination = getPagination(parametros, conn);
        } catch (SQLException e) {
            throw e;
        }
        return beansPagination;
    }

    public BEAN_CRUD add(Directorio obj, HashMap<String, Object> parametros) throws SQLException {
        BEAN_CRUD beancrud = new BEAN_CRUD();
        PreparedStatement pst;
        try (Connection conn = pool.getConnection();
                SQLCloseable finish = conn::rollback;) {
            conn.setAutoCommit(false);
            pst = conn.prepareStatement("INSERT INTO WEB.F00003(OFICINA,SECCION,ANEXO,ESTADO) VALUES(?,?,?,?)");
            pst.setString(1, obj.getOficina());
            pst.setString(2, obj.getSeccion());
            pst.setString(3, obj.getAnexo());
            pst.setBoolean(4, obj.getEstado());
            pst.executeUpdate();
            conn.commit();
            beancrud.setMESSAGE_SERVER("registered");
            beancrud.setBEAN_PAGINATION(getPagination(parametros, conn));
            pst.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return beancrud;
    }

    public BEAN_CRUD update(Directorio obj, HashMap<String, Object> parametros) throws SQLException {
        BEAN_CRUD beancrud = new BEAN_CRUD();
        PreparedStatement pst;
        try (Connection conn = pool.getConnection();
                SQLCloseable finish = conn::rollback;) {
            conn.setAutoCommit(false);
            pst = conn.prepareStatement("UPDATE WEB.F00003 SET = OFICINA, SECCION = ?, ANEXO = ?, ESTADO = ? "
                    + "WHERE ID = ?");
            pst.setString(1, obj.getOficina());
            pst.setString(2, obj.getSeccion());
            pst.setString(3, obj.getAnexo());
            pst.setBoolean(4, obj.getEstado());
            pst.setInt(5, obj.getId());
            pst.executeUpdate();
            conn.commit();
            beancrud.setMESSAGE_SERVER("modified");
            beancrud.setBEAN_PAGINATION(getPagination(parametros, conn));
            pst.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return beancrud;
    }

    public BEAN_CRUD delete(Directorio obj, HashMap<String, Object> parametros) throws SQLException {
        BEAN_CRUD beancrud = new BEAN_CRUD();
        PreparedStatement pst;
        try (Connection conn = pool.getConnection();
                SQLCloseable finish = conn::rollback;) {
            conn.setAutoCommit(false);
            pst = conn.prepareStatement("DELETE FROM WEB.F00003 WHERE ID = ?");
            pst.setInt(1, obj.getId());
            pst.executeUpdate();
            conn.commit();
            beancrud.setMESSAGE_SERVER("deleted");
            beancrud.setBEAN_PAGINATION(getPagination(parametros, conn));
            pst.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return beancrud;
    }

}
