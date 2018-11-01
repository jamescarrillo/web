/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gob.peam.web.api;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import gob.peam.web.dao.LibroReclamoDAO;
import gob.peam.web.dao.impl.LibroReclamoDAOImpl;
import gob.peam.web.model.LibroReclamo;
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
@WebServlet(name = "LibroReclamoAPI", urlPatterns = {"/participacionciudadana/libroreclamaciones"})
public class LibroReclamoAPI extends HttpServlet {
    
    @Resource(name = "jdbc/dbweb")
    private DataSource pool;
    private HttpSession session;
    private Gson json;
    private String jsonResponse;
    private HashMap<String, Object> parameters;
    private final Log logger = LogFactory.getLog(DocumentoAPI.class);
    private String action;

    private LibroReclamoDAO libroreclamoDAO;

    @Override
    public void init() throws ServletException {
        super.init(); // To change body of generated methods, choose Tools | Templates.
        this.json = new GsonBuilder().setDateFormat("dd/MM/yyyy").create();
        this.parameters = new HashMap<>();
        this.action = "";

        this.libroreclamoDAO = new LibroReclamoDAOImpl(this.pool);
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
                case "paginarLibroReclamo":
                    procesarLibroReclamo(new BEAN_CRUD(this.libroreclamoDAO.getPagination(getParametersLibroReclamo(request))), response);
                    break;
                case "addLibroReclamo":
                    procesarLibroReclamo(this.libroreclamoDAO.add(getLibroReclamo(request), getParametersLibroReclamo(request)), response);
                    break;
                case "updateLibroReclamo":
                    procesarLibroReclamo(this.libroreclamoDAO.update(getLibroReclamo(request), getParametersLibroReclamo(request)), response);
                    break;
                case "deleteLibroReclamo":
                    procesarLibroReclamo(this.libroreclamoDAO.eliminar(String.valueOf(request.getParameter("txtNumeroER")), String.valueOf(request.getParameter("txtAnhoER")), getParametersLibroReclamo(request)), response);
                    break;
                case "activateLibroReclamo":
                    procesarLibroReclamo(this.libroreclamoDAO.activate(String.valueOf(request.getParameter("txtNumeroER")), String.valueOf(request.getParameter("txtAnhoER")), getParametersLibroReclamo(request)), response);
                    break;
                default:
                    request.getRequestDispatcher("/jsp/gc/participacionciudadana/libroreclamo.jsp").forward(request, response);
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

    private void procesarLibroReclamo(BEAN_CRUD bean_crud, HttpServletResponse response) {
        try {
            this.jsonResponse = this.json.toJson(bean_crud);
            response.setContentType("application/json");
            response.getWriter().write(this.jsonResponse);
            this.logger.info(this.jsonResponse);
        } catch (IOException ex) {
            Logger.getLogger(DocumentoWebAPI.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private HashMap<String, Object> getParametersLibroReclamo(HttpServletRequest request) {
        this.parameters.clear();
        this.parameters.put("FILTER", request.getParameter("txtLibroReclamo").toLowerCase());
        if (request.getParameter("comboTipoListaReclamo").equals("-1")) {
            this.parameters.put("SQL_ESTADO", "");
        } else {
            this.parameters.put("SQL_ESTADO", "AND ESTADO = " + request.getParameter("comboTipoListaReclamo"));
        }
        if (request.getParameter("txtEstadoER").equals("true")) {
            this.parameters.put("ESTADOP", "false");
        } else {
            this.parameters.put("ESTADOP", "true");
        }
        if (request.getParameter("comboAnio").equals("-1")) {
            this.parameters.put("SQL_ANIO", "");
        } else {
            this.parameters.put("SQL_ANIO", "AND ANHO = '" + request.getParameter("comboAnio") + "' ");
        }
        this.parameters.put("SQL_ORDERS", "NUMERO DESC");
        this.parameters.put("LIMIT",
                " LIMIT " + request.getParameter("sizePageLibroReclamo") + " OFFSET "
                + (Integer.parseInt(request.getParameter("numberPageLibroReclamo")) - 1)
                * Integer.parseInt(request.getParameter("sizePageLibroReclamo")));
        return this.parameters;
    }

    private LibroReclamo getLibroReclamo(HttpServletRequest request) {
        LibroReclamo obj = new LibroReclamo();
        if (request.getParameter("action").equals("updateLibroReclamo")) {
            obj.setNumero(String.valueOf(request.getParameter("txtNumeroER")));
            obj.setAnho(String.valueOf(request.getParameter("txtAnhoER")));
        }
        obj.setDetalle_acciones(request.getParameter("txtRespuestaER"));
        obj.setDescripcion_atencion(request.getParameter("txtDescripcionER"));
        return obj;
    }
}