/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gob.peam.web.api;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import gob.peam.web.dao.DocumentoDAO;
import gob.peam.web.dao.impl.DocumentoDAOImpl;
import gob.peam.web.utilities.BEAN_CRUD;
import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

/**
 *
 * @author Juan Jose
 */
@WebServlet(name = "GestionTransparenteWebAPI", urlPatterns = {
    "/documentos/operacionesweb",
    "/gestiontransparente/documentos-normativos-y-de-gestion",
    "/gestiontransparente/presupuesto-y-finanzas",
    "/gestiontransparente/proyectos-de-inversion",
    "/gestiontransparente/recursos-humanos",
    "/gestiontransparente/adquisiciones-y-contrataciones",
    "/gestiontransparente/agenda-institucional",
    "/gestiontransparente/informacion-adicional",})
public class GestionTransparenteWebAPI extends HttpServlet {

    @Resource(name = "jdbc/dbweb")
    private DataSource pool;
    private Gson json;
    private String jsonResponse;
    private HashMap<String, Object> parameters;
    private static final Logger LOG = Logger.getLogger(GestionTransparenteWebAPI.class.getName());
    private String action;

    private DocumentoDAO documentoDAO;

    @Override
    public void init() throws ServletException {
        super.init(); // To change body of generated methods, choose Tools | Templates.
        this.json = new GsonBuilder().setDateFormat("dd/MM/yyyy").create();
        this.parameters = new HashMap<>();
        this.action = "";

        this.documentoDAO = new DocumentoDAOImpl(this.pool);
    }

    /*
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
        try {
            this.action = request.getParameter("action") == null ? "" : request.getParameter("action");
            LOG.info(action);
            switch (this.action) {
                case "paginarDocumentos":
                    procesarDocumento(new BEAN_CRUD(this.documentoDAO.getPagination(getParametersDocumentos(request))), response);
                    break;
                default:
                    request.getRequestDispatcher("/jsp/web/gestiontransparente/" + getJSP(request)).forward(request, response);
                    break;
            }
        } catch (SQLException ex) {
            Logger.getLogger(GestionTransparenteWebAPI.class.getName()).log(Level.SEVERE, null, ex);
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

    /*DOCUMENTOS*/
    private void procesarDocumento(BEAN_CRUD beanCrud, HttpServletResponse response) {
        try {
            this.jsonResponse = this.json.toJson(beanCrud);
            response.setContentType("application/json");
            response.getWriter().write(this.jsonResponse);
            LOG.info(this.jsonResponse);
        } catch (IOException ex) {
            Logger.getLogger(GestionTransparenteWebAPI.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private HashMap<String, Object> getParametersDocumentos(HttpServletRequest request) {
        this.parameters.clear();
        this.parameters.put("FILTER", request.getParameter("txtTituloDocumento").toLowerCase());
        if (request.getParameter("comboAnioDocumento").equals("-1")) {
            this.parameters.put("SQL_ANIO", "");
        } else {
            this.parameters.put("SQL_ANIO", "AND SUBSTRING(DOCU_FECHA_DOCX,7,4) = '" + request.getParameter("comboAnioDocumento") + "' ");
        }
        if (request.getParameter("comboTipoListaDocumentos").equals("-1")) {
            this.parameters.put("SQL_ESTADO", "");
        } else {
            this.parameters.put("SQL_ESTADO", "AND DOCU_ESTADO = " + request.getParameter("comboTipoListaDocumentos") + " ");
        }
        this.parameters.put("SQL_CATE_ID", "AND CATE_ID = " + request.getParameter("cate_id"));
        if (getTidoId(request).equals("")) {
            this.parameters.put("SQL_TIDO_ID", "");
        } else {
            this.parameters.put("SQL_TIDO_ID", "AND TIDO_ID = " + getTidoId(request));
        }
        this.parameters.put("SQL_ORDERS", "TO_DATE(DOCU_FECHA_DOCX,'DD/MM/YYYY') DESC");
        this.parameters.put("LIMIT",
                " LIMIT " + request.getParameter("sizePageDocumentos") + " OFFSET "
                + (Integer.parseInt(request.getParameter("numberPageDocumentos")) - 1)
                * Integer.parseInt(request.getParameter("sizePageDocumentos")));
        return this.parameters;
    }

    private String getCategoriaId(HttpServletRequest request) {
        String categoria_id = "-1";
        switch (request.getRequestURI().substring(request.getContextPath().length())) {
            case "/gestiontransparente/documentos-normativos-gestion/resolucionesgerenciales":
                categoria_id = "0";
                break;
            case "/gestiontransparente/documentos-normativos-gestion/actassession":
                categoria_id = "2800";
                break;
            case "/gestiontransparente/documentos-normativos-gestion/documentosgestion":
                categoria_id = "2";
                break;
            case "/gestiontransparente/documentos-normativos-gestion/normativasydirectivas":
                categoria_id = "0";
                break;
            case "/gestiontransparente/documentos-normativos-gestion/indicadoresdesempenio":
                categoria_id = "900";
                break;
            case "/gestiontransparente/adquisiciones-y-contrataciones/modificatoriaspac":
                categoria_id = "1100";
                break;
            case "/gestiontransparente/adquisiciones-y-contrataciones/liquidacionobras":
                categoria_id = "100";
                break;
            case "/gestiontransparente/adquisiciones-y-contrataciones/adicionalesobras":
                categoria_id = "200";
                break;
            case "/gestiontransparente/adquisiciones-y-contrataciones/supervisioncontratos":
                categoria_id = "300";
                break;
            case "/gestiontransparente/informacion-adicional/auditorias":
                categoria_id = "700";
                break;
            case "/gestiontransparente/informacion-adicional/evaluacionactualizacion":
                categoria_id = "800";
                break;
            case "/gestiontransparente/informacion-adicional/laudos":
                categoria_id = "500";
                break;
            case "/gestiontransparente/informacion-adicional/actasconciliacion":
                categoria_id = "600";
                break;
            case "/gestiontransparente/informacion-adicional/itp":
                categoria_id = "1300";
                break;
            /*
            case "/convocatorias/comitesencargados":
                categoria_id = "400";
                break;
             */
        }
        return categoria_id;
    }

    private String getJSP(HttpServletRequest request) {
        String page;
        switch (request.getRequestURI().substring(request.getContextPath().length())) {
            case "/gestiontransparente/documentos-normativos-y-de-gestion":
                page = "documentoNormativoGestion.jsp";
                break;
            case "/gestiontransparente/adquisiciones-y-contrataciones":
                page = "documentoAdquisicionContratacion.jsp";
                break;
            case "/gestiontransparente/informacion-adicional":
                page = "documentoInformacionAdicional.jsp";
                break;
            case "/gestiontransparente/proyectos-de-inversion":
                page = "proyectosinversion.jsp";
                break;
            case "/gestiontransparente/agenda-institucional":
                page = "agendaInstitucional.jsp";
                break;
            default:
                page = "../../../estamos_trabajando_web.jsp";
                break;
        }
        return page;
    }

    private String getTidoId(HttpServletRequest request) {
        String tido_id = "";
        switch (request.getRequestURI().substring(request.getContextPath().length())) {
            case "/gestiontransparente/documentos-normativos-gestion/normativasydirectivas":
                tido_id = "12";
                break;
            default:
                tido_id = "";
                break;
        }
        return tido_id;
    }

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
