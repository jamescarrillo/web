/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gob.peam.web.api;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import gob.peam.web.dao.DirectorioTelefonicoDAO;
import gob.peam.web.dao.impl.DirectorioTelefonicoDAOImpl;
import gob.peam.web.model.DirectorioTelefonico;
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
 * @author JhanxD
 */
@WebServlet(name = "DirectorioTelefonicoAPI", urlPatterns = {"/directoriostelefonicos"})
public class DirectorioTelefonicoAPI extends HttpServlet {

    @Resource(name = "jdbc/dbweb")
    private DataSource pool;
    private HttpSession session;
    private Gson json;
    private String jsonResponse;
    private HashMap<String, Object> parameters;
    private final Log logger = LogFactory.getLog(DirectorioTelefonicoAPI.class);
    private String action;

    private DirectorioTelefonicoDAO directorioTelefonicoDAO;

    @Override
    public void init() throws ServletException {
        super.init(); // To change body of generated methods, choose Tools | Templates.
        this.json = new GsonBuilder().setDateFormat("dd/MM/yyyy").create();
        this.parameters = new HashMap<>();
        this.action = "";

        this.directorioTelefonicoDAO = new DirectorioTelefonicoDAOImpl(this.pool);
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
                case "paginarDirectorioTelefonico":
                    procesarDirectorioTelefonico(new BEAN_CRUD(this.directorioTelefonicoDAO.getPagination(getParametersDirectorioTelefonico(request))), response);
                    break;
                case "addDirectorioTelefonico":
                    procesarDirectorioTelefonico(this.directorioTelefonicoDAO.add(getDirectorioTelefonico(request), getParametersDirectorioTelefonico(request)), response);
                    break;
                case "updateDirectorioTelefonico":
                    procesarDirectorioTelefonico(this.directorioTelefonicoDAO.update(getDirectorioTelefonico(request), getParametersDirectorioTelefonico(request)), response);
                    break;
                case "deleteDirectorioTelefonico":
                    procesarDirectorioTelefonico(this.directorioTelefonicoDAO.delete(Long.parseLong(request.getParameter("txtIdER")), getParametersDirectorioTelefonico(request)), response);
                    break;

                default:
                    request.getRequestDispatcher("/jsp/gc/otros/directorioTelefonico.jsp").forward(request, response);
                    break;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DirectorioTelefonicoAPI.class.getName()).log(Level.SEVERE, null, ex);
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
    
    private void procesarDirectorioTelefonico(BEAN_CRUD bean_crud, HttpServletResponse response) {
        try {
            this.jsonResponse = this.json.toJson(bean_crud);
            response.setContentType("application/json");
            response.getWriter().write(this.jsonResponse);
            this.logger.info(this.jsonResponse);
        } catch (IOException ex) {
            Logger.getLogger(DirectorioTelefonicoAPI.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    private HashMap<String, Object> getParametersDirectorioTelefonico(HttpServletRequest request) {
        this.parameters.clear();
        this.parameters.put("FILTER", request.getParameter("txtDirectorioTelefonico").toLowerCase());
        if (request.getParameter("comboTipoListaDirectorioTelefonico").equals("-1")) {
            this.parameters.put("SQL_ESTADO", "");
        } else {
            this.parameters.put("SQL_ESTADO", "AND ESTADO = " + request.getParameter("comboTipoListaDirectorioTelefonico") + " ");
        }
        this.parameters.put("SQL_ORDERS", "SECCION DESC");
        this.parameters.put("LIMIT",
                " LIMIT " + request.getParameter("sizePageDirectorioTelefonico") + " OFFSET "
                + (Integer.parseInt(request.getParameter("numberPageDirectorioTelefonico")) - 1)
                * Integer.parseInt(request.getParameter("sizePageDirectorioTelefonico")));
        return this.parameters;
    }

    private DirectorioTelefonico getDirectorioTelefonico(HttpServletRequest request) {
        DirectorioTelefonico obj = new DirectorioTelefonico();
        if (request.getParameter("action").equals("updateDirectorioTelefonico")) {
            obj.setId(Integer.parseInt(request.getParameter("txtIdER")));
        }
        obj.setOficina(request.getParameter("txtOficinaER"));
        obj.setSeccion(request.getParameter("txtSeccionER"));
        obj.setAnexo(request.getParameter("txtAnexoER"));
        obj.setEstado(false);
        return obj;
    }

}
