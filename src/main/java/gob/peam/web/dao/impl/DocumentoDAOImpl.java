/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gob.peam.web.dao.impl;

import gob.peam.web.dao.DocumentoDAO;
import gob.peam.web.model.Directivo;
import gob.peam.web.model.Documento;
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
 * @author JamesCarrillo
 */
public class DocumentoDAOImpl implements DocumentoDAO {

    private final Log logger = LogFactory.getLog(DocumentoDAOImpl.class);
    private final DataSource pool;

    public DocumentoDAOImpl(DataSource pool) {
        this.pool = pool;
    }

    @Override
    public BEAN_PAGINATION getPagination(HashMap<String, Object> parameters, Connection conn) throws SQLException {
        BEAN_PAGINATION beanpagination = new BEAN_PAGINATION();
        PreparedStatement pst;
        ResultSet rs;
        try {
            pst = conn.prepareStatement("SELECT COUNT(DOCU_ID) AS CANT FROM WEB.DOCUMENTO WHERE "
                    + "DOCU_TITULO LIKE CONCAT('%',?,'%') "
                    + parameters.get("SQL_ANIO") + " "
                    + parameters.get("SQL_ESTADO") + " "
                    + parameters.get("SQL_CATE_ID"));
            pst.setString(1, String.valueOf(parameters.get("FILTER")));
            this.logger.info("PST[1] -> " + pst);
            rs = pst.executeQuery();
            while (rs.next()) {
                beanpagination.setCOUNT_FILTER(rs.getInt("CANT"));
                if (rs.getInt("CANT") > 0) {
                    pst = conn.prepareStatement("SELECT * FROM WEB.DOCUMENTO WHERE "
                            + "DOCU_TITULO LIKE CONCAT('%',?,'%') "
                            + parameters.get("SQL_ANIO") + " "
                            + parameters.get("SQL_ESTADO") + " "
                            + parameters.get("SQL_CATE_ID") + " "
                            + "ORDER BY " + String.valueOf(parameters.get("SQL_ORDERS")) + " " + parameters.get("LIMIT"));
                    pst.setString(1, String.valueOf(parameters.get("FILTER")));
                    this.logger.info("PST[2] -> " + pst);
                    rs = pst.executeQuery();
                    List<Documento> list = new ArrayList<>();
                    while (rs.next()) {
                        Documento obj = new Documento();
                        obj.setDocu_id(rs.getInt("DOCU_ID"));
                        obj.setUsa_public_id(rs.getInt("USUA_PUBLIC_ID"));
                        obj.setDocu_descripcion(rs.getString("DOCU_DESCRIPCION"));
                        obj.setDocu_titulo(rs.getString("DOCU_TITULO"));
                        obj.setDocu_resumen(rs.getString("DOCU_RESUMEN"));
                        obj.setDocu_origen_archivo(rs.getString("DOCU_ORIGEN_ARCHIVO"));
                        obj.setTido_id(rs.getInt("TIDO_ID"));
                        obj.setDocu_estado(rs.getBoolean("DOCU_ESTADO"));
                        obj.setDocu_activo(rs.getBoolean("DOCU_ACTIVO"));
                        obj.setDocu_fecha_docx(rs.getString("DOCU_FECHA_DOCX"));
                        obj.setCate_id(rs.getInt("CATE_ID"));
                        obj.setDocu_metadata(rs.getString("DOCU_METADATA"));
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
    public BEAN_CRUD add(Documento obj, HashMap<String, Object> parameters) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public BEAN_CRUD update(Documento obj, HashMap<String, Object> parameters) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public BEAN_CRUD delete(long id, HashMap<String, Object> parameters) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Documento get(long id) throws SQLException {
        //LOS DOCUMENTOS NO SE ELIMINAN SOLO CAMBIAN LA CAT_ID = 0
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
