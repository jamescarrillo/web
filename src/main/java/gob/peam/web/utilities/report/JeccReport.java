/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gob.peam.web.utilities.report;

import java.io.ByteArrayOutputStream;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.Map;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.export.HtmlExporter;
import net.sf.jasperreports.engine.export.HtmlResourceHandler;
import net.sf.jasperreports.export.Exporter;
import net.sf.jasperreports.export.SimpleExporterInput;
import net.sf.jasperreports.export.SimpleHtmlExporterOutput;
import net.sf.jasperreports.export.SimpleHtmlReportConfiguration;
import org.apache.commons.codec.binary.Base64;

/**
 *
 * @author James Carrillo
 */
public class JeccReport {

    public static byte[] viewReportWeb(JasperPrint jasperPrint, int page) throws JRException {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        @SuppressWarnings("rawtypes")
        Exporter exporter;
        exporter = new HtmlExporter();
        SimpleHtmlExporterOutput exporterOutput = new SimpleHtmlExporterOutput(out);
        //exporterOutput.setImageHandler(new WebHtmlResourceHandler(URL_IMAGE));
        //exporter.setExporterOutput(new SimpleHtmlExporterOutput(out));
        final Map<String, String> images = new HashMap<>();
        exporterOutput.setImageHandler(new HtmlResourceHandler() {
            @Override
            public void handleResource(String id, byte[] data) {
                images.put(id, "data:image/gif;base64," + new String(Base64.encodeBase64(data)));
            }

            @Override
            public String getResourcePath(String id) {
                return images.get(id);
            }
        });
        exporter.setExporterOutput(exporterOutput);
        exporter.setExporterInput(new SimpleExporterInput(jasperPrint));
        SimpleHtmlReportConfiguration reportConfiguration = new SimpleHtmlReportConfiguration();
        /*
        Se puede configurar el rango de paginas que desea verse del reporte HTML, revisar API Jasperreports
         */
        reportConfiguration.setPageIndex(page);
        exporter.setConfiguration(reportConfiguration);
        exporter.exportReport();
        return out.toByteArray();
    }

    /*
    public ByteArrayOutputStream generateHtmlReport(JasperPrint jasperPrint) throws JRException {
        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        try {
            // exclude the repeating (paged) column headers
            jasperPrint.setProperty("net.sf.jasperreports.export.html.exclude.origin.keep.first.band.2", "columnHeader");
            // exclude the page footers
            jasperPrint.setProperty("net.sf.jasperreports.export.html.exclude.origin.band.2", "pageFooter");
            final Map<String, String> images = new HashMap<>();
            HtmlExporter exporterHTML = new HtmlExporter();
            //setting up an input stream to HtmlExporter object
            SimpleExporterInput exporterInput = new SimpleExporterInput(jasperPrint);
            exporterHTML.setExporterInput(exporterInput);
            //setting up an output stream to HtmlExporter object
            SimpleHtmlExporterOutput simpleHtmlExporterOutput = new SimpleHtmlExporterOutput(outputStream);
            exporterHTML.setExporterOutput(simpleHtmlExporterOutput);
            //To generate a html report we need to embed images using base64 encoding.
            //Otherwise it shows corrupted images.
            simpleHtmlExporterOutput.setImageHandler(new HtmlResourceHandler() {
                @Override
                public void handleResource(String id, byte[] data) {
                    images.put(id, "data:image/gif;base64," + new String(Base64.encodeBase64(data)));
                }

                @Override
                public String getResourcePath(String id) {
                    return images.get(id);
                }
            });
            exporterHTML.exportReport();
        } catch (JRException e) {
            throw new JRException("Error occurred exporting HTML report ", e);
        }
        return outputStream;
    }
*/
    public static boolean escribirArchivo(byte[] fileBytes, String archivoDestino) throws Exception {
        boolean correcto = false;
        try {
            try (OutputStream out = new FileOutputStream(archivoDestino)) {
                out.write(fileBytes);
            }
            correcto = true;
        } catch (Exception e) {
            throw e;
        }
        return correcto;

    }
}
