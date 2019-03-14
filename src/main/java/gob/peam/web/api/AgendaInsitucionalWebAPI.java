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
import javax.sql.DataSource;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 *
 * @author JamesCarrillo
 */
@WebServlet(name = "AgendaInsitucionalWebAPI", urlPatterns = {
    "/agendainstitucional/operacionesweb",})
public class AgendaInsitucionalWebAPI extends HttpServlet {

    @Resource(name = "jdbc/dbweb")
    private DataSource pool;
    private Gson json;
    private String jsonResponse;
    private HashMap<String, Object> parameters;
    private final Log LOG = LogFactory.getLog(AgendaInsitucionalWebAPI.class);
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
            }
        } catch (SQLException ex) {
            Logger.getLogger(AgendaInsitucionalWebAPI.class.getName()).log(Level.SEVERE, null, ex);
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

    private void procesarAgenda(BEAN_CRUD beanCrud, HttpServletResponse response) {
        try {
            this.jsonResponse = this.json.toJson(beanCrud);
            response.setContentType("application/json");
            response.getWriter().write(this.jsonResponse);
            LOG.info(this.jsonResponse);
        } catch (IOException ex) {
            Logger.getLogger(AgendaInsitucionalWebAPI.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private HashMap<String, Object> getParametersAgenda(HttpServletRequest request) {
        this.parameters.clear();
        String complemento = request.getParameter("complemento");
        this.parameters.put("FILTER", request.getParameter("txtActividad"+complemento).toLowerCase());
        switch (request.getParameter("comboFecha")) {
            case "todo":
                this.parameters.put("SQL_FECHA", "");
                break;
        }
        if (request.getParameter("txtCalendario"+complemento).equals("")) {
            this.parameters.put("SQL_CALENDARIO", "");
        } else {
            this.parameters.put("SQL_CALENDARIO", " AND FECHA_INICIO = '" + Utilities.getDateSQLFORMAT(request.getParameter("txtCalendario"+complemento), "dd/MM/yyyy") + "' ");
        }
        this.parameters.put("SQL_ESTADO", "AND ESTADO = true ");
        this.parameters.put("SQL_TIPO", "AND TIPO = " + request.getParameter("cbotipo"));
        this.parameters.put("SQL_ORDERS", "FECHA_INICIO DESC");
        this.parameters.put("LIMIT",
                " LIMIT " + request.getParameter("sizePageAgenda"+complemento) + " OFFSET "
                + (Integer.parseInt(request.getParameter("numberPageAgenda"+complemento)) - 1)
                * Integer.parseInt(request.getParameter("sizePageAgenda"+complemento)));
        return this.parameters;
    }

}
