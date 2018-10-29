/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gob.peam.web.model;

/**
 *
 * @author Juan Jose
 */
public class Anuncio {
    
    private Integer anu_id;
    private String anu_fecha_ini;
    private String anu_fecha_fin;
    private Integer tipo;
    private String titulo;
    private String contenido;
    private Boolean estado;

    public Integer getAnu_id() {
        return anu_id;
    }

    public void setAnu_id(Integer anu_id) {
        this.anu_id = anu_id;
    }

    public String getAnu_fecha_ini() {
        return anu_fecha_ini;
    }

    public void setAnu_fecha_ini(String anu_fecha_ini) {
        this.anu_fecha_ini = anu_fecha_ini;
    }

    public String getAnu_fecha_fin() {
        return anu_fecha_fin;
    }

    public void setAnu_fecha_fin(String anu_fecha_fin) {
        this.anu_fecha_fin = anu_fecha_fin;
    }

    public Integer getTipo() {
        return tipo;
    }

    public void setTipo(Integer tipo) {
        this.tipo = tipo;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getContenido() {
        return contenido;
    }

    public void setContenido(String contenido) {
        this.contenido = contenido;
    }

    public Boolean getEstado() {
        return estado;
    }

    public void setEstado(Boolean estado) {
        this.estado = estado;
    }
    
    
}
