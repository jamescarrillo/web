/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gob.peam.web.dao;

import gob.peam.web.model.CategoriaDoc;
import gob.peam.web.model.Documento;
import gob.peam.web.utilities.BEAN_CRUD;
import gob.peam.web.utilities.BEAN_PAGINATION;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

/**
 *
 * @author JamesCarrillo
 */
public interface DocumentoDAO extends CRUD<Documento> {

    BEAN_CRUD cambiarEstado(Integer id, Boolean estado, HashMap<String, Object> parameters) throws SQLException;
    
    List<CategoriaDoc> listarCategorias() throws SQLException;
    
    BEAN_PAGINATION getAnhos(HashMap<String, Object> parameters, Connection conn) throws SQLException;
    BEAN_PAGINATION getAnhos(HashMap<String, Object> parameters) throws SQLException;
}
