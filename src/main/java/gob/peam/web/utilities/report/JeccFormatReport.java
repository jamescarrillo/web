/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gob.peam.web.utilities.report;

import java.util.logging.Level;
import java.util.logging.Logger;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperPrint;

/**
 *
 * @author James Carrillo
 */
public class JeccFormatReport {

    public static byte[] getReport(JasperPrint jasperPrint, String extension) {
        byte[] bits = null;
        try {
            switch (extension) {
                case "xlsx":
                    bits = JeccExportReport.exportarXLSX(jasperPrint);
                    break;
                case "xls":
                    bits = JeccExportReport.exportarXLS(jasperPrint);
                    break;
                case "docx":
                    bits = JeccExportReport.exportarDOCX(jasperPrint);
                    break;
                case "pptx":
                    bits = JeccExportReport.exportarPPTX(jasperPrint);
                    break;
                default:
                    bits = JeccExportReport.exportarPDF(jasperPrint);
                    break;
            }
        } catch (JRException ex) {
            Logger.getLogger(JeccFormatReport.class.getName()).log(Level.SEVERE, null, ex);
        }
        return bits;
    }
}
