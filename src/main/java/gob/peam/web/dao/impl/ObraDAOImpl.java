/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gob.peam.web.dao.impl;

import gob.peam.web.dao.ObraDAO;
import gob.peam.web.dao.SQLCloseable;
import gob.peam.web.model.LineaAccion;
import gob.peam.web.model.Obra;
import gob.peam.web.model.Persona;
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
public class ObraDAOImpl implements ObraDAO {

    private final Log logger = LogFactory.getLog(DirectivoDAOImpl.class);
    private final DataSource pool;

    public ObraDAOImpl(DataSource pool) {
        this.pool = pool;
    }

    @Override
    public BEAN_PAGINATION getPagination(HashMap<String, Object> parameters, Connection conn) throws SQLException {
        BEAN_PAGINATION beanpagination = new BEAN_PAGINATION();
        PreparedStatement pst;
        ResultSet rs;
        try {
            pst = conn.prepareStatement("SELECT COUNT(ID) AS CANT FROM WEB.OBRA WHERE "
                    + "(LOWER(DESCRIPCION) LIKE CONCAT('%',?,'%'))"
                    + String.valueOf(parameters.get("SQL_ANIO")));
            pst.setString(1, String.valueOf(parameters.get("FILTER")));
            logger.info(pst.toString());
            rs = pst.executeQuery();
            while (rs.next()) {
                beanpagination.setCOUNT_FILTER(rs.getInt("CANT"));
            }
            pst = conn.prepareStatement("SELECT * FROM WEB.OBRA WHERE "
                    + "(LOWER(DESCRIPCION) LIKE CONCAT('%',?,'%'))"
                    + String.valueOf(parameters.get("SQL_ANIO")) + "ORDER BY "
                    + String.valueOf(parameters.get("SQL_ORDERS")) + " " + parameters.get("LIMIT"));
            pst.setString(1, String.valueOf(parameters.get("FILTER")));
            logger.info(pst);
            rs = pst.executeQuery();
            List<Obra> list = new ArrayList<>();
            while (rs.next()) {
                Obra obj = new Obra();
                obj.setId(rs.getInt("ID"));
                obj.setAnho(rs.getString("ANHO"));
                obj.setMes(rs.getString("MES"));
                obj.setEstado(rs.getBoolean("ESTADO"));
                Persona per = new Persona();
                per.setPers_id(rs.getInt("CREADO_POR"));
                obj.setCreadoPor(per);
                obj.setDescripcion(rs.getString("DESCRIPCION"));
                obj.setMontoInversion(rs.getInt("MONTO_INVERSION"));
                obj.setMontoGastado(rs.getInt("MONTO_GASTADO"));
                obj.setTiempoEjecucion(rs.getInt("TIEMPO_EJECUCION"));
                obj.setModalidadEjecucion(rs.getString("MODALIDAD_EJECUCION"));
                obj.setFechaInicio(rs.getDate("FECHA_INICIO"));
                obj.setFechaFin(rs.getDate("FECHA_FIN"));
                obj.setSeguimiento(rs.getString("SEGUIMIENTO"));
                obj.setUbicacion(rs.getString("UBICACION"));
                obj.setContratista(rs.getString("CONTRATISTA"));
                obj.setSupervisor(rs.getString("SUPERVISOR"));
                obj.setResidente(rs.getString("RESIDENTE"));
                obj.setAvanceFisico(rs.getInt("AVANCE_FISICO"));
                obj.setArea(new LineaAccion(rs.getInt("AREA")));
                obj.setGaleria(rs.getString("GALERIA"));
                obj.setFoto(rs.getString("FOTO"));
                obj.setAnhoActualizacion(rs.getString("ANHO_ACTUALIZACION"));
                obj.setMesActualizacion(rs.getString("MES_ACTUALIZACION"));
                obj.setSnip(rs.getString("SNIP"));
                obj.setObservacion(rs.getString("OBSERVACION"));
                obj.setInfobras(rs.getString("INFOBRAS"));
                obj.setLeyenda(rs.getString("LEYENDA"));
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
    public BEAN_CRUD add(Obra obj, HashMap<String, Object> parameters) throws SQLException {
        BEAN_CRUD beancrud = new BEAN_CRUD();
        PreparedStatement pst;
        try (Connection conn = pool.getConnection();
                SQLCloseable finish = conn::rollback;) {
            conn.setAutoCommit(false);
            pst = conn.prepareStatement("INSERT INTO WEB.OBRA (ID, ANHO, MES, ESTADO, CREADO_POR,FECHA_CREADO,"
                    + "DESCRIPCION, MONTO_INVERSION, MONTO_GASTADO, TIEMPO_EJECUCION, "
                    + "MODALIDAD_EJECUCION, FECHA_INICIO, FECHA_FIN, SEGUIMIENTO, UBICACION, CONTRATISTA, SUPERVISOR, "
                    + "RESIDENTE, AVANCE_FISICO,AREA,GALERIA,FOTO,ANHO_ACTUALIZACION, MES_ACTUALIZACION, SNIP, OBSERVACION, "
                    + "INFOBRAS, LEYENDA,EDITADO_POR,FECHA_EDITADO) VALUES ((select case when max(id) is null then 1 else cast((max(id)+1) as integer) end id  from web.obra),"
                    + "?,?,?,?, CURRENT_TIMESTAMP,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,CURRENT_TIMESTAMP)");
            pst.setString(1, obj.getAnho());
            pst.setString(2, obj.getMes());
            pst.setBoolean(3, obj.getEstado());
            pst.setInt(4, obj.getCreadoPor().getPers_id());
            pst.setString(5, obj.getDescripcion());
            pst.setInt(6, obj.getMontoInversion());
            pst.setInt(7, obj.getMontoGastado());
            pst.setInt(8, obj.getTiempoEjecucion());
            pst.setString(9, obj.getModalidadEjecucion());
            pst.setDate(10, obj.getFechaInicio());
            pst.setDate(11, obj.getFechaFin());
            pst.setString(12, obj.getSeguimiento());
            pst.setString(13, obj.getUbicacion());
            pst.setString(14, obj.getContratista());
            pst.setString(15, obj.getSupervisor());
            pst.setString(16, obj.getResidente());
            pst.setInt(17, obj.getAvanceFisico());
            pst.setInt(18, obj.getArea().getId());
            pst.setString(19, obj.getGaleria());
            pst.setString(20, obj.getFoto());
            pst.setString(21, obj.getAnhoActualizacion());
            pst.setString(22, obj.getMesActualizacion());
            pst.setString(23, obj.getSnip());
            pst.setString(24, obj.getObservacion());
            pst.setString(25, obj.getInfobras());
            pst.setString(26, obj.getLeyenda());
            pst.setInt(27, obj.getCreadoPor().getPers_id());
            logger.info(pst);
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
    public BEAN_CRUD update(Obra obj, HashMap<String, Object> parameters) throws SQLException {
        BEAN_CRUD beancrud = new BEAN_CRUD();
        PreparedStatement pst;
        try (Connection conn = pool.getConnection();
                SQLCloseable finish = conn::rollback;) {
            conn.setAutoCommit(false);
            pst = conn.prepareStatement("UPDATE WEB.OBRA SET  ANHO=?, MES=?, EDITADO_POR=?, FECHA_EDITADO=CURRENT_TIMESTAMP,"
                    + "DESCRIPCION=?, MONTO_INVERSION=?, MONTO_GASTADO=?, TIEMPO_EJECUCION=?,MODALIDAD_EJECUCION=?, "
                    + "FECHA_INICIO=?, FECHA_FIN=?, SEGUIMIENTO=?, UBICACION=?, CONTRATISTA=?, SUPERVISOR=?, RESIDENTE=?, "
                    + "AVANCE_FISICO=?,AREA=?,GALERIA=?,FOTO=?,ANHO_ACTUALIZACION=?, MES_ACTUALIZACION=?, SNIP=?, OBSERVACION=?,"
                    + "INFOBRAS=?, LEYENDA=? WHERE ID=?");
            pst.setString(1, obj.getAnho());
            pst.setString(2, obj.getMes());
            pst.setInt(3, obj.getEditadoPor().getPers_id());
            pst.setString(4, obj.getDescripcion());
            pst.setInt(5, obj.getMontoInversion());
            pst.setInt(6, obj.getMontoGastado());
            pst.setInt(7, obj.getTiempoEjecucion());
            pst.setString(8, obj.getModalidadEjecucion());
            pst.setDate(9, obj.getFechaInicio());
            pst.setDate(10, obj.getFechaFin());
            pst.setString(11, obj.getSeguimiento());
            pst.setString(12, obj.getUbicacion());
            pst.setString(13, obj.getContratista());
            pst.setString(14, obj.getSupervisor());
            pst.setString(15, obj.getResidente());
            pst.setInt(16, obj.getAvanceFisico());
            pst.setInt(17, obj.getArea().getId());
            pst.setString(18, obj.getGaleria());
            pst.setString(19, obj.getFoto());
            pst.setString(20, obj.getAnhoActualizacion());
            pst.setString(21, obj.getMesActualizacion());
            pst.setString(22, obj.getSnip());
            pst.setString(23, obj.getObservacion());
            pst.setString(24, obj.getInfobras());
            pst.setString(25, obj.getLeyenda());
            pst.setInt(26, obj.getId());
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
            pst = conn.prepareStatement("DELETE FROM WEB.OBRA WHERE ID = ?");
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
    public Obra get(long id) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public BEAN_CRUD activate(long id, HashMap<String, Object> parameters) throws SQLException {
        BEAN_CRUD beancrud = new BEAN_CRUD();
        PreparedStatement pst;
        try (Connection conn = pool.getConnection();
                SQLCloseable finish = conn::rollback;) {
            conn.setAutoCommit(false);
            pst = conn.prepareStatement("UPDATE WEB.OBRA SET ESTADO = ? WHERE ID = ?");
            if (parameters.get("ESTADOP").equals("true")) {
                pst.setBoolean(1, true);
            } else {
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
