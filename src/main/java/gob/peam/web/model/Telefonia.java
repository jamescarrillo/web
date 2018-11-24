/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gob.peam.web.model;

/**
 *
 * @author JamesCarrillo
 */
public class Telefonia {

    /*TABLA = F00020*/
    private Integer id;
    private String anho;
    private String mes;
    private String area_oficina;
    private String asignado_a;
    private String cargo_actividad;
    private Double importe;
    private Boolean estado;
    private String tipo;
    private String numero;

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

    public String getArea_oficina() {
        return area_oficina;
    }

    public void setArea_oficina(String area_oficina) {
        this.area_oficina = area_oficina;
    }

    public String getAsignado_a() {
        return asignado_a;
    }

    public void setAsignado_a(String asignado_a) {
        this.asignado_a = asignado_a;
    }

    public String getCargo_actividad() {
        return cargo_actividad;
    }

    public void setCargo_actividad(String cargo_actividad) {
        this.cargo_actividad = cargo_actividad;
    }

    public Double getImporte() {
        return importe;
    }

    public void setImporte(Double importe) {
        this.importe = importe;
    }

    public Boolean getEstado() {
        return estado;
    }

    public void setEstado(Boolean estado) {
        this.estado = estado;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getNumero() {
        return numero;
    }

    public void setNumero(String numero) {
        this.numero = numero;
    }

}
