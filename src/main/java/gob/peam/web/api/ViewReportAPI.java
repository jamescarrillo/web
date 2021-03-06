/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gob.peam.web.api;

import gob.peam.web.utilities.report.JeccFormatReport;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;

/**
 *
 * @author JamesCarrillo
 */
@WebServlet(name = "ViewReportAPI", urlPatterns = {"/viewreport"})
public class ViewReportAPI extends HttpServlet {

    private static final Logger LOG = Logger.getLogger(ViewReportAPI.class.getName());
    @Resource(name = "jdbc/dbweb")
    private DataSource pool;
    private String report;
    private HashMap<String, Object> reports;
    private HashMap<String, Object> parameters;

    private JasperPrint jasperPrint;
    private byte[] byts;
    private String extension = "pdf";

    @Override
    public void init() throws ServletException {
        try {
            super.init(); //To change body of generated methods, choose Tools | Templates.
            reports = new HashMap<>();
            parameters = new HashMap<>();
            reports.put("reporte_documentos", JasperCompileManager.compileReport(getServletContext().getRealPath("/peam_resources_app/reports/reporte_documentos.jrxml")));
            reports.put("reporte_ordenes_compra", JasperCompileManager.compileReport(getServletContext().getRealPath("/peam_resources_app/reports/reporte_ordenes_compra.jrxml")));
            reports.put("reporte_ordenes_servicio", JasperCompileManager.compileReport(getServletContext().getRealPath("/peam_resources_app/reports/reporte_ordenes_servicio.jrxml")));
            reports.put("reporte_gastos_publicidad", JasperCompileManager.compileReport(getServletContext().getRealPath("/peam_resources_app/reports/reporte_gastos_publicidad.jrxml")));
            reports.put("reporte_gastos_telefonia", JasperCompileManager.compileReport(getServletContext().getRealPath("/peam_resources_app/reports/reporte_gastos_telefonia.jrxml")));
            reports.put("reporte_uso_vehiculo", JasperCompileManager.compileReport(getServletContext().getRealPath("/peam_resources_app/reports/reporte_uso_vehiculo.jrxml")));
            reports.put("reporte_proveedores", JasperCompileManager.compileReport(getServletContext().getRealPath("/peam_resources_app/reports/reporte_proveedores.jrxml")));
            reports.put("reporte_viaticos", JasperCompileManager.compileReport(getServletContext().getRealPath("/peam_resources_app/reports/reporte_viaticos.jrxml")));
            reports.put("reporte_personal_categorias", JasperCompileManager.compileReport(getServletContext().getRealPath("/peam_resources_app/reports/reporte_personal_categorias.jrxml")));
            reports.put("reporte_personal", JasperCompileManager.compileReport(getServletContext().getRealPath("/peam_resources_app/reports/reporte_personal.jrxml")));
            reports.put("reporte_personal_ls", JasperCompileManager.compileReport(getServletContext().getRealPath("/peam_resources_app/reports/reporte_personal_ls.jrxml")));

            reports.put("reporte_nota_prensa", JasperCompileManager.compileReport(getServletContext().getRealPath("/peam_resources_app/reports/reporte_nota_prensa.jrxml")));
        } catch (JRException ex) {
            Logger.getLogger(ViewReportAPI.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        this.report = request.getParameter("report") == null ? "" : request.getParameter("report");
        LOG.info(this.report);
        switch (this.report) {
            case "reporte_documentos_normativos_gestion":
                exportarDocumentos(request, response, "");
                break;
            case "reporte_documentos_adquisiciones":
                exportarDocumentos(request, response, " AND DOCU_FECHA_DOCX != '' ");
                break;
            case "reporte_ordenes_compra":
                exportarOrdenCompra(request, response);
                break;
            case "reporte_ordenes_servicio":
                exportarOrdenServicio(request, response);
                break;
            case "reporte_gastos_publicidad":
                exportarPublicidad(request, response);
                break;
            case "reporte_gastos_telefonia":
                exportarTelefonia(request, response);
                break;
            case "reporte_uso_vehiculo":
                exportarVehiculo(request, response);
                break;
            case "reporte_proveedores":
                exportarProveedores(request, response);
                break;
            case "reporte_viaticos":
                exportarViaticos(request, response);
                break;
            case "reporte_personal_categorias":
                exportarPersonalCategorias(request, response);
                break;
            case "reporte_personal":
                exportarPersonal(request, response);
                break;
            case "reporte_nota_prensa":
                exportarNotaPrensa(request, response);
                break;
            default:
                response.sendRedirect("/index");
                break;
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    private void exportarDocumentos(HttpServletRequest request, HttpServletResponse response, String sql_fecha) throws IOException {
        /*PARAMETROS GENERALES*/
        cargarParametrosGenerales();
        /*PARAMETROS ESPECIFICOS*/
        if (validarParametrosReporteDocumentos(request)) {
            this.parameters.put("title_reporte", getTitleReporte(request.getParameter("cate_id"), request.getParameter("tido_id")));
            if (request.getParameter("anho").equals("")) {
                this.parameters.put("field_encabezado_tabla", "");
                this.parameters.put("sql_anho", "");
            } else {
                this.parameters.put("sql_anho", " AND SUBSTRING(DOCU_FECHA_DOCX,7,4) = '" + request.getParameter("anho") + "'");
                this.parameters.put("field_encabezado_tabla", " AÑO: " + request.getParameter("anho"));
            }
            this.parameters.put("sql_fecha", sql_fecha);
            if (request.getParameter("tido_id").equals("")) {
                this.parameters.put("sql_tido", "");
            } else {
                this.parameters.put("sql_tido", " AND TIDO_ID = " + request.getParameter("tido_id"));
            }
            this.parameters.put("sql_cate", getSQLCate_id(request.getParameter("cate_id"), request.getParameter("tido_id")));
            try (Connection conn = pool.getConnection()) {
                LOG.info(this.parameters.toString());
                this.jasperPrint = JasperFillManager.fillReport((JasperReport) this.reports.get("reporte_documentos"), parameters, conn);
                this.extension = getFormato(request);
                this.byts = JeccFormatReport.getReport(this.jasperPrint, this.extension);
                response.setContentLength(this.byts.length);
                response.setHeader("Content-disposition", "inline; filename=reporte." + this.extension);
                response.setContentType("application/" + this.extension);
                try (ServletOutputStream ouputstream = response.getOutputStream()) {
                    ouputstream.write(this.byts, 0, this.byts.length);
                }
            } catch (SQLException | JRException ex) {
                try {
                    throw ex;
                } catch (SQLException | JRException ex1) {
                    Logger.getLogger(ViewReportAPI.class.getName()).log(Level.SEVERE, null, ex1);
                }
            }
        } else {
            LOG.info("Parametros incorrectos . . .");
            response.sendRedirect("index");
        }
    }

    private void exportarOrdenCompra(HttpServletRequest request, HttpServletResponse response) throws IOException {
        /*PARAMETROS GENERALES*/
        cargarParametrosGenerales();
        /*PARAMETROS ESPECIFICOS*/
        this.parameters.put("title_reporte", "REPORTE DE ORDENES DE COMPRAS DE BIENES");
        this.parameters.put("field_encabezado_tabla", "AÑO: " + request.getParameter("anho"));
        this.parameters.put("anho", request.getParameter("anho"));
        try (Connection conn = pool.getConnection()) {
            LOG.info(this.parameters.toString());
            this.jasperPrint = JasperFillManager.fillReport((JasperReport) this.reports.get("reporte_ordenes_compra"), parameters, conn);
            this.extension = getFormato(request);
            this.byts = JeccFormatReport.getReport(this.jasperPrint, this.extension);
            response.setContentLength(this.byts.length);
            response.setHeader("Content-disposition", "inline; filename=reporte." + this.extension);
            response.setContentType("application/" + this.extension);
            try (ServletOutputStream ouputstream = response.getOutputStream()) {
                ouputstream.write(this.byts, 0, this.byts.length);
            }
        } catch (SQLException | JRException ex) {
            try {
                throw ex;
            } catch (SQLException | JRException ex1) {
                Logger.getLogger(ViewReportAPI.class.getName()).log(Level.SEVERE, null, ex1);
            }
        }
    }

    private void exportarOrdenServicio(HttpServletRequest request, HttpServletResponse response) throws IOException {
        /*PARAMETROS GENERALES*/
        cargarParametrosGenerales();
        /*PARAMETROS ESPECIFICOS*/
        this.parameters.put("title_reporte", "REPORTE DE ORDENES DE SERVICIOS");
        this.parameters.put("field_encabezado_tabla", "AÑO: " + request.getParameter("anho"));
        this.parameters.put("anho", request.getParameter("anho"));
        try (Connection conn = pool.getConnection()) {
            LOG.info(this.parameters.toString());
            this.jasperPrint = JasperFillManager.fillReport((JasperReport) this.reports.get("reporte_ordenes_servicio"), parameters, conn);
            this.extension = getFormato(request);
            this.byts = JeccFormatReport.getReport(this.jasperPrint, this.extension);
            response.setContentLength(this.byts.length);
            response.setHeader("Content-disposition", "inline; filename=reporte." + this.extension);
            response.setContentType("application/" + this.extension);
            try (ServletOutputStream ouputstream = response.getOutputStream()) {
                ouputstream.write(this.byts, 0, this.byts.length);
            }
        } catch (SQLException | JRException ex) {
            try {
                throw ex;
            } catch (SQLException | JRException ex1) {
                Logger.getLogger(ViewReportAPI.class.getName()).log(Level.SEVERE, null, ex1);
            }
        }
    }

    private void exportarPublicidad(HttpServletRequest request, HttpServletResponse response) throws IOException {
        /*PARAMETROS GENERALES*/
        cargarParametrosGenerales();
        /*PARAMETROS ESPECIFICOS*/
        this.parameters.put("title_reporte", "REPORTE DE GASTOS EN PUBLICIDAD");
        this.parameters.put("field_encabezado_tabla", "AÑO: " + request.getParameter("anho"));
        this.parameters.put("anho", request.getParameter("anho"));
        try (Connection conn = pool.getConnection()) {
            LOG.info(this.parameters.toString());
            this.jasperPrint = JasperFillManager.fillReport((JasperReport) this.reports.get("reporte_gastos_publicidad"), parameters, conn);
            this.extension = getFormato(request);
            this.byts = JeccFormatReport.getReport(this.jasperPrint, this.extension);
            response.setContentLength(this.byts.length);
            response.setHeader("Content-disposition", "inline; filename=reporte." + this.extension);
            response.setContentType("application/" + this.extension);
            try (ServletOutputStream ouputstream = response.getOutputStream()) {
                ouputstream.write(this.byts, 0, this.byts.length);
            }
        } catch (SQLException | JRException ex) {
            try {
                throw ex;
            } catch (SQLException | JRException ex1) {
                Logger.getLogger(ViewReportAPI.class.getName()).log(Level.SEVERE, null, ex1);
            }
        }
    }

    private void exportarTelefonia(HttpServletRequest request, HttpServletResponse response) throws IOException {
        /*PARAMETROS GENERALES*/
        cargarParametrosGenerales();
        /*PARAMETROS ESPECIFICOS*/
        this.parameters.put("title_reporte", "REPORTE DE GASTOS EN TELEFONÍA");
        this.parameters.put("field_encabezado_tabla", "AÑO: " + request.getParameter("anho"));
        this.parameters.put("anho", request.getParameter("anho"));
        try (Connection conn = pool.getConnection()) {
            LOG.info(this.parameters.toString());
            this.jasperPrint = JasperFillManager.fillReport((JasperReport) this.reports.get("reporte_gastos_telefonia"), parameters, conn);
            this.extension = getFormato(request);
            this.byts = JeccFormatReport.getReport(this.jasperPrint, this.extension);
            response.setContentLength(this.byts.length);
            response.setHeader("Content-disposition", "inline; filename=reporte." + this.extension);
            response.setContentType("application/" + this.extension);
            try (ServletOutputStream ouputstream = response.getOutputStream()) {
                ouputstream.write(this.byts, 0, this.byts.length);
            }
        } catch (SQLException | JRException ex) {
            try {
                throw ex;
            } catch (SQLException | JRException ex1) {
                Logger.getLogger(ViewReportAPI.class.getName()).log(Level.SEVERE, null, ex1);
            }
        }
    }

    private void exportarVehiculo(HttpServletRequest request, HttpServletResponse response) throws IOException {
        /*PARAMETROS GENERALES*/
        cargarParametrosGenerales();
        /*PARAMETROS ESPECIFICOS*/
        this.parameters.put("title_reporte", "REPORTE DE USO DE VEHÍCULOS");
        this.parameters.put("field_encabezado_tabla", "AÑO: " + request.getParameter("anho"));
        this.parameters.put("anho", request.getParameter("anho"));
        try (Connection conn = pool.getConnection()) {
            LOG.info(this.parameters.toString());
            this.jasperPrint = JasperFillManager.fillReport((JasperReport) this.reports.get("reporte_uso_vehiculo"), parameters, conn);
            this.extension = getFormato(request);
            this.byts = JeccFormatReport.getReport(this.jasperPrint, this.extension);
            response.setContentLength(this.byts.length);
            response.setHeader("Content-disposition", "inline; filename=reporte." + this.extension);
            response.setContentType("application/" + this.extension);
            try (ServletOutputStream ouputstream = response.getOutputStream()) {
                ouputstream.write(this.byts, 0, this.byts.length);
            }
        } catch (SQLException | JRException ex) {
            try {
                throw ex;
            } catch (SQLException | JRException ex1) {
                Logger.getLogger(ViewReportAPI.class.getName()).log(Level.SEVERE, null, ex1);
            }
        }
    }

    private void exportarProveedores(HttpServletRequest request, HttpServletResponse response) throws IOException {
        /*PARAMETROS GENERALES*/
        cargarParametrosGenerales();
        /*PARAMETROS ESPECIFICOS*/
        this.parameters.put("title_reporte", "REPORTE DE PRINCIPALES PROVEEDORES");
        this.parameters.put("field_encabezado_tabla", "AÑO: " + request.getParameter("anho"));
        this.parameters.put("anho", request.getParameter("anho"));
        try (Connection conn = pool.getConnection()) {
            LOG.info(this.parameters.toString());
            this.jasperPrint = JasperFillManager.fillReport((JasperReport) this.reports.get("reporte_proveedores"), parameters, conn);
            this.extension = getFormato(request);
            this.byts = JeccFormatReport.getReport(this.jasperPrint, this.extension);
            response.setContentLength(this.byts.length);
            response.setHeader("Content-disposition", "inline; filename=reporte." + this.extension);
            response.setContentType("application/" + this.extension);
            try (ServletOutputStream ouputstream = response.getOutputStream()) {
                ouputstream.write(this.byts, 0, this.byts.length);
            }
        } catch (SQLException | JRException ex) {
            try {
                throw ex;
            } catch (SQLException | JRException ex1) {
                Logger.getLogger(ViewReportAPI.class.getName()).log(Level.SEVERE, null, ex1);
            }
        }
    }

    private void exportarViaticos(HttpServletRequest request, HttpServletResponse response) throws IOException {
        /*PARAMETROS GENERALES*/
        cargarParametrosGenerales();
        /*PARAMETROS ESPECIFICOS*/
        this.parameters.put("title_reporte", "REPORTE DE GASTOS DE PASAJES Y VIÁTICOS");
        this.parameters.put("field_encabezado_tabla", "AÑO: " + request.getParameter("anho"));
        this.parameters.put("anho", request.getParameter("anho"));
        try (Connection conn = pool.getConnection()) {
            LOG.info(this.parameters.toString());
            this.jasperPrint = JasperFillManager.fillReport((JasperReport) this.reports.get("reporte_viaticos"), parameters, conn);
            this.extension = getFormato(request);
            this.byts = JeccFormatReport.getReport(this.jasperPrint, this.extension);
            response.setContentLength(this.byts.length);
            response.setHeader("Content-disposition", "inline; filename=reporte." + this.extension);
            response.setContentType("application/" + this.extension);
            try (ServletOutputStream ouputstream = response.getOutputStream()) {
                ouputstream.write(this.byts, 0, this.byts.length);
            }
        } catch (SQLException | JRException ex) {
            try {
                throw ex;
            } catch (SQLException | JRException ex1) {
                Logger.getLogger(ViewReportAPI.class.getName()).log(Level.SEVERE, null, ex1);
            }
        }
    }

    private void exportarPersonalCategorias(HttpServletRequest request, HttpServletResponse response) throws IOException {
        /*PARAMETROS GENERALES*/
        cargarParametrosGenerales();
        /*PARAMETROS ESPECIFICOS*/
        this.parameters.put("title_reporte", "REMUNERACIÓN POR CATEGORÍAS");
        this.parameters.put("field_encabezado_tabla", request.getParameter("trimestre").equals("1") ? "PRIMER TRIMESTRE" + " - " + request.getParameter("anho") : "SEGUNDO TRIMESTRE" + " - " + request.getParameter("anho"));
        this.parameters.put("anho", request.getParameter("anho"));
        try (Connection conn = pool.getConnection()) {
            LOG.info(this.parameters.toString());
            this.jasperPrint = JasperFillManager.fillReport((JasperReport) this.reports.get("reporte_personal_categorias"), parameters, conn);
            this.extension = getFormato(request);
            this.byts = JeccFormatReport.getReport(this.jasperPrint, this.extension);
            response.setContentLength(this.byts.length);
            response.setHeader("Content-disposition", "inline; filename=reporte." + this.extension);
            response.setContentType("application/" + this.extension);
            try (ServletOutputStream ouputstream = response.getOutputStream()) {
                ouputstream.write(this.byts, 0, this.byts.length);
            }
        } catch (SQLException | JRException ex) {
            try {
                throw ex;
            } catch (SQLException | JRException ex1) {
                Logger.getLogger(ViewReportAPI.class.getName()).log(Level.SEVERE, null, ex1);
            }
        }
    }

    private void exportarPersonal(HttpServletRequest request, HttpServletResponse response) throws IOException {
        /*PARAMETROS GENERALES*/
        cargarParametrosGenerales();
        /*PARAMETROS ESPECIFICOS*/
        this.parameters.put("title_reporte", getTitleReportePersonal(request.getParameter("tipo")));
        if (request.getParameter("anho").equals("-1")) {
            this.parameters.put("anho", "");
            this.parameters.put("field_encabezado_tabla", "");
        } else {
            this.parameters.put("anho", " AND ANHO = '" + request.getParameter("anho") + "' ");
            this.parameters.put("anho", " AND TRIMESTRE = '" + request.getParameter("trimestre_mes") + "' ");
            if (request.getParameter("tipo").equals("1")) {
                this.parameters.put("field_encabezado_tabla", getMes(request.getParameter("trimestre_mes")));
            } else {
                //TRIMESTRE
                this.parameters.put("field_encabezado_tabla", getTrimestre(request.getParameter("trimestre_mes")));
            }
            this.parameters.put("field_encabezado_tabla", this.parameters.get("field_encabezado_tabla") + " - " + request.getParameter("anho"));
        }
        if (request.getParameter("tipo").equals("3")) {
            this.parameters.put("tipo", " WHERE TIPO = 3");
        } else {
            this.parameters.put("tipo", " WHERE ESTADO = TRUE AND TIPO = " + request.getParameter("tipo"));
        }
        LOG.info(this.parameters.get("tipo").toString());
        try (Connection conn = pool.getConnection()) {
            LOG.info(this.parameters.toString());
            
            if (request.getParameter("tipo").equals("2")) {
                this.jasperPrint = JasperFillManager.fillReport((JasperReport) this.reports.get("reporte_personal_ls"), parameters, conn);
            } else {
                this.jasperPrint = JasperFillManager.fillReport((JasperReport) this.reports.get("reporte_personal"), parameters, conn);
            }
            this.extension = getFormato(request);
            this.byts = JeccFormatReport.getReport(this.jasperPrint, this.extension);
            response.setContentLength(this.byts.length);
            response.setHeader("Content-disposition", "inline; filename=reporte." + this.extension);
            response.setContentType("application/" + this.extension);
            try (ServletOutputStream ouputstream = response.getOutputStream()) {
                ouputstream.write(this.byts, 0, this.byts.length);
            }
        } catch (SQLException | JRException ex) {
            try {
                throw ex;
            } catch (SQLException | JRException ex1) {
                Logger.getLogger(ViewReportAPI.class.getName()).log(Level.SEVERE, null, ex1);
            }
        }
    }

    private String getTrimestre(String trimestre) {
        String s_trimestre = "";
        switch (trimestre) {
            case "1":
                s_trimestre = "Primer Trimestre";
                break;
            case "2":
                s_trimestre = "Segundo Trimestre";
                break;
            case "3":
                s_trimestre = "Tercer Trimestre";
                break;
            case "4":
                s_trimestre = "Cuarto Trimestre";
                break;
        }
        return s_trimestre;
    }

    private String getMes(String mes) {
        String s_mes = "";
        switch (mes) {
            case "1":
                s_mes = "Enero";
                break;
            case "2":
                s_mes = "Febrero";
                break;
            case "3":
                s_mes = "Marzo";
                break;
            case "4":
                s_mes = "Abril";
                break;
            case "5":
                s_mes = "Mayo";
                break;
            case "6":
                s_mes = "Junio";
                break;
            case "7":
                s_mes = "Julio";
                break;
            case "8":
                s_mes = "Agosto";
                break;
            case "9":
                s_mes = "Septiembre";
                break;
            case "10":
                s_mes = "Octubre";
                break;
            case "11":
                s_mes = "Noviembre";
                break;
            case "12":
                s_mes = "Diciembre";
                break;
        }
        return s_mes;
    }

    private void exportarNotaPrensa(HttpServletRequest request, HttpServletResponse response) throws IOException {
        /*PARAMETROS GENERALES*/
        cargarParametrosGeneralesVertical();
        /*PARAMETROS ESPECIFICOS*/
        this.parameters.put("title_reporte", "NOTA DE PRENSA");
        this.parameters.put("idnota_prensa", request.getParameter("id"));
        try (Connection conn = pool.getConnection()) {
            LOG.info(this.parameters.toString());
            this.jasperPrint = JasperFillManager.fillReport((JasperReport) this.reports.get("reporte_nota_prensa"), parameters, conn);
            this.extension = getFormato(request);
            this.byts = JeccFormatReport.getReport(this.jasperPrint, this.extension);
            response.setContentLength(this.byts.length);
            response.setHeader("Content-disposition", "inline; filename=reporte." + this.extension);
            response.setContentType("application/" + this.extension);
            try (ServletOutputStream ouputstream = response.getOutputStream()) {
                ouputstream.write(this.byts, 0, this.byts.length);
            }
        } catch (SQLException | JRException ex) {
            try {
                throw ex;
            } catch (SQLException | JRException ex1) {
                Logger.getLogger(ViewReportAPI.class.getName()).log(Level.SEVERE, null, ex1);
            }
        }
    }

    private String getTitleReportePersonal(String tipo) {
        String title = "REPORTE ";
        switch (tipo) {
            case "1":
                title += "DE PERSONAL Y REMUNERACIONES (RÉGIMEN LABORAL D.L. 728)";
                break;
            case "2":
                title += "DE PERSONAL Y REMUNERACIONES (LOCACIÓN DE SERVICIOS)";
                break;
            case "3":
                title += "DE PERSONAL Y REMUNERACIONES (REGIMEN CAS)";
                break;
        }
        return title;
    }

    private boolean validarParametrosReporteDocumentos(HttpServletRequest request) {
        return request.getParameter("anho") != null;
    }

    private void cargarParametrosGenerales() {
        this.parameters.clear();
        this.parameters.put("path_cabecera", getServletContext().getRealPath("/peam_resources_app/reports/cabecera_horizontal.jasper")); // .jasper
        this.parameters.put("path_logo_goresam", getServletContext().getRealPath("/peam_resources_app/reports/img/logo-goresam.png"));
    }

    private void cargarParametrosGeneralesVertical() {
        this.parameters.clear();
        this.parameters.put("path_cabecera", getServletContext().getRealPath("/peam_resources_app/reports/cabecera_vertical.jasper")); // .jasper
        this.parameters.put("path_logo_goresam", getServletContext().getRealPath("/peam_resources_app/reports/img/logo-goresam.png"));
    }

    private String getFormato(HttpServletRequest request) {
        String formato;
        if (request.getParameter("format") == null) {
            formato = "pdf";
        } else {
            if (request.getParameter("format").equalsIgnoreCase("pdf")
                    || request.getParameter("format").equalsIgnoreCase("xlsx")
                    || request.getParameter("format").equalsIgnoreCase("pptx")
                    || request.getParameter("format").equalsIgnoreCase("docx")) {
                formato = request.getParameter("format");
            } else {
                formato = "pdf";
            }
        }
        return formato;
    }

    private String getTitleReporte(String cate_id, String tido_id) {
        String title = "Reporte de ";
        switch (cate_id) {
            case "2800":
                title += "Actas de Sesión y Consejo Directivo";
                break;
            case "100":
                switch (tido_id) {
                    case "10":
                        title += "Resoluciones Gerenciales";
                        break;
                    case "11":
                        title += "Documentos de Gestión";
                        break;
                    case "12":
                        title += "Normas y Directivas 12";
                        break;
                    case "":
                        title += "Monto de Liquidación Final de Obra";
                        break;
                }
                break;
            case "900":
                title += "Indicadores de Desempeño";
                break;
            case "1100":
                title += "PAC y Modificatorias";
                break;
            case "200":
                title += "Montos Adicionales de las Obras";
                break;
            case "300":
                title += "Informes de Supervición de Contratos";
                break;
        }
        if (cate_id.contains("< 100")) {
            switch (tido_id) {
                case "10":
                    title += "Resoluciones Gerenciales";
                    break;
                case "11":
                    title += "Documentos de Gestión";
                    break;
                case "12":
                    title += "Normas y Directivas 12";
                    break;
                case "":
                    title += "Monto de Liquidación Final de Obra";
                    break;
            }
        }
        return title.toUpperCase();
    }

    private String getSQLCate_id(String cate_id, String tido_id) {
        String sql_cate_id = " AND CATE_ID ";
        if (cate_id.contains("<")) {
            sql_cate_id += cate_id;
        } else {
            sql_cate_id += "= " + cate_id;
        }
        return sql_cate_id;
    }

//    private HashMap<String, Object> getParameters(){
//        
//    } 
    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
