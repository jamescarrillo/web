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
public class Vehiculo {

    /*TABLA = F00014*/
    private Integer id;
    private String anho;
    private String mes;
    private String tipo_clase;
    private String clase_vehiculo;
    private String cargo_actividad;
    private String tipo_combustible;
    private Double recorrido_km;
    private Double costo_combustible;
    private java.sql.Date soat_fecha_vencimiento;
    private String placa;
    private String observaciones;
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

    public String getTipo_clase() {
        return tipo_clase;
    }

    public void setTipo_clase(String tipo_clase) {
        this.tipo_clase = tipo_clase;
    }

    public String getClase_vehiculo() {
        return clase_vehiculo;
    }

    public void setClase_vehiculo(String clase_vehiculo) {
        this.clase_vehiculo = clase_vehiculo;
    }

    public String getCargo_actividad() {
        return cargo_actividad;
    }

    public void setCargo_actividad(String cargo_actividad) {
        this.cargo_actividad = cargo_actividad;
    }

    public String getTipo_combustible() {
        return tipo_combustible;
    }

    public void setTipo_combustible(String tipo_combustible) {
        this.tipo_combustible = tipo_combustible;
    }

    public Double getRecorrido_km() {
        return recorrido_km;
    }

    public void setRecorrido_km(Double recorrido_km) {
        this.recorrido_km = recorrido_km;
    }

    public Double getCosto_combustible() {
        return costo_combustible;
    }

    public void setCosto_combustible(Double costo_combustible) {
        this.costo_combustible = costo_combustible;
    }

    public Date getSoat_fecha_vencimiento() {
        return soat_fecha_vencimiento;
    }

    public void setSoat_fecha_vencimiento(Date soat_fecha_vencimiento) {
        this.soat_fecha_vencimiento = soat_fecha_vencimiento;
    }

    public String getPlaca() {
        return placa;
    }

    public void setPlaca(String placa) {
        this.placa = placa;
    }

    public String getObservaciones() {
        return observaciones;
    }

    public void setObservaciones(String observaciones) {
        this.observaciones = observaciones;
    }

    public Boolean getEstado() {
        return estado;
    }

    public void setEstado(Boolean estado) {
        this.estado = estado;
    }

}
