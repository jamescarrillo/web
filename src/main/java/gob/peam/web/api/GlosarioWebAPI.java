/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gob.peam.web.api;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import gob.peam.web.dao.GlosarioDAO;
import gob.peam.web.dao.impl.GlosarioDAOImpl;
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
@WebServlet(name = "GlosarioWebAPI", urlPatterns = {"/glosario"})
public class GlosarioWebAPI extends HttpServlet {
    
    @Resource(name = "jdbc/dbweb")
    private DataSource pool;
    private Gson json;
    private String jsonResponse;
    private HashMap<String, Object> parameters;
    private HashMap<String, Object> jsonROOT;
    private final Log logger = LogFactory.getLog(DocumentoWebAPI.class);
    private String action;
    
    private GlosarioDAO glosarioDAO;

    @Override
    public void init() throws ServletException {
        super.init(); // To change body of generated methods, choose Tools | Templates.
        //this.json = new GsonBuilder().setDateFormat("dd/MM/yyyy HH:mm:ss").create();
        this.json = new GsonBuilder().setDateFormat("dd/MM/yyyy").create();
        this.parameters = new HashMap<>();
        this.jsonROOT = new HashMap<>();
        this.action = "";
        this.glosarioDAO = new GlosarioDAOImpl(this.pool);
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
                case "paginarGlosario":
                    procesarGlosario(new BEAN_CRUD(this.glosarioDAO.getPagination(getParametersGlosario(request))), response);
                    break;
                default:
                    request.getRequestDispatcher("/jsp/web/gestiontransparente/glosarioweb.jsp").forward(request, response);
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

    private void procesarGlosario(BEAN_CRUD bean_crud, HttpServletResponse response) {
        try {
            this.jsonResponse = this.json.toJson(bean_crud);
            response.setContentType("application/json");
            response.getWriter().write(this.jsonResponse);
            this.logger.info(this.jsonResponse);
        } catch (IOException ex) {
            Logger.getLogger(DocumentoWebAPI.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    private HashMap<String, Object> getParametersGlosario(HttpServletRequest request) {
        this.parameters.clear();
        this.parameters.put("FILTER", request.getParameter("txtTituloGlosario").toLowerCase());
        this.parameters.put("SQL_ORDERS", "FECHA_HORA DESC");
        this.parameters.put("LIMIT",
                " LIMIT " + request.getParameter("sizePageGlosario") + " OFFSET "
                + (Integer.parseInt(request.getParameter("numberPageGlosario")) - 1)
                * Integer.parseInt(request.getParameter("sizePageGlosario")));
        return this.parameters;
    }
}
