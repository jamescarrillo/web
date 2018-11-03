/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gob.peam.web.api;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import gob.peam.web.dao.EstudioDAO;
import gob.peam.web.dao.EstudioDAO;
import gob.peam.web.dao.impl.EstudioDAOImpl;
import gob.peam.web.dao.impl.EstudioDAOImpl;
import gob.peam.web.model.Estudio;
import gob.peam.web.model.Persona;
import gob.peam.web.model.Usuario;
import gob.peam.web.utilities.BEAN_CRUD;
import gob.peam.web.utilities.Utilities;
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
@WebServlet(name = "EstudioAPI", urlPatterns = {"/publicaciones/estudios"})
public class EstudioAPI extends HttpServlet {

    @Resource(name = "jdbc/dbweb")
    private DataSource pool;
    private HttpSession session;
    private Gson json;
    private String jsonResponse;
    private HashMap<String, Object> parameters;
    private final Log logger = LogFactory.getLog(DocumentoAPI.class);
    private String action;

    private EstudioDAO estudioDAO;

    @Override
    public void init() throws ServletException {
        super.init(); // To change body of generated methods, choose Tools | Templates.
        this.json = new GsonBuilder().setDateFormat("dd/MM/yyyy").create();
        this.parameters = new HashMap<>();
        this.action = "";

        this.estudioDAO = new EstudioDAOImpl(this.pool);
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
                case "paginarEstudio":
                    procesarEstudio(new BEAN_CRUD(this.estudioDAO.getPagination(getParametersEstudio(request))), response);
                    break;
                case "addEstudio":
                    procesarEstudio(this.estudioDAO.add(getEstudio(request), getParametersEstudio(request)), response);
                    break;
                case "updateEstudio":
                    procesarEstudio(this.estudioDAO.update(getEstudio(request), getParametersEstudio(request)), response);
                    break;
                case "deleteEstudio":
                    procesarEstudio(this.estudioDAO.delete(Long.parseLong(request.getParameter("txtIdER")), getParametersEstudio(request)), response);
                    break;
                case "activateEstudio":
                    procesarEstudio(this.estudioDAO.activate(Long.parseLong(request.getParameter("txtIdER")), getParametersEstudio(request)), response);
                    break;
                default:
                    request.getRequestDispatcher("/jsp/gc/publicaciones/estudio.jsp").forward(request, response);
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

    private void procesarEstudio(BEAN_CRUD bean_crud, HttpServletResponse response) {
        try {
            this.jsonResponse = this.json.toJson(bean_crud);
            response.setContentType("application/json");
            response.getWriter().write(this.jsonResponse);
            this.logger.info(this.jsonResponse);
        } catch (IOException ex) {
            Logger.getLogger(GestionTransparenteAPI.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private HashMap<String, Object> getParametersEstudio(HttpServletRequest request) {
        this.parameters.clear();
        this.parameters.put("FILTER", request.getParameter("txtEstudio").toLowerCase());
        if (request.getParameter("comboAnio").equals("-1")) {
            this.parameters.put("SQL_ANIO", "");
        } else {
            this.parameters.put("SQL_ANIO", "AND ANHO = '" + request.getParameter("comboAnio") + "' ");
        }
        if (request.getParameter("txtEstadoEstudioER").equals("true")) {
            this.parameters.put("ESTADOP", "false");
        } else {
            this.parameters.put("ESTADOP", "true");
        }
        this.parameters.put("SQL_ORDERS", "ANHO DESC");
        this.parameters.put("LIMIT",
                " LIMIT " + request.getParameter("sizePageEstudio") + " OFFSET "
                + (Integer.parseInt(request.getParameter("numberPageEstudio")) - 1)
                * Integer.parseInt(request.getParameter("sizePageEstudio")));
        return this.parameters;
    }

    private Estudio getEstudio(HttpServletRequest request) {
        Estudio obj = new Estudio();
        if (request.getParameter("action").equals("updateEstudio")) {
            obj.setId(Integer.parseInt(request.getParameter("txtIdER")));
            Persona per = ((Usuario) this.session.getAttribute("user")).getPersona();
            obj.setEditado_por(per);
        }
        Persona per = ((Usuario) this.session.getAttribute("user")).getPersona();
        obj.setCreado_por(per);
        obj.setFecha(Utilities.getDateSQLFORMAT(String.valueOf(request.getParameter("txtFechaER")), "dd/MM/yyyy"));
        obj.setAnho(String.valueOf(request.getParameter("txtFechaER")).substring(6, 10));
        obj.setTitulo(request.getParameter("txtTituloER"));
        obj.setFoto(request.getParameter("txtFotoER"));
        obj.setSeguimiento(request.getParameter("comboSeguimientoER"));
        obj.setSnip(request.getParameter("txtSnipER"));
        obj.setObjetivo(request.getParameter("txtObjetivoER"));
        obj.setCantidad_beneficiarios(Integer.parseInt(request.getParameter("txtCantBeneficiariosER")));
        obj.setCaracteristicas_beneficiarios(request.getParameter("txtCaracBeneficiariosER"));
        obj.setLugar(request.getParameter("txtLugarER"));
        obj.setMapa(request.getParameter("txtMapaER"));
        obj.setEstado(false);
        return obj;
    }

}
