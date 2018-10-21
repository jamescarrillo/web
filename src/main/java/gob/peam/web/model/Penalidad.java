/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gob.peam.web.model;

/**
 *
 * @author JhanxD
 */
public class Penalidad {
    private Integer id;
    private String anho;
    private String contratista;
    private String ruc;
    private String objeto;
    private String nro_proceso;
    private String nro_contrato;
    private String tipo;
    private String monto_contrato;
    private String monto_penalidad;

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

    public String getContratista() {
        return contratista;
    }

    public void setContratista(String contratista) {
        this.contratista = contratista;
    }

    public String getRuc() {
        return ruc;
    }

    public void setRuc(String ruc) {
        this.ruc = ruc;
    }

    public String getObjeto() {
        return objeto;
    }

    public void setObjeto(String objeto) {
        this.objeto = objeto;
    }

    public String getNro_proceso() {
        return nro_proceso;
    }

    public void setNro_proceso(String nro_proceso) {
        this.nro_proceso = nro_proceso;
    }

    public String getNro_contrato() {
        return nro_contrato;
    }

    public void setNro_contrato(String nro_contrato) {
        this.nro_contrato = nro_contrato;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getMonto_contrato() {
        return monto_contrato;
    }

    public void setMonto_contrato(String monto_contrato) {
        this.monto_contrato = monto_contrato;
    }

    public String getMonto_penalidad() {
        return monto_penalidad;
    }

    public void setMonto_penalidad(String monto_penalidad) {
        this.monto_penalidad = monto_penalidad;
    }
    
    
}
