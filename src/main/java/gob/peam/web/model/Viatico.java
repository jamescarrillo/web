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
public class Viatico {

    private Integer id;
    private String anho;
    private String mes;
    private String tipo_viatico;
    private String modalidad;
    private String area_oficina;
    private String usuarios;
    private String fuente_financiamiento;
    private java.sql.Date fecha_salida;
    private java.sql.Date fecha_retorno;
    private String ruta;
    private String autorizacion_viaje;
    private String resolucion;
    private Double costo_pasajes;
    private Double viaticos;
    private Boolean estado;

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

    public String getTipo_viatico() {
        return tipo_viatico;
    }

    public void setTipo_viatico(String tipo_viatico) {
        this.tipo_viatico = tipo_viatico;
    }

    public String getModalidad() {
        return modalidad;
    }

    public void setModalidad(String modalidad) {
        this.modalidad = modalidad;
    }

    public String getArea_oficina() {
        return area_oficina;
    }

    public void setArea_oficina(String area_oficina) {
        this.area_oficina = area_oficina;
    }

    public String getUsuarios() {
        return usuarios;
    }

    public void setUsuarios(String usuarios) {
        this.usuarios = usuarios;
    }

    public String getFuente_financiamiento() {
        return fuente_financiamiento;
    }

    public void setFuente_financiamiento(String fuente_financiamiento) {
        this.fuente_financiamiento = fuente_financiamiento;
    }

    public Date getFecha_salida() {
        return fecha_salida;
    }

    public void setFecha_salida(Date fecha_salida) {
        this.fecha_salida = fecha_salida;
    }

    public Date getFecha_retorno() {
        return fecha_retorno;
    }

    public void setFecha_retorno(Date fecha_retorno) {
        this.fecha_retorno = fecha_retorno;
    }

    public String getRuta() {
        return ruta;
    }

    public void setRuta(String ruta) {
        this.ruta = ruta;
    }

    public String getAutorizacion_viaje() {
        return autorizacion_viaje;
    }

    public void setAutorizacion_viaje(String autorizacion_viaje) {
        this.autorizacion_viaje = autorizacion_viaje;
    }

    public String getResolucion() {
        return resolucion;
    }

    public void setResolucion(String resolucion) {
        this.resolucion = resolucion;
    }

    public Double getCosto_pasajes() {
        return costo_pasajes;
    }

    public void setCosto_pasajes(Double costo_pasajes) {
        this.costo_pasajes = costo_pasajes;
    }

    public Double getViaticos() {
        return viaticos;
    }

    public void setViaticos(Double viaticos) {
        this.viaticos = viaticos;
    }

    public Boolean getEstado() {
        return estado;
    }

    public void setEstado(Boolean estado) {
        this.estado = estado;
    }
    
    
}
