/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gob.peam.web.api;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import gob.peam.web.dao.EventoDAO;
import gob.peam.web.dao.impl.EventoDAOImpl;
import gob.peam.web.model.Evento;
import gob.peam.web.model.LineaAccion;
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
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 *
 * @author JhanxD
 */
@WebServlet(name = "EventoAPI", urlPatterns = {"/publicaciones/eventos"})
public class EventoAPI extends HttpServlet {
    
    @Resource(name = "jdbc/dbweb")
    private DataSource pool;
    private HttpSession session;
    private Gson json;
    private String jsonResponse;
    private HashMap<String, Object> parameters;
    private final Log logger = LogFactory.getLog(DocumentoAPI.class);
    private String action;
    
    private EventoDAO eventoDAO;

    @Override
    public void init() throws ServletException {
        super.init(); // To change body of generated methods, choose Tools | Templates.
        this.json = new GsonBuilder().setDateFormat("dd/MM/yyyy").create();
        this.parameters = new HashMap<>();
        this.action = "";

        this.eventoDAO = new EventoDAOImpl(this.pool);
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
                case "paginarEvento":
                    procesarEvento(new BEAN_CRUD(this.eventoDAO.getPagination(getParametersEvento(request))), response);
                    break;
                case "addEvento":
                    procesarEvento(this.eventoDAO.add(getEvento(request), getParametersEvento(request)), response);
                    break;
                case "updateEvento":
                    procesarEvento(this.eventoDAO.update(getEvento(request), getParametersEvento(request)), response);
                    break;
                case "deleteEvento":
                    procesarEvento(this.eventoDAO.delete(Long.parseLong(request.getParameter("txtIdER")), getParametersEvento(request)), response);
                    break;
                default:
                    request.getRequestDispatcher("/jsp/gc/convocatorias/evento.jsp").forward(request, response);
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
    
    private void procesarEvento(BEAN_CRUD bean_crud, HttpServletResponse response) {
        try {
            this.jsonResponse = this.json.toJson(bean_crud);
            response.setContentType("application/json");
            response.getWriter().write(this.jsonResponse);
            this.logger.info(this.jsonResponse);
        } catch (IOException ex) {
            Logger.getLogger(GestionTransparenteAPI.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    private HashMap<String, Object> getParametersEvento(HttpServletRequest request) {
        this.parameters.clear();
        this.parameters.put("FILTER", request.getParameter("txtEvento").toLowerCase());
        if (request.getParameter("comboAnio").equals("-1")) {
            this.parameters.put("SQL_ANIO", "");
        } else {
            this.parameters.put("SQL_ANIO", "AND ANHO = '" + request.getParameter("comboAnio") + "' ");
        }
        
        this.parameters.put("SQL_ORDERS", "ANHO DESC");
        this.parameters.put("LIMIT",
                " LIMIT " + request.getParameter("sizePageEvento") + " OFFSET "
                + (Integer.parseInt(request.getParameter("numberPageEvento")) - 1)
                * Integer.parseInt(request.getParameter("sizePageEvento")));
        return this.parameters;
    }

    private Evento getEvento(HttpServletRequest request) {
        Evento obj = new Evento ();
        if (request.getParameter("action").equals("updateEvento")) {
            obj.setId(Integer.parseInt(request.getParameter("txtIdER")));
            obj.setEditado_por(Integer.parseInt("4"));
        }
        obj.setCreado_por(Integer.parseInt("4"));
        obj.setFecha(Utilities.getDateSQLFORMAT(String.valueOf(request.getParameter("txtFechaER")),"dd/MM/yyyy"));
        obj.setAnho(request.getParameter("txtAnhoER"));
        obj.setTitulo(request.getParameter("txtTituloER"));
        obj.setArea(new LineaAccion(Integer.parseInt(String.valueOf(request.getParameter("txtAreaER")))));
        obj.setFoto(request.getParameter("txtFotoER"));
        obj.setLink(request.getParameter("txtLinkER"));
        obj.setEstado(true);
        return obj;
    }

}
