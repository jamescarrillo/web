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
public class Publicacion {
    private Integer id;
    private String anho;
    private String titulo;
    private String descripcion;
    private String direccion_archivo;
    private Integer tipo;
    private Boolean estado;
    private Integer docu_id;

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

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getDireccion_archivo() {
        return direccion_archivo;
    }

    public void setDireccion_archivo(String direccion_archivo) {
        this.direccion_archivo = direccion_archivo;
    }

    public Integer getTipo() {
        return tipo;
    }

    public void setTipo(Integer tipo) {
        this.tipo = tipo;
    }

    public Boolean getEstado() {
        return estado;
    }

    public void setEstado(Boolean estado) {
        this.estado = estado;
    }

    public Integer getDocu_id() {
        return docu_id;
    }

    public void setDocu_id(Integer docu_id) {
        this.docu_id = docu_id;
    }
    
    
}
