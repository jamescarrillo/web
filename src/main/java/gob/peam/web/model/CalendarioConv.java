/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gob.peam.web.model;

import java.sql.Date;

/**
 *
 * @author JhanxD
 */
public class CalendarioConv {
    private Integer id;
    private java.sql.Date fecha_inicio;
    private java.sql.Date fecha_fin;
    private Boolean estado;
    private Integer convo_id;
    private Actividad acti_id;
    private Integer tipo;

    public CalendarioConv(Integer id) {
        this.id=id;
    }
    
    public CalendarioConv() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getFecha_inicio() {
        return fecha_inicio;
    }

    public void setFecha_inicio(Date fecha_inicio) {
        this.fecha_inicio = fecha_inicio;
    }

    public Date getFecha_fin() {
        return fecha_fin;
    }

    public void setFecha_fin(Date fecha_fin) {
        this.fecha_fin = fecha_fin;
    }

    public Boolean getEstado() {
        return estado;
    }

    public void setEstado(Boolean estado) {
        this.estado = estado;
    }

    public Integer getConvo_id() {
        return convo_id;
    }

    public void setConvo_id(Integer convo_id) {
        this.convo_id = convo_id;
    }

    public Actividad getActi_id() {
        return acti_id;
    }

    public void setActi_id(Actividad acti_id) {
        this.acti_id = acti_id;
    }

    public Integer getTipo() {
        return tipo;
    }

    public void setTipo(Integer tipo) {
        this.tipo = tipo;
    }
    
    
}
