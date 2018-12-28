/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gob.peam.web.api;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import gob.peam.web.dao.AnuncioDAO;
import gob.peam.web.dao.DestacadoDAO;
import gob.peam.web.dao.FuncionarioDAO;
import gob.peam.web.dao.MultimediaDAO;
import gob.peam.web.dao.NotaPrensaDAO;
import gob.peam.web.dao.impl.AnuncioDAOImpl;
import gob.peam.web.dao.impl.BusquedaDAOImpl;
import gob.peam.web.dao.impl.DestacadoDAOImpl;
import gob.peam.web.dao.impl.FuncionarioDAOImpl;
import gob.peam.web.dao.impl.MultimediaDAOImpl;
import gob.peam.web.dao.impl.NotaPrensaDAOImpl;
import gob.peam.web.model.others.Conf_Web;
import gob.peam.web.utilities.Utilities;
import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
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
 * @author James Carrillo
 */
@WebServlet(name = "IndexAPI", urlPatterns = {"/index"})
public class IndexAPI extends HttpServlet {
    
    @Resource(name = "jdbc/dbweb")
    private DataSource pool;
    private Gson json;
    private String jsonResponse;
    private HashMap<String, Object> parameters;
    private HashMap<String, Object> parametersFuncionario;
    private HashMap<String, Object> JSONROOT;
    private static final Logger LOG = Logger.getLogger(IndexAPI.class.getName());
    private String action;
    
    private NotaPrensaDAO notaPrensaDAO;
    private DestacadoDAO destacadoDAO;
    private MultimediaDAO multimediaDAO;
    private AnuncioDAO anuncioDAO;
    private FuncionarioDAO funcionarioDAO;
    private BusquedaDAOImpl busquedaDAO;
    
    @Override
    public void init() throws ServletException {
        super.init(); // To change body of generated methods, choose Tools | Templates.
        this.json = new GsonBuilder().setDateFormat("dd/MM/yyyy").create();
        this.parameters = new HashMap<>();
        this.parametersFuncionario = new HashMap<>();
        this.JSONROOT = new HashMap<>();
        this.action = "";
        
        this.notaPrensaDAO = new NotaPrensaDAOImpl(this.pool);
        this.destacadoDAO = new DestacadoDAOImpl(this.pool);
        this.multimediaDAO = new MultimediaDAOImpl(this.pool);
        this.anuncioDAO = new AnuncioDAOImpl(this.pool);
        this.funcionarioDAO = new FuncionarioDAOImpl(this.pool);
        this.busquedaDAO = new BusquedaDAOImpl(this.pool);
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
        this.action = request.getParameter("action") == null ? "" : request.getParameter("action");
        LOG.info(action);
        switch (this.action) {
            case "getDataIndex":
                procesarDataIndex(response);
                break;
            case "buscarPage":
                procesBusqueda(request, response);
                break;
            default:
                request.getRequestDispatcher("index.jsp").forward(request, response);
                break;
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
    
    private void procesarDataIndex(HttpServletResponse response) {
        try {
            Conf_Web conf_web = Utilities.getConf_Web(getServletContext().getRealPath("/peam_resources_app/conf_app/files/"), "conf_web.properties");
            this.JSONROOT.clear();
            this.JSONROOT.put("DATA_DESTACADOS", this.destacadoDAO.getPagination(getParametersNotasPrensa()));
            this.JSONROOT.put("DATA_NOTASPRENSA", this.notaPrensaDAO.getPagination(getParametersNotasPrensa()));
            this.JSONROOT.put("DATA_MULTIMEDIA", this.multimediaDAO.getPagination(getParametersMultimedia(conf_web)));
            this.JSONROOT.put("DATA_ANUNCIOS", this.anuncioDAO.getAnunciosDia(Integer.parseInt(conf_web.getNumero_anuncios_mostrar())));
            this.JSONROOT.put("DATA_FUNCIONARIOS", this.funcionarioDAO.getPagination(getParametersFuncionarios()));
            this.JSONROOT.put("GALERIA_APIKEY", conf_web.getApikey());
            this.JSONROOT.put("GALERIA_IDUSUARIO", conf_web.getIdusuario());
            this.JSONROOT.put("GALERIA_IDALBUM", conf_web.getIdalbum());
            this.JSONROOT.put("GALERIA_NUM_FOTOS_MOSTRAR", conf_web.getNumero_fotos_galeria());
            this.jsonResponse = this.json.toJson(this.JSONROOT);
            response.setContentType("application/json");
            response.getWriter().write(this.jsonResponse);
            LOG.info(this.jsonResponse);
        } catch (SQLException | IOException ex) {
            Logger.getLogger(IndexAPI.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    private void procesBusqueda(HttpServletRequest request, HttpServletResponse response) {
        try {
            this.JSONROOT.clear();
            this.JSONROOT.put("DATA_BUSQUEDA", this.busquedaDAO.getBusqueda(request.getParameter("txtBusquedaPage"), 100));
            this.jsonResponse = this.json.toJson(this.JSONROOT);
            response.setContentType("application/json");
            response.getWriter().write(this.jsonResponse);
            LOG.info(this.jsonResponse);
        } catch (SQLException | IOException ex) {
            Logger.getLogger(IndexAPI.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    private HashMap<String, Object> getParametersNotasPrensa() {
        this.parameters.clear();
        LocalDate localdate = LocalDate.now();
        this.parameters.put("FILTER", "");
        this.parameters.put("SQL_ANIO", "AND ANHO = '" + localdate.getYear() + "' ");
        this.parameters.put("SQL_ESTADO", "AND ESTADO = true ");
        this.parameters.put("SQL_ORDERS", "FECHA DESC ");
        this.parameters.put("LIMIT", " LIMIT 10 OFFSET 0");
        return this.parameters;
    }
    
    private HashMap<String, Object> getParametersMultimedia(Conf_Web conf_web) {
        this.parameters.clear();
        this.parameters.put("FILTER", "");
        this.parameters.put("SQL_ANIO", "");
        this.parameters.put("SQL_ESTADO", "AND ESTADO = true AND \"default\" = true");
        this.parameters.put("SQL_ORDERS", "FECHA DESC");
        this.parameters.put("LIMIT", " LIMIT " + conf_web.getNumero_videos_multimedia() + " OFFSET 0");
        return this.parameters;
    }
    
    private HashMap<String, Object> getParametersFuncionarios() {
        this.parametersFuncionario.clear();
        this.parametersFuncionario.put("FILTER", "");
        this.parametersFuncionario.put("SQL_ESTADO", "AND ESTADO = TRUE AND DESTACADO = TRUE AND ORGANIGRAMA ='GERENCIA GENERAL'");
        this.parametersFuncionario.put("SQL_ORDERS", "NOMBRES_APELLIDOS");
        this.parametersFuncionario.put("LIMIT", "");
        return this.parametersFuncionario;
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
