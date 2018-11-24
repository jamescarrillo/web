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
public class PersonalCategoria {
    
    private Integer id;
    private String anho;
    private Integer trimestre;
    private String codigo;
    private String categoria;
    private Double remuneracion_minima;
    private Double remuneracion_maxima;
    private Integer numero_trabajadores;
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

    public Integer getTrimestre() {
        return trimestre;
    }

    public void setTrimestre(Integer trimestre) {
        this.trimestre = trimestre;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public Double getRemuneracion_minima() {
        return remuneracion_minima;
    }

    public void setRemuneracion_minima(Double remuneracion_minima) {
        this.remuneracion_minima = remuneracion_minima;
    }

    public Double getRemuneracion_maxima() {
        return remuneracion_maxima;
    }

    public void setRemuneracion_maxima(Double remuneracion_maxima) {
        this.remuneracion_maxima = remuneracion_maxima;
    }

    public Integer getNumero_trabajadores() {
        return numero_trabajadores;
    }

    public void setNumero_trabajadores(Integer numero_trabajadores) {
        this.numero_trabajadores = numero_trabajadores;
    }

    public Boolean getEstado() {
        return estado;
    }

    public void setEstado(Boolean estado) {
        this.estado = estado;
    }
    
}
