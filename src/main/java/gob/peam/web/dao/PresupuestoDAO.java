/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gob.peam.web.dao;

import gob.peam.web.model.Presupuesto;
import gob.peam.web.utilities.BEAN_CRUD;
import gob.peam.web.utilities.BEAN_PAGINATION;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

/**
 *
 * @author JhanxD
 */
public interface PresupuestoDAO extends CRUD<Presupuesto> {

    BEAN_CRUD activate(long id, HashMap<String, Object> parameters) throws SQLException;

    BEAN_PAGINATION getAnhos(HashMap<String, Object> parameters, Connection conn) throws SQLException;

    BEAN_PAGINATION getAnhos(HashMap<String, Object> parameters) throws SQLException;

}
