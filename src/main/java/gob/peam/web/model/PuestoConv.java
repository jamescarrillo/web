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
public class PuestoConv {
    private Integer pues_id;
    private String cargo;
    private String entidad;
    private String modaidad;
    private Integer nroplaza;
    private String ingre_mensual;
    private Boolean estado;
    private Convocatoria_Pers coper_id;

    public Integer getPues_id() {
        return pues_id;
    }

    public void setPues_id(Integer pues_id) {
        this.pues_id = pues_id;
    }

    public String getCargo() {
        return cargo;
    }

    public void setCargo(String cargo) {
        this.cargo = cargo;
    }

    public String getEntidad() {
        return entidad;
    }

    public void setEntidad(String entidad) {
        this.entidad = entidad;
    }

    public String getModaidad() {
        return modaidad;
    }

    public void setModaidad(String modaidad) {
        this.modaidad = modaidad;
    }

    public Integer getNroplaza() {
        return nroplaza;
    }

    public void setNroplaza(Integer nroplaza) {
        this.nroplaza = nroplaza;
    }

    public String getIngre_mensual() {
        return ingre_mensual;
    }

    public void setIngre_mensual(String ingre_mensual) {
        this.ingre_mensual = ingre_mensual;
    }

    public Boolean getEstado() {
        return estado;
    }

    public void setEstado(Boolean estado) {
        this.estado = estado;
    }

    public Convocatoria_Pers getCoper_id() {
        return coper_id;
    }

    public void setCoper_id(Convocatoria_Pers coper_id) {
        this.coper_id = coper_id;
    }
}
