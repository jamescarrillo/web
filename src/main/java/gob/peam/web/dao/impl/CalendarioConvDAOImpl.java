/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gob.peam.web.dao.impl;

import gob.peam.web.dao.CalendarioConvDAO;
import gob.peam.web.dao.SQLCloseable;
import gob.peam.web.model.Actividad;
import gob.peam.web.model.CalendarioConv;
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
public class CalendarioConvDAOImpl implements CalendarioConvDAO {

    private final Log logger = LogFactory.getLog(DirectivoDAOImpl.class);
    private final DataSource pool;

    public CalendarioConvDAOImpl(DataSource pool) {
        this.pool = pool;
    }

    @Override
    public BEAN_PAGINATION getPagination(HashMap<String, Object> parameters, Connection conn) throws SQLException {
        BEAN_PAGINATION beanpagination = new BEAN_PAGINATION();
        PreparedStatement pst;
        ResultSet rs;
        try {
            pst = conn.prepareStatement("SELECT COUNT(WEB.CALENDARIO_CONV.ID) AS CANT FROM WEB.CALENDARIO_CONV "
                    + "INNER JOIN WEB.ACTIVIDAD ON WEB.CALENDARIO_CONV.ACTI_ID = WEB.ACTIVIDAD.ACTI_ID WHERE"
                    + "(LOWER(WEB.ACTIVIDAD.DESCRIPCION) LIKE CONCAT('%',?,'%'))" + parameters.get("CONVOCATORIA_PERS") + " "
                    + parameters.get("TIPO") + " ");
            pst.setString(1, String.valueOf(parameters.get("FILTER")));
            rs = pst.executeQuery();
            while (rs.next()) {
                beanpagination.setCOUNT_FILTER(rs.getInt("CANT"));
            }
            pst = conn.prepareStatement("SELECT * FROM WEB.CALENDARIO_CONV "
                    + "INNER JOIN WEB.ACTIVIDAD ON WEB.CALENDARIO_CONV.ACTI_ID = WEB.ACTIVIDAD.ACTI_ID WHERE "
                    + "(LOWER(WEB.ACTIVIDAD.DESCRIPCION) LIKE CONCAT('%',?,'%')) " + parameters.get("CONVOCATORIA_PERS")
                    + parameters.get("TIPO") + " ORDER BY WEB.ACTIVIDAD.DESCRIPCION "
                    + parameters.get("LIMIT"));
            pst.setString(1, String.valueOf(parameters.get("FILTER")));
            logger.info(pst);
            rs = pst.executeQuery();
            List<CalendarioConv> list = new ArrayList<>();
            while (rs.next()) {
                CalendarioConv obj = new CalendarioConv();
                obj.setId(rs.getInt("ID"));
                obj.setFecha_inicio(rs.getDate("FECHA_INICIO"));
                obj.setFecha_fin(rs.getDate("FECHA_FIN"));
                obj.setEstado(rs.getBoolean("ESTADO"));
                obj.setConvo_id(rs.getInt("CONVO_ID"));
                obj.setActi_id(new Actividad((rs.getInt("ACTI_ID")), (rs.getString("DESCRIPCION"))));
                obj.setTipo(rs.getInt("TIPO"));
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
    public BEAN_CRUD add(CalendarioConv obj, HashMap<String, Object> parameters) throws SQLException {
        BEAN_CRUD beancrud = new BEAN_CRUD();
        PreparedStatement pst;
        try (Connection conn = pool.getConnection();
                SQLCloseable finish = conn::rollback;) {
            conn.setAutoCommit(false);
            pst = conn.prepareStatement("INSERT INTO WEB.CALENDARIO_CONV (ID, fecha_inicio, fecha_fin, "
                    + "ESTADO, CONVO_ID, ACTI_ID, TIPO) VALUES((select case when max(id) is null then 1 else cast((max(id)+1) as integer) end id  from web.calendario_conv),"
                    + "?,?,?,?,?,?)");
            pst.setDate(1, obj.getFecha_inicio());
            pst.setDate(2, obj.getFecha_fin());
            pst.setBoolean(3, obj.getEstado());
            pst.setInt(4, obj.getConvo_id());
            pst.setInt(5, obj.getActi_id().getActi_id());
            pst.setInt(6, obj.getTipo());
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
    public BEAN_CRUD update(CalendarioConv obj, HashMap<String, Object> parameters) throws SQLException {
        BEAN_CRUD beancrud = new BEAN_CRUD();
        PreparedStatement pst;
        try (Connection conn = pool.getConnection();
                SQLCloseable finish = conn::rollback;) {
            conn.setAutoCommit(false);
            pst = conn.prepareStatement("UPDATE WEB.CALENDARIO_CONV SET FECHA_INICIO = ?,FECHA_FIN = ?, "
                    + "ACTI_ID = ? WHERE ID = ?");
            pst.setDate(1, obj.getFecha_inicio());
            pst.setDate(2, obj.getFecha_fin());
            pst.setInt(3, obj.getActi_id().getActi_id());
            pst.setInt(4, obj.getId());
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
    public BEAN_CRUD delete(long id, HashMap<String, Object> parameters) throws SQLException {
        BEAN_CRUD beancrud = new BEAN_CRUD();
        PreparedStatement pst;
        ResultSet rs;
        try (Connection conn = pool.getConnection();
                SQLCloseable finish = conn::rollback;) {
            conn.setAutoCommit(false);
            if (Integer.parseInt(String.valueOf(parameters.get("ORIGEN")))==1) {
                pst = conn.prepareStatement("DELETE FROM WEB.CALENDARIO_CONV WHERE ID = ?");
                pst.setInt(1, (int) id);
                pst.executeUpdate();
                conn.commit();
                beancrud.setMESSAGE_SERVER("ok");
                beancrud.setBEAN_PAGINATION(getPagination(parameters, conn));
                pst.close();
            } else {
                pst = conn.prepareStatement("SELECT COUNT(ID) AS CANT FROM WEB.DOCUMENT_CONV WHERE ID = ?");
                pst.setInt(1, (int) id);
                rs = pst.executeQuery();
                while (rs.next()) {
                    if (rs.getInt("CANT") <= 0) {
                        pst = conn.prepareStatement("DELETE FROM WEB.CALENDARIO_CONV WHERE ID = ?");
                        pst.setInt(1, (int) id);
                        pst.executeUpdate();
                        conn.commit();
                        beancrud.setMESSAGE_SERVER("ok");
                    } else {
                        beancrud.setMESSAGE_SERVER("No se puede eliminar, existen documentos que dependen de este item");
                    }
                }
                beancrud.setBEAN_PAGINATION(getPagination(parameters, conn));
                rs.close();
                pst.close();
            }

        } catch (SQLException ex) {
            throw ex;
        }
        return beancrud;
    }

    @Override
    public CalendarioConv get(long id) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
