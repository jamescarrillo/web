/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gob.peam.web.dao.impl;

import gob.peam.web.dao.SQLCloseable;
import gob.peam.web.model.Vehiculo;
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
public class VehiculoDAOImpl implements gob.peam.web.dao.VehiculoDAO {
    
    private static final Logger LOG = Logger.getLogger(VehiculoDAOImpl.class.getName());
    private final DataSource pool;
    
    public VehiculoDAOImpl(DataSource pool) {
        this.pool = pool;
    }
    
    @Override
    public BEAN_PAGINATION getPagination(HashMap<String, Object> parameters, Connection conn) throws SQLException {
        BEAN_PAGINATION beanpagination = new BEAN_PAGINATION();
        List<Vehiculo> list = new ArrayList<>();
        PreparedStatement pst;
        ResultSet rs;
        try {
            pst = conn.prepareStatement("SELECT COUNT(ID) AS COUNT FROM WEB.F00014 WHERE "
                    + "LOWER(AREA_OFICINA) LIKE CONCAT('%',?,'%') " + parameters.get("SQL_ESTADO"));
            pst.setString(1, String.valueOf(parameters.get("FILTER")));
            LOG.info(pst.toString());
            rs = pst.executeQuery();
            while (rs.next()) {
                beanpagination.setCOUNT_FILTER(rs.getInt("COUNT"));
                if (rs.getInt("COUNT") > 0) {
                    pst = conn.prepareStatement("SELECT * FROM WEB.F00014 WHERE "
                            + "LOWER(AREA_OFICINA) LIKE CONCAT('%',?,'%') " + parameters.get("SQL_ESTADO")
                            + "ORDER BY " + String.valueOf(parameters.get("SQL_ORDERS")) + " " + parameters.get("LIMIT"));
                    pst.setString(1, String.valueOf(parameters.get("FILTER")));
                    LOG.info(pst.toString());
                    rs = pst.executeQuery();
                    while (rs.next()) {
                        Vehiculo vehiculo = new Vehiculo();
                        vehiculo.setId(rs.getInt("ID"));
                        vehiculo.setAnho(rs.getString("ANHO"));
                        vehiculo.setMes(rs.getString("MES"));
                        vehiculo.setTipo_clase(rs.getString("TIPO_CLASE"));
                        vehiculo.setClase_vehiculo(rs.getString("CLASE_VEHICULO"));
                        vehiculo.setCargo_actividad(rs.getString("CARGO_ACTIVIDAD"));
                        vehiculo.setTipo_combustible(rs.getString("TIPO_COMBUSTIBLE"));
                        vehiculo.setRecorrido_km(rs.getDouble("RECORRIDO_KM"));
                        vehiculo.setCosto_combustible(rs.getDouble("COSTO_COMBUSTIBLE"));
                        vehiculo.setSoat_fecha_vencimiento(rs.getDate("SOAT_FECHA_VENCIMIENTO"));
                        vehiculo.setPlaca(rs.getString("PLACA"));
                        vehiculo.setObservaciones(rs.getString("OBSERVACIONES"));
                        vehiculo.setEstado(rs.getBoolean("ESTADO"));
                        list.add(vehiculo);
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
    public BEAN_CRUD add(Vehiculo obj, HashMap<String, Object> parameters) throws SQLException {
        BEAN_CRUD beancrud = new BEAN_CRUD();
        PreparedStatement pst;
        try (Connection conn = pool.getConnection();
                SQLCloseable finish = conn::rollback;) {
            conn.setAutoCommit(false);
            pst = conn.prepareStatement("INSERT INTO WEB.F00014(ID,ANHO,MES,TIPO_CLASE,"
                    + "CLASE_VEHICULO,CARGO_ACTIVIDAD,TIPO_COMBUSTIBLE,RECORRIDO_KM,"
                    + "COSTO_COMBUSTIBLE,SOAT_FECHA_VENCIMIENTO,PLACA,OBSERVACIONES,ESTADO)"
                    + "VALUES((select case when max(id) is null then 1 else cast((max(id)+1) as integer) end id  from web.f00014),"
                    + "?,?,?,?,?,?,?,?,?,?,?,?)");
            pst.setString(1, obj.getAnho());
            pst.setString(2, obj.getMes());
            pst.setString(3, obj.getTipo_clase());
            pst.setString(4, obj.getClase_vehiculo());
            pst.setString(5, obj.getCargo_actividad());
            pst.setString(6, obj.getTipo_combustible());
            pst.setDouble(7, obj.getRecorrido_km());
            pst.setDouble(8, obj.getCosto_combustible());
            pst.setDate(9, obj.getSoat_fecha_vencimiento());
            pst.setString(10, obj.getPlaca());
            pst.setString(11, obj.getObservaciones());
            pst.setBoolean(12, obj.getEstado());
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
    public BEAN_CRUD update(Vehiculo obj, HashMap<String, Object> parameters) throws SQLException {
        BEAN_CRUD beancrud = new BEAN_CRUD();
        PreparedStatement pst;
        try (Connection conn = pool.getConnection();
                SQLCloseable finish = conn::rollback;) {
            conn.setAutoCommit(false);
            pst = conn.prepareStatement("UPDATE WEB.F00014 SET ANHO = ?, MES = ?, TIPO_CLASE = ?,"
                    + "CLASE_VEHICULO = ?, CARGO_ACTIVIDAD = ?, TIPO_COMBUSTIBLE = ?, RECORRIDO_KM = ?,"
                    + "COSTO_COMBUSTIBLE = ?, SOAT_FECHA_VENCIMIENTO = ?, PLACA = ?, OBSERVACIONES = ?, "
                    + "ESTADO = ? WHERE ID = ?");
            pst.setString(1, obj.getAnho());
            pst.setString(2, obj.getMes());
            pst.setString(3, obj.getTipo_clase());
            pst.setString(4, obj.getClase_vehiculo());
            pst.setString(5, obj.getCargo_actividad());
            pst.setString(6, obj.getTipo_combustible());
            pst.setDouble(7, obj.getRecorrido_km());
            pst.setDouble(8, obj.getCosto_combustible());
            pst.setDate(9, obj.getSoat_fecha_vencimiento());
            pst.setString(10, obj.getPlaca());
            pst.setString(11, obj.getObservaciones());
            pst.setBoolean(12, obj.getEstado());
            pst.setInt(13, obj.getId());
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
            pst = conn.prepareStatement("DELETE FROM WEB.F00014 WHERE ID = ?");
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
    public Vehiculo get(long id) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
