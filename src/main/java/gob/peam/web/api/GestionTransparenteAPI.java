/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gob.peam.web.api;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import gob.peam.web.dao.DirectivoDAO;
import gob.peam.web.dao.FuncionarioDAO;
import gob.peam.web.dao.impl.DirectivoDAOImpl;
import gob.peam.web.dao.impl.FuncionarioDAOImpl;
import gob.peam.web.model.Directivo;
import gob.peam.web.model.Funcionario;
import gob.peam.web.utilities.BEAN_CRUD;
import gob.peam.web.utilities.Utilities;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
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
 * @author James Carrillo
 */
@MultipartConfig
@WebServlet(name = "GestionTransparenteController", urlPatterns = {"/gestiontransparente/actasconciliacion",
    "/gestiontransparente/actassesion", "/gestiontransparente/adquisiciones",
    "/gestiontransparente/declaracionjurada", "/gestiontransparente/evaluacionactualizacion",
    "/gestiontransparente/gestiondocumentos", "/gestiontransparente/indicadoresdesempenio",
    "/gestiontransparente/itp", "/gestiontransparente/laudos", "/gestiontransparente/modificatoriaspac",
    "/gestiontransparente/personal", "/gestiontransparente/directivos", "/gestiontransparente/proyectosinversion",
    "/gestiontransparente/recomendacionesauditorias", "/gestiontransparente/viaticos"})
public class GestionTransparenteAPI extends HttpServlet {

    private static final long serialVersionUID = 1L;
    @Resource(name = "jdbc/dbweb")
    private DataSource pool;
    private HttpSession session;
    private Gson json;
    private String jsonResponse;
    private HashMap<String, Object> parameters;
    private HashMap<String, Object> jsonROOT;
    private final Log logger = LogFactory.getLog(GestionTransparenteAPI.class);

    private String action;
    private DirectivoDAO directivoDAO;
    private FuncionarioDAO funcionarioDAO;

    @Override
    public void init() throws ServletException {
        super.init(); // To change body of generated methods, choose Tools | Templates.
        //this.json = new GsonBuilder().setDateFormat("dd/MM/yyyy HH:mm:ss").create();
        this.json = new GsonBuilder().setDateFormat("dd/MM/yyyy").create();
        this.parameters = new HashMap<>();
        this.jsonROOT = new HashMap<>();
        this.action = "";
        this.directivoDAO = new DirectivoDAOImpl(this.pool);
        this.funcionarioDAO = new FuncionarioDAOImpl(this.pool);
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
                case "/gestiontransparente/actasconciliacion":
                    break;
                case "/gestiontransparente/actassesion":
                    break;
                case "/gestiontransparente/adquisiciones":
                    break;
                case "/gestiontransparente/declaracionjurada":
                    break;
                case "/gestiontransparente/evaluacionactualizacion":
                    break;
                case "/gestiontransparente/gestiondocumentos":
                    break;
                case "/gestiontransparente/indicadoresdesempenio":
                    break;
                case "/gestiontransparente/itp":
                    break;
                case "/gestiontransparente/laudos":
                    break;
                case "/gestiontransparente/modificatoriaspac":
                    break;
                case "/gestiontransparente/personal":
                    break;
                case "/gestiontransparente/directivos":
                    action = request.getParameter("action") == null ? "" : request.getParameter("action");
                    switch (action) {
                        case "paginarFuncionario":
                            procesarFuncionario(new BEAN_CRUD(this.funcionarioDAO.getPagination(getParametersFuncionarios(request))), response);
                            break;
                        case "addFuncionario":
                            procesarFuncionario(this.funcionarioDAO.add(getFuncionario(request), getParametersFuncionarios(request)), response);
                            break;
                        case "updateFuncionario":
                            procesarFuncionario(this.funcionarioDAO.update(getFuncionario(request), getParametersFuncionarios(request)), response);
                            break;
                        case "deleteFuncionario":
                            procesarFuncionario(this.funcionarioDAO.delete(Long.parseLong(request.getParameter("txtIdFuncionarioER")), getParametersFuncionarios(request)), response);
                            break;
                        case "paginarDirectivo":
                            procesarDirectivo(new BEAN_CRUD(this.directivoDAO.getPagination(getParametersDirectivos(request))), request, response);
                            break;
                        case "addDirectivo":
                            procesarDirectivo(this.directivoDAO.add(getDirectivo(request), getParametersDirectivos(request)), request, response);
                            break;
                        case "updateDirectivo":
                            procesarDirectivo(this.directivoDAO.update(getDirectivo(request), getParametersDirectivos(request)), request, response);
                            break;
                        case "deleteDirectivo":
                            procesarDirectivo(this.directivoDAO.delete(Long.parseLong(request.getParameter("txtIdFuncionarioER")), getParametersDirectivos(request)), request, response);
                            break;
                        default:
                            request.getRequestDispatcher("/jsp/gc/gestion_transparente/directivos.jsp").forward(request, response);
                            break;
                    }
                    break;
                case "/gestiontransparente/proyectosinversion":
                    break;
                case "/gestiontransparente/recomendacionesauditorias":
                    break;
                case "/gestiontransparente/viaticos":
                    break;
                default:
            }
        } catch (SQLException ex) {
            Logger.getLogger(GestionTransparenteAPI.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the
    // + sign on the left to edit the code.">
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

    /*FUNCIONARIOS*/
    private void procesarFuncionario(BEAN_CRUD beanCrud, HttpServletResponse response) {
        try {
            this.jsonROOT.clear();
            this.jsonResponse = this.json.toJson(beanCrud);
            response.setContentType("application/json");
            response.getWriter().write(this.jsonResponse);
            this.logger.info(this.jsonResponse);
        } catch (IOException ex) {
            Logger.getLogger(GestionTransparenteAPI.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private HashMap<String, Object> getParametersFuncionarios(HttpServletRequest request) {
        this.parameters.clear();
        this.parameters.put("FILTER", request.getParameter("txtNombreFuncionario").toLowerCase());
        if (request.getParameter("comboTipoListaFuncionarios").equals("-1")) {
            this.parameters.put("SQL_ESTADO", "");
        } else {
            this.parameters.put("SQL_ESTADO", "AND ESTADO = " + request.getParameter("comboTipoListaFuncionarios") + " ");
        }
        this.parameters.put("SQL_ORDERS", "NOMBRES_APELLIDOS");
        this.parameters.put("LIMIT",
                " LIMIT " + request.getParameter("sizePageFuncionarios") + " OFFSET "
                + (Integer.parseInt(request.getParameter("numberPageFuncionarios")) - 1)
                * Integer.parseInt(request.getParameter("sizePageFuncionarios")));
        return this.parameters;
    }

    private Funcionario getFuncionario(HttpServletRequest request) {
        Funcionario funcionario = new Funcionario();
        if (request.getParameter("action").equals("updateFuncioanario")) {
            funcionario.setId(Integer.parseInt(request.getParameter("")));
        }
        funcionario.setOrganigrama(request.getParameter("comboOficinaER"));
        funcionario.setTratamiento(request.getParameter("txtTratamientoER"));
        funcionario.setNombres_apellidos(request.getParameter("txtNombreCompletoER"));
        funcionario.setCargo(request.getParameter("txtCargoER"));
        funcionario.setNivel_remunerativo(request.getParameter("txtNivelER"));
        funcionario.setNumero_dni(request.getParameter("txtDniER"));
        funcionario.setResolucion(request.getParameter("txtDesignadoPorER"));
        if (!request.getParameter("datePickerFechaDesignacion").equals("")) {
            funcionario.setFecha_designacion(Utilities.getDateSQLFORMAT(request.getParameter("datePickerFechaDesignacion"), "dd/MM/yyyy"));
        }
        funcionario.setTelefono(request.getParameter("txtTelefonoER"));
        funcionario.setFax(request.getParameter("txtFaxER"));
        funcionario.setE_mail(request.getParameter("txtEmailER"));
        funcionario.setFoto(request.getParameter(""));
        funcionario.setProfesion(request.getParameter(""));
        funcionario.setResumen(request.getParameter("txtResumenER"));
        funcionario.setRetribucion_mensual(Double.parseDouble(request.getParameter("")));
        funcionario.setHoja_vida(request.getParameter(""));
        funcionario.setEstado(Boolean.parseBoolean(request.getParameter("comboEstadoER")));
        funcionario.setDestacado(Boolean.parseBoolean(request.getParameter("comboDestacadoER")));
        funcionario.setFecha_inicio(Utilities.getDateSQLFORMAT(request.getParameter(""), "dd/MM/yyyy"));
        return funcionario;
    }

    /*DIRECTIVOS*/
    private void procesarDirectivo(BEAN_CRUD beanCrud, HttpServletRequest request, HttpServletResponse response) throws IOException {
        this.jsonROOT.clear();
        this.jsonResponse = this.json.toJson(this.jsonROOT);
        response.setContentType("application/json");
        try {
            response.getWriter().write(this.jsonResponse);
        } catch (IOException e) {
            // TODO Auto-generated catch block
            throw e;
        }
    }

    private HashMap<String, Object> getParametersDirectivos(HttpServletRequest request) {
        this.parameters.clear();
        this.parameters.put("FILTER", request.getParameter("txtNombreFuncionario"));
        this.parameters.put("SQL_ORDERS", "NOMBRES_APELLIDOS");
        this.parameters.put("LIMIT",
                " LIMIT " + request.getParameter("comboTamPaginaFuncionarios") + " OFFSET "
                + (Integer.parseInt(request.getParameter("NumPaginaFuncionarios")) - 1)
                * Integer.parseInt(request.getParameter("comboTamPaginaFuncionarios")));
        return this.parameters;
    }

    private Directivo getDirectivo(HttpServletRequest request) {
        Directivo directivo = new Directivo();
        directivo.setNombres_apellidos(request.getParameter(""));

        return directivo;
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
