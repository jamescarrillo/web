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
public class CategoriaDoc {
    
    private int id_cate;
    private String nombre;
    private int tido_id;

    public int getId_cate() {
        return id_cate;
    }

    public void setId_cate(int id_cate) {
        this.id_cate = id_cate;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getTido_id() {
        return tido_id;
    }

    public void setTido_id(int tido_id) {
        this.tido_id = tido_id;
    }
    
}
