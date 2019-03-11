/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gob.peam.web.dao.impl;

import gob.peam.web.dao.SQLCloseable;
import gob.peam.web.dao.ViaticoDAO;
import gob.peam.web.model.Viatico;
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
public class ViaticoDAOImpl implements ViaticoDAO {
    
    private static final Logger LOG = Logger.getLogger(DocumentoDAOImpl.class.getName());
    private final DataSource pool;
    
    public ViaticoDAOImpl(DataSource pool) {
        this.pool = pool;
    }
    
    @Override
    public BEAN_PAGINATION getPagination(HashMap<String, Object> parameters, Connection conn) throws SQLException {
        BEAN_PAGINATION beanpagination = new BEAN_PAGINATION();
        List<Viatico> list = new ArrayList<>();
        PreparedStatement pst;
        ResultSet rs;
        try {
            pst = conn.prepareStatement("SELECT COUNT(ID) AS COUNT FROM WEB.f00018 WHERE "
                    + "(LOWER(USUARIOS) LIKE CONCAT('%',?,'%') OR LOWER(RUTA) LIKE CONCAT('%',?,'%')) "
                    + parameters.get("SQL_ANIO"));
            pst.setString(1, String.valueOf(parameters.get("FILTER")));
            pst.setString(2, String.valueOf(parameters.get("FILTER")));
            LOG.info(pst.toString());
            rs = pst.executeQuery();
            while (rs.next()) {
                beanpagination.setCOUNT_FILTER(rs.getInt("COUNT"));
                if (rs.getInt("COUNT") > 0) {
                    pst = conn.prepareStatement("SELECT * FROM WEB.F00018 WHERE "
                            + "(LOWER(USUARIOS) LIKE CONCAT('%',?,'%') OR LOWER(RUTA) LIKE CONCAT('%',?,'%')) "
                            + parameters.get("SQL_ANIO") + " "
                            + "ORDER BY " + String.valueOf(parameters.get("SQL_ORDERS")) + " " + parameters.get("LIMIT"));
                    pst.setString(1, String.valueOf(parameters.get("FILTER")));
                    pst.setString(2, String.valueOf(parameters.get("FILTER")));
                    LOG.info(pst.toString());
                    rs = pst.executeQuery();
                    while (rs.next()) {
                        Viatico obj = new Viatico();
                        obj.setId(rs.getInt("ID"));
                        obj.setAnho(rs.getString("ANHO"));
                        obj.setMes(rs.getString("MES"));
                        obj.setTipo_viatico(rs.getString("TIPO_VIATICO"));
                        obj.setModalidad(rs.getString("MODALIDAD"));
                        obj.setArea_oficina(rs.getString("AREA_OFICINA"));
                        obj.setUsuarios(rs.getString("USUARIOS"));
                        obj.setFuente_financiamiento(rs.getString("FUENTE_FINANCIAMIENTO"));
                        obj.setFecha_salida(rs.getDate("FECHA_SALIDA"));
                        obj.setFecha_retorno(rs.getDate("FECHA_RETORNO"));
                        obj.setRuta(rs.getString("RUTA"));
                        obj.setAutorizacion_viaje(rs.getString("AUTORIZACION_VIAJE"));
                        obj.setResolucion(rs.getString("RESOLUCION"));
                        obj.setCosto_pasajes(rs.getDouble("COSTO_PASAJES"));
                        obj.setViaticos(rs.getDouble("VIATICOS"));
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
    public BEAN_CRUD add(Viatico obj, HashMap<String, Object> parameters) throws SQLException {
        BEAN_CRUD beancrud = new BEAN_CRUD();
        PreparedStatement pst;
        try (Connection conn = pool.getConnection();
                SQLCloseable finish = conn::rollback;) {
            conn.setAutoCommit(false);
            pst = conn.prepareStatement("INSERT INTO WEB.F00018 VALUES((select cast((max(id)+1) as integer)  from web.F00018),"
                    + "?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            pst.setString(1, obj.getAnho());
            pst.setString(2, obj.getMes());
            pst.setString(3, obj.getTipo_viatico());
            pst.setString(4, obj.getModalidad());
            pst.setString(5, obj.getArea_oficina());
            pst.setString(6, obj.getUsuarios());
            pst.setString(7, obj.getFuente_financiamiento());
            pst.setDate(8, obj.getFecha_salida());
            pst.setDate(9, obj.getFecha_retorno());
            pst.setString(10, obj.getRuta());
            pst.setString(11, obj.getAutorizacion_viaje());
            pst.setString(12, obj.getResolucion());
            pst.setDouble(13, obj.getCosto_pasajes());
            pst.setDouble(14, obj.getViaticos());
            pst.setBoolean(15, obj.getEstado());
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
    public BEAN_CRUD update(Viatico obj, HashMap<String, Object> parameters) throws SQLException {
        BEAN_CRUD beancrud = new BEAN_CRUD();
        PreparedStatement pst;
        try (Connection conn = pool.getConnection();
                SQLCloseable finish = conn::rollback;) {
            conn.setAutoCommit(false);
            pst = conn.prepareStatement("UPDATE WEB.F00018 SET  ANHO=? , MES=? , TIPO_VIATICO=? , MODALIDAD=?, AREA_OFICINA=?, "
                    + "USUARIOS=?, FUENTE_FINANCIAMIENTO=?, FECHA_SALIDA=?, FECHA_RETORNO=?, RUTA=?, AUTORIZACION_VIAJE=?, "
                    + "RESOLUCION=?, COSTO_PASAJES=?, VIATICOS=?, ESTADO=? WHERE ID = ?");
            pst.setString(1, obj.getAnho());
            pst.setString(2, obj.getMes());
            pst.setString(3, obj.getTipo_viatico());
            pst.setString(4, obj.getModalidad());
            pst.setString(5, obj.getArea_oficina());
            pst.setString(6, obj.getUsuarios());
            pst.setString(7, obj.getFuente_financiamiento());
            pst.setDate(8, obj.getFecha_salida());
            pst.setDate(9, obj.getFecha_retorno());
            pst.setString(10, obj.getRuta());
            pst.setString(11, obj.getAutorizacion_viaje());
            pst.setString(12, obj.getResolucion());
            pst.setDouble(13, obj.getCosto_pasajes());
            pst.setDouble(14, obj.getViaticos());
            pst.setBoolean(15, obj.getEstado());
            pst.setInt(16, obj.getId());
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
            pst = conn.prepareStatement("DELETE FROM WEB.F00018 WHERE ID = ?");
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
    public Viatico get(long id) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public BEAN_PAGINATION getAnhos(HashMap<String, Object> parameters, Connection conn) throws SQLException {
        BEAN_PAGINATION beanpagination = new BEAN_PAGINATION();
        List<Viatico> list = new ArrayList<>();
        PreparedStatement pst;
        ResultSet rs;
        try {
            pst = conn.prepareStatement("SELECT COUNT(DISTINCT(ANHO)) AS COUNT FROM WEB.F00018 WHERE "
                    + "LOWER(USUARIOS) LIKE CONCAT('%',?,'%') " + parameters.get("SQL_ESTADO"));
            pst.setString(1, String.valueOf(parameters.get("FILTER")));
            LOG.info(pst.toString());
            rs = pst.executeQuery();
            while (rs.next()) {
                beanpagination.setCOUNT_FILTER(rs.getInt("COUNT"));
                if (rs.getInt("COUNT") > 0) {
                    pst = conn.prepareStatement("SELECT DISTINCT(ANHO) FROM WEB.F00018 WHERE "
                            + "LOWER(USUARIOS) LIKE CONCAT('%',?,'%') " + parameters.get("SQL_ESTADO")
                            + "ORDER BY " + String.valueOf(parameters.get("SQL_ORDERS")));
                    pst.setString(1, String.valueOf(parameters.get("FILTER")));
                    LOG.info(pst.toString());
                    rs = pst.executeQuery();
                    while (rs.next()) {
                        Viatico orden = new Viatico();
                        orden.setAnho(rs.getString("ANHO"));
                        list.add(orden);
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
    public BEAN_PAGINATION getMes(HashMap<String, Object> parameters, Connection conn) throws SQLException {
        BEAN_PAGINATION beanpagination = new BEAN_PAGINATION();
        List<Viatico> list = new ArrayList<>();
        PreparedStatement pst;
        ResultSet rs;
        try {
            pst = conn.prepareStatement("SELECT COUNT(DISTINCT(MES)) AS COUNT FROM WEB.F00018 WHERE "
                    + "LOWER(USUARIOS) LIKE CONCAT('%',?,'%') " + parameters.get("SQL_ESTADO"));
            pst.setString(1, String.valueOf(parameters.get("FILTER")));
            LOG.info(pst.toString());
            rs = pst.executeQuery();
            while (rs.next()) {
                beanpagination.setCOUNT_FILTER(rs.getInt("COUNT"));
                if (rs.getInt("COUNT") > 0) {
                    pst = conn.prepareStatement("SELECT DISTINCT(MES) FROM WEB.F00018 WHERE "
                            + "LOWER(USUARIOS) LIKE CONCAT('%',?,'%') " + parameters.get("SQL_ESTADO")
                            + "ORDER BY " + String.valueOf(parameters.get("SQL_ORDERS")));
                    pst.setString(1, String.valueOf(parameters.get("FILTER")));
                    LOG.info(pst.toString());
                    rs = pst.executeQuery();
                    while (rs.next()) {
                        Viatico orden = new Viatico();
                        orden.setMes(rs.getString("MES"));
                        list.add(orden);
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
    public BEAN_PAGINATION getAnhos(HashMap<String, Object> parameters, int tipo) throws SQLException {
        BEAN_PAGINATION beansPagination = null;
        try (Connection conn = pool.getConnection()) {
            if (tipo == 1) {
                beansPagination = getAnhos(parameters, conn);//años
            } else {
                beansPagination = getMes(parameters, conn);//mese
            }

        } catch (SQLException e) {
            throw e;
        }
        return beansPagination;
    }
    
}
