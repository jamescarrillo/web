/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gob.peam.web.utilities;

import java.text.ParseException;
import java.text.SimpleDateFormat;
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
}
