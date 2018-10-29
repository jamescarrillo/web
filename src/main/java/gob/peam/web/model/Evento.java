/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gob.peam.web.model;

import java.sql.Date;
import java.sql.Timestamp;

/**
 *
 * @author JhanxD
 */
public class Evento {
    private Integer id;
    private String anho;
    private String titulo;
    private java.sql.Date fecha;
    private String foto;
    private Boolean estado;
    private Integer creado_por;
    private java.sql.Timestamp fecha_creado;
    private Integer editado_por;
    private java.sql.Timestamp fecha_editado;
    private LineaAccion area;
    private String link;

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

    public Integer getCreado_por() {
        return creado_por;
    }

    public void setCreado_por(Integer creado_por) {
        this.creado_por = creado_por;
    }

    public Timestamp getFecha_creado() {
        return fecha_creado;
    }

    public void setFecha_creado(Timestamp fecha_creado) {
        this.fecha_creado = fecha_creado;
    }

    public Integer getEditado_por() {
        return editado_por;
    }

    public void setEditado_por(Integer editado_por) {
        this.editado_por = editado_por;
    }

    public Timestamp getFecha_editado() {
        return fecha_editado;
    }

    public void setFecha_editado(Timestamp fecha_editado) {
        this.fecha_editado = fecha_editado;
    }

    public LineaAccion getArea() {
        return area;
    }

    public void setArea(LineaAccion area) {
        this.area = area;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }
    
    
    
    
}
