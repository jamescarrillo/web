/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gob.peam.web.dao;

import gob.peam.web.model.Convocatoria_Pers;
import gob.peam.web.utilities.BEAN_CRUD;
import java.sql.SQLException;
import java.util.HashMap;

/**
 *
 * @author JamesCarrillo
 */
public interface Convocatoria_PersDAO extends CRUD<Convocatoria_Pers>{
    
    BEAN_CRUD activate(long id, HashMap<String, Object> parameters) throws SQLException;
}
