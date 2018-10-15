/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gob.peam.web.model;

import java.sql.Date;

/**
 *
 * @author James Carrillo
 */
public class Usuario {

    private Integer usua_id;
    private String usua_login;
    private String usua_clave;
    private java.sql.Date usua_fecha_registro;
    private java.sql.Date usua_fecha_caducidad;
    private Boolean usua_estado;
    private String usua_firma_digital;
    private Persona persona;

    public Integer getUsua_id() {
        return usua_id;
    }

    public void setUsua_id(Integer usua_id) {
        this.usua_id = usua_id;
    }

    public String getUsua_login() {
        return usua_login;
    }

    public void setUsua_login(String usua_login) {
        this.usua_login = usua_login;
    }

    public String getUsua_clave() {
        return usua_clave;
    }

    public void setUsua_clave(String usua_clave) {
        this.usua_clave = usua_clave;
    }

    public Date getUsua_fecha_registro() {
        return usua_fecha_registro;
    }

    public void setUsua_fecha_registro(Date usua_fecha_registro) {
        this.usua_fecha_registro = usua_fecha_registro;
    }

    public Date getUsua_fecha_caducidad() {
        return usua_fecha_caducidad;
    }

    public void setUsua_fecha_caducidad(Date usua_fecha_caducidad) {
        this.usua_fecha_caducidad = usua_fecha_caducidad;
    }

    public Boolean getUsua_estado() {
        return usua_estado;
    }

    public void setUsua_estado(Boolean usua_estado) {
        this.usua_estado = usua_estado;
    }

    public String getUsua_firma_digital() {
        return usua_firma_digital;
    }

    public void setUsua_firma_digital(String usua_firma_digital) {
        this.usua_firma_digital = usua_firma_digital;
    }

    public Persona getPersona() {
        return persona;
    }

    public void setPersona(Persona persona) {
        this.persona = persona;
    }

}
