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
public class Destacado {

    private Integer id;
    private String anho;
    private String titulo;
    private String contenido;
    private java.sql.Date fecha;
    private String foto;
    private Boolean estado;
    private String url;
    private Persona creado_por;
    private java.sql.Date fecha_creado;
    private Persona editado_por;
    private java.sql.Date fecha_editado;

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

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getContenido() {
        return contenido;
    }

    public void setContenido(String contenido) {
        this.contenido = contenido;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public String getFoto() {
        return foto;
    }

    public void setFoto(String foto) {
        this.foto = foto;
    }

    public Boolean getEstado() {
        return estado;
    }

    public void setEstado(Boolean estado) {
        this.estado = estado;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Persona getCreado_por() {
        return creado_por;
    }

    public void setCreado_por(Persona creado_por) {
        this.creado_por = creado_por;
    }

    public Date getFecha_creado() {
        return fecha_creado;
    }

    public void setFecha_creado(Date fecha_creado) {
        this.fecha_creado = fecha_creado;
    }

    public Persona getEditado_por() {
        return editado_por;
    }

    public void setEditado_por(Persona editado_por) {
        this.editado_por = editado_por;
    }

    public Date getFecha_editado() {
        return fecha_editado;
    }

    public void setFecha_editado(Date fecha_editado) {
        this.fecha_editado = fecha_editado;
    }

}
