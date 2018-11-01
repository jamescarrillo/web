/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gob.peam.web.model;

import java.sql.Date;

/**
 *
 * @author JhanxD
 */
public class LibroReclamo {
    private String numero;
    private String anho;
    private java.sql.Date fecha;
    private String usuario;
    private String documento_identidad;
    private String numero_documento;
    private String direccion;
    private String telefono;
    private String e_mail;
    private String descripcion_atencion;
    private String firma_usuario;
    private String detalle_acciones;
    private java.sql.Date fecha_acciones;
    private Boolean estado;

    public String getNumero() {
        return numero;
    }

    public void setNumero(String numero) {
        this.numero = numero;
    }

    public String getAnho() {
        return anho;
    }

    public void setAnho(String anho) {
        this.anho = anho;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getDocumento_identidad() {
        return documento_identidad;
    }

    public void setDocumento_identidad(String documento_identidad) {
        this.documento_identidad = documento_identidad;
    }

    public String getNumero_documento() {
        return numero_documento;
    }

    public void setNumero_documento(String numero_documento) {
        this.numero_documento = numero_documento;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getE_mail() {
        return e_mail;
    }

    public void setE_mail(String e_mail) {
        this.e_mail = e_mail;
    }

    public String getDescripcion_atencion() {
        return descripcion_atencion;
    }

    public void setDescripcion_atencion(String descripcion_atencion) {
        this.descripcion_atencion = descripcion_atencion;
    }

    public String getFirma_usuario() {
        return firma_usuario;
    }

    public void setFirma_usuario(String firma_usuario) {
        this.firma_usuario = firma_usuario;
    }

    public String getDetalle_acciones() {
        return detalle_acciones;
    }

    public void setDetalle_acciones(String detalle_acciones) {
        this.detalle_acciones = detalle_acciones;
    }

    public Date getFecha_acciones() {
        return fecha_acciones;
    }

    public void setFecha_acciones(Date fecha_acciones) {
        this.fecha_acciones = fecha_acciones;
    }

    public Boolean getEstado() {
        return estado;
    }

    public void setEstado(Boolean estado) {
        this.estado = estado;
    }
    
    
    
}
