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
public class Correo {
    private Integer id;
    private String para_correo;
    private String cc_correo;
    private String parte_correo;
    private String mensaje_correo;
    private Boolean estado;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPara_correo() {
        return para_correo;
    }

    public void setPara_correo(String para_correo) {
        this.para_correo = para_correo;
    }

    public String getCc_correo() {
        return cc_correo;
    }

    public void setCc_correo(String cc_correo) {
        this.cc_correo = cc_correo;
    }

    public String getParte_correo() {
        return parte_correo;
    }

    public void setParte_correo(String parte_correo) {
        this.parte_correo = parte_correo;
    }

    public String getMensaje_correo() {
        return mensaje_correo;
    }

    public void setMensaje_correo(String mensaje_correo) {
        this.mensaje_correo = mensaje_correo;
    }

    public Boolean getEstado() {
        return estado;
    }

    public void setEstado(Boolean estado) {
        this.estado = estado;
    }
    
    
}
