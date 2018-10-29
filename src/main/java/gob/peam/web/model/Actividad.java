/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gob.peam.web.model;

/**
 *
 * @author Juan Jose
 */
public class Actividad {

    private Integer acti_id;
    private String descripcion;
    private Boolean estado;
    private Integer acti_tipo;

    public Actividad(int acti_id, String descripcion) {
        this.acti_id=acti_id;
        this.descripcion=descripcion;
    }

    public Actividad() {
    }
    
    public Actividad(int acti_id) {
        this.acti_id=acti_id;
    }

    public Integer getActi_id() {
        return acti_id;
    }

    public void setActi_id(Integer acti_id) {
        this.acti_id = acti_id;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public Boolean getEstado() {
        return estado;
    }

    public void setEstado(Boolean estado) {
        this.estado = estado;
    }

    public Integer getActi_tipo() {
        return acti_tipo;
    }

    public void setActi_tipo(Integer acti_tipo) {
        this.acti_tipo = acti_tipo;
    }

}
