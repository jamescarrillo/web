/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gob.peam.web.model;

/**
 *
 * @author James Carrillo
 */
public class Persona {

    private Integer pers_id;
    private String pers_dni;
    private String pers_nombre;
    private String pers_apellido_paterno;
    private String pers_apellido_materno;
    private Boolean pers_estado;
    private String pers_iniciales;
    private String pers_cargo;

    public Integer getPers_id() {
        return pers_id;
    }

    public void setPers_id(Integer pers_id) {
        this.pers_id = pers_id;
    }

    public String getPers_dni() {
        return pers_dni;
    }

    public void setPers_dni(String pers_dni) {
        this.pers_dni = pers_dni;
    }

    public String getPers_nombre() {
        return pers_nombre;
    }

    public void setPers_nombre(String pers_nombre) {
        this.pers_nombre = pers_nombre;
    }

    public String getPers_apellido_paterno() {
        return pers_apellido_paterno;
    }

    public void setPers_apellido_paterno(String pers_apellido_paterno) {
        this.pers_apellido_paterno = pers_apellido_paterno;
    }

    public String getPers_apellido_materno() {
        return pers_apellido_materno;
    }

    public void setPers_apellido_materno(String pers_apellido_materno) {
        this.pers_apellido_materno = pers_apellido_materno;
    }

    public Boolean getPers_estado() {
        return pers_estado;
    }

    public void setPers_estado(Boolean pers_estado) {
        this.pers_estado = pers_estado;
    }

    public String getPers_iniciales() {
        return pers_iniciales;
    }

    public void setPers_iniciales(String pers_iniciales) {
        this.pers_iniciales = pers_iniciales;
    }

    public String getPers_cargo() {
        return pers_cargo;
    }

    public void setPers_cargo(String pers_cargo) {
        this.pers_cargo = pers_cargo;
    }

}
