/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gob.peam.web.api;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import gob.peam.web.dao.ObraDAO;
import gob.peam.web.dao.impl.ObraDAOImpl;
import gob.peam.web.model.LineaAccion;
import gob.peam.web.model.Obra;
import gob.peam.web.model.Persona;
import gob.peam.web.model.Usuario;
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
@WebServlet(name = "ObraAPI", urlPatterns = {"/publicaciones/obrasyproyectos"})
public class ObraAPI extends HttpServlet {
    
    @Resource(name = "jdbc/dbweb")
    private DataSource pool;
    private HttpSession session;
    private Gson json;
    private String jsonResponse;
    private HashMap<String, Object> parameters;
    private final Log logger = LogFactory.getLog(DocumentoAPI.class);
    private String action;

    private ObraDAO ObraDAO;

    @Override
    public void init() throws ServletException {
        super.init(); // To change body of generated methods, choose Tools | Templates.
        this.json = new GsonBuilder().setDateFormat("dd/MM/yyyy").create();
        this.parameters = new HashMap<>();
        this.action = "";

        this.ObraDAO = new ObraDAOImpl(this.pool);
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
                case "paginarObra":
                    procesarObra(new BEAN_CRUD(this.ObraDAO.getPagination(getParametersObra(request))), response);
                    break;
                case "addObra":
                    procesarObra(this.ObraDAO.add(getObra(request), getParametersObra(request)), response);
                    break;
                case "updateObra":
                    procesarObra(this.ObraDAO.update(getObra(request), getParametersObra(request)), response);
                    break;
                case "deleteObra":
                    procesarObra(this.ObraDAO.delete(Long.parseLong(request.getParameter("txtIdER")), getParametersObra(request)), response);
                    break;
                case "activateObra":
                    procesarObra(this.ObraDAO.activate(Long.parseLong(request.getParameter("txtIdER")), getParametersObra(request)), response);
                    break;
                default:
                    request.getRequestDispatcher("/jsp/gc/publicaciones/obra.jsp").forward(request, response);
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

    private void procesarObra(BEAN_CRUD bean_crud, HttpServletResponse response) {
        try {
            this.jsonResponse = this.json.toJson(bean_crud);
            response.setContentType("application/json");
            response.getWriter().write(this.jsonResponse);
            this.logger.info(this.jsonResponse);
        } catch (IOException ex) {
            Logger.getLogger(GestionTransparenteAPI.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private HashMap<String, Object> getParametersObra(HttpServletRequest request) {
        this.parameters.clear();
        this.parameters.put("FILTER", request.getParameter("txtObra").toLowerCase());
        if (request.getParameter("comboAnio").equals("-1")) {
            this.parameters.put("SQL_ANIO", "");
        } else {
            this.parameters.put("SQL_ANIO", "AND ANHO = '" + request.getParameter("comboAnio") + "' ");
        }
        if (request.getParameter("txtEstadoObraER").equals("true")) {
            this.parameters.put("ESTADOP", "false");
        } else {
            this.parameters.put("ESTADOP", "true");
        }
        this.parameters.put("SQL_ORDERS", "ANHO DESC");
        this.parameters.put("LIMIT",
                " LIMIT " + request.getParameter("sizePageObra") + " OFFSET "
                + (Integer.parseInt(request.getParameter("numberPageObra")) - 1)
                * Integer.parseInt(request.getParameter("sizePageObra")));
        return this.parameters;
    }

    private Obra getObra(HttpServletRequest request) {
        Obra obj = new Obra();
        if (request.getParameter("action").equals("updateObra")) {
            obj.setId(Integer.parseInt(request.getParameter("txtIdER")));
            Persona per = ((Usuario) this.session.getAttribute("user")).getPersona();
            obj.setEditadoPor(per);
        }
        Persona per = ((Usuario) this.session.getAttribute("user")).getPersona();
        obj.setCreadoPor(per);
        obj.setFechaInicio(Utilities.getDateSQLFORMAT(String.valueOf(request.getParameter("txtFechaInicioER")), "dd/MM/yyyy"));
        obj.setFechaFin(Utilities.getDateSQLFORMAT(String.valueOf(request.getParameter("txtFechaFinER")), "dd/MM/yyyy"));
        obj.setAnho(String.valueOf(request.getParameter("txtFechaInicioER")).substring(6, 10));
        obj.setMes(String.valueOf(request.getParameter("txtFechaInicioER")).substring(3, 5));
        obj.setDescripcion(request.getParameter("txtDescripcionER").toUpperCase());
        obj.setMontoInversion(Integer.parseInt(request.getParameter("txtMontoInversionER")));
        obj.setMontoGastado(Integer.parseInt(request.getParameter("txtMontoGastadoER")));
        obj.setTiempoEjecucion(Integer.parseInt((request.getParameter("txtTiempoEjecucionER"))));
        obj.setModalidadEjecucion(request.getParameter("txtModalidadEjecucionER"));
        obj.setSeguimiento(request.getParameter("comboSeguimientoER"));
        obj.setUbicacion(request.getParameter("txtDescripcionER"));
        obj.setContratista(request.getParameter("txtContratistaER"));
        obj.setSupervisor(request.getParameter("txtSuppervisorER"));
        obj.setResidente(request.getParameter("txtResidenteER"));
        obj.setAvanceFisico(Integer.parseInt(request.getParameter("txtAvanceFisicoER")));
        obj.setArea(new LineaAccion(Integer.parseInt(request.getParameter("comboAreaER"))));
        obj.setGaleria(request.getParameter("txtGaleriaER"));
        obj.setFoto(request.getParameter("txtFotoER"));
        obj.setAnhoActualizacion(request.getParameter("txtAnhoActualizacionER"));
        obj.setMesActualizacion(request.getParameter("txtMesActualizacionER"));
        obj.setSnip(request.getParameter("txtSnipER"));
        obj.setObservacion(request.getParameter("txtObservacionER"));
        obj.setInfobras(request.getParameter("txtInfobrasER"));
        obj.setLeyenda(request.getParameter("txtLeyendaER"));
        obj.setEstado(false);
        return obj;
    }
}