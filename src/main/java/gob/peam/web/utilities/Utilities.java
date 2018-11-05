/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gob.peam.web.utilities;

import gob.peam.web.model.others.Conf_Web;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author JamesCarrillo
 */
public class Utilities {

    public static java.sql.Timestamp getDateFullSQL(String datehour, String format) {
        SimpleDateFormat formato = new SimpleDateFormat(format);
        java.util.Date fechaUtil;
        java.sql.Timestamp fechaSql = null;
        try {
            fechaUtil = formato.parse(datehour);
            fechaSql = new java.sql.Timestamp(fechaUtil.getTime());
        } catch (ParseException ex) {
            Logger.getLogger(Utilities.class.getName()).log(Level.SEVERE, null, ex);
        }
        return fechaSql;
    }

    public static java.sql.Date getDateSQLFORMAT(String fecha, String format) {
        SimpleDateFormat formato = new SimpleDateFormat(format);
        java.util.Date fechaUtil;
        java.sql.Date fechaSql = null;
        try {
            fechaUtil = formato.parse(fecha);
            fechaSql = new java.sql.Date(fechaUtil.getTime());
        } catch (ParseException ex) {
            Logger.getLogger(Utilities.class.getName()).log(Level.SEVERE, null, ex);
        }
        return fechaSql;
    }

    public static String ConvertDateToView(String fecha) {
        SimpleDateFormat originalbd = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy");
        java.util.Date fechaUtil;
        String fechafin = "";
        try {
            fechaUtil = originalbd.parse(fecha);
            fechafin = formato.format(fechaUtil);
        } catch (ParseException ex) {
            Logger.getLogger(Utilities.class.getName()).log(Level.SEVERE, null, ex);
        }
        return fechafin;
    }

    public static Conf_Web getConf_Web(String path, String nameFile) {
        Conf_Web conf = new Conf_Web();
        Properties prop = new Properties();
        try (InputStream inputstream = new FileInputStream(path + nameFile)) {
            prop.load(inputstream);
            conf.setNumero_fotos_galeria(prop.getProperty("numero_fotos_galeria"));
            conf.setNumero_videos_multimedia(prop.getProperty("numero_videos_multimedia"));
            conf.setNumero_anuncios_mostrar(prop.getProperty("numero_anuncios_mostrar"));
            conf.setIcono_pagina(prop.getProperty("icono_pagina"));
            conf.setNombre_logo_peam(prop.getProperty("nombre_logo_peam"));
            conf.setUrl_logo_goresam(prop.getProperty("url_logo_goresam"));
            conf.setNombre_logo_goresam(prop.getProperty("nombre_logo_goresam"));
            conf.setUrl_logo_portal(prop.getProperty("url_logo_portal"));
            conf.setNombre_logo_portal(prop.getProperty("nombre_logo_portal"));
            conf.setNombre_logo_escudo(prop.getProperty("nombre_logo_escudo"));
            conf.setNombre_logo_presentacion_actualidad(prop.getProperty("nombre_logo_presentacion_actualidad"));
            conf.setRedes_sociales(prop.getProperty("redes_sociales"));
            conf.setApikey(prop.getProperty("apikey"));
            conf.setIdusuario(prop.getProperty("idusuario"));
            conf.setIdalbum(prop.getProperty("idalbum"));
        } catch (IOException ex) {
            Logger.getLogger(Utilities.class.getName()).log(Level.SEVERE, null, ex);
        }
        return conf;
    }

    public static String setConf_Web(Conf_Web conf, String path, String nameFile) {
        String res = "";
        try {
            Properties prop = new Properties();
            try (InputStream inputstream = new FileInputStream(path + "/" + nameFile)) {
                prop.load(inputstream);
                prop.setProperty("numero_fotos_galeria", conf.getNumero_fotos_galeria());
                prop.setProperty("numero_videos_multimedia", conf.getNumero_videos_multimedia());
                prop.setProperty("numero_anuncios_mostrar", conf.getNumero_anuncios_mostrar());
                prop.setProperty("icono_pagina", conf.getIcono_pagina());
                prop.setProperty("nombre_logo_peam", conf.getNombre_logo_peam());
                prop.setProperty("url_logo_goresam", conf.getUrl_logo_goresam());
                prop.setProperty("nombre_logo_goresam", conf.getNombre_logo_goresam());
                prop.setProperty("url_logo_portal", conf.getUrl_logo_portal());
                prop.setProperty("nombre_logo_portal", conf.getNombre_logo_portal());
                prop.setProperty("nombre_logo_escudo", conf.getNombre_logo_escudo());
                prop.setProperty("nombre_logo_presentacion_actualidad", conf.getNombre_logo_presentacion_actualidad());
                prop.setProperty("redes_sociales", conf.getRedes_sociales());
                prop.setProperty("apikey", conf.getApikey());
                prop.setProperty("idusuario", conf.getIdusuario());
                prop.setProperty("idalbum", conf.getIdalbum());
                prop.store(new FileWriter(path + "/" + nameFile), "ARCHIVO GENERADO POR EL SISTEMA");
                res = "OK";
            }
        } catch (IOException ex) {
            Logger.getLogger(Utilities.class.getName()).log(Level.SEVERE, null, ex);
        }
        return res;
    }

    public static String getCadenaAleatoria(String cadena, int tamMax) {
        int pos = (int) (Math.random() * tamMax + 1);
        return cadena.substring(0, pos);
    }
}
