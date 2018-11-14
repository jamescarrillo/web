/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gob.peam.web.dao.impl.others;

import gob.peam.web.dao.others.DocumentoArcDigDAO;
import gob.peam.web.model.others.DocumentoArcDig;
import gob.peam.web.utilities.BEAN_CRUD;
import gob.peam.web.utilities.BEAN_PAGINATION;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.sql.DataSource;

/**
 *
 * @author James Carrillo
 */
public class DocumentoArcDigDAOImpl implements DocumentoArcDigDAO {

    private static final Logger LOG = Logger.getLogger(DocumentoArcDigDAOImpl.class.getName());
    private final DataSource pool;

    public DocumentoArcDigDAOImpl(DataSource pool) {
        this.pool = pool;
    }

    @Override
    public BEAN_PAGINATION getPagination(HashMap<String, Object> parameters, Connection conn) throws SQLException {
        BEAN_PAGINATION beanpagination = new BEAN_PAGINATION();
        List<DocumentoArcDig> list = new ArrayList<>();
        PreparedStatement pst;
        ResultSet rs;
        try {
            pst = conn.prepareStatement("SELECT COUNT(D.DOCU_ID) AS COUNT FROM DOCUMENTO D "
                    + parameters.get("SQL_ETIQUETA_SI") + " WHERE "
                    + "(LOWER(D.DOCU_TITULO) LIKE CONCAT('%',?,'%') OR LOWER(D.DOCU_RESUMEN) LIKE CONCAT('%',?,'%')) "
                    + "AND D.DOCU_FECHA_DOCX != '' "
                    + parameters.get("SQL_TIDO") + " "
                    + parameters.get("SQL_ANIO") + " "
                    + parameters.get("SQL_ETIQUETA") + " "
                    + parameters.get("SQL_ESTADO") + " ");
            pst.setString(1, String.valueOf(parameters.get("FILTER")));
            pst.setString(2, String.valueOf(parameters.get("FILTER")));
            LOG.log(Level.INFO, "PST[1] -> {0}", pst);
            rs = pst.executeQuery();
            while (rs.next()) {
                beanpagination.setCOUNT_FILTER(rs.getInt("COUNT"));
                if (rs.getInt("COUNT") > 0) {
                    pst = conn.prepareStatement("SELECT D.DOCU_ID, D.USUA_ID, D.DOCU_TITULO, D.DOCU_RESUMEN, D.DOCU_FECHA_DOCX, "
                            + "D.DOCU_ORIGEN_ARCHIVO, D.TIDO_ID,  D.CATE_ID, D.DOCU_METADATA FROM DOCUMENTO D "
                            + parameters.get("SQL_ETIQUETA_SI") + " WHERE "
                            + "(LOWER(D.DOCU_TITULO) LIKE CONCAT('%',?,'%') OR LOWER(D.DOCU_RESUMEN) LIKE CONCAT('%',?,'%')) "
                            + "AND D.DOCU_FECHA_DOCX != '' "
                            + parameters.get("SQL_TIDO") + " "
                            + parameters.get("SQL_ANIO") + " "
                            + parameters.get("SQL_ETIQUETA") + " "
                            + parameters.get("SQL_ESTADO") + " "
                            + "ORDER BY " + String.valueOf(parameters.get("SQL_ORDERS")) + " " + parameters.get("LIMIT"));
                    pst.setString(1, String.valueOf(parameters.get("FILTER")));
                    pst.setString(2, String.valueOf(parameters.get("FILTER")));
                    LOG.log(Level.INFO, "PST[2] -> {0}", pst);
                    rs = pst.executeQuery();
                    while (rs.next()) {
                        DocumentoArcDig obj = new DocumentoArcDig();
                        obj.setDocu_id(rs.getInt("DOCU_ID"));
                        obj.setUsua_id(rs.getInt("USUA_ID"));
                        obj.setDocu_titulo(rs.getString("DOCU_TITULO"));
                        obj.setDocu_resumen(rs.getString("DOCU_RESUMEN"));
                        obj.setDocu_origen_archivo(rs.getString("DOCU_ORIGEN_ARCHIVO"));
                        obj.setTido_id(rs.getInt("TIDO_ID"));
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
    public BEAN_CRUD add(DocumentoArcDig obj, HashMap<String, Object> parameters) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public BEAN_CRUD update(DocumentoArcDig obj, HashMap<String, Object> parameters) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public BEAN_CRUD delete(long id, HashMap<String, Object> parameters) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public DocumentoArcDig get(long id) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
