/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gob.peam.web.dao;

import gob.peam.web.model.Directorio;
import gob.peam.web.utilities.BeanCrud;
import gob.peam.web.utilities.BeanPagination;
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

    private BeanPagination getPagination(HashMap<String, Object> parametros, Connection conn) throws SQLException {
        BeanPagination beanpagination = new BeanPagination();
        PreparedStatement pst;
        ResultSet rs;
        try {
            pst = conn.prepareStatement("SELECT COUNT(ID) AS CANT FROM WEB.F00003 WHERE "
                    + String.valueOf(parametros.get("FIELD_FILTER")) + " LIKE CONCAT('%',?,'%')");
            pst.setString(1, String.valueOf(parametros.get("FILTER")));
            rs = pst.executeQuery();
            while (rs.next()) {
                beanpagination.setCount_filter(rs.getInt("CANT"));
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
            beanpagination.setList(list);
            rs.close();
            pst.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return beanpagination;
    }

    public BeanPagination getPagination(HashMap<String, Object> parametros) throws SQLException {
        BeanPagination beansPagination = null;
        try (Connection conn = pool.getConnection()) {
            beansPagination = getPagination(parametros, conn);
        } catch (SQLException e) {
            throw e;
        }
        return beansPagination;
    }

    public BeanCrud add(Directorio obj, HashMap<String, Object> parametros) throws SQLException {
        BeanCrud beancrud = new BeanCrud();
        PreparedStatement pst;
        try (Connection conn = pool.getConnection();
                SQLCloseable finish = conn::rollback;) {
            conn.setAutoCommit(false);
            pst = conn.prepareStatement("INSERT INTO WEB.F00003(OFICINA,SECCION,ANEXO,ESTADO) VALUES(?,?,?,?)");
            pst.setString(1, obj.getOficina());
            pst.setString(2, obj.getSeccion());
            pst.setString(3, obj.getAnexo());
            pst.setBoolean(4, obj.isEstado());
            pst.executeUpdate();
            conn.commit();
            beancrud.setMessageServer("registered");
            beancrud.setBeanPagination(getPagination(parametros, conn));
            pst.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return beancrud;
    }

    public BeanCrud update(Directorio obj, HashMap<String, Object> parametros) throws SQLException {
        BeanCrud beancrud = new BeanCrud();
        PreparedStatement pst;
        try (Connection conn = pool.getConnection();
                SQLCloseable finish = conn::rollback;) {
            conn.setAutoCommit(false);
            pst = conn.prepareStatement("UPDATE WEB.F00003 SET = OFICINA, SECCION = ?, ANEXO = ?, ESTADO = ? "
                    + "WHERE ID = ?");
            pst.setString(1, obj.getOficina());
            pst.setString(2, obj.getSeccion());
            pst.setString(3, obj.getAnexo());
            pst.setBoolean(4, obj.isEstado());
            pst.setInt(5, obj.getId());
            pst.executeUpdate();
            conn.commit();
            beancrud.setMessageServer("modified");
            beancrud.setBeanPagination(getPagination(parametros, conn));
            pst.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return beancrud;
    }

    public BeanCrud delete(Directorio obj, HashMap<String, Object> parametros) throws SQLException {
        BeanCrud beancrud = new BeanCrud();
        PreparedStatement pst;
        try (Connection conn = pool.getConnection();
                SQLCloseable finish = conn::rollback;) {
            conn.setAutoCommit(false);
            pst = conn.prepareStatement("DELETE FROM WEB.F00003 WHERE ID = ?");
            pst.setInt(1, obj.getId());
            pst.executeUpdate();
            conn.commit();
            beancrud.setMessageServer("deleted");
            beancrud.setBeanPagination(getPagination(parametros, conn));
            pst.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return beancrud;
    }

}
