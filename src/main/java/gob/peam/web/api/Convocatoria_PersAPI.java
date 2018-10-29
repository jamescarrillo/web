/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gob.peam.web.api;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import gob.peam.web.dao.Convocatoria_PersDAO;
import gob.peam.web.dao.impl.Convocatoria_PersDAOImpl;
import gob.peam.web.model.Convocatoria_Pers;
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
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 *
 * @author JamesCarrillo
 */
@WebServlet(name = "Convocatoria_PersAPI", urlPatterns = {"/convocatorias/personal"})
public class Convocatoria_PersAPI extends HttpServlet {

    @Resource(name = "jdbc/dbweb")
    private DataSource pool;
    private HttpSession session;
    private Gson json;
    private String jsonResponse;
    private HashMap<String, Object> parameters;
    private final Log logger = LogFactory.getLog(DocumentoAPI.class);
    private String action;

    private Convocatoria_PersDAO convocatoria_persDAO;

    @Override
    public void init() throws ServletException {
        super.init(); // To change body of generated methods, choose Tools | Templates.
        this.json = new GsonBuilder().setDateFormat("dd/MM/yyyy").create();
        this.parameters = new HashMap<>();
        this.action = "";

        this.convocatoria_persDAO = new Convocatoria_PersDAOImpl(this.pool);
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
            this.logger.info("ACTION -> " + this.action);
            switch (this.action) {
                case "paginarConvocatoriaPers":
                    procesarConvocatoria_Pers(new BEAN_CRUD(this.convocatoria_persDAO.getPagination(getParametersConvocatoria_Pers(request))), response);
                    break;
                case "addConvocatoriaPers":
                    procesarConvocatoria_Pers(this.convocatoria_persDAO.add(getConvocatoria_Pers(request), getParametersConvocatoria_Pers(request)), response);
                    break;
                case "updateConvocatoriaPers":
                    procesarConvocatoria_Pers(this.convocatoria_persDAO.update(getConvocatoria_Pers(request), getParametersConvocatoria_Pers(request)), response);
                    break;
                case "deleteConvocatoriaPers":
                    procesarConvocatoria_Pers(this.convocatoria_persDAO.delete(Long.parseLong(request.getParameter("txtCoperIdER")), getParametersConvocatoria_Pers(request)), response);
                    break;
                case "activateConvocatoriaPers":
                    procesarConvocatoria_Pers(this.convocatoria_persDAO.activate(Long.parseLong(request.getParameter("txtCoperIdER")), getParametersConvocatoria_Pers(request)), response);
                    break;
                default:
                    request.getRequestDispatcher("/jsp/gc/convocatorias/convocatoria_pers.jsp").forward(request, response);
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

    private void procesarConvocatoria_Pers(BEAN_CRUD bean_crud, HttpServletResponse response) {
        try {
            this.jsonResponse = this.json.toJson(bean_crud);
            response.setContentType("application/json");
            response.getWriter().write(this.jsonResponse);
            this.logger.info(this.jsonResponse);
        } catch (IOException ex) {
            Logger.getLogger(DocumentoWebAPI.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private HashMap<String, Object> getParametersConvocatoria_Pers(HttpServletRequest request) {
        this.parameters.clear();
        this.parameters.put("FILTER", request.getParameter("txtConvocatoriaPers").toLowerCase());
        if (request.getParameter("comboAnio").equals("-1")) {
            this.parameters.put("SQL_ANIO", "");
        } else {
            this.parameters.put("SQL_ANIO", "AND ANHO = '" + request.getParameter("comboAnio") + "' ");
        }
        if (request.getParameter("comboTipoListaConvocatoriaPers").equals("-1")) {
            this.parameters.put("SQL_ESTADO", "");
        } else {
            this.parameters.put("SQL_ESTADO", "AND ESTADO = " + request.getParameter("comboTipoListaConvocatoriaPers") + " ");
        }
        if (request.getParameter("txtEstadoER").equals("true")) {
            this.parameters.put("ESTADO", "false");
        }else{
            this.parameters.put("ESTADO", "true");
        }
        this.parameters.put("SQL_ORDERS", "ANHO DESC");
        this.parameters.put("LIMIT",
                " LIMIT " + request.getParameter("sizePageConvocatoriaPers") + " OFFSET "
                + (Integer.parseInt(request.getParameter("numberPageConvocatoriaPers")) - 1)
                * Integer.parseInt(request.getParameter("sizePageConvocatoriaPers")));
        return this.parameters;
    }

    private Convocatoria_Pers getConvocatoria_Pers(HttpServletRequest request) {
        Convocatoria_Pers obj = new Convocatoria_Pers();
        if (request.getParameter("action").equals("updateConvocatoriaPers")) {
            obj.setCoper_id(Integer.parseInt(request.getParameter("txtCoperIdER")));
        }
        obj.setConvocatoria(request.getParameter("txtConvocatoriaER"));
        obj.setDescripcion(request.getParameter("txtSintesisER"));
        obj.setEstado(false);
        return obj;
    }

}
