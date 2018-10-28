/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gob.peam.web.model;

import java.sql.Date;

/**
 *
 * @author JamesCarrillo
 */
public class Convocatoria_Pers {
    
    private Integer coper_id;
    private java.sql.Date fecha;
    private String convocatoria;
    private String descripcion;
    private Boolean estado;
    private String anho;

    public Convocatoria_Pers(int coper_id) {
        this.coper_id= coper_id;
    }
    
    public Convocatoria_Pers() {
    }

    public Integer getCoper_id() {
        return coper_id;
    }

    public void setCoper_id(Integer coper_id) {
        this.coper_id = coper_id;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public String getConvocatoria() {
        return convocatoria;
    }

    public void setConvocatoria(String convocatoria) {
        this.convocatoria = convocatoria;
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

    public String getAnho() {
        return anho;
    }

    public void setAnho(String anho) {
        this.anho = anho;
    }
    
    
}
