/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gob.peam.web.model.others;

/**
 *
 * @author Juan Jose
 */
public class Etiqueta {
    
    private Integer etiq_id;
    private String etiq_nombre;
    private Boolean etiq_estado;

    public Integer getEtiq_id() {
        return etiq_id;
    }

    public void setEtiq_id(Integer etiq_id) {
        this.etiq_id = etiq_id;
    }

    public String getEtiq_nombre() {
        return etiq_nombre;
    }

    public void setEtiq_nombre(String etiq_nombre) {
        this.etiq_nombre = etiq_nombre;
    }

    public Boolean getEtiq_estado() {
        return etiq_estado;
    }

    public void setEtiq_estado(Boolean etiq_estado) {
        this.etiq_estado = etiq_estado;
    }
    
}
