/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gob.peam.web.api;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import gob.peam.web.dao.AnuncioDAO;
import gob.peam.web.dao.MultimediaDAO;
import gob.peam.web.dao.NotaPrensaDAO;
import gob.peam.web.dao.PublicacionDAO;
import gob.peam.web.dao.impl.AnuncioDAOImpl;
import gob.peam.web.dao.impl.MultimediaDAOImpl;
import gob.peam.web.dao.impl.NotaPrensaDAOImpl;
import gob.peam.web.dao.impl.PublicacionDAOImpl;
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

/**
 *
 * @author JhanxD
 */
@WebServlet(name = "PublicacionesWebAPI", urlPatterns = {
    "/publicaciones/noticias/notas-de-prensa",
    "/publicaciones/noticias/multimedia",
    "/publicaciones/memorias-anuales",
    "/publicaciones/comunicados",
    "/publicaciones/otras-publicaciones",
    "/publicaciones/control-interno"
})
public class PublicacionesWebAPI extends HttpServlet {

    @Resource(name = "jdbc/dbweb")
    private DataSource pool;
    private Gson json;
    private String jsonResponse;
    private HashMap<String, Object> parameters;
    private static final Logger LOG = Logger.getLogger(PublicacionesWebAPI.class.getName());
    private String action;

    private NotaPrensaDAO notaPrensaDAO;
    private MultimediaDAO multimediaDAO;
    private AnuncioDAO anuncioDAO;
    private PublicacionDAO publicacionDAO;

    @Override
    public void init() throws ServletException {
        super.init(); // To change body of generated methods, choose Tools | Templates.
        this.json = new GsonBuilder().setDateFormat("dd/MM/yyyy").create();
        this.parameters = new HashMap<>();
        this.action = "";

        this.notaPrensaDAO = new NotaPrensaDAOImpl(this.pool);
        this.multimediaDAO = new MultimediaDAOImpl(this.pool);
        this.anuncioDAO = new AnuncioDAOImpl(this.pool);
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
            switch (request.getRequestURI().substring(request.getContextPath().length())) {
                case "/publicaciones/noticias/notas-de-prensa":
                    this.action = request.getParameter("action") == null ? "readNotaPrensa" : request.getParameter("action");
                    LOG.info(action);
                    switch (this.action) {
                        case "paginarNotaPrensa":
                            procesarNotaPrensa(new BEAN_CRUD(this.notaPrensaDAO.getPagination(getParametersNotasPrensa(request))), response);
                            break;
                        case "readNotaPrensa":
                            request.getRequestDispatcher("/jsp/web/publicaciones/notaPrensaWeb.jsp").forward(request, response);
                            break;
                    }
                    break;
                case "/publicaciones/noticias/multimedia":
                    this.action = request.getParameter("action") == null ? "" : request.getParameter("action");
                    LOG.info(this.action);
                    switch (this.action) {
                        case "paginarMultimedia":
                            procesarMultimedia(new BEAN_CRUD(this.multimediaDAO.getPagination(getParametersMultimedia(request))), response);
                            break;
                        default:
                            request.getRequestDispatcher("/jsp/web/publicaciones/multimediaWeb.jsp").forward(request, response);
                            break;
                    }
                    break;
                case "/publicaciones/comunicados":
                    this.action = request.getParameter("action") == null ? "" : request.getParameter("action");
                    LOG.info(this.action);
                    switch (this.action) {
                        case "paginarComunicado":
                            procesarAnuncio(new BEAN_CRUD(this.anuncioDAO.getPagination(getParametersAnuncio(request))), response);
                            break;
                        default:
                            request.getRequestDispatcher("/jsp/web/publicaciones/comunicadosWeb.jsp").forward(request, response);
                            break;
                    }
                    break;
                case "/publicaciones/memorias-anuales":
                    request.setAttribute("title", "Memorias Anuales");
                    request.setAttribute("tipo", "1");
                    request.getRequestDispatcher("/jsp/web/publicaciones/otrasPublicacionesWeb.jsp").forward(request, response);
                    break;
                case "/publicaciones/otras-publicaciones":
                    this.action = request.getParameter("action") == null ? "" : request.getParameter("action");
                    LOG.info(this.action);
                    switch (this.action) {
                        case "paginarPublicacion":
                            procesarPublicacion(new BEAN_CRUD(this.publicacionDAO.getPagination(getParametersPublicacion(request))), response);
                            break;
                        default:
                            request.setAttribute("title", "Otras Publicaciones");
                            request.setAttribute("tipo", "3");
                            request.getRequestDispatcher("/jsp/web/publicaciones/otrasPublicacionesWeb.jsp").forward(request, response);
                            break;
                    }
                    break;
                case "/publicaciones/control-interno":
                    request.getRequestDispatcher("/jsp/web/publicaciones/control_interno.jsp").forward(request, response);
                    break;
                default:
                    response.sendRedirect("/index");
                    break;
            }
        } catch (SQLException ex) {
            Logger.getLogger(PublicacionesWebAPI.class.getName()).log(Level.SEVERE, null, ex);
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

    /*NOTAS DE PRENSA*/
    private void procesarNotaPrensa(BEAN_CRUD beanCrud, HttpServletResponse response) {
        try {
            this.jsonResponse = this.json.toJson(beanCrud);
            response.setContentType("application/json");
            response.getWriter().write(this.jsonResponse);
            LOG.info(this.jsonResponse);
        } catch (IOException ex) {
            Logger.getLogger(PublicacionesWebAPI.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private HashMap getParametersNotasPrensa(HttpServletRequest request) {
        this.parameters.clear();
        this.parameters.put("FILTER", request.getParameter("txtTituloNotaPrensa").toLowerCase());
        if (request.getParameter("comboAnio").equals("-1")) {
            this.parameters.put("SQL_ANIO", "");
        } else {
            this.parameters.put("SQL_ANIO", "AND ANHO = '" + request.getParameter("comboAnio") + "' ");
        }
        if (request.getParameter("estadoNotaPrensa").equals("-1")) {
            this.parameters.put("SQL_ESTADO", "");
        } else {
            this.parameters.put("SQL_ESTADO", "AND ESTADO = " + request.getParameter("estadoNotaPrensa"));
        }
        this.parameters.put("SQL_ORDERS", "FECHA DESC");
        this.parameters.put("LIMIT",
                " LIMIT " + request.getParameter("sizePageNotaPrensa") + " OFFSET "
                + (Integer.parseInt(request.getParameter("numberPageNotaPrensa")) - 1)
                * Integer.parseInt(request.getParameter("sizePageNotaPrensa")));
        return this.parameters;
    }

    private void procesarMultimedia(BEAN_CRUD bean_crud, HttpServletResponse response) {
        try {
            this.jsonResponse = this.json.toJson(bean_crud);
            response.setContentType("application/json");
            response.getWriter().write(this.jsonResponse);
            LOG.info(this.jsonResponse);
        } catch (IOException ex) {
            Logger.getLogger(PublicacionesWebAPI.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private HashMap<String, Object> getParametersMultimedia(HttpServletRequest request) {
        this.parameters.clear();
        this.parameters.put("FILTER", request.getParameter("txtMultimedia").toLowerCase());
        if (request.getParameter("comboAnio").equals("-1")) {
            this.parameters.put("SQL_ANIO", "");
        } else {
            this.parameters.put("SQL_ANIO", "AND (select extract(year from current_date)) = '" + request.getParameter("comboAnio") + "' ");
        }
        if (request.getParameter("estadoMultimedia").equals("-1")) {
            this.parameters.put("SQL_ESTADO", "");
        } else {
            this.parameters.put("SQL_ESTADO", "AND ESTADO = " + request.getParameter("estadoMultimedia") + " ");

        }
        this.parameters.put("SQL_ORDERS", "FECHA DESC");
        this.parameters.put("LIMIT",
                " LIMIT " + request.getParameter("sizePageMultimedia") + " OFFSET "
                + (Integer.parseInt(request.getParameter("numberPageMultimedia")) - 1)
                * Integer.parseInt(request.getParameter("sizePageMultimedia")));
        return this.parameters;
    }

    private void procesarAnuncio(BEAN_CRUD beanCrud, HttpServletResponse response) {
        try {
            this.jsonResponse = this.json.toJson(beanCrud);
            response.setContentType("application/json");
            response.getWriter().write(this.jsonResponse);
            LOG.info(this.jsonResponse);
        } catch (IOException ex) {
            Logger.getLogger(AnuncioAPI.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private HashMap getParametersAnuncio(HttpServletRequest request) {
        this.parameters.clear();
        this.parameters.put("FILTER", request.getParameter("txtTituloComunicado"));
        this.parameters.put("SQL_ESTADO", "AND ESTADO = TRUE");
        this.parameters.put("ESTADOP", "true");
        this.parameters.put("SQL_TIPO", "");
        this.parameters.put("SQL_ORDERS", "ANU_FECHA_INI DESC");
        this.parameters.put("LIMIT",
                " LIMIT " + request.getParameter("sizePageComunicado") + " OFFSET "
                + (Integer.parseInt(request.getParameter("numberPageComunicado")) - 1)
                * Integer.parseInt(request.getParameter("sizePageComunicado")));
        return this.parameters;
    }

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
        this.parameters.put("SQL_ESTADO", "AND ESTADO = TRUE");
        this.parameters.put("SQL_TIPO", "AND TIPO = " + request.getParameter("tipo"));
        this.parameters.put("SQL_ORDERS", "ID DESC");
        this.parameters.put("LIMIT",
                " LIMIT " + request.getParameter("sizePagePublicacion") + " OFFSET "
                + (Integer.parseInt(request.getParameter("numberPagePublicacion")) - 1)
                * Integer.parseInt(request.getParameter("sizePagePublicacion")));
        return this.parameters;
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
