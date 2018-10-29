/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gob.peam.web.api;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import gob.peam.web.dao.AgendaDAO;
import gob.peam.web.dao.impl.AgendaDAOImpl;
import gob.peam.web.model.Agenda;
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
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 *
 * @author JamesCarrillo
 */
@WebServlet(name = "AgendaInsitucionalAPI", urlPatterns = {
    "/agendainstitucional/operaciones",
    "/agendainstitucional/agendagerencial",
    "/agendainstitucional/directordesarrollo",
    "/agendainstitucional/directorinfraestructura",
    "/agendainstitucional/directormanejoambiental"
})
public class AgendaInsitucionalAPI extends HttpServlet {

    @Resource(name = "jdbc/dbweb")
    private DataSource pool;
    private HttpSession session;
    private Gson json;
    private String jsonResponse;
    private HashMap<String, Object> parameters;
    private final Log LOG = LogFactory.getLog(AgendaInsitucionalAPI.class);
    private String action;

    private AgendaDAO agendaDAO;

    @Override
    public void init() throws ServletException {
        super.init(); // To change body of generated methods, choose Tools | Templates.
        this.json = new GsonBuilder().setDateFormat("dd/MM/yyyy").create();
        this.parameters = new HashMap<>();
        this.action = "";

        this.agendaDAO = new AgendaDAOImpl(this.pool);
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
                case "paginarAgenda":
                    procesarAgenda(new BEAN_CRUD(this.agendaDAO.getPagination(getParametersAgenda(request))), response);
                    break;
                case "addAgenda":
                    procesarAgenda(this.agendaDAO.add(getAgenda(request), getParametersAgenda(request)), response);
                    break;
                case "updateAgenda":
                    procesarAgenda(this.agendaDAO.update(getAgenda(request), getParametersAgenda(request)), response);
                    break;
                case "deleteAgenda":
                    procesarAgenda(this.agendaDAO.delete(Integer.parseInt(request.getParameter("txtIdER")), getParametersAgenda(request)), response);
                    break;
                case "activateAgenda":
                    procesarAgenda(this.agendaDAO.activate(Long.parseLong(request.getParameter("txtIdER")), getParametersAgenda(request)), response);
                    break;
                default:
                    request.getRequestDispatcher("/jsp/gc/agenda_institucional/agendainstitucional.jsp").forward(request, response);
                    break;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AgendaInsitucionalAPI.class.getName()).log(Level.SEVERE, null, ex);
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
        session = request.getSession();
        if (session.getAttribute("user") == null) {
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

    private void procesarAgenda(BEAN_CRUD beanCrud, HttpServletResponse response) {
        try {
            this.jsonResponse = this.json.toJson(beanCrud);
            response.setContentType("application/json");
            response.getWriter().write(this.jsonResponse);
            LOG.info(this.jsonResponse);
        } catch (IOException ex) {
            Logger.getLogger(DocumentoWebAPI.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private HashMap<String, Object> getParametersAgenda(HttpServletRequest request) {
        this.parameters.clear();
        this.parameters.put("FILTER", request.getParameter("txtActividad").toLowerCase());
        switch (request.getParameter("comboFecha")) {
            case "dia":
                this.parameters.put("SQL_FECHA", "AND EXTRACT(DAY FROM FECHA_INICIO)=" + request.getParameter("tFecha") + " ");
                break;
            case "mes":
                this.parameters.put("SQL_FECHA", "AND EXTRACT(MONTH FROM FECHA_INICIO)=" + request.getParameter("tFecha") + " ");
                break;
            case "anho":
                this.parameters.put("SQL_FECHA", "AND EXTRACT(YEAR FROM FECHA_INICIO)=" + request.getParameter("tFecha") + " ");
                break;
            case "todo":
                this.parameters.put("SQL_FECHA", "");
                break;
        }

        if (request.getParameter("txtCalendario").equals("")) {
            this.parameters.put("SQL_CALENDARIO", "");
        } else {
            this.parameters.put("SQL_CALENDARIO", "OR FECHA_INICIO = '" + Utilities.getDateSQLFORMAT(request.getParameter("txtCalendario"), "dd/MM/yyyy") + "' ");
        }
        if (request.getParameter("comboTipoListaAgenda").equals("-1")) {
            this.parameters.put("SQL_ESTADO", "");
        } else {
            this.parameters.put("SQL_ESTADO", "AND ESTADO = " + request.getParameter("comboTipoListaAgenda") + " ");
        }
        if (request.getParameter("txtEstadoER").equals("true")) {
            this.parameters.put("ESTADO", "false");
        } else {
            this.parameters.put("ESTADO", "true");
        }
        this.parameters.put("SQL_TIPO", "AND TIPO = " + getTipo(request));
        this.parameters.put("SQL_ORDERS", "FECHA_INICIO DESC");
        this.parameters.put("LIMIT",
                " LIMIT " + request.getParameter("sizePageAgenda") + " OFFSET "
                + (Integer.parseInt(request.getParameter("numberPageAgenda")) - 1)
                * Integer.parseInt(request.getParameter("sizePageAgenda")));
        return this.parameters;
    }

    private Agenda getAgenda(HttpServletRequest request) {
        Agenda documento = new Agenda();
        if (request.getParameter("action").equals("updateAgenda")) {
            documento.setId(Integer.parseInt(request.getParameter("txtIdER")));
        }
        documento.setActividad(request.getParameter("txtActividadER"));
        documento.setCiudad(request.getParameter("txtCiudadER"));
        documento.setEstado(Boolean.FALSE);
        documento.setFecha_inicio(Utilities.getDateSQLFORMAT(request.getParameter("datePickerFechaER"), "dd/MM/yyyy"));
        documento.setHora_final(request.getParameter("txtHoraFinER"));
        documento.setHora_inicio(request.getParameter("txtHoraInicioER"));
        documento.setLugar(request.getParameter("txtLugarER"));
        documento.setTipo(Integer.parseInt(getTipo(request)));
        return documento;
    }

    private String getTipo(HttpServletRequest request) {
        String tipo = "0"; //LOS ELIMINADOS
        switch (request.getParameter("urlAgenda")) {
            case "/agendainstitucional/agendagerencial":
                tipo = "1";
                break;
            case "/agendainstitucional/directordesarrollo":
                tipo = "3";
                break;
            case "/agendainstitucional/directorinfraestructura":
                tipo = "2";
                break;
            case "/agendainstitucional/directormanejoambiental":
                tipo = "4";
                break;

        }
        return tipo;
    }

}
