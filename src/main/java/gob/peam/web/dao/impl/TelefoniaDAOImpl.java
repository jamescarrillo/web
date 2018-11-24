/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gob.peam.web.dao.impl;

import gob.peam.web.dao.SQLCloseable;
import gob.peam.web.model.Telefonia;
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
 * @author JamesCarrillo
 */
public class TelefoniaDAOImpl implements gob.peam.web.dao.TelefoniaDAO {

    private static final Logger LOG = Logger.getLogger(TelefoniaDAOImpl.class.getName());
    private final DataSource pool;

    public TelefoniaDAOImpl(DataSource pool) {
        this.pool = pool;
    }

    @Override
    public BEAN_PAGINATION getPagination(HashMap<String, Object> parameters, Connection conn) throws SQLException {
        BEAN_PAGINATION beanpagination = new BEAN_PAGINATION();
        List<Telefonia> list = new ArrayList<>();
        PreparedStatement pst;
        ResultSet rs;
        try {
            pst = conn.prepareStatement("SELECT COUNT(ID) AS COUNT FROM WEB.F00020 WHERE "
                    + "LOWER(AREA_OFICINA) LIKE CONCAT('%',?,'%') " + parameters.get("SQL_ESTADO"));
            pst.setString(1, String.valueOf(parameters.get("FILTER")));
            LOG.info(pst.toString());
            rs = pst.executeQuery();
            while (rs.next()) {
                beanpagination.setCOUNT_FILTER(rs.getInt("COUNT"));
                if (rs.getInt("COUNT") > 0) {
                    pst = conn.prepareStatement("SELECT * FROM WEB.F00020 WHERE "
                            + "LOWER(AREA_OFICINA) LIKE CONCAT('%',?,'%') " + parameters.get("SQL_ESTADO")
                            + "ORDER BY " + String.valueOf(parameters.get("SQL_ORDERS")) + " " + parameters.get("LIMIT"));
                    pst.setString(1, String.valueOf(parameters.get("FILTER")));
                    LOG.info(pst.toString());
                    rs = pst.executeQuery();
                    while (rs.next()) {
                        Telefonia telefonia = new Telefonia();
                        telefonia.setId(rs.getInt("ID"));
                        telefonia.setAnho(rs.getString("ANHO"));
                        telefonia.setMes(rs.getString("MES"));
                        telefonia.setArea_oficina(rs.getString("AREA_OFICINA"));
                        telefonia.setAsignado_a(rs.getString("ASIGNADO_A"));
                        telefonia.setCargo_actividad(rs.getString("CARGO_ACTIVIDAD"));
                        telefonia.setImporte(rs.getDouble("IMPORTE"));
                        telefonia.setEstado(rs.getBoolean("ESTADO"));
                        telefonia.setTipo(rs.getString("TIPO"));
                        telefonia.setNumero(rs.getString("NUMERO"));
                        list.add(telefonia);
                    }
                }
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
    public BEAN_CRUD add(Telefonia obj, HashMap<String, Object> parameters) throws SQLException {
        BEAN_CRUD beancrud = new BEAN_CRUD();
        PreparedStatement pst;
        try (Connection conn = pool.getConnection();
                SQLCloseable finish = conn::rollback;) {
            conn.setAutoCommit(false);
            pst = conn.prepareStatement("INSERT INTO WEB.F00020(ID,ANHO,MES,AREA_OFICINA,"
                    + "ASIGNADO_A,CARGO_ACTIVIDAD,IMPORTE,ESTADO,TIPO,NUMERO)"
                    + "VALUES((select case when max(id) is null then 1 else cast((max(id)+1) as integer) end id  from web.f00020),"
                    + "?,?,?,?,?,?,?,?,?)");
            pst.setString(1, obj.getAnho());
            pst.setString(2, obj.getMes());
            pst.setString(3, obj.getArea_oficina());
            pst.setString(4, obj.getAsignado_a());
            pst.setString(5, obj.getCargo_actividad());
            pst.setDouble(6, obj.getImporte());
            pst.setBoolean(7, obj.getEstado());
            pst.setString(8, obj.getTipo());
            pst.setString(9, obj.getNumero());
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
    public BEAN_CRUD update(Telefonia obj, HashMap<String, Object> parameters) throws SQLException {
        BEAN_CRUD beancrud = new BEAN_CRUD();
        PreparedStatement pst;
        try (Connection conn = pool.getConnection();
                SQLCloseable finish = conn::rollback;) {
            conn.setAutoCommit(false);
            pst = conn.prepareStatement("UPDATE WEB.F00020 SET ANHO = ?,MES = ?, AREA_OFICINA =?,"
                    + "ASIGNADO_A = ?, CARGO_ACTIVIDAD = ?, IMPORTE = ?, ESTADO = ?, TIPO = ?, NUMERO = ? "
                    + "WHERE ID = ?");
            pst.setString(1, obj.getAnho());
            pst.setString(2, obj.getMes());
            pst.setString(3, obj.getArea_oficina());
            pst.setString(4, obj.getAsignado_a());
            pst.setString(5, obj.getCargo_actividad());
            pst.setDouble(6, obj.getImporte());
            pst.setBoolean(7, obj.getEstado());
            pst.setString(8, obj.getTipo());
            pst.setString(9, obj.getNumero());
            pst.setInt(10, obj.getId());
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
        ResultSet rs;
        try (Connection conn = pool.getConnection();
                SQLCloseable finish = conn::rollback;) {
            conn.setAutoCommit(false);
            pst = conn.prepareStatement("DELETE FROM WEB.F00020 WHERE ID = ?");
            pst.setInt(1, (int) id);
            LOG.info(pst.toString());
            pst.executeUpdate();
            conn.commit();
            beancrud.setMESSAGE_SERVER("ok");
            beancrud.setBEAN_PAGINATION(getPagination(parameters, conn));
        } catch (SQLException ex) {
            throw ex;
        }
        return beancrud;
    }

    @Override
    public Telefonia get(long id) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
