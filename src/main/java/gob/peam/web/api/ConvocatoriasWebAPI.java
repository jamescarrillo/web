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
import gob.peam.web.dao.DocumentoDAO;
import gob.peam.web.dao.ProcesoExoneradoDAO;
import gob.peam.web.dao.PuestoConvDAO;
import gob.peam.web.dao.impl.CalendarioConvDAOImpl;
import gob.peam.web.dao.impl.ConvocatoriaBienDAOImpl;
import gob.peam.web.dao.impl.Convocatoria_PersDAOImpl;
import gob.peam.web.dao.impl.DocumentCalDAOImpl;
import gob.peam.web.dao.impl.DocumentoDAOImpl;
import gob.peam.web.dao.impl.ProcesoExoneradoDAOImpl;
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
@WebServlet(name = "ConvocatoriasWebAPI", urlPatterns = {
    "/convocatorias/convocatoria-de-personal",
    "/convocatorias/convocatoria-de-bienes-y-servicios",
    "/convocatorias/procesos-exonerados",
    "/convocatorias/comite-de-seleccion"})
public class ConvocatoriasWebAPI extends HttpServlet {

    @Resource(name = "jdbc/dbweb")
    private DataSource pool;
    private Gson json;
    private String jsonResponse;
    private HashMap<String, Object> parameters;
    private HashMap<String, Object> parametersAnhos;
    private HashMap<String, Object> parametersProceso;
    private HashMap<String, Object> parametersAnhosProceso;
    private HashMap<String, Object> parametersComites;
    private HashMap<String, Object> parametersAnhosComites;
    private final Log logger = LogFactory.getLog(ConvocatoriasWebAPI.class);
    private String action;

    ///CONVOCATORIAS DE PERSONAL
    private Convocatoria_PersDAO convocatoriapersDAO;
    private CalendarioConvDAO calendarioDAO;
    private DocumentCalDAO documentDAO;
    private PuestoConvDAO puestoconvDAO;

    ///CONVOCATORIAS DE BIENES
    private ConvocatoriaBienDAO convocatoriabienDAO;

    ///PROCESOS EXONERADOS
    private ProcesoExoneradoDAO procesoExoneradoDAO;

    ///COMITES DE SELECCION
    private DocumentoDAO documentoDAO;

    @Override
    public void init() throws ServletException {
        super.init(); // To change body of generated methods, choose Tools | Templates.
        //this.json = new GsonBuilder().setDateFormat("dd/MM/yyyy HH:mm:ss").create();
        this.json = new GsonBuilder().setDateFormat("dd/MM/yyyy").create();
        this.parameters = new HashMap<>();
        this.parametersAnhos = new HashMap<>();
        this.parametersProceso = new HashMap<>();
        this.parametersAnhosProceso = new HashMap<>();
        this.parametersComites = new HashMap<>();
        this.parametersAnhosComites = new HashMap<>();
        this.action = "";

        this.convocatoriapersDAO = new Convocatoria_PersDAOImpl(this.pool);
        this.calendarioDAO = new CalendarioConvDAOImpl(this.pool);
        this.documentDAO = new DocumentCalDAOImpl(this.pool);
        this.puestoconvDAO = new PuestoConvDAOImpl(this.pool);

        this.convocatoriabienDAO = new ConvocatoriaBienDAOImpl(this.pool);

        this.procesoExoneradoDAO = new ProcesoExoneradoDAOImpl(this.pool);

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
                        case "listarAnhosConvocatoriaPers":
                            procesarAnhos(new BEAN_CRUD(this.convocatoriapersDAO.getAnhos(getParametersAnhos1(request))), response);
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
                        case "listarAnhosConvocatoriaBien":
                            procesarAnhos(new BEAN_CRUD(this.convocatoriabienDAO.getAnhos(getParametersAnhos1(request))), response);
                            break;
                        default:
                            request.getRequestDispatcher("/jsp/web/convocatorias/convocatoriasbien.jsp").forward(request, response);
                            break;
                    }
                    break;
                case "/convocatorias/procesos-exonerados":
                    this.action = request.getParameter("action") == null ? "" : request.getParameter("action");
                    logger.info("--->" + this.action);
                    switch (this.action) {
                        case "paginarProceso":
                            procesarProcesoExonerado(new BEAN_CRUD(this.procesoExoneradoDAO.getPagination(getParametersProcesoExonerado(request))), response);
                            break;
                        case "listarAnhosProceso":
                            procesarAnhosProcesoExonerado(new BEAN_CRUD(this.procesoExoneradoDAO.getAnhos(getParametersAnhos2(request))), response);
                            break;
                        default:
                            request.getRequestDispatcher("/jsp/web/convocatorias/convocatoriasbien.jsp").forward(request, response);
                            break;
                    }
                    break;
                case "/convocatorias/comite-de-seleccion":
                    this.action = request.getParameter("action") == null ? "" : request.getParameter("action");
                    logger.info("----->" + this.action);
                    switch (this.action) {
                        case "paginarComite":
                            procesarComite(new BEAN_CRUD(this.documentoDAO.getPagination(getParametersComite(request))), response);
                            break;
                        case "listarAnhosComite":
                            procesarComiteAnhos(new BEAN_CRUD(this.documentoDAO.getAnhos(getParametersAnhos3(request))), response);
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

    private void procesarAnhos(BEAN_CRUD bean_crud, HttpServletResponse response) {
        try {
            this.jsonResponse = this.json.toJson(bean_crud);
            response.setContentType("application/json");
            response.getWriter().write(this.jsonResponse);
            logger.info(this.jsonResponse);
        } catch (IOException ex) {
            Logger.getLogger(GestionTransparenteAPI.class.getName()).log(Level.SEVERE, null, ex);
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

    private HashMap<String, Object> getParametersProcesoExonerado(HttpServletRequest request) {
        this.parametersProceso.clear();
        this.parametersProceso.put("FILTER", request.getParameter("txtProcesoExonerado").toLowerCase());
        if (request.getParameter("comboAnioProcesoExonerado").equals("-1")) {
            this.parametersProceso.put("SQL_ANIO", "");
        } else {
            this.parametersProceso.put("SQL_ANIO", " AND ANHO = '" + request.getParameter("comboAnioProcesoExonerado") + "' ");
        }
        this.parametersProceso.put("SQL_ORDERS", "FECHA DESC");
        this.parametersProceso.put("LIMIT",
                " LIMIT " + request.getParameter("sizePageProcesoExonerado") + " OFFSET "
                + (Integer.parseInt(request.getParameter("numberPageProcesoExonerado")) - 1)
                * Integer.parseInt(request.getParameter("sizePageProcesoExonerado")));
        return this.parametersProceso;
    }

    private HashMap<String, Object> getParametersComite(HttpServletRequest request) {
        this.parametersComites.clear();
        this.parametersComites.put("FILTER", request.getParameter("txtTituloComite").toLowerCase());
        if (request.getParameter("comboAnioComites").equals("-1")) {
            this.parametersComites.put("SQL_ANIO", "");
        } else {
            this.parametersComites.put("SQL_ANIO", "AND SUBSTRING(DOCU_FECHA_DOCX,7,4) = '" + request.getParameter("comboAnioComites") + "' ");
        }

        this.parametersComites.put("SQL_ESTADO", "");

        this.parametersComites.put("SQL_CATE_ID", " AND CATE_ID = 400");
        this.parametersComites.put("SQL_TIDO_ID", " ");
        this.parametersComites.put("SQL_ORDERS", " SUBSTRING(DOCU_FECHA_DOCX,7,4) DESC");
        this.parametersComites.put("LIMIT",
                " LIMIT " + request.getParameter("sizePageComite") + " OFFSET "
                + (Integer.parseInt(request.getParameter("numberPageComite")) - 1)
                * Integer.parseInt(request.getParameter("sizePageComite")));
        return this.parametersComites;
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

    private HashMap<String, Object> getParametersAnhos1(HttpServletRequest request) {
        this.parametersAnhos.clear();
        this.parametersAnhos.put("FILTER", "");
        if (request.getRequestURI().substring(request.getContextPath().length()).equals("/convocatorias/comite-de-seleccion")) {
            this.parametersAnhos.put("SQL_ESTADO", " AND DOCU_ESTADO = TRUE");
            this.parametersAnhos.put("SQL_CATE_ID", " AND CATE_ID = 400");
            this.parametersAnhos.put("SQL_TIDO_ID", " ");
            this.parametersAnhos.put("SQL_ORDERS", " SUBSTRING(DOCU_FECHA_DOCX,7,4) DESC");
        } else {
            if (request.getRequestURI().substring(request.getContextPath().length()).equals("/convocatorias/procesos-exonerados")) {
                this.parametersAnhos.put("SQL_ESTADO", "");
            } else {
                if (request.getParameter("comboTipoEstado").equals("-1")) {
                    this.parametersAnhos.put("SQL_ESTADO", "");
                } else {
                    this.parametersAnhos.put("SQL_ESTADO", " AND ESTADO = " + request.getParameter("comboTipoEstado") + " ");
                }
            }

            this.parametersAnhos.put("SQL_ORDERS", " ORDER BY ANHO DESC");

        }

        return this.parametersAnhos;
    }
    
    private HashMap<String, Object> getParametersAnhos2(HttpServletRequest request) {
        this.parametersAnhosProceso.clear();
        this.parametersAnhosProceso.put("FILTER", "");
        if (request.getRequestURI().substring(request.getContextPath().length()).equals("/convocatorias/comite-de-seleccion")) {
            this.parametersAnhosProceso.put("SQL_ESTADO", " AND DOCU_ESTADO = TRUE");
            this.parametersAnhosProceso.put("SQL_CATE_ID", " AND CATE_ID = 400");
            this.parametersAnhosProceso.put("SQL_TIDO_ID", " ");
            this.parametersAnhosProceso.put("SQL_ORDERS", " SUBSTRING(DOCU_FECHA_DOCX,7,4) DESC");
        } else {
            if (request.getRequestURI().substring(request.getContextPath().length()).equals("/convocatorias/procesos-exonerados")) {
                this.parametersAnhosProceso.put("SQL_ESTADO", "");
            } else {
                if (request.getParameter("comboTipoEstado").equals("-1")) {
                    this.parametersAnhosProceso.put("SQL_ESTADO", "");
                } else {
                    this.parametersAnhosProceso.put("SQL_ESTADO", " AND ESTADO = " + request.getParameter("comboTipoEstado") + " ");
                }
            }

            this.parametersAnhosProceso.put("SQL_ORDERS", " ORDER BY ANHO DESC");

        }

        return this.parametersAnhosProceso;
    }
    private HashMap<String, Object> getParametersAnhos3(HttpServletRequest request) {
        this.parametersAnhosComites.clear();
        this.parametersAnhosComites.put("FILTER", "");
        if (request.getRequestURI().substring(request.getContextPath().length()).equals("/convocatorias/comite-de-seleccion")) {
            this.parametersAnhosComites.put("SQL_ESTADO", " AND DOCU_ESTADO = TRUE");
            this.parametersAnhosComites.put("SQL_CATE_ID", " AND CATE_ID = 400");
            this.parametersAnhosComites.put("SQL_TIDO_ID", " ");
            this.parametersAnhosComites.put("SQL_ORDERS", " SUBSTRING(DOCU_FECHA_DOCX,7,4) DESC");
        } else {
            if (request.getRequestURI().substring(request.getContextPath().length()).equals("/convocatorias/procesos-exonerados")) {
                this.parametersAnhosComites.put("SQL_ESTADO", "");
            } else {
                if (request.getParameter("comboTipoEstado").equals("-1")) {
                    this.parametersAnhosComites.put("SQL_ESTADO", "");
                } else {
                    this.parametersAnhosComites.put("SQL_ESTADO", " AND ESTADO = " + request.getParameter("comboTipoEstado") + " ");
                }
            }

            this.parametersAnhosComites.put("SQL_ORDERS", " ORDER BY ANHO DESC");

        }

        return this.parametersAnhosComites;
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
            this.parameters.put("SQL_ANIO", "AND ANHO = '" + String.valueOf(request.getParameter("comboAnio")) + "' ");
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

    private void procesarProcesoExonerado(BEAN_CRUD bean_crud, HttpServletResponse response) {
        try {
            this.jsonResponse = this.json.toJson(bean_crud);
            response.setContentType("application/json");
            response.getWriter().write(this.jsonResponse);
            this.logger.info(this.jsonResponse);
        } catch (IOException ex) {
            Logger.getLogger(ConsultasWebAPI.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void procesarAnhosProcesoExonerado(BEAN_CRUD bean_crud, HttpServletResponse response) {
        try {
            this.jsonResponse = this.json.toJson(bean_crud);
            response.setContentType("application/json");
            response.getWriter().write(this.jsonResponse);
            this.logger.info(this.jsonResponse);
        } catch (IOException ex) {
            Logger.getLogger(ConsultasWebAPI.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void procesarComite(BEAN_CRUD bean_crud, HttpServletResponse response) {
        try {
            this.jsonResponse = this.json.toJson(bean_crud);
            response.setContentType("application/json");
            response.getWriter().write(this.jsonResponse);
            this.logger.info(this.jsonResponse);
        } catch (IOException ex) {
            Logger.getLogger(ConsultasWebAPI.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void procesarComiteAnhos(BEAN_CRUD bean_crud, HttpServletResponse response) {
        try {
            this.jsonResponse = this.json.toJson(bean_crud);
            response.setContentType("application/json");
            response.getWriter().write(this.jsonResponse);
            this.logger.info(this.jsonResponse);
        } catch (IOException ex) {
            Logger.getLogger(ConsultasWebAPI.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
