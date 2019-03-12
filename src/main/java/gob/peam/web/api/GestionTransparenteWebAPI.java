/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gob.peam.web.api;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import gob.peam.web.dao.DocumentoDAO;
import gob.peam.web.dao.FinanzaDAO;
import gob.peam.web.dao.PenalidadDAO;
import gob.peam.web.dao.PresupuestoDAO;
import gob.peam.web.dao.ViaticoDAO;
import gob.peam.web.dao.impl.DocumentoDAOImpl;
import gob.peam.web.dao.impl.FinanzaDAOImpl;
import gob.peam.web.dao.impl.PenalidadDAOImpl;
import gob.peam.web.dao.impl.PresupuestoDAOImpl;
import gob.peam.web.dao.impl.ViaticoDAOImpl;
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
    "/gestiontransparente/presupuestos-y-finanzas",
    "/gestiontransparente/proyectos-de-inversion",
    "/gestiontransparente/agenda-institucional",
    "/gestiontransparente/informacion-adicional",})
public class GestionTransparenteWebAPI extends HttpServlet {

    @Resource(name = "jdbc/dbweb")
    private DataSource pool;
    private Gson json;
    private String jsonResponse;
    private String jsonResponseFinanza;
    private String jsonResponsePenalidad;
    private HashMap<String, Object> parameters;
    private HashMap<String, Object> parametersAnhiosDocumentos;
    private HashMap<String, Object> JSONROOT;
    private HashMap<String, Object> parametersF;
    private HashMap<String, Object> parametersF2;
    private HashMap<String, Object> parametersPenalidad;
    private static final Logger LOG = Logger.getLogger(GestionTransparenteWebAPI.class.getName());
    private String action;

    private DocumentoDAO documentoDAO;
    private PresupuestoDAO presupuestoDAO;
    private FinanzaDAO finanzaDAO;
    private PenalidadDAO penalidadDAO;
    private ViaticoDAO viaticoDAO;

    @Override
    public void init() throws ServletException {
        super.init(); // To change body of generated methods, choose Tools | Templates.
        this.json = new GsonBuilder().setDateFormat("dd/MM/yyyy").create();
        this.parameters = new HashMap<>();
        this.parametersAnhiosDocumentos = new HashMap<>();
        this.JSONROOT = new HashMap<>();
        this.parametersF = new HashMap<>();
        this.parametersF2 = new HashMap<>();
        this.parametersPenalidad = new HashMap<>();
        this.action = "";

        this.documentoDAO = new DocumentoDAOImpl(this.pool);
        this.presupuestoDAO = new PresupuestoDAOImpl(this.pool);
        this.finanzaDAO = new FinanzaDAOImpl(this.pool);
        this.penalidadDAO = new PenalidadDAOImpl(this.pool);
        this.viaticoDAO = new ViaticoDAOImpl(this.pool);
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
                case "getDataAdquisiciones2":
                    procesarDataAdquisiciones2(request, response);
                    break;
                case "paginarDocumentos":
                    procesarDocumento(new BEAN_CRUD(this.documentoDAO.getPagination(getParametersDocumentos(request))), response);
                    break;
                case "paginarPresupuesto":
                    procesarPresupuesto(new BEAN_CRUD(this.presupuestoDAO.getPagination(getParametersPresupuesto(request))), response);
                    break;
                case "paginarFinanza":
                    procesarFinanza(new BEAN_CRUD(this.finanzaDAO.getPagination(getParametersFinanzas(request))), response);
                    break;
                case "paginarFinanza2":
                    procesarFinanza(new BEAN_CRUD(this.finanzaDAO.getPagination(getParametersFinanzas2(request))), response);
                    break;
                case "paginarPenalidad":
                    procesarPenalidad(new BEAN_CRUD(this.penalidadDAO.getPagination(getParametersPenalidad(request))), response);
                    break;
                case "paginarViatico":
                    procesarViatico(new BEAN_CRUD(this.viaticoDAO.getPagination(getParametersViatico(request))), response);
                    break;
                case "getCategoriasDoc":
                    procesarCategoriaDOC(response);
                    break;
                case "listarAnhos":
                    procesarAnhios(new BEAN_CRUD(this.documentoDAO.getAnhos(getParametersAnhios(request))), response);
                    break;
                case "listarAnhosPenalidad":
                    procesarAnhios(new BEAN_CRUD(this.penalidadDAO.getAnhos(getParametersAnhiosPenalidad(request))), response);
                    break;
                case "listarAnhosViatico":
                    procesarAnhios(new BEAN_CRUD(this.viaticoDAO.getAnhos(getParametersAnhosyMES(request, 1), 1)), response);
                    break;
                case "listarMesViatico":
                    procesarAnhios(new BEAN_CRUD(this.viaticoDAO.getAnhos(getParametersAnhosyMES(request, 2), 2)), response);
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

    private void procesarDataAdquisiciones2(HttpServletRequest request, HttpServletResponse response) {
        try {
            this.JSONROOT.clear();
            this.JSONROOT.put("DATA_DOCUMENTO", this.documentoDAO.getPagination(getParametersDocumentos(request)));
            this.JSONROOT.put("DATA_PENALIDAD", this.penalidadDAO.getPagination(getParametersPenalidad(request)));
            this.JSONROOT.put("DATA_VIATICO", this.viaticoDAO.getPagination(getParametersViatico(request)));
            response.setContentType("application/json");
            this.jsonResponse = json.toJson(this.JSONROOT);
            response.getWriter().write(this.jsonResponse);
            LOG.info(this.jsonResponse);
        } catch (IOException | SQLException ex) {
            Logger.getLogger(GestionTransparenteAPI.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void procesarCategoriaDOC(HttpServletResponse response) {
        try {
            HashMap<String, Object> JSON_CA = new HashMap<>();
            JSON_CA.put("DATA_CATEGORIAS", this.documentoDAO.listarCategorias());
            response.setContentType("application/json");
            String jsonResponseCat = json.toJson(JSON_CA);
            response.getWriter().write(jsonResponseCat);
            LOG.info(jsonResponseCat);
        } catch (IOException | SQLException ex) {
            Logger.getLogger(GestionTransparenteAPI.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(GestionTransparenteWebAPI.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void procesarAnhios(BEAN_CRUD beanCrud, HttpServletResponse response) {
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
        String complemento = request.getParameter("txtComplemento") == null ? "" : request.getParameter("txtComplemento");
        this.parameters.put("FILTER", request.getParameter("txtTituloDocumento" + complemento).toLowerCase());
        if (request.getParameter("comboAnioDocumento" + complemento).equals("-1")) {
            this.parameters.put("SQL_ANIO", "");
        } else {
            this.parameters.put("SQL_ANIO", "AND SUBSTRING(DOCU_FECHA_DOCX,7,4) = '" + request.getParameter("comboAnioDocumento" + complemento) + "' ");
        }
        this.parameters.put("SQL_ESTADO", "AND DOCU_ESTADO = TRUE");
        this.parameters.put("SQL_CATE_ID", " " + getCategoriaIdFinal(request));
        this.parameters.put("SQL_TIDO_ID", " " + getTidoIdFinal(request));
        //this.parameters.put("SQL_ORDERS", "TO_DATE(DOCU_FECHA_DOCX,'DD/MM/YYYY') DESC");
        this.parameters.put("SQL_ORDERS", "DOCU_TITULO ASC");
        this.parameters.put("LIMIT",
                " LIMIT " + request.getParameter("sizePageDocumentos" + complemento) + " OFFSET "
                + (Integer.parseInt(request.getParameter("numberPageDocumentos" + complemento)) - 1)
                * Integer.parseInt(request.getParameter("sizePageDocumentos" + complemento)));
        return this.parameters;
    }

    private HashMap<String, Object> getParametersAnhiosPenalidad(HttpServletRequest request) {
        this.parametersPenalidad.clear();
        this.parametersPenalidad.put("FILTER","");
        this.parametersPenalidad.put("SQL_ORDERS", " ANHO DESC");

        return this.parametersPenalidad;
    }
    private HashMap<String, Object> getParametersAnhios(HttpServletRequest request) {
        this.parametersAnhiosDocumentos.clear();
        this.parametersAnhiosDocumentos.put("FILTER", "");
        this.parametersAnhiosDocumentos.put("SQL_ESTADO", "AND DOCU_ESTADO = TRUE");
        this.parametersAnhiosDocumentos.put("SQL_CATE_ID", getCategoriaIdFinal(request));
        this.parametersAnhiosDocumentos.put("SQL_TIDO_ID", " " + getTidoIdFinal(request));
        //this.parameters.put("SQL_ORDERS", "TO_DATE(DOCU_FECHA_DOCX,'DD/MM/YYYY') DESC");
        this.parametersAnhiosDocumentos.put("SQL_ORDERS", " SUBSTRING(DOCU_FECHA_DOCX,7,4) DESC");
        return this.parametersAnhiosDocumentos;
    }

    private String getCategoriaIdFinal(HttpServletRequest request) {
        String categoria_id;
        if (request.getParameter("cate_id").equals("100")) {
            categoria_id = "AND CATE_ID =" + request.getParameter("cate_id");
        } else {
            categoria_id = "AND DOCU_FECHA_DOCX != ''  AND CATE_ID =" + request.getParameter("cate_id");
        }
        return categoria_id;
    }

    private String getTidoIdFinal(HttpServletRequest request) {
        String tido_id = "";
        if (request.getParameter("tido_id") != null) {
            if (request.getParameter("cate_id").equals("100")) {
                tido_id = "AND TIDO_ID = " + request.getParameter("tido_id");
            }
        }
        return tido_id;
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
            case "/gestiontransparente/presupuestos-y-finanzas":
                page = "presupuestosFinanzas.jsp";
                break;
            default:
                page = "../../../estamos_trabajando_web.jsp";
                break;
        }
        return page;
    }

    private void procesarPresupuesto(BEAN_CRUD beanCrud, HttpServletResponse response) {
        try {
            this.jsonResponse = this.json.toJson(beanCrud);
            response.setContentType("application/json");
            response.getWriter().write(this.jsonResponse);
            LOG.info(this.jsonResponse);
        } catch (IOException ex) {
            Logger.getLogger(GestionTransparenteWebAPI.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private HashMap<String, Object> getParametersPresupuesto(HttpServletRequest request) {
        this.parameters.clear();
        this.parameters.put("FILTER", request.getParameter("txtPresupuestoInstitucional").toLowerCase());
        if (request.getParameter("comboAnioPresupuestoInstitucional").equals("-1")) {
            this.parameters.put("SQL_ANIO", "");
        } else {
            this.parameters.put("SQL_ANIO", "AND ANHO = '" + request.getParameter("comboAnioPresupuestoInstitucional") + "' ");
        }
        this.parameters.put("SQL_ESTADO", "AND ESTADO = TRUE");
        if (request.getParameter("comboTipoPresupuestoInstitucional").equals("-1")) {
            this.parameters.put("SQL_TIDO_ID", "");
        } else {
            this.parameters.put("SQL_TIDO_ID", "AND TIPO = " + request.getParameter("comboTipoPresupuestoInstitucional"));
        }
        this.parameters.put("SQL_ORDERS", "FECHA_APROBACION DESC");
        this.parameters.put("LIMIT",
                " LIMIT " + request.getParameter("sizePagePresupuestoInstitucional") + " OFFSET "
                + (Integer.parseInt(request.getParameter("numberPagePresupuestoInstitucional")) - 1)
                * Integer.parseInt(request.getParameter("sizePagePresupuestoInstitucional")));
        return this.parameters;
    }

    private void procesarFinanza(BEAN_CRUD beanCrud, HttpServletResponse response) {
        try {
            this.jsonResponseFinanza = this.json.toJson(beanCrud);
            response.setContentType("application/json");
            response.getWriter().write(this.jsonResponseFinanza);
            LOG.info(this.jsonResponseFinanza);
        } catch (IOException ex) {
            Logger.getLogger(FinanzaAPI.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    private HashMap<String, Object> getParametersAnhosyMES(HttpServletRequest request, int tipo) {
        this.parameters.clear();
        this.parameters.put("FILTER", "");
        if (tipo == 1) {
            this.parameters.put("SQL_ESTADO", " AND ESTADO = TRUE ");
            this.parameters.put("SQL_ORDERS", " ANHO DESC");
        } else {
            this.parameters.put("SQL_ESTADO", " AND ESTADO = TRUE AND ANHO ='" + String.valueOf(request.getParameter("anho") + "'"));
            this.parameters.put("SQL_ORDERS", " MES DESC");
        }

        return this.parameters;
    }

    private HashMap<String, Object> getParametersFinanzas(HttpServletRequest request) {
        this.parametersF.clear();
        this.parametersF.put("FILTER", request.getParameter("txtInfoFinanciera").toLowerCase());
        if (request.getParameter("comboAnioInfoFinanciera").equals("-1")) {
            this.parametersF.put("SQL_ANIO", "");
        } else {
            this.parametersF.put("SQL_ANIO", "AND ANHO = '" + request.getParameter("comboAnioInfoFinanciera") + "' ");
        }
        this.parametersF.put("SQL_ESTADO", "AND ESTADO = TRUE");
        if (request.getParameter("comboCategoriaInfoFinanciera").equals("-1")) {
            this.parametersF.put("SQL_TIPO", "");
        } else {
            this.parametersF.put("SQL_TIPO", "AND TIPO = " + request.getParameter("comboCategoriaInfoFinanciera"));
        }
        this.parametersF.put("SQL_ORDERS", "ANHO DESC");
        this.parametersF.put("LIMIT",
                " LIMIT " + request.getParameter("sizePageInfoFinanciera") + " OFFSET "
                + (Integer.parseInt(request.getParameter("numberPageInfoFinanciera")) - 1)
                * Integer.parseInt(request.getParameter("sizePageInfoFinanciera")));
        return this.parametersF;
    }

    private HashMap<String, Object> getParametersFinanzas2(HttpServletRequest request) {
        this.parametersF2.clear();
        this.parametersF2.put("FILTER", request.getParameter("txtInfoPresupuestal").toLowerCase());
        if (request.getParameter("comboAnioInfoPresupuestal").equals("-1")) {
            this.parametersF2.put("SQL_ANIO", "");
        } else {
            this.parametersF2.put("SQL_ANIO", "AND ANHO = '" + request.getParameter("comboAnioInfoPresupuestal") + "' ");
        }
        this.parametersF2.put("SQL_ESTADO", "AND ESTADO = TRUE");
        if (request.getParameter("comboCategoriaInfoPresupuestal").equals("-1")) {
            this.parametersF2.put("SQL_TIPO", "");
        } else {
            this.parametersF2.put("SQL_TIPO", "AND TIPO = " + request.getParameter("comboCategoriaInfoPresupuestal"));
        }
        this.parametersF2.put("SQL_ORDERS", "ANHO DESC");
        this.parametersF2.put("LIMIT",
                " LIMIT " + request.getParameter("sizePageInfoPresupuestal") + " OFFSET "
                + (Integer.parseInt(request.getParameter("numberPageInfoPresupuestal")) - 1)
                * Integer.parseInt(request.getParameter("sizePageInfoPresupuestal")));
        return this.parametersF2;
    }

    private void procesarPenalidad(BEAN_CRUD bean_crud, HttpServletResponse response) {
        try {
            this.jsonResponsePenalidad = this.json.toJson(bean_crud);
            response.setContentType("application/json");
            response.getWriter().write(this.jsonResponsePenalidad);
            LOG.info(this.jsonResponsePenalidad);
        } catch (IOException ex) {
            Logger.getLogger(PenalidadAPI.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private HashMap<String, Object> getParametersPenalidad(HttpServletRequest request) {
        this.parametersPenalidad.clear();
        this.parametersPenalidad.put("FILTER", request.getParameter("txtPenalidad").toLowerCase());
        if (request.getParameter("comboAnioPenalidad").equals("-1")) {
            this.parametersPenalidad.put("SQL_ANIO", "");
        } else {
            this.parametersPenalidad.put("SQL_ANIO", "AND ANHO = '" + request.getParameter("comboAnioPenalidad") + "' ");
        }

        this.parametersPenalidad.put("SQL_ORDERS", "CONTRATISTA, ANHO DESC");
        this.parametersPenalidad.put("LIMIT",
                " LIMIT " + request.getParameter("sizePagePenalidad") + " OFFSET "
                + (Integer.parseInt(request.getParameter("numberPagePenalidad")) - 1)
                * Integer.parseInt(request.getParameter("sizePagePenalidad")));
        return this.parametersPenalidad;
    }

    private void procesarViatico(BEAN_CRUD beanCrud, HttpServletResponse response) {
        try {
            this.jsonResponse = this.json.toJson(beanCrud);
            response.setContentType("application/json");
            response.getWriter().write(this.jsonResponse);
            LOG.info(this.jsonResponse);
        } catch (IOException ex) {
            Logger.getLogger(PublicacionAPI.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private HashMap<String, Object> getParametersViatico(HttpServletRequest request) {
        this.parameters.clear();
        this.parameters.put("FILTER", request.getParameter("txtTituloViatico").toLowerCase());
        if (request.getParameter("comboAnioViatico").equals("-1")) {
            this.parameters.put("SQL_ANIO", " AND ESTADO = TRUE ");
        } else {
            this.parameters.put("SQL_ANIO", " AND ESTADO = TRUE AND ANHO = '" + request.getParameter("comboAnioViatico") + "' AND MES = '" + request.getParameter("comboMesesViatico") + "'");
        }
        this.parameters.put("SQL_ORDERS", "ID DESC");
        this.parameters.put("LIMIT",
                " LIMIT " + request.getParameter("sizePageViatico") + " OFFSET "
                + (Integer.parseInt(request.getParameter("numberPageViatico")) - 1)
                * Integer.parseInt(request.getParameter("sizePageViatico")));
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
