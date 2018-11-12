/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gob.peam.web.model;

import java.sql.Date;

/**
 *
 * @author Juan Barrantes
 */
public class Presupuesto {
    private Integer id;
    private String anho;
    private String titulo_formato;
    private String descripcion;
    private String resolucion_aprobacion;
    private java.sql.Date fecha_aprobacion;
    private String ubicacion;
    private Integer tipo;
    private Boolean estado;
    private Integer docu_id;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAnho() {
        return anho;
    }

    public void setAnho(String anho) {
        this.anho = anho;
    }

    public String getTitulo_formato() {
        return titulo_formato;
    }

    public void setTitulo_formato(String titulo_formato) {
        this.titulo_formato = titulo_formato;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getResolucion_aprobacion() {
        return resolucion_aprobacion;
    }

    public void setResolucion_aprobacion(String resolucion_aprobacion) {
        this.resolucion_aprobacion = resolucion_aprobacion;
    }

    public Date getFecha_aprobacion() {
        return fecha_aprobacion;
    }

    public void setFecha_aprobacion(Date fecha_aprobacion) {
        this.fecha_aprobacion = fecha_aprobacion;
    }

    public String getUbicacion() {
        return ubicacion;
    }

    public void setUbicacion(String ubicacion) {
        this.ubicacion = ubicacion;
    }

    public Integer getTipo() {
        return tipo;
    }

    public void setTipo(Integer tipo) {
        this.tipo = tipo;
    }

    public Boolean getEstado() {
        return estado;
    }

    public void setEstado(Boolean estado) {
        this.estado = estado;
    }

    public Integer getDocu_id() {
        return docu_id;
    }

    public void setDocu_id(Integer docu_id) {
        this.docu_id = docu_id;
    }
    
    
}
