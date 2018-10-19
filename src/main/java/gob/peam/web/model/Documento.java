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
public class Documento {

    private Integer docu_id;
    private Integer usa_public_id;
    private String docu_descripcion;
    private String docu_titulo;
    private String docu_resumen;
    private String docu_origen_archivo;
    private Integer tido_id;
    private Boolean docu_estado;
    private Boolean docu_activo;
    private String docu_fecha_docx;
    private Integer cate_id;
    private String docu_metadata;

    public Integer getDocu_id() {
        return docu_id;
    }

    public void setDocu_id(Integer docu_id) {
        this.docu_id = docu_id;
    }

    public Integer getUsa_public_id() {
        return usa_public_id;
    }

    public void setUsa_public_id(Integer usa_public_id) {
        this.usa_public_id = usa_public_id;
    }

    public String getDocu_descripcion() {
        return docu_descripcion;
    }

    public void setDocu_descripcion(String docu_descripcion) {
        this.docu_descripcion = docu_descripcion;
    }

    public String getDocu_titulo() {
        return docu_titulo;
    }

    public void setDocu_titulo(String docu_titulo) {
        this.docu_titulo = docu_titulo;
    }

    public String getDocu_resumen() {
        return docu_resumen;
    }

    public void setDocu_resumen(String docu_resumen) {
        this.docu_resumen = docu_resumen;
    }

    public String getDocu_origen_archivo() {
        return docu_origen_archivo;
    }

    public void setDocu_origen_archivo(String docu_origen_archivo) {
        this.docu_origen_archivo = docu_origen_archivo;
    }

    public Integer getTido_id() {
        return tido_id;
    }

    public void setTido_id(Integer tido_id) {
        this.tido_id = tido_id;
    }

    public Boolean getDocu_estado() {
        return docu_estado;
    }

    public void setDocu_estado(Boolean docu_estado) {
        this.docu_estado = docu_estado;
    }

    public Boolean getDocu_activo() {
        return docu_activo;
    }

    public void setDocu_activo(Boolean docu_activo) {
        this.docu_activo = docu_activo;
    }

    public String getDocu_fecha_docx() {
        return docu_fecha_docx;
    }

    public void setDocu_fecha_docx(String docu_fecha_docx) {
        this.docu_fecha_docx = docu_fecha_docx;
    }

    public Integer getCate_id() {
        return cate_id;
    }

    public void setCate_id(Integer cate_id) {
        this.cate_id = cate_id;
    }

    public String getDocu_metadata() {
        return docu_metadata;
    }

    public void setDocu_metadata(String docu_metadata) {
        this.docu_metadata = docu_metadata;
    }

}
