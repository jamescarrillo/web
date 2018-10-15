/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gob.peam.web.model;

import java.sql.Date;

/**
 *
 * @author James Carrillo
 */
public class Funcionario {

    private Integer id;
    private String organigrama;
    private String tratamiento;
    private String nombres_apellidos;
    private String cargo;
    private String nivel_remunerativo;
    private String numero_dni;
    private String resolucion;
    private java.sql.Date fecha_designacion;
    private String telefono;
    private String fax;
    private String e_mail;
    private String foto;
    private String profesion;
    private String resumen;
    private String regimen_laboral;
    private Double retribucion_mensual;
    private String hoja_vida;
    private Boolean estado;
    private Boolean destacado;
    private java.sql.Date fecha_inicio;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getOrganigrama() {
        return organigrama;
    }

    public void setOrganigrama(String organigrama) {
        this.organigrama = organigrama;
    }

    public String getTratamiento() {
        return tratamiento;
    }

    public void setTratamiento(String tratamiento) {
        this.tratamiento = tratamiento;
    }

    public String getNombres_apellidos() {
        return nombres_apellidos;
    }

    public void setNombres_apellidos(String nombres_apellidos) {
        this.nombres_apellidos = nombres_apellidos;
    }

    public String getCargo() {
        return cargo;
    }

    public void setCargo(String cargo) {
        this.cargo = cargo;
    }

    public String getNivel_remunerativo() {
        return nivel_remunerativo;
    }

    public void setNivel_remunerativo(String nivel_remunerativo) {
        this.nivel_remunerativo = nivel_remunerativo;
    }

    public String getNumero_dni() {
        return numero_dni;
    }

    public void setNumero_dni(String numero_dni) {
        this.numero_dni = numero_dni;
    }

    public String getResolucion() {
        return resolucion;
    }

    public void setResolucion(String resolucion) {
        this.resolucion = resolucion;
    }

    public Date getFecha_designacion() {
        return fecha_designacion;
    }

    public void setFecha_designacion(Date fecha_designacion) {
        this.fecha_designacion = fecha_designacion;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getFax() {
        return fax;
    }

    public void setFax(String fax) {
        this.fax = fax;
    }

    public String getE_mail() {
        return e_mail;
    }

    public void setE_mail(String e_mail) {
        this.e_mail = e_mail;
    }

    public String getFoto() {
        return foto;
    }

    public void setFoto(String foto) {
        this.foto = foto;
    }

    public String getProfesion() {
        return profesion;
    }

    public void setProfesion(String profesion) {
        this.profesion = profesion;
    }

    public String getResumen() {
        return resumen;
    }

    public void setResumen(String resumen) {
        this.resumen = resumen;
    }

    public String getRegimen_laboral() {
        return regimen_laboral;
    }

    public void setRegimen_laboral(String regimen_laboral) {
        this.regimen_laboral = regimen_laboral;
    }

    public Double getRetribucion_mensual() {
        return retribucion_mensual;
    }

    public void setRetribucion_mensual(Double retribucion_mensual) {
        this.retribucion_mensual = retribucion_mensual;
    }

    public String getHoja_vida() {
        return hoja_vida;
    }

    public void setHoja_vida(String hoja_vida) {
        this.hoja_vida = hoja_vida;
    }

    public Boolean getEstado() {
        return estado;
    }

    public void setEstado(Boolean estado) {
        this.estado = estado;
    }

    public Boolean getDestacado() {
        return destacado;
    }

    public void setDestacado(Boolean destacado) {
        this.destacado = destacado;
    }

    public Date getFecha_inicio() {
        return fecha_inicio;
    }

    public void setFecha_inicio(Date fecha_inicio) {
        this.fecha_inicio = fecha_inicio;
    }

}
