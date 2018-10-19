/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gob.peam.web.dao.impl;

import gob.peam.web.model.Persona;
import gob.peam.web.model.Usuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.sql.DataSource;

/**
 *
 * @author James Carrillo
 */
public class UsuarioDAO {

    private final DataSource pool;

    public UsuarioDAO(DataSource pool) {
        this.pool = pool;
    }

    public Usuario getUserValidation(String login) throws SQLException {
        Usuario usuario = null;
        try (Connection connPool = pool.getConnection()) {
            try (PreparedStatement pst = connPool.prepareStatement("SELECT USUA_ID, USUA_CLAVE, USUA_ESTADO, PERS_DNI, PERS_NOMBRE, "
                    + "PERS_APELLIDO_PATERNO, PERS_APELLIDO_MATERNO, PERS_CARGO FROM ADMINISTRACION.USUARIO U "
                    + "INNER JOIN ADMINISTRACION.PERSONA P ON U.PERS_ID = P.PERS_ID WHERE USUA_LOGIN = ?");) {
                pst.setString(1, login);
                try (ResultSet rs = pst.executeQuery()) {
                    while (rs.next()) {
                        usuario = new Usuario();
                        usuario.setUsua_login(login);
                        usuario.setUsua_id(rs.getInt("USUA_ID"));
                        usuario.setUsua_estado(rs.getBoolean("USUA_ESTADO"));
                        usuario.setUsua_clave(rs.getString("USUA_CLAVE"));
                        Persona persona = new Persona();
                        persona.setPers_dni(rs.getString("PERS_DNI"));
                        persona.setPers_nombre(rs.getString("PERS_NOMBRE"));
                        persona.setPers_apellido_paterno(rs.getString("PERS_APELLIDO_PATERNO"));
                        persona.setPers_apellido_materno(rs.getString("PERS_APELLIDO_MATERNO"));
                        persona.setPers_cargo(rs.getString("PERS_CARGO"));
                        usuario.setPersona(persona);
                    }
                }
            }
        } catch (SQLException e) {
            throw e;
        }
        return usuario;
    }

}
