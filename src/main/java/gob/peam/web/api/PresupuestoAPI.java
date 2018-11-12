/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gob.peam.web.api;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import gob.peam.web.dao.FinanzaDAO;
import gob.peam.web.dao.PresupuestoDAO;
import gob.peam.web.dao.impl.FinanzaDAOImpl;
import gob.peam.web.dao.impl.PresupuestoDAOImpl;
import gob.peam.web.model.Finanza;
import gob.peam.web.model.Presupuesto;
import gob.peam.web.utilities.BEAN_CRUD;
import gob.peam.web.utilities.Utilities;
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
 * @author JhanxD
 */
@WebServlet(name = "PresupuestoAPI", urlPatterns = {"/finanzas/pendiente"})
public class PresupuestoAPI extends HttpServlet {

    @Resource(name = "jdbc/dbweb")
    private DataSource pool;
    private HttpSession session;
    private Gson json;
    private String jsonResponse;
    private HashMap<String, Object> parameters;
    private HashMap<String, Object> parametersF;
    private static final Logger LOG = Logger.getLogger(PresupuestoAPI.class.getName());
    private String action;

    private PresupuestoDAO presupuestoDAO;
    private FinanzaDAO finanzaDAO;

    @Override
    public void init() throws ServletException {
        super.init(); // To change body of generated methods, choose Tools | Templates.
        this.json = new GsonBuilder().setDateFormat("dd/MM/yyyy").create();
        this.parameters = new HashMap<>();
        this.parametersF = new HashMap<>();
        this.action = "";

        this.presupuestoDAO = new PresupuestoDAOImpl(this.pool);
        this.finanzaDAO = new FinanzaDAOImpl(this.pool);
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
            LOG.info("--->" + action);
            switch (this.action) {
                case "paginarPresupuesto":
                    procesarPresupuesto(new BEAN_CRUD(this.presupuestoDAO.getPagination(getParametersPresupuesto(request))), response);
                    break;
                case "addPresupuesto":
                    procesarPresupuesto(this.presupuestoDAO.add(getPresupuesto(request), getParametersPresupuesto(request)), response);
                    break;
                case "updatePresupuesto":
                    procesarPresupuesto(this.presupuestoDAO.update(getPresupuesto(request), getParametersPresupuesto(request)), response);
                    break;
                case "deletePresupuesto":
                    procesarPresupuesto(this.presupuestoDAO.delete(Integer.parseInt(request.getParameter("txtIdPresupuestoER")), getParametersPresupuesto(request)), response);
                    break;
                case "activatePresupuesto":
                    procesarPresupuesto(this.presupuestoDAO.activate(Integer.parseInt(request.getParameter("txtIdPresupuestoER")), getParametersPresupuesto(request)), response);                    
                    break;
                case "paginarFinanza":
                    procesarFinanza(new BEAN_CRUD(this.finanzaDAO.getPagination(getParametersFinanzas(request))), response);
                    break;
                case "addFinanza":
                    procesarFinanza(this.finanzaDAO.add(getFinanza(request), getParametersFinanzas(request)), response);
                    break;
                case "updateFinanza":
                    procesarFinanza(this.finanzaDAO.update(getFinanza(request), getParametersFinanzas(request)), response);
                    break;
                case "deleteFinanza":
                    procesarFinanza(this.finanzaDAO.delete(Integer.parseInt(request.getParameter("txtIdFinanzaER")), getParametersFinanzas(request)), response);
                    break;
                case "activateFinanza":
                    procesarFinanza(this.finanzaDAO.cambiarEstado(Integer.parseInt(request.getParameter("txtIdFinanzaER")), Boolean.parseBoolean(request.getParameter("txtEstadoFinanzaER")), getParametersFinanzas(request)), response);
                    break;
                default:
                    request.getRequestDispatcher("/jsp/gc/finanzas/presupuesto.jsp").forward(request, response);
                    break;
            }
        } catch (SQLException ex) {
            Logger.getLogger(PresupuestoAPI.class.getName()).log(Level.SEVERE, null, ex);
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

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private void procesarPresupuesto(BEAN_CRUD beanCrud, HttpServletResponse response) {
        try {
            this.jsonResponse = this.json.toJson(beanCrud);
            response.setContentType("application/json");
            response.getWriter().write(this.jsonResponse);
            LOG.info(this.jsonResponse);
        } catch (IOException ex) {
            Logger.getLogger(PresupuestoAPI.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private HashMap<String, Object> getParametersPresupuesto(HttpServletRequest request) {
        this.parameters.clear();
        this.parameters.put("FILTER", request.getParameter("txtTituloPresupuesto").toLowerCase());
        String tipo = "comboAnioPresupuesto" + request.getParameter("DatoTipo");
        if (request.getParameter(tipo).equals("-1")) {
            this.parameters.put("SQL_ANIO", "");
        } else {
            this.parameters.put("SQL_ANIO", "AND ANHO = '" + request.getParameter(tipo) + "' ");
        }
        if (request.getParameter("comboTipoListaPresupuesto").equals("-1")) {
            this.parameters.put("SQL_ESTADO", "");
        } else {
            this.parameters.put("SQL_ESTADO", "AND ESTADO = " + request.getParameter("comboTipoListaPresupuesto") + " ");
        }
        if (request.getParameter("action").equals("activatePresupuesto")) {
            if (request.getParameter("txtEstadoER").equals("true")) {
                this.parameters.put("ESTADOP", "true");
            } else {
                this.parameters.put("ESTADOP", "false");
            }
        }
        this.parameters.put("SQL_TIDO_ID", "AND TIPO = " + request.getParameter("DatoTipo"));
        this.parameters.put("SQL_ORDERS", "FECHA_APROBACION DESC");
        this.parameters.put("LIMIT",
                " LIMIT " + request.getParameter("sizePagePresupuesto") + " OFFSET "
                + (Integer.parseInt(request.getParameter("numberPagePresupuesto")) - 1)
                * Integer.parseInt(request.getParameter("sizePagePresupuesto")));
        return this.parameters;
    }

    private Presupuesto getPresupuesto(HttpServletRequest request) {
        Presupuesto presupuesto = new Presupuesto();
        if (request.getParameter("action").equals("updatePresupuesto")) {
            presupuesto.setId(Integer.parseInt(request.getParameter("txtIdPresupuestoER")));
        }
        presupuesto.setAnho(request.getParameter("txtFechaAprobacionER").substring(6, 10));
        presupuesto.setDescripcion(request.getParameter("txtDescripcionER"));
        presupuesto.setDocu_id(Integer.parseInt(request.getParameter("txtDocuIdER")));
        presupuesto.setEstado(Boolean.parseBoolean(request.getParameter("txtEstadoER")));
        presupuesto.setFecha_aprobacion(Utilities.getDateSQLFORMAT(request.getParameter("txtFechaAprobacionER"), "dd/MM/yyyy"));
        presupuesto.setResolucion_aprobacion(request.getParameter("txtResolucionAprobacionER"));
        presupuesto.setTipo(Integer.parseInt(request.getParameter("txtTipoER")));
        presupuesto.setTitulo_formato(request.getParameter("txtTituloFormatoER"));
        presupuesto.setUbicacion(request.getParameter("txtUbicacionER"));
        return presupuesto;
    }
    
    private void procesarFinanza(BEAN_CRUD beanCrud, HttpServletResponse response) {
        try {
            this.jsonResponse = this.json.toJson(beanCrud);
            response.setContentType("application/json");
            response.getWriter().write(this.jsonResponse);
            LOG.info(this.jsonResponse);
        } catch (IOException ex) {
            Logger.getLogger(FinanzaAPI.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private HashMap<String, Object> getParametersFinanzas(HttpServletRequest request) {
        this.parametersF.clear();
        this.parametersF.put("FILTER", request.getParameter("txtDescripcionFinanza").toLowerCase());
        String tipo = "comboAnioFinanza" + request.getParameter("DatoTipoFinanza");
        if (request.getParameter(tipo).equals("-1")) {
            this.parametersF.put("SQL_ANIO", "");
        } else {
            this.parametersF.put("SQL_ANIO", "AND ANHO = '" + request.getParameter(tipo) + "' ");
        }
        if (request.getParameter("comboTipoListaFinanza").equals("-1")) {
            this.parametersF.put("SQL_ESTADO", "");
        } else {
            this.parametersF.put("SQL_ESTADO", "AND ESTADO = " + request.getParameter("comboTipoListaFinanza") + " ");
        }
        this.parametersF.put("SQL_TIPO", "AND TIPO = " + request.getParameter("DatoTipoFinanza"));

        this.parametersF.put("SQL_ORDERS", "ANHO DESC");
        this.parametersF.put("LIMIT",
                " LIMIT " + request.getParameter("sizePageFinanza") + " OFFSET "
                + (Integer.parseInt(request.getParameter("numberPageFinanza")) - 1)
                * Integer.parseInt(request.getParameter("sizePageFinanza")));
        return this.parametersF;
    }

    private Finanza getFinanza(HttpServletRequest request) {
        Finanza finanza = new Finanza();
        if (request.getParameter("action").equals("updateFinanza")) {
            finanza.setId(Integer.parseInt(request.getParameter("txtIdFinanzaER")));
            finanza.setDescripcion(request.getParameter("txtDescripcionFinanzaER"));
            finanza.setFecha(request.getParameter("txtFechaFinanzaER")); // -> dd/MM/yyyy
        } else {
            finanza.setTipo(Integer.parseInt(request.getParameter("txtTipoFinanzaER")));
            finanza.setAnho(request.getParameter("txtAnhoFinanzaER"));
            finanza.setMes(request.getParameter("txtMesFinanzaER"));
            finanza.setTitulo_formato(request.getParameter("txtTituloFinanzaER"));
            finanza.setDocumento(request.getParameter("txtDocumentoFinanzaER"));
            finanza.setDescripcion(request.getParameter("txtDescripcionFinanzaER"));
            finanza.setUbicacion(request.getParameter("txtUbicacionFinanzaER"));
            finanza.setEstado(Boolean.parseBoolean(request.getParameter("txtEstadoFinanzaER")));
            finanza.setDocu_id(Integer.parseInt(request.getParameter("txtDocu_idFinanzaER")));
            finanza.setFecha(request.getParameter("txtFechaFinanzaER")); // -> dd/MM/yyyy
        }
        return finanza;
    }

}
