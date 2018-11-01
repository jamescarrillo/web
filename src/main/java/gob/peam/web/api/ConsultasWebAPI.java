/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gob.peam.web.api;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import gob.peam.web.dao.ComentSuggestDAO;
import gob.peam.web.dao.LibroReclamoDAO;
import gob.peam.web.dao.SolicitudDAO;
import gob.peam.web.dao.impl.ComentSuggestDAOImpl;
import gob.peam.web.dao.impl.LibroReclamoDAOImpl;
import gob.peam.web.dao.impl.SolicitudDAOImpl;
import gob.peam.web.model.ComentSuggest;
import gob.peam.web.model.LibroReclamo;
import gob.peam.web.model.Solicitud;
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
@WebServlet(name = "ConsultasWebAPI", urlPatterns = {"/consultas/consultas-y-sugerencias",
"/consultas/libro-de-reclamaciones",
"/consultas/acceso-informacion"})
public class ConsultasWebAPI extends HttpServlet {

    @Resource(name = "jdbc/dbweb")
    private DataSource pool;
    private Gson json;
    private String jsonResponse;
    private HashMap<String, Object> parameters;
    private static final Logger LOG = Logger.getLogger(PublicacionesWebAPI.class.getName());
    private String action;

    private ComentSuggestDAO comentsuggestDAO;
    private LibroReclamoDAO libroreclamoDAO;
    private SolicitudDAO solicitudDAO;

    @Override
    public void init() throws ServletException {
        super.init(); // To change body of generated methods, choose Tools | Templates.
        this.json = new GsonBuilder().setDateFormat("dd/MM/yyyy").create();
        this.parameters = new HashMap<>();
        this.action = "";

        comentsuggestDAO = new ComentSuggestDAOImpl(this.pool);
        libroreclamoDAO = new LibroReclamoDAOImpl(this.pool);
        solicitudDAO = new SolicitudDAOImpl(this.pool);

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
                case "/consultas/consultas-y-sugerencias":
                    this.action = request.getParameter("action") == null ? "" : request.getParameter("action");
                    switch (action) {
                        case "addConsulta":
                            procesarConsulta(this.comentsuggestDAO.add(getConsulta(request), getParametersConsulta(request)), response);
                            break;
                        default:
                            request.getRequestDispatcher("/jsp/web/publicaciones/comentariossugerencias.jsp").forward(request, response);
                            break;
                    }
                    break;
                case "/consultas/libro-de-reclamaciones":
                    this.action = request.getParameter("action") == null ? "" : request.getParameter("action");
                    switch (action) {
                        case "addReclamo":
                            procesarReclamo(this.libroreclamoDAO.add(getReclamo(request), getParametersReclamo(request)), response);
                            break;
                        default:
                            request.getRequestDispatcher("/jsp/web/publicaciones/libroreclamaciones.jsp").forward(request, response);
                            break;
                    }
                    break;
                case "/consultas/acceso-informacion":
                    this.action = request.getParameter("action") == null ? "" : request.getParameter("action");
                    switch (action) {
                        case "addSolicitud":
                            procesarSolicitud(this.solicitudDAO.add(getSolicitud(request), getParametersSolicitud(request)), response);
                            break;
                        default:
                            request.getRequestDispatcher("/jsp/web/publicaciones/accesoalainformacion.jsp").forward(request, response);
                            break;
                    }
                    break;
                    }
            }catch (SQLException ex) {
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
        protected void doGet
        (HttpServletRequest request, HttpServletResponse response)
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
        protected void doPost
        (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            processRequest(request, response);
        }

        /**
         * Returns a short description of the servlet.
         *
         * @return a String containing servlet description
         */
        @Override
        public String getServletInfo
        
            () {
        return "Short description";
        }// </editor-fold>

    

    private void procesarConsulta(BEAN_CRUD bean_crud, HttpServletResponse response) {
        try {
            this.jsonResponse = this.json.toJson(bean_crud);
            response.setContentType("application/json");
            response.getWriter().write(this.jsonResponse);
        } catch (IOException ex) {
            Logger.getLogger(GestionTransparenteAPI.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private HashMap<String, Object> getParametersConsulta(HttpServletRequest request) {
        this.parameters.clear();
        return this.parameters;
    }

    private ComentSuggest getConsulta(HttpServletRequest request) {
        ComentSuggest obj = new ComentSuggest();
        obj.setUsuario(request.getParameter("txtInteresado"));
        obj.setCorreo(request.getParameter("txtEmail"));
        obj.setTema(request.getParameter("txtTema"));
        obj.setDescripcion(request.getParameter("txtMensaje"));
        return obj;
    }
    
    private void procesarReclamo(BEAN_CRUD bean_crud, HttpServletResponse response) {
        try {
            this.jsonResponse = this.json.toJson(bean_crud);
            response.setContentType("application/json");
            response.getWriter().write(this.jsonResponse);
        } catch (IOException ex) {
            Logger.getLogger(GestionTransparenteAPI.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private HashMap<String, Object> getParametersReclamo(HttpServletRequest request) {
        this.parameters.clear();
        return this.parameters;
    }

    private LibroReclamo getReclamo(HttpServletRequest request) {
        LibroReclamo obj = new LibroReclamo();
        obj.setUsuario(request.getParameter("txtInteresado"));
        obj.setE_mail(request.getParameter("txtEmail"));
        obj.setDocumento_identidad(request.getParameter("comboTipoDocumento"));
        obj.setNumero_documento(request.getParameter("txtNroDocumento"));
        obj.setTelefono(request.getParameter("txtTelefono"));
        obj.setDireccion(request.getParameter("txtDomicilio"));
        obj.setDescripcion_atencion(request.getParameter("txtMensaje"));
        return obj;
    }
    
    private void procesarSolicitud(BEAN_CRUD bean_crud, HttpServletResponse response) {
        try {
            this.jsonResponse = this.json.toJson(bean_crud);
            response.setContentType("application/json");
            response.getWriter().write(this.jsonResponse);
        } catch (IOException ex) {
            Logger.getLogger(GestionTransparenteAPI.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private HashMap<String, Object> getParametersSolicitud(HttpServletRequest request) {
        this.parameters.clear();
        return this.parameters;
    }

    private Solicitud getSolicitud(HttpServletRequest request) {
        Solicitud obj = new Solicitud();
        obj.setUsuario(request.getParameter("txtInteresado"));
        obj.setDni(request.getParameter("txtNroDocumento"));
        obj.setDomicilio(request.getParameter("txtDomicilio"));
        obj.setTelefono(request.getParameter("txtTelefono"));
        obj.setCorreo(request.getParameter("txtEmail"));
        obj.setForma(Integer.parseInt(request.getParameter("comboTipoFormato")));
        obj.setDependencia(request.getParameter("txtDependencia"));
        obj.setDescripcion(request.getParameter("txtMensaje"));
        return obj;
    }

}
