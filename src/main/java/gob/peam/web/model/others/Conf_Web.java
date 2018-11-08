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
public class Conf_Web {

    private String numero_fotos_galeria;
    private String numero_videos_multimedia;
    private String numero_anuncios_mostrar;
    private String icono_pagina;

    private String nombre_logo_peam;
    private String url_logo_goresam;
    private String nombre_logo_goresam;
    private String url_logo_portal;
    private String nombre_logo_portal;
    private String nombre_logo_escudo;
    private String nombre_logo_presentacion_actualidad;

    // nombre::link::icono::target=1=>_blank
    private String redes_sociales;

    private String apikey;
    private String idusuario;
    private String idalbum;

    public String getNumero_fotos_galeria() {
        return numero_fotos_galeria;
    }

    public void setNumero_fotos_galeria(String numero_fotos_galeria) {
        this.numero_fotos_galeria = numero_fotos_galeria;
    }

    public String getNumero_videos_multimedia() {
        return numero_videos_multimedia;
    }

    public void setNumero_videos_multimedia(String numero_videos_multimedia) {
        this.numero_videos_multimedia = numero_videos_multimedia;
    }

    public String getNumero_anuncios_mostrar() {
        return numero_anuncios_mostrar;
    }

    public void setNumero_anuncios_mostrar(String numero_anuncios_mostrar) {
        this.numero_anuncios_mostrar = numero_anuncios_mostrar;
    }

    public String getIcono_pagina() {
        return icono_pagina;
    }

    public void setIcono_pagina(String icono_pagina) {
        this.icono_pagina = icono_pagina;
    }

    public String getNombre_logo_peam() {
        return nombre_logo_peam;
    }

    public void setNombre_logo_peam(String nombre_logo_peam) {
        this.nombre_logo_peam = nombre_logo_peam;
    }

    public String getUrl_logo_goresam() {
        return url_logo_goresam;
    }

    public void setUrl_logo_goresam(String url_logo_goresam) {
        this.url_logo_goresam = url_logo_goresam;
    }

    public String getNombre_logo_goresam() {
        return nombre_logo_goresam;
    }

    public void setNombre_logo_goresam(String nombre_logo_goresam) {
        this.nombre_logo_goresam = nombre_logo_goresam;
    }

    public String getUrl_logo_portal() {
        return url_logo_portal;
    }

    public void setUrl_logo_portal(String url_logo_portal) {
        this.url_logo_portal = url_logo_portal;
    }

    public String getNombre_logo_portal() {
        return nombre_logo_portal;
    }

    public void setNombre_logo_portal(String nombre_logo_portal) {
        this.nombre_logo_portal = nombre_logo_portal;
    }

    public String getNombre_logo_escudo() {
        return nombre_logo_escudo;
    }

    public void setNombre_logo_escudo(String nombre_logo_escudo) {
        this.nombre_logo_escudo = nombre_logo_escudo;
    }

    public String getNombre_logo_presentacion_actualidad() {
        return nombre_logo_presentacion_actualidad;
    }

    public void setNombre_logo_presentacion_actualidad(String nombre_logo_presentacion_actualidad) {
        this.nombre_logo_presentacion_actualidad = nombre_logo_presentacion_actualidad;
    }

    public String getRedes_sociales() {
        return redes_sociales;
    }

    public void setRedes_sociales(String redes_sociales) {
        this.redes_sociales = redes_sociales;
    }

    public String getApikey() {
        return apikey;
    }

    public void setApikey(String apikey) {
        this.apikey = apikey;
    }

    public String getIdusuario() {
        return idusuario;
    }

    public void setIdusuario(String idusuario) {
        this.idusuario = idusuario;
    }

    public String getIdalbum() {
        return idalbum;
    }

    public void setIdalbum(String idalbum) {
        this.idalbum = idalbum;
    }

    @Override
    public String toString() {
        return "Conf_Web{" + "numero_fotos_galeria=" + numero_fotos_galeria + ", numero_videos_multimedia=" + numero_videos_multimedia + ", numero_anuncios_mostrar=" + numero_anuncios_mostrar + ", icono_pagina=" + icono_pagina + ", nombre_logo_peam=" + nombre_logo_peam + ", url_logo_goresam=" + url_logo_goresam + ", nombre_logo_goresam=" + nombre_logo_goresam + ", url_logo_portal=" + url_logo_portal + ", nombre_logo_portal=" + nombre_logo_portal + ", nombre_logo_escudo=" + nombre_logo_escudo + ", nombre_logo_presentacion_actualidad=" + nombre_logo_presentacion_actualidad + ", redes_sociales=" + redes_sociales + ", apikey=" + apikey + ", idusuario=" + idusuario + ", idalbum=" + idalbum + '}';
    }
    
}