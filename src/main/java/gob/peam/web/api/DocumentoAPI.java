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
import gob.peam.web.model.Documento;
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
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

/**
 *
 * @author JamesCarrillo
 */
@WebServlet(name = "DocumentoAPI", urlPatterns = {
    "/documentos/operaciones",
    "/convocatorias/adicionalesobras",
    "/convocatorias/comitesencargados",
    "/convocatorias/liquidacionobras",
    "/convocatorias/supervisioncontratos",
    "/gestiontransparente/actasconciliacion",
    "/gestiontransparente/actassession",
    "/gestiontransparente/declaracionjurada",
    "/gestiontransparente/evaluacionactualizacion",
    "/gestiontransparente/itp",
    "/gestiontransparente/indicadoresdesempenio",
    "/gestiontransparente/laudos",
    "/gestiontransparente/modificatoriaspac",
    "/gestiontransparente/proyectosinversion",
    "/gestiontransparente/recomendacionesauditorias",})
public class DocumentoAPI extends HttpServlet {

    @Resource(name = "jdbc/dbweb")
    private DataSource pool;
    private HttpSession session;
    private Gson json;
    private String jsonResponse;
    private HashMap<String, Object> parameters;
    private static final Logger LOG = Logger.getLogger(DocumentoAPI.class.getName());
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
        try {
            this.action = request.getParameter("action") == null ? "" : request.getParameter("action");
            LOG.info(action);
            switch (this.action) {
                case "paginarDocumentos":
                    procesarDocumento(new BEAN_CRUD(this.documentoDAO.getPagination(getParametersDocumentos(request))), response);
                    break;
                case "addDocumento":
                    procesarDocumento(this.documentoDAO.add(getDocumento(request), getParametersDocumentos(request)), response);
                    break;
                case "updateDocumento":
                    procesarDocumento(this.documentoDAO.update(getDocumento(request), getParametersDocumentos(request)), response);
                    break;
                case "deleteDocumento":
                    procesarDocumento(this.documentoDAO.delete(Integer.parseInt(request.getParameter("txtIdDocumentoER")), getParametersDocumentos(request)), response);
                    break;
                case "activateDocumento":
                    procesarDocumento(this.documentoDAO.cambiarEstado(Integer.parseInt(request.getParameter("txtIdDocumentoER")), Boolean.parseBoolean(request.getParameter("txtEstadoDocumentoER")), getParametersDocumentos(request)), response);
                    break;
                default:
                    request.getRequestDispatcher("/jsp/gc/global/" + getJSP(request)).forward(request, response);
                    break;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DocumentoAPI.class.getName()).log(Level.SEVERE, null, ex);
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
        this.session = request.getSession();
        if (this.session.getAttribute("user") == null) {
            response.sendRedirect("../login");
        } else {
            processRequest(request, response);
        }
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
        this.session = request.getSession();
        if (this.session.getAttribute("user") == null) {
            response.sendRedirect("../login");
        } else {
            processRequest(request, response);
        }
    }

    /*DOCUMENTOS*/
    private void procesarDocumento(BEAN_CRUD beanCrud, HttpServletResponse response) {
        try {
            this.jsonResponse = this.json.toJson(beanCrud);
            response.setContentType("application/json");
            response.getWriter().write(this.jsonResponse);
            LOG.info(this.jsonResponse);
        } catch (IOException ex) {
            Logger.getLogger(DocumentoAPI.class.getName()).log(Level.SEVERE, null, ex);
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
        this.parameters.put("SQL_CATE_ID", "AND CATE_ID = " + getCategoriaId(request));
        this.parameters.put("SQL_TIDO_ID", "");
        //SOLO PAR ELIMINAR
        this.parameters.put("CATE_ID", getCategoriaId(request));
        //
        this.parameters.put("SQL_ORDERS", "TO_DATE(DOCU_FECHA_DOCX,'DD/MM/YYYY') DESC");
        this.parameters.put("LIMIT",
                " LIMIT " + request.getParameter("sizePageDocumentos") + " OFFSET "
                + (Integer.parseInt(request.getParameter("numberPageDocumentos")) - 1)
                * Integer.parseInt(request.getParameter("sizePageDocumentos")));
        return this.parameters;
    }

    private Documento getDocumento(HttpServletRequest request) {
        Documento documento = new Documento();
        if (request.getParameter("action").equals("updateDocumento")) {
            documento.setDocu_id(Integer.parseInt(request.getParameter("txtIdDocumentoER")));
            documento.setDocu_titulo(request.getParameter("txtTituloDocumentoER"));
            documento.setDocu_resumen(request.getParameter("txtResumenDocumentoER"));
        } else {
            documento.setDocu_id(Integer.parseInt(request.getParameter("txtIdDocumentoER")));
            documento.setUsa_public_id(Integer.parseInt(request.getParameter("txtUsuaPublicIdDocumentoER")));
            documento.setDocu_descripcion(request.getParameter("txtDescripcionDocumentoER"));
            documento.setDocu_titulo(request.getParameter("txtTituloDocumentoER"));
            documento.setDocu_resumen(request.getParameter("txtResumenDocumentoER"));
            documento.setDocu_origen_archivo(request.getParameter("txtOrigenDocumentoER"));
            documento.setTido_id(Integer.parseInt(request.getParameter("txtTidoDocumentoER")));
            documento.setDocu_estado(Boolean.FALSE);
            documento.setDocu_activo(Boolean.TRUE);
            documento.setDocu_fecha_docx(request.getParameter("txtFechaDoxDocumentoER"));
            documento.setCate_id(Integer.parseInt(getCategoriaId(request)));
            documento.setDocu_metadata(request.getParameter("txtMetaDataDocumentoER"));
        }
        return documento;
    }

    private String getCategoriaId(HttpServletRequest request) {
        String categoria_id = "-1";
        switch (request.getParameter("urlDocumentos")) {
            case "/convocatorias/adicionalesobras":
                categoria_id = "200";
                break;
            case "/convocatorias/comitesencargados":
                categoria_id = "400";
                break;
            case "/convocatorias/liquidacionobras":
                categoria_id = "100";
                break;
            case "/convocatorias/supervisioncontratos":
                categoria_id = "300";
                break;
            case "/gestiontransparente/actasconciliacion":
                categoria_id = "600";
                break;
            case "/gestiontransparente/actassession":
                categoria_id = "2800";
                break;
            case "/gestiontransparente/evaluacionactualizacion":
                categoria_id = "800";
                break;
            case "/gestiontransparente/indicadoresdesempenio":
                categoria_id = "900";
                break;
            case "/gestiontransparente/itp":
                categoria_id = "1300";
                break;
            case "/gestiontransparente/laudos":
                categoria_id = "500";
                break;
            case "/gestiontransparente/modificatoriaspac":
                categoria_id = "1100";
                break;
            case "/gestiontransparente/recomendacionesauditorias":
                categoria_id = "700";
                break;
            case "/gestiontransparente/declaracionjurada":
                categoria_id = "1200";
                break;
        }
        return categoria_id;
    }

    private String getJSP(HttpServletRequest request) {
        String jsp;
        if (request.getRequestURI().substring(request.getContextPath().length()).equals("/gestiontransparente/declaracionjurada")) {
            jsp = "documento2.jsp";
        } else {
            jsp = "documento.jsp";
        }
        return jsp;
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
