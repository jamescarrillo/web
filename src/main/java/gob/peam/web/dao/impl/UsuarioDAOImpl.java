/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gob.peam.web.dao.impl;

import gob.peam.web.dao.SQLCloseable;
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
public class UsuarioDAOImpl {

    private final DataSource pool;

    public UsuarioDAOImpl(DataSource pool) {
        this.pool = pool;
        //10205114
    }

    public Usuario getUserValidation(String login) throws SQLException {
        Usuario usuario = null;
        try (Connection conn = pool.getConnection()) {
            try (PreparedStatement pst = conn.prepareStatement("SELECT USUA_ID, USUA_CLAVE, USUA_ESTADO, U.PERS_ID, PERS_DNI, PERS_NOMBRE, "
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
                        persona.setPers_id(rs.getInt("PERS_ID"));
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

    public String updateUser(Usuario usuario) throws SQLException {
        String res = "";
        PreparedStatement pst;
        ResultSet rs;
        try (Connection conn = pool.getConnection();
                SQLCloseable finish = conn::rollback;) {
            conn.setAutoCommit(false);
            pst = conn.prepareStatement("SELECT COUNT(USUA_ID) AS COUNT FROM ADMINISTRACION.USUARIO "
                    + "WHERE USUA_LOGIN = ? AND USUA_ID != ?");
            pst.setString(1, usuario.getUsua_login());
            pst.setInt(2, usuario.getUsua_id());
            rs = pst.executeQuery();
            while (rs.next()) {
                if (rs.getInt("COUNT") == 0) {
                    pst = conn.prepareStatement("UPDATE ADMINISTRACION.USUARIO SET USUA_LOGIN = ?, "
                            + "USUA_CLAVE = ? WHERE USUA_ID = ?");
                    pst.setString(1, usuario.getUsua_login());
                    pst.setString(2, usuario.getUsua_clave());
                    pst.setInt(3, usuario.getUsua_id());
                    pst.executeUpdate();
                    conn.commit();
                    res = "ok";
                } else {
                    res = "No se actualizó, ya existe un Usuario con el nombre login ingresado";
                }
            }
        } catch (SQLException e) {
            throw e;
        }
        return res;
    }

}
