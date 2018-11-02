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
public class Estudio {
    private Integer id;
    private String titulo;
    private String snip;
    private String objetivo;
    private Integer cantidad_beneficiarios;
    private String caracteristicas_beneficiarios;
    private String foto;
    private String lugar;
    private String mapa;
    private String seguimiento;
    private Boolean estado;
    private Persona creado_por;
    private java.sql.Timestamp fecha_creado;
    private Persona editado_por;
    private java.sql.Timestamp fecha_editado;
    private String anho;
    private java.sql.Date fecha;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getSnip() {
        return snip;
    }

    public void setSnip(String snip) {
        this.snip = snip;
    }

    public String getObjetivo() {
        return objetivo;
    }

    public void setObjetivo(String objetivo) {
        this.objetivo = objetivo;
    }

    public Integer getCantidad_beneficiarios() {
        return cantidad_beneficiarios;
    }

    public void setCantidad_beneficiarios(Integer cantidad_beneficiarios) {
        this.cantidad_beneficiarios = cantidad_beneficiarios;
    }

    public String getCaracteristicas_beneficiarios() {
        return caracteristicas_beneficiarios;
    }

    public void setCaracteristicas_beneficiarios(String caracteristicas_beneficiarios) {
        this.caracteristicas_beneficiarios = caracteristicas_beneficiarios;
    }

    public String getFoto() {
        return foto;
    }

    public void setFoto(String foto) {
        this.foto = foto;
    }

    public String getLugar() {
        return lugar;
    }

    public void setLugar(String lugar) {
        this.lugar = lugar;
    }

    public String getMapa() {
        return mapa;
    }

    public void setMapa(String mapa) {
        this.mapa = mapa;
    }

    public String getSeguimiento() {
        return seguimiento;
    }

    public void setSeguimiento(String seguimiento) {
        this.seguimiento = seguimiento;
    }

    public Boolean getEstado() {
        return estado;
    }

    public void setEstado(Boolean estado) {
        this.estado = estado;
    }

    public Persona getCreado_por() {
        return creado_por;
    }

    public void setCreado_por(Persona creado_por) {
        this.creado_por = creado_por;
    }

    public Timestamp getFecha_creado() {
        return fecha_creado;
    }

    public void setFecha_creado(Timestamp fecha_creado) {
        this.fecha_creado = fecha_creado;
    }

    public Persona getEditado_por() {
        return editado_por;
    }

    public void setEditado_por(Persona editado_por) {
        this.editado_por = editado_por;
    }

    public Timestamp getFecha_editado() {
        return fecha_editado;
    }

    public void setFecha_editado(Timestamp fecha_editado) {
        this.fecha_editado = fecha_editado;
    }

    public String getAnho() {
        return anho;
    }

    public void setAnho(String anho) {
        this.anho = anho;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }
    
    
}
