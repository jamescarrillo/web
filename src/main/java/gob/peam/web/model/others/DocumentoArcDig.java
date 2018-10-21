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
public class DocumentoArcDig {

    private Integer docu_id;
    private Integer usua_id;
    private String docu_titulo;
    private String docu_resumen;
    private String docu_fecha_docx;
    private String docu_origen_archivo;
    private Integer tido_id;
    private Integer cate_id;
    private String docu_metadata;

    public Integer getDocu_id() {
        return docu_id;
    }

    public void setDocu_id(Integer docu_id) {
        this.docu_id = docu_id;
    }

    public Integer getUsua_id() {
        return usua_id;
    }

    public void setUsua_id(Integer usua_id) {
        this.usua_id = usua_id;
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

    public String getDocu_fecha_docx() {
        return docu_fecha_docx;
    }

    public void setDocu_fecha_docx(String docu_fecha_docx) {
        this.docu_fecha_docx = docu_fecha_docx;
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
