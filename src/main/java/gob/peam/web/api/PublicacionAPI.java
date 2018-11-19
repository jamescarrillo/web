/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gob.peam.web.api;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import gob.peam.web.dao.PublicacionDAO;
import gob.peam.web.dao.impl.PublicacionDAOImpl;
import gob.peam.web.model.Publicacion;
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
 * @author JhanxD
 */
@WebServlet(name = "PublicacionAPI", urlPatterns = {"/publicaciones/otraspublicaciones"})
public class PublicacionAPI extends HttpServlet {

    @Resource(name = "jdbc/dbweb")
    private DataSource pool;
    private HttpSession session;
    private Gson json;
    private String jsonResponse;
    private HashMap<String, Object> parameters;
    private static final Logger LOG = Logger.getLogger(PublicacionAPI.class.getName());
    private String action;

    private PublicacionDAO publicacionDAO;

    @Override
    public void init() throws ServletException {
        super.init(); // To change body of generated methods, choose Tools | Templates.
        this.json = new GsonBuilder().setDateFormat("dd/MM/yyyy").create();
        this.parameters = new HashMap<>();
        this.action = "";

        this.publicacionDAO = new PublicacionDAOImpl(this.pool);
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
                case "paginarPublicacion":
                    procesarPublicacion(new BEAN_CRUD(this.publicacionDAO.getPagination(getParametersPublicacion(request))), response);
                    break;
                case "addPublicacion":
                    procesarPublicacion(this.publicacionDAO.add(getPublicacion(request), getParametersPublicacion(request)), response);
                    break;
                case "updatePublicacion":
                    procesarPublicacion(this.publicacionDAO.update(getPublicacion(request), getParametersPublicacion(request)), response);
                    break;
                case "deletePublicacion":
                    procesarPublicacion(this.publicacionDAO.delete(Integer.parseInt(request.getParameter("txtIdPublicacionER")), getParametersPublicacion(request)), response);
                    break;
                case "activatePublicacion":
                    procesarPublicacion(this.publicacionDAO.activate(Integer.parseInt(request.getParameter("txtIdPublicacionER")), getParametersPublicacion(request)), response);
                    break;
                default:
                    request.getRequestDispatcher("/jsp/gc/publicaciones/otraspublicaciones.jsp").forward(request, response);
                    break;
            }
        } catch (SQLException ex) {
            Logger.getLogger(PublicacionAPI.class.getName()).log(Level.SEVERE, null, ex);
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

    private void procesarPublicacion(BEAN_CRUD beanCrud, HttpServletResponse response) {
        try {
            this.jsonResponse = this.json.toJson(beanCrud);
            response.setContentType("application/json");
            response.getWriter().write(this.jsonResponse);
            LOG.info(this.jsonResponse);
        } catch (IOException ex) {
            Logger.getLogger(PublicacionAPI.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private HashMap<String, Object> getParametersPublicacion(HttpServletRequest request) {
        this.parameters.clear();
        this.parameters.put("FILTER", request.getParameter("txtTituloPublicacion").toLowerCase());
        if (request.getParameter("comboAnioPublicacion").equals("-1")) {
            this.parameters.put("SQL_ANIO", "");
        } else {
            this.parameters.put("SQL_ANIO", "AND ANHO = '" + request.getParameter("comboAnioPublicacion") + "' ");
        }
        if (request.getParameter("comboTipoListaPublicacion").equals("-1")) {
            this.parameters.put("SQL_ESTADO", "");
        } else {
            this.parameters.put("SQL_ESTADO", "AND ESTADO = " + request.getParameter("comboTipoListaPublicacion") + " ");
        }
        if (request.getParameter("action").equals("activatePublicacion")) {
            if (request.getParameter("txtEstadoPublicacionER").equals("true")) {
                this.parameters.put("ESTADOP", "true");
            } else {
                this.parameters.put("ESTADOP", "false");
            }
        }
        this.parameters.put("SQL_TIPO", "AND TIPO = " + getTipo(request));
        this.parameters.put("SQL_ORDERS", "ID DESC");
        this.parameters.put("LIMIT",
                " LIMIT " + request.getParameter("sizePagePublicacion") + " OFFSET "
                + (Integer.parseInt(request.getParameter("numberPagePublicacion")) - 1)
                * Integer.parseInt(request.getParameter("sizePagePublicacion")));
        return this.parameters;
    }

    private Publicacion getPublicacion(HttpServletRequest request) {
        Publicacion publicacion = new Publicacion();
        if (request.getParameter("action").equals("updatePublicacion")) {
            publicacion.setId(Integer.parseInt(request.getParameter("txtIdPublicacionER")));
        }
        if (request.getParameter("txtFechaPublicacionER").equals("")) {
            publicacion.setAnho(request.getParameter("txtAnhoER"));
        } else {
            publicacion.setAnho(request.getParameter("txtFechaPublicacionER").substring(6, 10));
        }
        publicacion.setDescripcion(request.getParameter("txtDescripcionER"));
        publicacion.setDocu_id(Integer.parseInt(request.getParameter("txtDocu_idPublicacionER")));
        publicacion.setEstado(Boolean.parseBoolean(request.getParameter("txtEstadoPublicacionER")));
        publicacion.setTipo(Integer.parseInt(getTipo(request)));
        publicacion.setTitulo(request.getParameter("txtTituloER"));
        return publicacion;
    }

    private String getTipo(HttpServletRequest request) {
        String tipo = "";
        switch (request.getParameter("url_publicacion")) {
            case "/publicaciones/otraspublicaciones":
                tipo = "3";
                break;
//            case "/finanzas/flujoefectivo":
//                tipo = "7";
//                break;
//            case "/finanzas/gestion":
//                tipo = "8";
//                break;
//            case "/finanzas/saldos":
//                tipo = "5";
//                break;
        }
        return tipo;
    }

}
