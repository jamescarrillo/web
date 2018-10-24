/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gob.peam.web.dao.impl;

import gob.peam.web.dao.AgendaDAO;
import gob.peam.web.dao.SQLCloseable;
import gob.peam.web.model.Agenda;
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
public class AgendaDAOImpl implements AgendaDAO {
    
    private static final Logger LOG = Logger.getLogger(DocumentoDAOImpl.class.getName());
    private final DataSource pool;

    public AgendaDAOImpl(DataSource pool) {
        this.pool = pool;
    }


    @Override
    public BEAN_PAGINATION getPagination(HashMap<String, Object> parameters, Connection conn) throws SQLException {
        BEAN_PAGINATION beanpagination = new BEAN_PAGINATION();
        List<Agenda> list = new ArrayList<>();
        PreparedStatement pst;
        ResultSet rs;
        try {
            pst = conn.prepareStatement("SELECT COUNT(ID) AS COUNT FROM WEB.f00019 WHERE "
                    + "LOWER(ACTIVIDAD) LIKE CONCAT('%',?,'%') "
                    + parameters.get("SQL_FECHA") + " "
                    + parameters.get("SQL_CALENDARIO") + " "
                    + parameters.get("SQL_ESTADO") + " "
                    + parameters.get("SQL_TIPO"));
            pst.setString(1, String.valueOf(parameters.get("FILTER")));
            LOG.info(pst.toString());
            rs = pst.executeQuery();
            while (rs.next()) {
                beanpagination.setCOUNT_FILTER(rs.getInt("COUNT"));
                if (rs.getInt("COUNT") > 0) {
                    pst = conn.prepareStatement("SELECT * FROM WEB.f00019 WHERE "
                            + "LOWER(ACTIVIDAD) LIKE CONCAT('%',?,'%') "
                            + parameters.get("SQL_FECHA") + " "
                            + parameters.get("SQL_CALENDARIO") + " "
                            + parameters.get("SQL_ESTADO") + " "
                            + parameters.get("SQL_TIPO") + " "
                            + "ORDER BY " + String.valueOf(parameters.get("SQL_ORDERS")) + " " + parameters.get("LIMIT"));
                    pst.setString(1, String.valueOf(parameters.get("FILTER")));
                    LOG.info(pst.toString());
                    rs = pst.executeQuery();
                    while (rs.next()) {
                        Agenda obj = new Agenda();
                        obj.setId(rs.getInt("ID"));
                        obj.setFecha_inicio(rs.getDate("FECHA_INICIO"));
                        obj.setHora_inicio(rs.getString("HORA_INICIO"));
                        obj.setHora_final(rs.getString("HORA_FINAL"));
                        obj.setActividad(rs.getString("ACTIVIDAD"));
                        obj.setCiudad(rs.getString("CIUDAD"));
                        obj.setLugar(rs.getString("LUGAR"));
                        obj.setTipo(rs.getInt("TIPO"));
                        obj.setEstado(rs.getBoolean("ESTADO"));
 
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
    public BEAN_CRUD add(Agenda obj, HashMap<String, Object> parameters) throws SQLException {
        BEAN_CRUD beancrud = new BEAN_CRUD();
        PreparedStatement pst;
        try (Connection conn = pool.getConnection();
                SQLCloseable finish = conn::rollback;) {
            conn.setAutoCommit(false);
            pst = conn.prepareStatement("INSERT INTO WEB.f00019 (ID, FECHA_INICIO, HORA_INICIO, "
                    + "HORA_FINAL, ACTIVIDAD, CIUDAD, LUGAR, TIPO, ESTADO) VALUES((select case when max(id) is null then 1 else cast((max(id)+1) as integer) end id  from web.f00019),"
                    + "?,?,?,?,?,?,?,?)");
            pst.setDate(1, obj.getFecha_inicio());
            pst.setString(2, obj.getHora_inicio());
            pst.setString(3, obj.getHora_final());
            pst.setString(4, obj.getActividad());
            pst.setString(5, obj.getCiudad());
            pst.setString(6, obj.getLugar());
            pst.setInt(7, obj.getTipo());
            pst.setBoolean(8, obj.getEstado());
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
    public BEAN_CRUD update(Agenda obj, HashMap<String, Object> parameters) throws SQLException {
        BEAN_CRUD beancrud = new BEAN_CRUD();
        PreparedStatement pst;
        try (Connection conn = pool.getConnection();
                SQLCloseable finish = conn::rollback;) {
            conn.setAutoCommit(false);
            pst = conn.prepareStatement("UPDATE WEB.f00019 SET FECHA_INICIO = ?, HORA_INICIO = ?, "
                    + " HORA_FINAL=?, ACTIVIDAD=?, CIUDAD=?, LUGAR=? WHERE ID = ?");
            pst.setDate(1, obj.getFecha_inicio());
            pst.setString(2, obj.getHora_inicio());
            pst.setString(3, obj.getHora_final());
            pst.setString(4, obj.getActividad());
            pst.setString(5, obj.getCiudad());
            pst.setString(6, obj.getLugar());
            pst.setInt(7, obj.getId());
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
            pst = conn.prepareStatement("DELETE FROM WEB.f00019 WHERE ID = ?");
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
    public Agenda get(long id) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public BEAN_CRUD activate(long id, HashMap<String, Object> parameters) throws SQLException {
        BEAN_CRUD beancrud = new BEAN_CRUD();
        PreparedStatement pst;
        try (Connection conn = pool.getConnection();
                SQLCloseable finish = conn::rollback;) {
            conn.setAutoCommit(false);
            pst = conn.prepareStatement("UPDATE WEB.f00019 SET ESTADO = ? WHERE ID = ?");
            if (parameters.get("ESTADO").equals("true")) {
                pst.setBoolean(1, true);
            }else{
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
