/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gob.peam.web.dao;

import gob.peam.web.model.NotaPrensa;
import gob.peam.web.utilities.BEAN_CRUD;
import java.sql.SQLException;
import java.util.HashMap;

/**
 *
 * @author Juan Jose
 */
public interface NotaPrensaDAO extends CRUD<NotaPrensa> {

    BEAN_CRUD cambiarEstado(Integer id, Boolean estado, HashMap<String, Object> parameters) throws SQLException;

}
