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
public class Publicidad {
    
    /*F00026*/
    private Integer id;
    private String anho;
    private String bienes_servicios;
    private String fuente_financiamiento;
    private String proceso;
    private String contrato;
    private String objeto_contrato;
    private Double valor_referencial;
    private String proveedor;
    private String ruc;
    private Double monto_contrato;
    private Double penalidad;
    private Double costo_final;
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

    public String getBienes_servicios() {
        return bienes_servicios;
    }

    public void setBienes_servicios(String bienes_servicios) {
        this.bienes_servicios = bienes_servicios;
    }

    public String getFuente_financiamiento() {
        return fuente_financiamiento;
    }

    public void setFuente_financiamiento(String fuente_financiamiento) {
        this.fuente_financiamiento = fuente_financiamiento;
    }

    public String getProceso() {
        return proceso;
    }

    public void setProceso(String proceso) {
        this.proceso = proceso;
    }

    public String getContrato() {
        return contrato;
    }

    public void setContrato(String contrato) {
        this.contrato = contrato;
    }

    public String getObjeto_contrato() {
        return objeto_contrato;
    }

    public void setObjeto_contrato(String objeto_contrato) {
        this.objeto_contrato = objeto_contrato;
    }

    public Double getMonto_contrato() {
        return monto_contrato;
    }

    public void setMonto_contrato(Double monto_contrato) {
        this.monto_contrato = monto_contrato;
    }

    public String getProveedor() {
        return proveedor;
    }

    public void setProveedor(String proveedor) {
        this.proveedor = proveedor;
    }

    public String getRuc() {
        return ruc;
    }

    public void setRuc(String ruc) {
        this.ruc = ruc;
    }

    public Double getValor_referencial() {
        return valor_referencial;
    }

    public void setValor_referencial(Double valor_referencial) {
        this.valor_referencial = valor_referencial;
    }

    public Double getPenalidad() {
        return penalidad;
    }

    public void setPenalidad(Double penalidad) {
        this.penalidad = penalidad;
    }

    public Double getCosto_final() {
        return costo_final;
    }

    public void setCosto_final(Double costo_final) {
        this.costo_final = costo_final;
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
