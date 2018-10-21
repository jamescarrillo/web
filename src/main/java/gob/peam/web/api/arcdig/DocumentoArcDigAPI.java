/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gob.peam.web.api.arcdig;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import gob.peam.web.dao.impl.others.DocumentoArcDigDAOImpl;
import gob.peam.web.dao.impl.others.EtiquetaDAOImpl;
import gob.peam.web.dao.others.DocumentoArcDigDAO;
import gob.peam.web.dao.others.EtiquetaDAO;
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
 * @author Juan Jose
 */
@WebServlet(name = "DocumentoArcDigAPI", urlPatterns = {"/documentosarcdig"})
public class DocumentoArcDigAPI extends HttpServlet {

    private static final Logger LOG = Logger.getLogger(DocumentoArcDigAPI.class.getName());
    @Resource(name = "jdbc/dbarcdig")
    private DataSource pool;
    private HttpSession session;
    private Gson json;
    private String jsonResponse;
    private HashMap<String, Object> parameters;
    private String action;

    private EtiquetaDAO etiquetaDAO;
    private DocumentoArcDigDAO documentoArcDigDAO;

    @Override
    public void init() throws ServletException {
        super.init(); // To change body of generated methods, choose Tools | Templates.
        this.json = new GsonBuilder().setDateFormat("dd/MM/yyyy").create();
        this.parameters = new HashMap<>();
        this.action = "";

        this.etiquetaDAO = new EtiquetaDAOImpl(this.pool);
        this.documentoArcDigDAO = new DocumentoArcDigDAOImpl(this.pool);
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
            switch (this.action) {
                case "paginarEtiquetas":
                    procesarEtiquetas(new BEAN_CRUD(this.etiquetaDAO.getPagination(getParametersEtiquetas())), response);
                    break;
                case "paginarDocumentosArcDig":
                    procesarDocumentosArcDig(new BEAN_CRUD(this.documentoArcDigDAO.getPagination(getParametersDocumentosArcDig(request))), response);
                    break;
                default:
                    response.sendRedirect("403.jsp");
                    break;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DocumentoArcDigAPI.class.getName()).log(Level.SEVERE, null, ex);
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
        session = request.getSession();
        if (session.getAttribute("user") == null) {
            response.sendRedirect("login");
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
        session = request.getSession();
        if (session.getAttribute("user") == null) {
            response.sendRedirect("login");
        } else {
            processRequest(request, response);
        }
    }

    private void procesarEtiquetas(BEAN_CRUD beanCrud, HttpServletResponse response) {
        try {
            this.jsonResponse = this.json.toJson(beanCrud);
            response.setContentType("application/json");
            response.getWriter().write(this.jsonResponse);
            LOG.info(this.jsonResponse);
        } catch (IOException ex) {
            Logger.getLogger(DocumentoArcDigAPI.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private HashMap getParametersEtiquetas() {
        this.parameters.clear();
        this.parameters.put("FILTER", "");
        this.parameters.put("SQL_ORDERS", "ETIQ_NOMBRE");
        this.parameters.put("LIMIT", "");
        return this.parameters;
    }

    private void procesarDocumentosArcDig(BEAN_CRUD beanCrud, HttpServletResponse response) {
        try {
            this.jsonResponse = this.json.toJson(beanCrud);
            response.setContentType("application/json");
            response.getWriter().write(this.jsonResponse);
            LOG.info(this.jsonResponse);
        } catch (IOException ex) {
            Logger.getLogger(DocumentoArcDigAPI.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private HashMap getParametersDocumentosArcDig(HttpServletRequest request) {
        this.parameters.clear();
        this.parameters.put("FILTER", request.getParameter("txtTituloResumenDocumentosArcDig").toLowerCase());
        if (request.getParameter("comboAnioDocumentosArcDig").equals("-1")) {
            this.parameters.put("SQL_ANIO", " ");
        } else {
            this.parameters.put("SQL_ANIO", "AND SUBSTRING(DOCU_FECHA_DOCX,7,4) = '" + request.getParameter("comboAnioDocumentosArcDig") + "' ");
        }
        this.parameters.put("SQL_ESTADO", "AND DOCU_ESTADO = TRUE ");
        this.parameters.put("SQL_ORDERS", "DOCU_TITULO");
        this.parameters.put("LIMIT",
                " LIMIT " + request.getParameter("sizePageDocumentosArcDig") + " OFFSET "
                + (Integer.parseInt(request.getParameter("numberPageDocumentosArcDig")) - 1)
                * Integer.parseInt(request.getParameter("sizePageDocumentosArcDig")));
        return this.parameters;
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
