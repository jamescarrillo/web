/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gob.peam.web.api;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import gob.peam.web.dao.CalendarioConvDAO;
import gob.peam.web.dao.ConvocatoriaBienDAO;
import gob.peam.web.dao.Convocatoria_PersDAO;
import gob.peam.web.dao.DocumentCalDAO;
import gob.peam.web.dao.PuestoConvDAO;
import gob.peam.web.dao.impl.CalendarioConvDAOImpl;
import gob.peam.web.dao.impl.ConvocatoriaBienDAOImpl;
import gob.peam.web.dao.impl.Convocatoria_PersDAOImpl;
import gob.peam.web.dao.impl.DocumentCalDAOImpl;
import gob.peam.web.dao.impl.PuestoConvDAOImpl;
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
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 *
 * @author JhanxD
 */
@WebServlet(name = "ConvocatoriasWebAPI", urlPatterns = {"/convocatorias/convocatoria-de-personal",
    "/convocatorias/convocatoria-de-bienes-y-servicios"})
public class ConvocatoriasWebAPI extends HttpServlet {

    @Resource(name = "jdbc/dbweb")
    private DataSource pool;
    private Gson json;
    private String jsonResponse;
    private HashMap<String, Object> parameters;
    private HashMap<String, Object> jsonROOT;
    private final Log logger = LogFactory.getLog(ConvocatoriasWebAPI.class);
    private String action;

    ///CONVOCATORIAS DE PERSONAL
    private Convocatoria_PersDAO convocatoriapersDAO;
    private CalendarioConvDAO calendarioDAO;
    private DocumentCalDAO documentDAO;
    private PuestoConvDAO puestoconvDAO;

    ///CONVOCATORIAS DE BIENES
    private ConvocatoriaBienDAO convocatoriabienDAO;

    @Override
    public void init() throws ServletException {
        super.init(); // To change body of generated methods, choose Tools | Templates.
        //this.json = new GsonBuilder().setDateFormat("dd/MM/yyyy HH:mm:ss").create();
        this.json = new GsonBuilder().setDateFormat("dd/MM/yyyy").create();
        this.parameters = new HashMap<>();
        this.jsonROOT = new HashMap<>();
        this.action = "";

        this.convocatoriapersDAO = new Convocatoria_PersDAOImpl(this.pool);
        this.calendarioDAO = new CalendarioConvDAOImpl(this.pool);
        this.documentDAO = new DocumentCalDAOImpl(this.pool);
        this.puestoconvDAO = new PuestoConvDAOImpl(this.pool);

        this.convocatoriabienDAO = new ConvocatoriaBienDAOImpl(this.pool);
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
            switch (request.getRequestURI().substring(request.getContextPath().length())) {
                case "/convocatorias/convocatoria-de-personal":
                    this.action = request.getParameter("action") == null ? "" : request.getParameter("action");
                    logger.info("--->" + this.action);
                    switch (this.action) {
                        case "paginarConvocatoria":
                            procesarConvocatoriaPers(new BEAN_CRUD(this.convocatoriapersDAO.getPagination(getParametersConvocatoriaPers(request))), response);
                            break;
                        case "paginarCalendario":
                            procesarCalendario(new BEAN_CRUD(this.calendarioDAO.getPagination(getParametersCalendario(request))), response);
                            break;
                        case "paginarDocumentoCal":
                            procesarDocumentoCal(new BEAN_CRUD(this.documentDAO.getPagination(getParametersDocumentoCal(request))), response);
                            break;
                        case "paginarPuestoConv":
                            procesarPuestoConv(new BEAN_CRUD(this.puestoconvDAO.getPagination(getParametersPuestoConv(request))), response);
                            break;
                        default:
                            request.getRequestDispatcher("/jsp/web/convocatorias/convocatoriaspers.jsp").forward(request, response);
                            break;
                    }
                    break;
                case "/convocatorias/convocatoria-de-bienes-y-servicios":
                    this.action = request.getParameter("action") == null ? "" : request.getParameter("action");
                    logger.info("--->" + this.action);
                    switch (this.action) {
                        case "paginarConvocatoria":
                            procesarConvocatoriaBien(new BEAN_CRUD(this.convocatoriabienDAO.getPagination(getParametersConvocatoriaBien(request))), response);
                            break;
                        case "paginarCalendario":
                            procesarCalendario(new BEAN_CRUD(this.calendarioDAO.getPagination(getParametersCalendario(request))), response);
                            break;
                        default:
                            request.getRequestDispatcher("/jsp/web/convocatorias/convocatoriasbien.jsp").forward(request, response);
                            break;
                    }
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

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private void procesarConvocatoriaPers(BEAN_CRUD bean_crud, HttpServletResponse response) {
        try {
            this.jsonResponse = this.json.toJson(bean_crud);
            response.setContentType("application/json");
            response.getWriter().write(this.jsonResponse);
            this.logger.info(this.jsonResponse);
        } catch (IOException ex) {
            Logger.getLogger(ConvocatoriasWebAPI.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private HashMap<String, Object> getParametersConvocatoriaPers(HttpServletRequest request) {
        this.parameters.clear();
        this.parameters.put("FILTER", request.getParameter("txtTituloConvocatoria").toLowerCase());
        if (request.getParameter("comboAnioConvocatoria").equals("-1")) {
            this.parameters.put("SQL_ANIO", "");
        } else {
            this.parameters.put("SQL_ANIO", "AND ANHO = '" + request.getParameter("comboAnioConvocatoria") + "' ");
        }
        if (request.getParameter("comboTipoEstado").equals("-1")) {
            this.parameters.put("SQL_ESTADO", "");
        } else {
            this.parameters.put("SQL_ESTADO", "AND ESTADO = " + request.getParameter("comboTipoEstado") + " ");
        }
        this.parameters.put("SQL_ORDERS", "FECHA DESC");
        this.parameters.put("LIMIT",
                " LIMIT " + request.getParameter("sizePageConvocatoria") + " OFFSET "
                + (Integer.parseInt(request.getParameter("numberPageConvocatoria")) - 1)
                * Integer.parseInt(request.getParameter("sizePageConvocatoria")));
        return this.parameters;
    }

    private void procesarCalendario(BEAN_CRUD bean_crud, HttpServletResponse response) {
        try {
            this.jsonResponse = this.json.toJson(bean_crud);
            response.setContentType("application/json");
            response.getWriter().write(this.jsonResponse);
            this.logger.info(this.jsonResponse);
        } catch (IOException ex) {
            Logger.getLogger(GestionTransparenteAPI.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private HashMap<String, Object> getParametersCalendario(HttpServletRequest request) {
        this.parameters.clear();
        this.parameters.put("FILTER", "");
        this.parameters.put("CONVOCATORIA_PERS", " AND WEB.CALENDARIO_CONV.CONVO_ID = " + Integer.parseInt(request.getParameter("CoperID")));
        if (request.getRequestURI().substring(request.getContextPath().length()).equals("/convocatorias/convocatoria-de-personal")) {
            this.parameters.put("ORIGEN", (int) 2);
            this.parameters.put("TIPO", " AND TIPO = 2 ");
        } else {
            this.parameters.put("ORIGEN", (int) 1);
            this.parameters.put("TIPO", " AND TIPO = 1 ");
        }
        this.parameters.put("LIMIT",
                " LIMIT " + request.getParameter("sizePageCalendario") + " OFFSET "
                + (Integer.parseInt(request.getParameter("numberPageCalendario")) - 1)
                * Integer.parseInt(request.getParameter("sizePageCalendario")));
        return this.parameters;
    }

    private void procesarDocumentoCal(BEAN_CRUD bean_crud, HttpServletResponse response) {
        try {
            this.jsonResponse = this.json.toJson(bean_crud);
            response.setContentType("application/json");
            response.getWriter().write(this.jsonResponse);
            this.logger.info(this.jsonResponse);
        } catch (IOException ex) {
            Logger.getLogger(GestionTransparenteAPI.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private HashMap<String, Object> getParametersDocumentoCal(HttpServletRequest request) {
        this.parameters.clear();
        this.parameters.put("IDCALENDARIO", " ID = " + Integer.parseInt(request.getParameter("CaleId")));
        return this.parameters;
    }

    private void procesarPuestoConv(BEAN_CRUD bean_crud, HttpServletResponse response) {
        try {
            this.jsonResponse = this.json.toJson(bean_crud);
            response.setContentType("application/json");
            response.getWriter().write(this.jsonResponse);
            this.logger.info(this.jsonResponse);
        } catch (IOException ex) {
            Logger.getLogger(GestionTransparenteAPI.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private HashMap<String, Object> getParametersPuestoConv(HttpServletRequest request) {
        this.parameters.clear();
        this.parameters.put("FILTER", "");
        this.parameters.put("IDCONVO", " AND COPER_ID = " + Integer.parseInt(request.getParameter("CoperID")));
        return this.parameters;
    }

    private void procesarConvocatoriaBien(BEAN_CRUD bean_crud, HttpServletResponse response) {
        try {
            this.jsonResponse = this.json.toJson(bean_crud);
            response.setContentType("application/json");
            response.getWriter().write(this.jsonResponse);
            this.logger.info(this.jsonResponse);
        } catch (IOException ex) {
            Logger.getLogger(GestionTransparenteAPI.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private HashMap<String, Object> getParametersConvocatoriaBien(HttpServletRequest request) {
        this.parameters.clear();
        this.parameters.put("FILTER", request.getParameter("txtConvocatoria").toLowerCase());
        if (request.getParameter("comboAnio").equals("-1")) {
            this.parameters.put("SQL_ANIO", "");
        } else {
            this.parameters.put("SQL_ANIO", "AND ANHO = '1" + String.valueOf(request.getParameter("comboAnio")).substring(2, 4) + "' ");
        }
        if (request.getParameter("comboTipoListaConvocatoria").equals("-1")) {
            this.parameters.put("SQL_ESTADO", "");
        } else {
            this.parameters.put("SQL_ESTADO", "AND ESTADO = " + request.getParameter("comboTipoListaConvocatoria") + " ");
        }
        this.parameters.put("SQL_ORDERS", "FECHA DESC");
        this.parameters.put("LIMIT",
                " LIMIT " + request.getParameter("sizePageConvocatoria") + " OFFSET "
                + (Integer.parseInt(request.getParameter("numberPageConvocatoria")) - 1)
                * Integer.parseInt(request.getParameter("sizePageConvocatoria")));
        return this.parameters;
    }

}
