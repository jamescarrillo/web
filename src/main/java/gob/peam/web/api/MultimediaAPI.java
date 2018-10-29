/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gob.peam.web.api;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import gob.peam.web.dao.MultimediaDAO;
import gob.peam.web.dao.impl.MultimediaDAOImpl;
import gob.peam.web.model.Multimedia;
import gob.peam.web.model.Persona;
import gob.peam.web.model.Usuario;
import gob.peam.web.utilities.BEAN_CRUD;
import gob.peam.web.utilities.Utilities;
import java.io.IOException;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 *
 * @author Juan Jose
 */
@WebServlet(name = "MultimediaAPI", urlPatterns = {"/publicaciones/noticiasmultimedia"})
public class MultimediaAPI extends HttpServlet {

    @Resource(name = "jdbc/dbweb")
    private DataSource pool;
    private HttpSession session;
    private Gson json;
    private String jsonResponse;
    private HashMap<String, Object> parameters;
    private final Log logger = LogFactory.getLog(DocumentoAPI.class);
    private String action;

    private MultimediaDAO multimediaDAO;

    @Override
    public void init() throws ServletException {
        super.init(); // To change body of generated methods, choose Tools | Templates.
        this.json = new GsonBuilder().setDateFormat("dd/MM/yyyy").create();
        this.parameters = new HashMap<>();
        this.action = "";

        this.multimediaDAO = new MultimediaDAOImpl(this.pool);
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
                case "paginarMultimedia":
                    procesarMultimedia(new BEAN_CRUD(this.multimediaDAO.getPagination(getParametersMultimedia(request))), response);
                    break;
                case "addMultimedia":
                    procesarMultimedia(this.multimediaDAO.add(getMultimedia(request), getParametersMultimedia(request)), response);
                    break;
                case "updateMultimedia":
                    procesarMultimedia(this.multimediaDAO.update(getMultimedia(request), getParametersMultimedia(request)), response);
                    break;
                case "deleteMultimedia":
                    procesarMultimedia(this.multimediaDAO.delete(Long.parseLong(request.getParameter("txtIdER")), getParametersMultimedia(request)), response);
                    break;
                case "activateMultimedia":
                    procesarMultimedia(this.multimediaDAO.activate(Long.parseLong(request.getParameter("txtIdER")), getParametersMultimedia(request)), response);
                    break;
                case "favoriteMultimedia":
                    procesarMultimedia(this.multimediaDAO.favorito(Long.parseLong(request.getParameter("txtIdER")), getParametersMultimedia(request)), response);
                    break;
                default:
                    request.getRequestDispatcher("/jsp/gc/publicaciones/multimedia.jsp").forward(request, response);
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

    private void procesarMultimedia(BEAN_CRUD bean_crud, HttpServletResponse response) {
        try {
            this.jsonResponse = this.json.toJson(bean_crud);
            response.setContentType("application/json");
            response.getWriter().write(this.jsonResponse);
            this.logger.info(this.jsonResponse);
        } catch (IOException ex) {
            Logger.getLogger(GestionTransparenteAPI.class.getName()).log(Level.SEVERE, null, ex);
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
        if (request.getParameter("txtEstadoER").equals("true")) {
            this.parameters.put("ESTADO", "false");
        } else {
            this.parameters.put("ESTADO", "true");
        }
        if (request.getParameter("txtDefectoER").equals("true")) {
            this.parameters.put("ESTADO", "false");
        } else {
            this.parameters.put("ESTADO", "true");
        }
        this.parameters.put("SQL_ORDERS", "FECHA DESC");
        this.parameters.put("LIMIT",
                " LIMIT " + request.getParameter("sizePageMultimedia") + " OFFSET "
                + (Integer.parseInt(request.getParameter("numberPageMultimedia")) - 1)
                * Integer.parseInt(request.getParameter("sizePageMultimedia")));
        return this.parameters;
    }

    private Multimedia getMultimedia(HttpServletRequest request) {
        Multimedia obj = new Multimedia();
        if (request.getParameter("action").equals("updateMultimedia")) {
            obj.setId(Integer.parseInt(request.getParameter("txtIdER")));
        }
        Persona per = ((Usuario) this.session.getAttribute("user")).getPersona();
        obj.setUsuario(per);
        obj.setFecha(Utilities.getDateSQLFORMAT(String.valueOf(request.getParameter("txtFechaER")), "dd/MM/yyyy"));
        obj.setTitulo(request.getParameter("txtTituloER"));
        obj.setFuente(request.getParameter("txtFuenteER"));
        obj.setEstado(true);
        obj.setDefecto(false);
        return obj;
    }
}
