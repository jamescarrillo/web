/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gob.peam.web.dao.impl;

import gob.peam.web.dao.SQLCloseable;
import gob.peam.web.model.Publicidad;
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
public class PublicidadDAOImpl implements gob.peam.web.dao.PublicidadDAO {

    private static final Logger LOG = Logger.getLogger(PublicidadDAOImpl.class.getName());
    private final DataSource pool;

    public PublicidadDAOImpl(DataSource pool) {
        this.pool = pool;
    }

    @Override
    public BEAN_PAGINATION getPagination(HashMap<String, Object> parameters, Connection conn) throws SQLException {
        BEAN_PAGINATION beanpagination = new BEAN_PAGINATION();
        List<Publicidad> list = new ArrayList<>();
        PreparedStatement pst;
        ResultSet rs;
        try {
            pst = conn.prepareStatement("SELECT COUNT(ID) AS COUNT FROM WEB.F00026 WHERE "
                    + "LOWER(PROVEEDOR) LIKE CONCAT('%',?,'%') " + parameters.get("SQL_ESTADO"));
            pst.setString(1, String.valueOf(parameters.get("FILTER")));
            LOG.info(pst.toString());
            rs = pst.executeQuery();
            while (rs.next()) {
                beanpagination.setCOUNT_FILTER(rs.getInt("COUNT"));
                if (rs.getInt("COUNT") > 0) {
                    pst = conn.prepareStatement("SELECT * FROM WEB.F00026 WHERE "
                            + "LOWER(PROVEEDOR) LIKE CONCAT('%',?,'%') " + parameters.get("SQL_ESTADO")
                            + "ORDER BY " + String.valueOf(parameters.get("SQL_ORDERS")) + " " + parameters.get("LIMIT"));
                    pst.setString(1, String.valueOf(parameters.get("FILTER")));
                    LOG.info(pst.toString());
                    rs = pst.executeQuery();
                    while (rs.next()) {
                        Publicidad publicidad = new Publicidad();
                        publicidad.setId(rs.getInt("ID"));
                        publicidad.setAnho(rs.getString("ANHO"));
                        publicidad.setBienes_servicios(rs.getString("BIENES_SERVICIOS"));
                        publicidad.setFuente_financiamiento(rs.getString("FUENTE_FINANCIAMIENTO"));
                        publicidad.setProceso(rs.getString("PROCESO"));
                        publicidad.setContrato(rs.getString("CONTRATO"));
                        publicidad.setObjeto_contrato(rs.getString("OBJETO_CONTRATO"));
                        publicidad.setValor_referencia(rs.getDouble("VALOR_REFERENCIA"));
                        publicidad.setProveedor(rs.getString("PROVEEDOR"));
                        publicidad.setRuc(rs.getString("RUC"));
                        publicidad.setNumero_contrato(rs.getDouble("NUMERO_CONTRATO"));
                        publicidad.setPenalidad(rs.getDouble("PENALIDAD"));
                        publicidad.setCosto_final(rs.getDouble("COSTO_FINAL"));
                        publicidad.setObservaciones(rs.getString("OBSERVACIONES"));
                        publicidad.setEstado(rs.getBoolean("ESTADO"));
                        list.add(publicidad);
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
    public BEAN_CRUD add(Publicidad obj, HashMap<String, Object> parameters) throws SQLException {
        BEAN_CRUD beancrud = new BEAN_CRUD();
        PreparedStatement pst;
        try (Connection conn = pool.getConnection();
                SQLCloseable finish = conn::rollback;) {
            conn.setAutoCommit(false);
            pst = conn.prepareStatement("INSERT INTO WEB.F00026(ID,ANHO,BIENES_SERVICIO,FUENTE_FINANCIAMIENTO,"
                    + "PROCESO,CONTRATO,OBJETO_CONTRATO,VALOR_REFERENCIA,PROVEDDOR,RUC,NUMERO_CONTRATO,"
                    + "PENALIDAD,COSTO_FINAL,OBSERVACIONES,ESTADO)"
                    + "VALUES((select case when max(id) is null then 1 else cast((max(id)+1) as integer) end id  from web.f00026),"
                    + "?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            pst.setString(1, obj.getAnho());
            pst.setString(2, obj.getBienes_servicios());
            pst.setString(3, obj.getFuente_financiamiento());
            pst.setString(4, obj.getProceso());
            pst.setString(5, obj.getContrato());
            pst.setString(6, obj.getObjeto_contrato());
            pst.setDouble(7, obj.getValor_referencia());
            pst.setString(8, obj.getProveedor());
            pst.setString(9, obj.getRuc());
            pst.setDouble(10, obj.getNumero_contrato());
            pst.setDouble(11, obj.getPenalidad());
            pst.setDouble(12, obj.getCosto_final());
            pst.setString(13, obj.getObservaciones());
            pst.setBoolean(14, obj.getEstado());
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
    public BEAN_CRUD update(Publicidad obj, HashMap<String, Object> parameters) throws SQLException {
        BEAN_CRUD beancrud = new BEAN_CRUD();
        PreparedStatement pst;
        try (Connection conn = pool.getConnection();
                SQLCloseable finish = conn::rollback;) {
            conn.setAutoCommit(false);
            pst = conn.prepareStatement("UPDATE WEB.F00026 SET ANHO = ?, BIENES_SERVICIO = ?, FUENTE_FINANCIAMIENTO = ?,"
                    + "PROCESO = ?, CONTRATO = ?, OBJETO_CONTRATO = ?, VALOR_REFERENCIA = ?, PROVEDDOR = ?, RUC = ?, "
                    + "NUMERO_CONTRATO = ?, PENALIDAD = ?,COSTO_FINAL = ?, OBSERVACIONES = ?, ESTADO = ? WHERE ID = ?");
            pst.setString(1, obj.getAnho());
            pst.setString(2, obj.getBienes_servicios());
            pst.setString(3, obj.getFuente_financiamiento());
            pst.setString(4, obj.getProceso());
            pst.setString(5, obj.getContrato());
            pst.setString(6, obj.getObjeto_contrato());
            pst.setDouble(7, obj.getValor_referencia());
            pst.setString(8, obj.getProveedor());
            pst.setString(9, obj.getRuc());
            pst.setDouble(10, obj.getNumero_contrato());
            pst.setDouble(11, obj.getPenalidad());
            pst.setDouble(12, obj.getCosto_final());
            pst.setString(13, obj.getObservaciones());
            pst.setBoolean(14, obj.getEstado());
            pst.setInt(15, obj.getId());
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
            pst = conn.prepareStatement("DELETE FROM WEB.F00026 WHERE ID = ?");
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
    public Publicidad get(long id) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
