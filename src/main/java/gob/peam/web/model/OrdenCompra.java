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
public class OrdenCompra {

    /*F00007*/
    private Integer id;
    private String mes;
    private String anho;
    private String orden_compra;
    private java.sql.Date fecha_compra;
    private String fuente_financiamiento;
    private String proveedor;
    private Double monto;
    private String financiamiento;
    private Boolean estado;
    private String nro_siaf;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getMes() {
        return mes;
    }

    public void setMes(String mes) {
        this.mes = mes;
    }

    public String getAnho() {
        return anho;
    }

    public void setAnho(String anho) {
        this.anho = anho;
    }

    public String getOrden_compra() {
        return orden_compra;
    }

    public void setOrden_compra(String orden_compra) {
        this.orden_compra = orden_compra;
    }

    public Date getFecha_compra() {
        return fecha_compra;
    }

    public void setFecha_compra(Date fecha_compra) {
        this.fecha_compra = fecha_compra;
    }

    public String getFuente_financiamiento() {
        return fuente_financiamiento;
    }

    public void setFuente_financiamiento(String fuente_financiamiento) {
        this.fuente_financiamiento = fuente_financiamiento;
    }

    public String getProveedor() {
        return proveedor;
    }

    public void setProveedor(String proveedor) {
        this.proveedor = proveedor;
    }

    public Double getMonto() {
        return monto;
    }

    public void setMonto(Double monto) {
        this.monto = monto;
    }

    public String getFinanciamiento() {
        return financiamiento;
    }

    public void setFinanciamiento(String financiamiento) {
        this.financiamiento = financiamiento;
    }

    public Boolean getEstado() {
        return estado;
    }

    public void setEstado(Boolean estado) {
        this.estado = estado;
    }

    public String getNro_siaf() {
        return nro_siaf;
    }

    public void setNro_siaf(String nro_siaf) {
        this.nro_siaf = nro_siaf;
    }

}
