/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gob.peam.web.dao;

import gob.peam.web.model.Anuncio;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author Juan Jose
 */
public interface AnuncioDAO extends CRUD<Anuncio> {

    List<Anuncio> getAnunciosDia(Integer cantidad) throws SQLException;
}
