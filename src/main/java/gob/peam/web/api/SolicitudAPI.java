/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gob.peam.web.api;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import gob.peam.web.dao.SolicitudDAO;
import gob.peam.web.dao.impl.SolicitudDAOImpl;
import gob.peam.web.model.Solicitud;
import gob.peam.web.utilities.BEAN_CRUD;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "SolicitudAPI", urlPatterns = {"/participacionciudadana/solicitudes"})
public class SolicitudAPI extends HttpServlet {
    
    @Resource(name = "jdbc/dbweb")
    private DataSource pool;
    private HttpSession session;
    private Gson json;
    private String jsonResponse;
    private HashMap<String, Object> parameters;
    private final Log logger = LogFactory.getLog(SolicitudAPI.class);
    private String action;

    private SolicitudDAO solicitudDAO;

    @Override
    public void init() throws ServletException {
        super.init(); // To change body of generated methods, choose Tools | Templates.
        this.json = new GsonBuilder().setDateFormat("dd/MM/yyyy").create();
        this.parameters = new HashMap<>();
        this.action = "";

        this.solicitudDAO = new SolicitudDAOImpl(this.pool);
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
                case "paginarSolicitud":
                    procesarSolicitud(new BEAN_CRUD(this.solicitudDAO.getPagination(getParametersSolicitud(request))), response);
                    break;
                case "addSolicitud":
                    procesarSolicitud(this.solicitudDAO.add(getSolicitud(request), getParametersSolicitud(request)), response);
                    break;
                case "revisarSolicitud":
                    procesarSolicitud(this.solicitudDAO.update(getSolicitud(request), getParametersSolicitud(request)), response);
                    break;
                case "deleteSolicitud":
                    procesarSolicitud(this.solicitudDAO.delete(Long.parseLong(request.getParameter("txtSoli_IdER")), getParametersSolicitud(request)), response);
                    break;
                default:
                    request.getRequestDispatcher("/jsp/gc/participacionciudadana/solicitud.jsp").forward(request, response);
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

    private void procesarSolicitud(BEAN_CRUD bean_crud, HttpServletResponse response) {
        try {
            this.jsonResponse = this.json.toJson(bean_crud);
            response.setContentType("application/json");
            response.getWriter().write(this.jsonResponse);
            this.logger.info(this.jsonResponse);
        } catch (IOException ex) {
            Logger.getLogger(SolicitudAPI.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private HashMap<String, Object> getParametersSolicitud(HttpServletRequest request) {
        this.parameters.clear();
        this.parameters.put("FILTER", request.getParameter("txtSolicitud").toLowerCase());
        if (request.getParameter("comboTipoListaSolicitud").equals("-1")) {
            this.parameters.put("SQL_ESTADO", "");
        } else {
            if (request.getParameter("comboTipoListaSolicitud").equals("true")) {
                this.parameters.put("SQL_ESTADO", "AND FECHA_ATENDIDO != ''");
            }else{
                this.parameters.put("SQL_ESTADO", "AND FECHA_ATENDIDO = ''");
            }
            
        }
        if (request.getParameter("comboAnio").equals("-1")) {
            this.parameters.put("SQL_ANIO", "");
        } else {
            this.parameters.put("SQL_ANIO", "AND ANHO = '" + request.getParameter("comboAnio") + "' ");
        }
        this.parameters.put("SQL_ORDERS", "SOLI_ID DESC");
        this.parameters.put("LIMIT",
                " LIMIT " + request.getParameter("sizePageSolicitud") + " OFFSET "
                + (Integer.parseInt(request.getParameter("numberPageSolicitud")) - 1)
                * Integer.parseInt(request.getParameter("sizePageSolicitud")));
        return this.parameters;
    }

    private Solicitud getSolicitud(HttpServletRequest request) {
        Solicitud obj = new Solicitud();
        if (request.getParameter("action").equals("revisarSolicitud")) {
            obj.setSoli_id(Integer.parseInt(request.getParameter("txtSoli_IdER")));
        }
        return obj;
    }
}