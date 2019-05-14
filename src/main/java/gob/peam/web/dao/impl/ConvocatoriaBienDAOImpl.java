/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gob.peam.web.dao.impl;

import gob.peam.web.dao.ConvocatoriaBienDAO;
import gob.peam.web.dao.SQLCloseable;
import gob.peam.web.model.ConvocatoriaBien;
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
public class ConvocatoriaBienDAOImpl implements ConvocatoriaBienDAO {

    private final Log logger = LogFactory.getLog(DirectivoDAOImpl.class);
    private final DataSource pool;

    public ConvocatoriaBienDAOImpl(DataSource pool) {
        this.pool = pool;
    }

    @Override
    public BEAN_PAGINATION getPagination(HashMap<String, Object> parameters, Connection conn) throws SQLException {
        BEAN_PAGINATION beanpagination = new BEAN_PAGINATION();
        PreparedStatement pst;
        ResultSet rs;
        try {
            pst = conn.prepareStatement("SELECT COUNT(CONVO_ID) AS CANT FROM WEB.CONVOCATORIA_BIEN WHERE "
                    + "(LOWER(REFERENCIA) LIKE CONCAT('%',?,'%')) " + String.valueOf(parameters.get("SQL_ESTADO"))
                    + String.valueOf(parameters.get("SQL_ANIO")));
            pst.setString(1, String.valueOf(parameters.get("FILTER")));
            logger.info(pst);
            rs = pst.executeQuery();
            while (rs.next()) {
                beanpagination.setCOUNT_FILTER(rs.getInt("CANT"));
            }
            pst = conn.prepareStatement("SELECT * FROM WEB.CONVOCATORIA_BIEN WHERE "
                    + "(LOWER(REFERENCIA) LIKE CONCAT('%',?,'%')) " + String.valueOf(parameters.get("SQL_ESTADO"))
                    + String.valueOf(parameters.get("SQL_ANIO")) + "ORDER BY "
                    + String.valueOf(parameters.get("SQL_ORDERS")) + " " + parameters.get("LIMIT"));
            pst.setString(1, String.valueOf(parameters.get("FILTER")));
            logger.info(pst);
            rs = pst.executeQuery();
            List<ConvocatoriaBien> list = new ArrayList<>();
            while (rs.next()) {
                ConvocatoriaBien obj = new ConvocatoriaBien();
                obj.setConvo_id(rs.getInt("CONVO_ID"));
                obj.setTitulo(rs.getString("TITULO"));
                obj.setReferencia(rs.getString("REFERENCIA"));
                obj.setFecha(rs.getDate("FECHA"));
                obj.setTipo(rs.getInt("TIPO"));
                obj.setVal_referencial(rs.getString("VAL_REFERENCIAL"));
                obj.setLug_reg_participante(rs.getString("LUG_REG_PARTICIPANTE"));
                obj.setCost_participacion("COST_PARTICIPACION");
                obj.setProceso(rs.getInt("PROCESO"));
                obj.setEstado(rs.getBoolean("ESTADO"));
                obj.setBase_file(rs.getString("BASES_FILE"));
                obj.setRes_eject_file(rs.getString("RES_EJECT_FILE"));
                obj.setAbs_consult_file(rs.getString("ABS_CONSULT_FILE"));
                obj.setAbs_observa_file(rs.getString("ABS_OBSERVA_FILE"));
                obj.setPro_enti_file(rs.getString("PRO_ENTI_FILE"));
                obj.setPro_osce_file(rs.getString("PRO_OSCE_FILE"));
                obj.setBas_inte_file(rs.getString("BAS_INTE_FILE"));
                obj.setAct_eval_tec_file(rs.getString("ACT_EVAL_TEC_FILE"));
                obj.setCua_compa_file(rs.getString("CUA_COMPA_FILE"));
                obj.setActa_buena_pro_file(rs.getString("ACTA_BUENA_PRO_FILE"));
                obj.setNoti_sus_file(rs.getString("NOTI_SUS_FILE"));
                obj.setRes_rec_enti_file(rs.getString("RES_REC_ENTI_FILE"));
                obj.setRes_res_trib_file(rs.getString("RES_REC_TRIB_FILE"));
                obj.setAbs_con_obser_file(rs.getString("ABS_CON_OBSER_FILE"));
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
    public BEAN_CRUD add(ConvocatoriaBien obj, HashMap<String, Object> parameters) throws SQLException {
        BEAN_CRUD beancrud = new BEAN_CRUD();
        PreparedStatement pst;
        try (Connection conn = pool.getConnection();
                SQLCloseable finish = conn::rollback;) {
            conn.setAutoCommit(false);
            pst = conn.prepareStatement("INSERT INTO WEB.CONVOCATORIA_BIEN (CONVO_ID, TITULO, REFERENCIA, "
                    + "FECHA, TIPO, VAL_REFERENCIAL, LUG_REG_PARTICIPANTE, COST_PARTICIPACION, PROCESO, ESTADO,ANHO) VALUES((select case when max(convo_id) is null then 1 else cast((max(convo_id)+1) as integer) end id  from web.convocatoria_bien),"
                    + "?,?,?,?,?,?,?,?,?,?)");
            pst.setString(1, obj.getTitulo());
            pst.setString(2, obj.getReferencia());
            pst.setDate(3, obj.getFecha());
            pst.setInt(4, obj.getTipo());
            pst.setString(5, obj.getVal_referencial());
            pst.setString(6, obj.getLug_reg_participante());
            pst.setString(7, obj.getCost_participacion());
            pst.setInt(8, obj.getProceso());
            pst.setBoolean(9, obj.getEstado());
            pst.setString(10, obj.getAnho());
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
    public BEAN_CRUD update(ConvocatoriaBien obj, HashMap<String, Object> parameters) throws SQLException {
        BEAN_CRUD beancrud = new BEAN_CRUD();
        PreparedStatement pst;
        try (Connection conn = pool.getConnection();
                SQLCloseable finish = conn::rollback;) {
            conn.setAutoCommit(false);
            pst = conn.prepareStatement("UPDATE WEB.CONVOCATORIA_BIEN SET TITULO = ?,REFERENCIA = ?, FECHA=?, TIPO=?, "
                    + "VAL_REFERENCIAL=?, LUG_REG_PARTICIPANTE=?, COST_PARTICIPACION=?, PROCESO=?, ESTADO=?, ANHO=? WHERE CONVO_ID = ?");
            pst.setString(1, obj.getTitulo());
            pst.setString(2, obj.getReferencia());
            pst.setDate(3, obj.getFecha());
            pst.setInt(4, obj.getTipo());
            pst.setString(5, obj.getVal_referencial());
            pst.setString(6, obj.getLug_reg_participante());
            pst.setString(7, obj.getCost_participacion());
            pst.setInt(8, obj.getProceso());
            pst.setBoolean(9, obj.getEstado());
            pst.setString(10, obj.getAnho());
            pst.setInt(11, obj.getConvo_id());
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
            pst = conn.prepareStatement("SELECT COUNT(CONVO_ID) AS CANT FROM WEB.CALENDARIO_CONV WHERE CONVO_ID = ? AND TIPO = 1");
            pst.setInt(1, (int) id);
            rs = pst.executeQuery();
            while (rs.next()) {
                if (rs.getInt("CANT") <= 0) {
                    pst = conn.prepareStatement("DELETE FROM WEB.CONVOCATORIA_BIEN WHERE CONVO_ID = ?");
                    pst.setInt(1, (int) id);
                    logger.info(pst);
                    pst.executeUpdate();
                    conn.commit();
                    beancrud.setMESSAGE_SERVER("ok");
                } else {
                    beancrud.setMESSAGE_SERVER("No se puede eliminar, existen un calendario de actividades que dependen de esta convocatoria");
                }
            }
            beancrud.setBEAN_PAGINATION(getPagination(parameters, conn));
            pst.close();
        } catch (SQLException ex) {
            throw ex;
        }
        return beancrud;
    }

    @Override
    public ConvocatoriaBien get(long id) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public BEAN_CRUD activate(long id, HashMap<String, Object> parameters) throws SQLException {
        BEAN_CRUD beancrud = new BEAN_CRUD();
        PreparedStatement pst;
        try (Connection conn = pool.getConnection();
                SQLCloseable finish = conn::rollback;) {
            conn.setAutoCommit(false);
            pst = conn.prepareStatement("UPDATE WEB.CONVOCATORIA_BIEN SET ESTADO = ? WHERE CONVO_ID = ?");
            if (parameters.get("ESTADO").equals("true")) {
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

    @Override
    public BEAN_CRUD upload(ConvocatoriaBien obj, HashMap<String, Object> parameters) throws SQLException {
        BEAN_CRUD beancrud = new BEAN_CRUD();
        PreparedStatement pst;
        try (Connection conn = pool.getConnection();
                SQLCloseable finish = conn::rollback;) {
            conn.setAutoCommit(false);
            pst = conn.prepareStatement("UPDATE WEB.CONVOCATORIA_BIEN SET " + String.valueOf(parameters.get("ARCHIVO")) + " WHERE convo_id = ? ");
            pst.setInt(1, obj.getConvo_id());
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
    public BEAN_PAGINATION getAnhos(HashMap<String, Object> parameters, Connection conn) throws SQLException {
        BEAN_PAGINATION beanpagination = new BEAN_PAGINATION();
        PreparedStatement pst;
        ResultSet rs;
        try {
            pst = conn.prepareStatement("SELECT COUNT(DISTINCT(ANHO)) AS CANT FROM WEB.CONVOCATORIA_BIEN WHERE "
                    + "(LOWER(REFERENCIA) LIKE CONCAT('%',?,'%'))");
            pst.setString(1, String.valueOf(parameters.get("FILTER")));
            logger.info(pst.toString());
            rs = pst.executeQuery();
            while (rs.next()) {
                beanpagination.setCOUNT_FILTER(rs.getInt("CANT"));
            }
            pst = conn.prepareStatement("SELECT DISTINCT(ANHO) FROM WEB.CONVOCATORIA_BIEN WHERE "
                    + "(LOWER(REFERENCIA) LIKE CONCAT('%',?,'%'))"
                    + String.valueOf(parameters.get("SQL_ESTADO"))
                    + String.valueOf(parameters.get("SQL_ORDERS")));
            pst.setString(1, String.valueOf(parameters.get("FILTER")));
            logger.info(pst.toString());
            rs = pst.executeQuery();
            List<ConvocatoriaBien> list = new ArrayList<>();
            while (rs.next()) {
                ConvocatoriaBien obj = new ConvocatoriaBien();
                obj.setAnho(rs.getString("ANHO"));
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
    public BEAN_PAGINATION getAnhos(HashMap<String, Object> parameters) throws SQLException {
        BEAN_PAGINATION beansPagination = null;
        try (Connection conn = pool.getConnection()) {
            beansPagination = getAnhos(parameters, conn);
        } catch (SQLException e) {
            throw e;
        }
        return beansPagination;
    }

}
