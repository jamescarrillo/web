/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gob.peam.web.api;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import gob.peam.web.dao.AnuncioDAO;
import gob.peam.web.dao.impl.AnuncioDAOImpl;
import gob.peam.web.model.Anuncio;
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

/**
 *
 * @author Juan Jose
 */
@WebServlet(name = "AnuncioAPI", urlPatterns = {"/publicaciones/anuncios"})
public class AnuncioAPI extends HttpServlet {

    @Resource(name = "jdbc/dbweb")
    private DataSource pool;
    private HttpSession session;
    private Gson json;
    private String jsonResponse;
    private HashMap<String, Object> parameters;
    private static final Logger LOG = Logger.getLogger(DocumentoAPI.class.getName());
    private String action;

    private AnuncioDAO anuncioDao;

    @Override
    public void init() throws ServletException {
        super.init(); // To change body of generated methods, choose Tools | Templates.
        this.json = new GsonBuilder().setDateFormat("dd/MM/yyyy").create();
        this.parameters = new HashMap<>();
        this.action = "";

        this.anuncioDao = new AnuncioDAOImpl(this.pool);
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
                case "paginarAnuncio":
                    procesarAnuncio(new BEAN_CRUD(this.anuncioDao.getPagination(getParametersAnuncio(request))), response);
                    break;
                case "addAnuncio":
                    procesarAnuncio(this.anuncioDao.add(getAnuncio(request), getParametersAnuncio(request)), response);
                    break;
                case "updateAnuncio":
                    procesarAnuncio(this.anuncioDao.update(getAnuncio(request), getParametersAnuncio(request)), response);
                    break;
                case "deleteAnuncio":
                    procesarAnuncio(this.anuncioDao.delete(Long.parseLong(request.getParameter("txtIdAnuncioER")), getParametersAnuncio(request)), response);
                    break;
                case "activateAnuncio":
                    procesarAnuncio(this.anuncioDao.activate(Long.parseLong(request.getParameter("txtIdAnuncioER")), getParametersAnuncio(request)), response);
                    break;
                default:
                    request.getRequestDispatcher("/jsp/gc/publicaciones/anuncio.jsp").forward(request, response);
                    break;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AnuncioAPI.class.getName()).log(Level.SEVERE, null, ex);
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

    private Anuncio getAnuncio(HttpServletRequest request) {
        Anuncio anuncio = new Anuncio();
        if (request.getParameter("action").equals("updateAnuncio")) {
            anuncio.setAnu_id(Integer.parseInt(request.getParameter("txtIdAnuncioER")));
        }
        anuncio.setAnu_fecha_ini(Utilities.getDateSQLFORMAT(request.getParameter("datePickerFechaInicioER"), "dd/MM/yyyy").toString());
        anuncio.setAnu_fecha_fin(Utilities.getDateSQLFORMAT(request.getParameter("datePickerFechaFinER"), "dd/MM/yyyy").toString());
        anuncio.setTipo(Integer.parseInt(request.getParameter("tipoER")));
        anuncio.setTitulo(request.getParameter("txtTituloAnuncioER"));
        anuncio.setContenido(request.getParameter("txtContenidoAnuncioER"));
        anuncio.setEstado(false);
        return anuncio;
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
        this.parameters.put("FILTER", request.getParameter("txtTituloAnuncio"));
        if (request.getParameter("estadoAnuncio").equals("-1")) {
            this.parameters.put("SQL_ESTADO", "");
        } else {
            this.parameters.put("SQL_ESTADO", "AND ESTADO = " + request.getParameter("estadoAnuncio"));
        }
        if (request.getParameter("txtEstadoAnuncioER").equals("true")) {
            this.parameters.put("ESTADOP", "false");
        } else {
            this.parameters.put("ESTADOP", "true");
        }
        if (request.getParameter("tipo").equals("-1")) {
            this.parameters.put("SQL_TIPO", "");
        } else {
            this.parameters.put("SQL_TIPO", "AND TIPO = " + request.getParameter("tipo"));
        }
        this.parameters.put("SQL_ORDERS", "ANU_FECHA_INI DESC");
        this.parameters.put("LIMIT",
                " LIMIT " + request.getParameter("sizePageAnuncio") + " OFFSET "
                + (Integer.parseInt(request.getParameter("numberPageAnuncio")) - 1)
                * Integer.parseInt(request.getParameter("sizePageAnuncio")));
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
