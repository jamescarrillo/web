/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gob.peam.web.dao;

import gob.peam.web.model.Evento;
import gob.peam.web.utilities.BEAN_CRUD;
import java.sql.SQLException;
import java.util.HashMap;

/**
 *
 * @author JhanxD
 */
public interface EventoDAO extends CRUD<Evento> {
        
    BEAN_CRUD activate(long id, HashMap<String, Object> parameters) throws SQLException;
}
