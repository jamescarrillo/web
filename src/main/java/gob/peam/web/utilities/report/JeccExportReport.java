/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gob.peam.web.utilities.report;

import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.imageio.ImageIO;
import net.sf.jasperreports.engine.DefaultJasperReportsContext;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperPrintManager;
import net.sf.jasperreports.engine.export.HtmlExporter;
import net.sf.jasperreports.engine.export.JRCsvExporter;
import net.sf.jasperreports.engine.export.JRPdfExporter;
import net.sf.jasperreports.engine.export.JRRtfExporter;
import net.sf.jasperreports.engine.export.JRTextExporter;
import net.sf.jasperreports.engine.export.JRXlsExporter;
import net.sf.jasperreports.engine.export.oasis.JROdsExporter;
import net.sf.jasperreports.engine.export.oasis.JROdtExporter;
import net.sf.jasperreports.engine.export.ooxml.JRDocxExporter;
import net.sf.jasperreports.engine.export.ooxml.JRPptxExporter;
import net.sf.jasperreports.engine.export.ooxml.JRXlsxExporter;
import net.sf.jasperreports.export.Exporter;
import net.sf.jasperreports.export.SimpleExporterInput;
import net.sf.jasperreports.export.SimpleHtmlExporterOutput;
import net.sf.jasperreports.export.SimpleHtmlReportConfiguration;
import net.sf.jasperreports.export.SimpleOutputStreamExporterOutput;
import net.sf.jasperreports.export.SimplePdfExporterConfiguration;
import net.sf.jasperreports.export.SimplePdfReportConfiguration;
import net.sf.jasperreports.export.SimpleTextExporterConfiguration;
import net.sf.jasperreports.export.SimpleTextReportConfiguration;
import net.sf.jasperreports.export.SimpleWriterExporterOutput;
import net.sf.jasperreports.export.SimpleXlsExporterConfiguration;
import net.sf.jasperreports.export.SimpleXlsReportConfiguration;
import net.sf.jasperreports.export.SimpleXlsxExporterConfiguration;
import net.sf.jasperreports.export.SimpleXlsxReportConfiguration;

/**
 *
 * @author James Carrillo
 */
public class JeccExportReport {

    public static byte[] exportarPDF(JasperPrint jasperPrint) throws JRException {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        @SuppressWarnings("rawtypes")
        Exporter exporter;
        exporter = new JRPdfExporter();
        exporter.setExporterOutput(new SimpleOutputStreamExporterOutput(out));
        exporter.setExporterInput(new SimpleExporterInput(jasperPrint));
        SimplePdfReportConfiguration reportConfiguration = new SimplePdfReportConfiguration();
        SimplePdfExporterConfiguration exportConfiguration = new SimplePdfExporterConfiguration();
        exporter.setConfiguration(exportConfiguration);
        exporter.setConfiguration(reportConfiguration);
        exporter.exportReport();
        return out.toByteArray();
    }

    public static byte[] exportarDOCX(JasperPrint jasperPrint) throws JRException {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        @SuppressWarnings("rawtypes")
        Exporter exporter;
        exporter = new JRDocxExporter();
        exporter.setExporterOutput(new SimpleOutputStreamExporterOutput(out));
        exporter.setExporterInput(new SimpleExporterInput(jasperPrint));
        exporter.exportReport();
        return out.toByteArray();
    }

    public static byte[] exportarPPTX(JasperPrint jasperPrint) throws JRException {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        @SuppressWarnings("rawtypes")
        Exporter exporter;
        exporter = new JRPptxExporter();
        exporter.setExporterOutput(new SimpleOutputStreamExporterOutput(out));
        exporter.setExporterInput(new SimpleExporterInput(jasperPrint));
        exporter.exportReport();
        return out.toByteArray();
    }

    public static byte[] exportarTXT(JasperPrint jasperPrint) throws JRException {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        @SuppressWarnings("rawtypes")
        Exporter exporter;
        exporter = new JRTextExporter();
        exporter.setExporterOutput(new SimpleWriterExporterOutput(out));
        exporter.setExporterInput(new SimpleExporterInput(jasperPrint));
        SimpleTextReportConfiguration reportConfiguration = new SimpleTextReportConfiguration();
        SimpleTextExporterConfiguration exportConfiguration = new SimpleTextExporterConfiguration();
        Integer pageWidth = 798;
        Integer pageHeigth = 1000;
        Integer charactersPerLine = 110;
        Integer linesPerPage = 71;
        float charHeight = linesPerPage > 0 ? pageHeigth / linesPerPage : 13.948f;
        float charWidth = charactersPerLine > 0 ? pageWidth / charactersPerLine : 7.238f;
        reportConfiguration.setCharHeight(charHeight);
        reportConfiguration.setCharWidth(charWidth);
        exporter.setConfiguration(exportConfiguration);
        exporter.setConfiguration(reportConfiguration);
        exporter.exportReport();
        return out.toByteArray();
    }

    public static byte[] exportarXLS(JasperPrint jasperPrint) throws JRException {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        @SuppressWarnings("rawtypes")
        Exporter exporter;
        exporter = new JRXlsExporter();
        SimpleXlsReportConfiguration reportConfiguration = new SimpleXlsReportConfiguration();
        reportConfiguration.setIgnoreGraphics(Boolean.FALSE);
        reportConfiguration.setCollapseRowSpan(Boolean.FALSE);
        reportConfiguration.setDetectCellType(Boolean.TRUE);
        reportConfiguration.setFontSizeFixEnabled(Boolean.TRUE);
        reportConfiguration.setRemoveEmptySpaceBetweenColumns(Boolean.FALSE);
        reportConfiguration.setRemoveEmptySpaceBetweenRows(Boolean.FALSE);
        reportConfiguration.setIgnoreCellBorder(Boolean.FALSE);
        reportConfiguration.setImageBorderFixEnabled(Boolean.FALSE);
        reportConfiguration.setShowGridLines(Boolean.FALSE);
        reportConfiguration.setIgnoreCellBackground(Boolean.FALSE);
        reportConfiguration.setWrapText(Boolean.FALSE);
        reportConfiguration.setOnePagePerSheet(Boolean.TRUE);
        reportConfiguration.setColumnWidthRatio(1.25f);
        exporter.setExporterOutput(new SimpleOutputStreamExporterOutput(out));
        exporter.setExporterInput(new SimpleExporterInput(jasperPrint));
        exporter.setConfiguration(reportConfiguration);
        SimpleXlsExporterConfiguration exportConfiguration = new SimpleXlsExporterConfiguration();
        exporter.setConfiguration(exportConfiguration);
        exporter.exportReport();
        return out.toByteArray();
    }

    public static byte[] exportarXLSX(JasperPrint jasperPrint) throws JRException {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        @SuppressWarnings("rawtypes")
        Exporter exporter;
        exporter = new JRXlsxExporter();
        exporter.setExporterOutput(new SimpleOutputStreamExporterOutput(out));
        exporter.setExporterInput(new SimpleExporterInput(jasperPrint));
        SimpleXlsxReportConfiguration reportConfiguration = new SimpleXlsxReportConfiguration();
        SimpleXlsxExporterConfiguration exportConfiguration = new SimpleXlsxExporterConfiguration();
        reportConfiguration.setIgnoreGraphics(Boolean.FALSE);
        reportConfiguration.setCollapseRowSpan(Boolean.FALSE);
        reportConfiguration.setDetectCellType(Boolean.TRUE);
        reportConfiguration.setFontSizeFixEnabled(Boolean.TRUE);
        reportConfiguration.setRemoveEmptySpaceBetweenColumns(Boolean.FALSE);
        reportConfiguration.setRemoveEmptySpaceBetweenRows(Boolean.FALSE);
        reportConfiguration.setIgnoreCellBorder(Boolean.FALSE);
        reportConfiguration.setImageBorderFixEnabled(Boolean.FALSE);
        reportConfiguration.setShowGridLines(Boolean.FALSE);
        reportConfiguration.setIgnoreCellBackground(Boolean.FALSE);
        reportConfiguration.setWrapText(Boolean.FALSE);
        reportConfiguration.setOnePagePerSheet(Boolean.TRUE);
        reportConfiguration.setColumnWidthRatio(1.25f);
        exporter.setConfiguration(exportConfiguration);
        exporter.setConfiguration(reportConfiguration);
        exporter.exportReport();
        return out.toByteArray();
    }

    public static byte[] exportarIMAGEN(JasperPrint jasperPrint, String format) throws JRException {
        byte[] output = null;
        try {
            //cambiar parametro formato de imagen acepta: png, jpeg, bmp
            try (ByteArrayOutputStream buffer = new ByteArrayOutputStream(30000)) {
                List<JasperPrint> listaprints = new ArrayList<>();
                listaprints.add(jasperPrint);
                List<BufferedImage> images = renderImages(listaprints);
                BufferedImage combinedImage = mergeImages(images);
                ImageIO.write(combinedImage, format.toUpperCase(), buffer);
                buffer.flush();
                output = buffer.toByteArray();
            }
        } catch (Exception e) {
            try {
                throw e;
            } catch (Exception ex) {
                Logger.getLogger(JeccExportReport.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return output;
    }

    private static BufferedImage mergeImages(List<BufferedImage> images) {
        int width = 0;
        int height = 0;
        for (BufferedImage image : images) {
            width = Math.max(width, image.getWidth());
            height += image.getHeight();
        }
        BufferedImage combined = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
        int currentHeight = 0;
        // paint all pages 
        Graphics g = combined.getGraphics();
        for (BufferedImage image : images) {
            g.drawImage(image, 0, currentHeight, null);
            currentHeight += image.getHeight();
        }
        return combined;
    }

    private static List<BufferedImage> renderImages(List<JasperPrint> print) {
        Float zoom = 1.6f;
        List<BufferedImage> images = new ArrayList<>();
        JasperPrintManager printManager = JasperPrintManager.getInstance(DefaultJasperReportsContext.getInstance());
        for (JasperPrint jasperPrint : print) {
            for (int page = 0; page < jasperPrint.getPages().size(); page++) {
                try {
                    BufferedImage renderedImage = (BufferedImage) printManager.printToImage(jasperPrint, page, zoom);
                    images.add(renderedImage);
                } catch (JRException e) {
                    throw new RuntimeException(e);
                }
            }
        }
        return images;
    }

    public static byte[] exportarODT(JasperPrint jasperPrint) throws JRException {
        /*WORD DE LINUX SOFTWARE LIBRE*/
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        @SuppressWarnings("rawtypes")
        Exporter exporter;
        exporter = new JROdtExporter();
        exporter.setExporterOutput(new SimpleOutputStreamExporterOutput(out));
        exporter.setExporterInput(new SimpleExporterInput(jasperPrint));
        /*
        SimpleOdtReportConfiguration reportConfiguration = new SimpleOdtReportConfiguration(); 
        SimpleOdtExporterConfiguration exportConfiguration = new SimpleOdtExporterConfiguration(); 
         */
        exporter.exportReport();
        return out.toByteArray();
    }
    
    public static byte[] exportarODS(JasperPrint jasperPrint) throws JRException {
        //NO SALE BIEN---OBSERVACION NO RECOMENDABLE UTILIZAR
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        @SuppressWarnings("rawtypes")
        Exporter exporter;
        exporter = new JROdsExporter();
        exporter.setExporterOutput(new SimpleOutputStreamExporterOutput(out));
        exporter.setExporterInput(new SimpleExporterInput(jasperPrint));        
        exporter.exportReport();
        return out.toByteArray();
    }
    
    public static byte[] exportarRTF(JasperPrint jasperPrint) throws JRException {
        /*WORD DE LINUX SOFTWARE LIBRE*/
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        @SuppressWarnings("rawtypes")
        Exporter exporter;
        exporter = new JRRtfExporter();
        exporter.setExporterOutput(new SimpleWriterExporterOutput(out));
        exporter.setExporterInput(new SimpleExporterInput(jasperPrint));        
        exporter.exportReport();
        return out.toByteArray();
    }
    
    public static byte[] exportarCSV(JasperPrint jasperPrint) throws JRException {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        @SuppressWarnings("rawtypes")
        Exporter exporter;
        exporter = new JRCsvExporter();
        exporter.setExporterOutput(new SimpleWriterExporterOutput(out));
        exporter.setExporterInput(new SimpleExporterInput(jasperPrint));        
        exporter.exportReport();
        return out.toByteArray();
    }
    
    public static byte[] exportarHTML(JasperPrint jasperPrint) throws JRException {
        /*PARA ESTE REPORTE SE NECESITAN LAS DOS LIBRERIAS EXTRAS QUE SE DESCARGO*/
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        @SuppressWarnings("rawtypes")
        Exporter exporter;
        exporter = new HtmlExporter();
        exporter.setExporterOutput(new SimpleHtmlExporterOutput(out));
        exporter.setExporterInput(new SimpleExporterInput(jasperPrint));
        SimpleHtmlReportConfiguration reportConfiguration = new SimpleHtmlReportConfiguration();
        exporter.setConfiguration(reportConfiguration);
        exporter.exportReport();
        return out.toByteArray();
    }
}


    /*
    NOTA---------> En todos los reportes como DOCX, PDF, U otro documento similar
    la clase de configuracion utilizar la por defecto por recomendacion ;). Si se quiere manipular
    seguir este patron: 1.- instancia SimpleExtencionReportConfiguration conf = new Sim..
                        2.- instancia SimpleExtensionExportConfiguration confRe = Sim...
     */