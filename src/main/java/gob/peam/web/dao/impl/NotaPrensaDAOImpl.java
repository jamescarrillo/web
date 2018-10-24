/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gob.peam.web.dao.impl;

import gob.peam.web.dao.NotaPrensaDAO;
import gob.peam.web.model.Directivo;
import gob.peam.web.model.NotaPrensa;
import gob.peam.web.utilities.BEAN_CRUD;
import gob.peam.web.utilities.BEAN_PAGINATION;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 *
 * @author James Carrillo
 */
public class NotaPrensaDAOImpl implements NotaPrensaDAO{

    @Override
    public BEAN_PAGINATION getPagination(HashMap<String, Object> parameters, Connection conn) throws SQLException {
        BEAN_PAGINATION beanpagination = new BEAN_PAGINATION();
        List<Directivo> list = new ArrayList<>();
        PreparedStatement pst;
        ResultSet rs;
        try {
            pst = conn.prepareStatement("SELECT COUNT(ID) AS COUNT FROM WEB.F00012 WHERE "
                    + "NOMBRES_APELLIDOS LIKE CONCAT('%',?,'%')");
            pst.setString(1, String.valueOf(parameters.get("FILTER")));
            rs = pst.executeQuery();
            while (rs.next()) {
                beanpagination.setCOUNT_FILTER(rs.getInt("COUNT"));
                pst = conn.prepareStatement("SELECT * FROM WEB.F00012 WHERE "
                        + "NOMBRES_APELLIDOS LIKE CONCAT('%',?,'%') ORDER BY "
                        + String.valueOf(parameters.get("SQL_ORDERS")) + " " + parameters.get("LIMIT"));
                pst.setString(1, String.valueOf(parameters.get("FILTER")));
                rs = pst.executeQuery();
                while (rs.next()) {
                    Directivo obj = new Directivo();
                    
                    list.add(obj);
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
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public BEAN_CRUD add(NotaPrensa obj, HashMap<String, Object> parameters) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public BEAN_CRUD update(NotaPrensa obj, HashMap<String, Object> parameters) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public BEAN_CRUD delete(long id, HashMap<String, Object> parameters) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public NotaPrensa get(long id) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
