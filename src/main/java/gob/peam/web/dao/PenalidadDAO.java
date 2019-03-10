/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gob.peam.web.dao;

import gob.peam.web.model.Penalidad;
import gob.peam.web.utilities.BEAN_PAGINATION;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

/**
 *
 * @author JamesCarrillo
 */
public interface PenalidadDAO extends CRUD<Penalidad> {
    BEAN_PAGINATION getAnhos(HashMap<String, Object> parameters, Connection conn) throws SQLException;
    BEAN_PAGINATION getAnhos(HashMap<String, Object> parameters) throws SQLException;
}
