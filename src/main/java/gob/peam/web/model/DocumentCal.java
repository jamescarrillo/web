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
public class DocumentCal {
    private Integer doco_id;
    private String nombre;
    private String url_file;
    private Boolean estado;
    private CalendarioConv id;

    public Integer getDoco_id() {
        return doco_id;
    }

    public void setDoco_id(Integer doco_id) {
        this.doco_id = doco_id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getUrl_file() {
        return url_file;
    }

    public void setUrl_file(String url_file) {
        this.url_file = url_file;
    }

    public Boolean getEstado() {
        return estado;
    }

    public void setEstado(Boolean estado) {
        this.estado = estado;
    }

    public CalendarioConv getId() {
        return id;
    }

    public void setId(CalendarioConv id) {
        this.id = id;
    }
    
    
}
