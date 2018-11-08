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
public class Obra {

    private Integer id;
    private String anho;
    private String mes;
    private Boolean estado;
    private Persona creadoPor;
    private java.sql.Timestamp fechaCreado;
    private Persona editadoPor;
    private java.sql.Timestamp fechaEditado;
    private String descripcion;
    private Integer montoInversion;
    private Integer montoGastado;
    private Integer tiempoEjecucion;
    private String modalidadEjecucion;
    private java.sql.Date fechaInicio;
    private java.sql.Date fechaFin;
    private String seguimiento;
    private String ubicacion;
    private String contratista;
    private String supervisor;
    private String residente;
    private Integer avanceFisico;
    private LineaAccion area;
    private String galeria;
    private String foto;
    private String anhoActualizacion;
    private String mesActualizacion;
    private String snip;
    private String observacion;
    private String infobras;
    private String leyenda;

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

    public String getMes() {
        return mes;
    }

    public void setMes(String mes) {
        this.mes = mes;
    }

    public Boolean getEstado() {
        return estado;
    }

    public void setEstado(Boolean estado) {
        this.estado = estado;
    }

    public Persona getCreadoPor() {
        return creadoPor;
    }

    public void setCreadoPor(Persona creadoPor) {
        this.creadoPor = creadoPor;
    }

    public Timestamp getFechaCreado() {
        return fechaCreado;
    }

    public void setFechaCreado(Timestamp fechaCreado) {
        this.fechaCreado = fechaCreado;
    }

    public Persona getEditadoPor() {
        return editadoPor;
    }

    public void setEditadoPor(Persona editadoPor) {
        this.editadoPor = editadoPor;
    }

    public Timestamp getFechaEditado() {
        return fechaEditado;
    }

    public void setFechaEditado(Timestamp fechaEditado) {
        this.fechaEditado = fechaEditado;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public Integer getMontoInversion() {
        return montoInversion;
    }

    public void setMontoInversion(Integer montoInversion) {
        this.montoInversion = montoInversion;
    }

    public Integer getMontoGastado() {
        return montoGastado;
    }

    public void setMontoGastado(Integer montoGastado) {
        this.montoGastado = montoGastado;
    }

    public Integer getTiempoEjecucion() {
        return tiempoEjecucion;
    }

    public void setTiempoEjecucion(Integer tiempoEjecucion) {
        this.tiempoEjecucion = tiempoEjecucion;
    }

    public String getModalidadEjecucion() {
        return modalidadEjecucion;
    }

    public void setModalidadEjecucion(String modalidadEjecucion) {
        this.modalidadEjecucion = modalidadEjecucion;
    }

    public Date getFechaInicio() {
        return fechaInicio;
    }

    public void setFechaInicio(Date fechaInicio) {
        this.fechaInicio = fechaInicio;
    }

    public Date getFechaFin() {
        return fechaFin;
    }

    public void setFechaFin(Date fechaFin) {
        this.fechaFin = fechaFin;
    }

    public String getSeguimiento() {
        return seguimiento;
    }

    public void setSeguimiento(String seguimiento) {
        this.seguimiento = seguimiento;
    }

    public String getUbicacion() {
        return ubicacion;
    }

    public void setUbicacion(String ubicacion) {
        this.ubicacion = ubicacion;
    }

    public String getContratista() {
        return contratista;
    }

    public void setContratista(String contratista) {
        this.contratista = contratista;
    }

    public String getSupervisor() {
        return supervisor;
    }

    public void setSupervisor(String supervisor) {
        this.supervisor = supervisor;
    }

    public String getResidente() {
        return residente;
    }

    public void setResidente(String residente) {
        this.residente = residente;
    }

    public Integer getAvanceFisico() {
        return avanceFisico;
    }

    public void setAvanceFisico(Integer avanceFisico) {
        this.avanceFisico = avanceFisico;
    }

    public LineaAccion getArea() {
        return area;
    }

    public void setArea(LineaAccion area) {
        this.area = area;
    }

    public String getGaleria() {
        return galeria;
    }

    public void setGaleria(String galeria) {
        this.galeria = galeria;
    }

    public String getFoto() {
        return foto;
    }

    public void setFoto(String foto) {
        this.foto = foto;
    }

    public String getAnhoActualizacion() {
        return anhoActualizacion;
    }

    public void setAnhoActualizacion(String anhoActualizacion) {
        this.anhoActualizacion = anhoActualizacion;
    }

    public String getMesActualizacion() {
        return mesActualizacion;
    }

    public void setMesActualizacion(String mesActualizacion) {
        this.mesActualizacion = mesActualizacion;
    }

    public String getSnip() {
        return snip;
    }

    public void setSnip(String snip) {
        this.snip = snip;
    }

    public String getObservacion() {
        return observacion;
    }

    public void setObservacion(String observacion) {
        this.observacion = observacion;
    }

    public String getInfobras() {
        return infobras;
    }

    public void setInfobras(String infobras) {
        this.infobras = infobras;
    }

    public String getLeyenda() {
        return leyenda;
    }

    public void setLeyenda(String leyenda) {
        this.leyenda = leyenda;
    }

    
}
