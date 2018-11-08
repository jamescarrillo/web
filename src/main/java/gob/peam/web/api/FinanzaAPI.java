/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gob.peam.web.api;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import gob.peam.web.dao.FinanzaDAO;
import gob.peam.web.dao.impl.FinanzaDAOImpl;
import gob.peam.web.model.Finanza;
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
@WebServlet(name = "FinanzaAPI", urlPatterns = {
    "/finanzas/operaciones",
    "/finanzas/patrimonio",
    "/finanzas/flujoefectivo",
    "/finanzas/gestion",
    "/finanzas/saldos"})
public class FinanzaAPI extends HttpServlet {

    @Resource(name = "jdbc/dbweb")
    private DataSource pool;
    private HttpSession session;
    private Gson json;
    private String jsonResponse;
    private HashMap<String, Object> parameters;
    private static final Logger LOG = Logger.getLogger(FinanzaAPI.class.getName());
    private String action;

    private FinanzaDAO finanzaDAO;

    @Override
    public void init() throws ServletException {
        super.init(); // To change body of generated methods, choose Tools | Templates.
        this.json = new GsonBuilder().setDateFormat("dd/MM/yyyy").create();
        this.parameters = new HashMap<>();
        this.action = "";

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
            LOG.info(action);
            switch (this.action) {
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
                    request.setAttribute("titleFinanzas", getTitleFinanzas(request));
                    request.getRequestDispatcher("/jsp/gc/finanzas/finanza.jsp").forward(request, response);
                    break;
            }
        } catch (SQLException ex) {
            Logger.getLogger(FinanzaAPI.class.getName()).log(Level.SEVERE, null, ex);
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
        this.parameters.clear();
        this.parameters.put("FILTER", request.getParameter("txtDescripcionFinanza").toLowerCase());
        if (request.getParameter("comboAnioFinanza").equals("-1")) {
            this.parameters.put("SQL_ANIO", "");
        } else {
            this.parameters.put("SQL_ANIO", "AND SUBSTRING(FECHA,7,4) = '" + request.getParameter("comboAnioFinanza") + "' ");
        }
        if (request.getParameter("comboTipoListaFinanza").equals("-1")) {
            this.parameters.put("SQL_ESTADO", "");
        } else {
            this.parameters.put("SQL_ESTADO", "AND ESTADO = " + request.getParameter("comboTipoListaFinanza") + " ");
        }
        this.parameters.put("SQL_TIPO", "AND TIPO = " + getTipo(request));

        this.parameters.put("SQL_ORDERS", "TO_DATE(FECHA,'DD/MM/YYYY') DESC");
        this.parameters.put("LIMIT",
                " LIMIT " + request.getParameter("sizePageFinanza") + " OFFSET "
                + (Integer.parseInt(request.getParameter("numberPageFinanza")) - 1)
                * Integer.parseInt(request.getParameter("sizePageFinanza")));
        return this.parameters;
    }

    private Finanza getFinanza(HttpServletRequest request) {
        Finanza finanza = new Finanza();
        if (request.getParameter("action").equals("updateFinanza")) {
            finanza.setId(Integer.parseInt(request.getParameter("txtIdFinanzaER")));
            finanza.setDescripcion(request.getParameter("txtDescripcionFinanzaER"));
            finanza.setFecha(request.getParameter("txtFechaFinanzaER")); // -> dd/MM/yyyy
        } else {
            finanza.setTipo(Integer.parseInt(getTipo(request)));
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

    private String getTitleFinanzas(HttpServletRequest request) {
        String title = "";
        switch (request.getRequestURI().substring(request.getContextPath().length())) {
            case "/finanzas/patrimonio":
                title = "Estados de Cambio en el Patrimonio Neto";
                break;
            case "/finanzas/flujoefectivo":
                title = "Estados de Flujo de Efectivo";
                break;
            case "/finanzas/gestion":
                title = "Estados de Gestión";
                break;
            case "/finanzas/saldos":
                title = "Saldos de Balance";
                break;
        }
        return title;
    }

    private String getTipo(HttpServletRequest request) {
        String tipo = "";
        switch (request.getParameter("url_finanzas")) {
            case "/finanzas/patrimonio":
                tipo = "6";
                break;
            case "/finanzas/flujoefectivo":
                tipo = "7";
                break;
            case "/finanzas/gestion":
                tipo = "8";
                break;
            case "/finanzas/saldos":
                tipo = "5";
                break;
        }
        return tipo;
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
