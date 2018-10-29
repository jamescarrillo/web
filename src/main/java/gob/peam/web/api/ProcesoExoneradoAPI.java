/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gob.peam.web.api;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import gob.peam.web.dao.ProcesoExoneradoDAO;
import gob.peam.web.dao.impl.ProcesoExoneradoDAOImpl;
import gob.peam.web.model.ProcesoExonerado;
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
@WebServlet(name = "ProcesoExoneradoAPI", urlPatterns = {"/procesosexonerados"})
public class ProcesoExoneradoAPI extends HttpServlet {

    @Resource(name = "jdbc/dbweb")
    private DataSource pool;
    private HttpSession session;
    private Gson json;
    private String jsonResponse;
    private HashMap<String, Object> parameters;
    private final Log logger = LogFactory.getLog(DocumentoAPI.class);
    private String action;

    private ProcesoExoneradoDAO procesoExoneradoDAO;

    @Override
    public void init() throws ServletException {
        super.init(); // To change body of generated methods, choose Tools | Templates.
        this.json = new GsonBuilder().setDateFormat("dd/MM/yyyy").create();
        this.parameters = new HashMap<>();
        this.action = "";

        this.procesoExoneradoDAO = new ProcesoExoneradoDAOImpl(this.pool);
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
                case "paginarProcesoExonerado":
                    procesarProcesoExonerado(new BEAN_CRUD(this.procesoExoneradoDAO.getPagination(getParametersProcesoExonerado(request))), response);
                    break;
                case "addProcesoExonerado":
                    procesarProcesoExonerado(this.procesoExoneradoDAO.add(getProcesoExonerado(request), getParametersProcesoExonerado(request)), response);
                    break;
                case "updateProcesoExonerado":
                    procesarProcesoExonerado(this.procesoExoneradoDAO.update(getProcesoExonerado(request), getParametersProcesoExonerado(request)), response);
                    break;
                case "deleteProcesoExonerado":
                    procesarProcesoExonerado(this.procesoExoneradoDAO.delete(Long.parseLong(request.getParameter("txtIdER")), getParametersProcesoExonerado(request)), response);
                    break;
                default:
                    request.getRequestDispatcher("/jsp/gc/convocatorias/procesoexonerado.jsp").forward(request, response);
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

    private void procesarProcesoExonerado(BEAN_CRUD bean_crud, HttpServletResponse response) {
        try {
            this.jsonResponse = this.json.toJson(bean_crud);
            response.setContentType("application/json");
            response.getWriter().write(this.jsonResponse);
            this.logger.info(this.jsonResponse);
        } catch (IOException ex) {
            Logger.getLogger(DocumentoWebAPI.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private HashMap<String, Object> getParametersProcesoExonerado(HttpServletRequest request) {
        this.parameters.clear();
        this.parameters.put("FILTER", request.getParameter("txtProcesoExonerado").toLowerCase());
        if (request.getParameter("comboAnio").equals("-1")) {
            this.parameters.put("SQL_ANIO", "");
        } else {
            this.parameters.put("SQL_ANIO", "AND ANHO = '" + request.getParameter("comboAnio") + "' ");
        }
        this.parameters.put("SQL_ORDERS", "ANHO DESC");
        this.parameters.put("LIMIT",
                " LIMIT " + request.getParameter("sizePageProcesoExonerado") + " OFFSET "
                + (Integer.parseInt(request.getParameter("numberPageProcesoExonerado")) - 1)
                * Integer.parseInt(request.getParameter("sizePageProcesoExonerado")));
        return this.parameters;
    }

    private ProcesoExonerado getProcesoExonerado(HttpServletRequest request) {
        ProcesoExonerado obj = new ProcesoExonerado();
        if (request.getParameter("action").equals("updateProcesoExonerado")) {
            obj.setId(Integer.parseInt(request.getParameter("txtIdER")));
        }
        obj.setContratista(request.getParameter("txtContratistaER"));
        obj.setAnho(request.getParameter("datePickerFAProcesoExoneradoER").substring(6, 10));
        obj.setRuc(request.getParameter("txtRucER"));
        obj.setObjeto(request.getParameter("txtObjetoER"));
        obj.setNro_exonerado(request.getParameter("txtNroExoneracionER"));
        if (!request.getParameter("datePickerFAProcesoExoneradoER").equals("")) {
            obj.setFecha(Utilities.getDateSQLFORMAT(request.getParameter("datePickerFAProcesoExoneradoER"), "dd/MM/yyyy"));
        }
        obj.setCausa(request.getParameter("txtCausaER"));
        obj.setDescripcion(request.getParameter("txtDescripcionER"));
        obj.setMonto(request.getParameter("txtMontoER"));
        obj.setUrl(request.getParameter("txtUrlER"));
        return obj;
    }

}
