/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gob.peam.web.api;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import gob.peam.web.dao.DirectorioTelefonicoDAO;
import gob.peam.web.dao.FuncionarioDAO;
import gob.peam.web.dao.impl.DirectorioTelefonicoDAOImpl;
import gob.peam.web.dao.impl.FuncionarioDAOImpl;
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
 * @author James Carrillo
 */
@WebServlet(name = "LaInstitucionController",
        urlPatterns = {
            "/institucion/quienessomos",
            "/institucion/visionmision",
            "/institucion/objetivofunciones",
            "/institucion/etica",
            "/institucion/ubicacion",
            "/institucion/estructuraorganica",
            "/institucion/directorios"})
public class LaInstitucionController extends HttpServlet {

    @Resource(name = "jdbc/dbweb")
    private DataSource pool;
    private HttpSession session;
    private Gson json;
    private String jsonResponse;
    private HashMap<String, Object> parameters;
    private final Log logger = LogFactory.getLog(DocumentoAPI.class);
    private String action;

    private DirectorioTelefonicoDAO directorioTelefonicoDAO;
    private FuncionarioDAO funcionarioDAO;

    @Override
    public void init() throws ServletException {
        super.init(); // To change body of generated methods, choose Tools | Templates.
        this.json = new GsonBuilder().setDateFormat("dd/MM/yyyy").create();
        this.parameters = new HashMap<>();
        this.action = "";

        this.directorioTelefonicoDAO = new DirectorioTelefonicoDAOImpl(this.pool);
        this.funcionarioDAO = new FuncionarioDAOImpl(this.pool);
    }

    /**
     * |
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
        //System.out.println("->  " + request.getRequestURI().substring(request.getContextPath().length()));
        //System.out.println("->  " + request.getRequestURI());
        //getServletContext().getContextPath() = web
        //sin el /web
        try {
            switch (request.getRequestURI().substring(request.getContextPath().length())) {
                case "/institucion/quienessomos":
                    request.getRequestDispatcher("/jsp/web/institucion/quienessomos.jsp").forward(request, response);
                    break;
                case "/institucion/visionmision":
                    request.getRequestDispatcher("/jsp/web/institucion/visionmision.jsp").forward(request, response);
                    break;
                case "/institucion/objetivofunciones":
                    request.getRequestDispatcher("/jsp/web/institucion/objetivofunciones.jsp").forward(request, response);
                    break;
                case "/institucion/etica":
                    request.getRequestDispatcher("/jsp/web/institucion/codigoetica.jsp").forward(request, response);
                    break;
                case "/institucion/ubicacion":
                    request.getRequestDispatcher("/jsp/web/institucion/ubicacion.jsp").forward(request, response);
                    break;
                case "/institucion/estructuraorganica":
                    request.getRequestDispatcher("/jsp/web/institucion/estructuraorganica.jsp").forward(request, response);
                    break;
                case "/institucion/directorios":
                    String accion = request.getParameter("action") == null ? "" : request.getParameter("action");
                    logger.info("---->"+accion);
                    switch (accion) {
                        case "paginarDirectorio":
                            procesarDirectorioTelefonico(new BEAN_CRUD(this.directorioTelefonicoDAO.getPagination(getParametersDirectorioTelefonico(request))), response);
                            break;
                        case "paginarFuncionario":
                            procesarFuncionario(new BEAN_CRUD(this.funcionarioDAO.getPagination(getParametersFuncionarios(request))), response);
                            break;
                        default:
                            request.getRequestDispatcher("/jsp/web/institucion/directorios.jsp").forward(request, response);
                            break;
                    }
                    break;
                default:
                    request.getRequestDispatcher("/jsp/web/institucion/quienessomos.jsp").forward(request, response);
                    break;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DocumentoAPI.class.getName()).log(Level.SEVERE, null, ex);
        }
        //dp.forward(request, response);
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

    private void procesarDirectorioTelefonico(BEAN_CRUD bean_crud, HttpServletResponse response) {
        try {
            this.jsonResponse = this.json.toJson(bean_crud);
            response.setContentType("application/json");
            response.getWriter().write(this.jsonResponse);
            this.logger.info(this.jsonResponse);
        } catch (IOException ex) {
            Logger.getLogger(DocumentoWebAPI.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private HashMap<String, Object> getParametersDirectorioTelefonico(HttpServletRequest request) {
        this.parameters.clear();
        this.parameters.put("FILTER", request.getParameter("txtDirectorioTelefonico").toLowerCase());
        this.parameters.put("SQL_ESTADO", "AND ESTADO = true ");
        this.parameters.put("SQL_ORDERS", "SECCION DESC");
        this.parameters.put("LIMIT",
                " LIMIT " + request.getParameter("sizePageDirectorio") + " OFFSET "
                + (Integer.parseInt(request.getParameter("numberPageDirectorio")) - 1)
                * Integer.parseInt(request.getParameter("sizePageDirectorio")));
        return this.parameters;
    }

    private void procesarFuncionario(BEAN_CRUD beanCrud, HttpServletResponse response) {
        try {
            this.jsonResponse = this.json.toJson(beanCrud);
            response.setContentType("application/json");
            response.getWriter().write(this.jsonResponse);
            this.logger.info(this.jsonResponse);
        } catch (IOException ex) {
            Logger.getLogger(GestionTransparenteAPI.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private HashMap<String, Object> getParametersFuncionarios(HttpServletRequest request) {
        this.parameters.clear();
        this.parameters.put("FILTER", request.getParameter("txtFuncionario").toLowerCase());
        this.parameters.put("SQL_ESTADO", "AND ESTADO = true  AND DESTACADO = true ");
        this.parameters.put("SQL_ORDERS", "NOMBRES_APELLIDOS ASC ");
        this.parameters.put("LIMIT",
                " LIMIT " + request.getParameter("sizePageFuncionario") + " OFFSET "
                + (Integer.parseInt(request.getParameter("numberPageFuncionario")) - 1)
                * Integer.parseInt(request.getParameter("sizePageFuncionario")));
        return this.parameters;
    }

}
