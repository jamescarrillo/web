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
import gob.peam.web.dao.OrdenCompraDAO;
import gob.peam.web.dao.OrdenServicioDAO;
import gob.peam.web.dao.PersonalCategoriaDAO;
import gob.peam.web.dao.PersonalDAO;
import gob.peam.web.dao.ProveedorDAO;
import gob.peam.web.dao.PublicidadDAO;
import gob.peam.web.dao.TelefoniaDAO;
import gob.peam.web.dao.VehiculoDAO;
import gob.peam.web.dao.impl.DirectivoDAOImpl;
import gob.peam.web.dao.impl.FuncionarioDAOImpl;
import gob.peam.web.dao.impl.OrdenCompraDAOImpl;
import gob.peam.web.dao.impl.OrdenServicioDAOImpl;
import gob.peam.web.dao.impl.PersonalCategoriaDAOImpl;
import gob.peam.web.dao.impl.PersonalDAOImpl;
import gob.peam.web.dao.impl.ProveedorDAOImpl;
import gob.peam.web.dao.impl.PublicidadDAOImpl;
import gob.peam.web.dao.impl.TelefoniaDAOImpl;
import gob.peam.web.dao.impl.VehiculoDAOImpl;
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
 * @author Juan Jose
 */
@WebServlet(name = "GestionTransparente2WebAPI", urlPatterns = {
    "/gestiontransparente/recursos-humanos",
    "/gestiontransparente/adquisiciones-y-contrataciones"})
public class GestionTransparente2WebAPI extends HttpServlet {

    @Resource(name = "jdbc/dbweb")
    private DataSource pool;
    private Gson json;
    private String jsonResponse;
    private String jsonResponseRRHH;
    private String jsonResponseOrdenCompra;
    private String jsonResponseOrdenServicio;
    private String jsonResponsePublicidad;
    private String jsonResponseTelefonia;
    private String jsonResponseVehiculo;
    private String jsonResponseProveedor;
    private HashMap<String, Object> JSONROOT;
    private HashMap<String, Object> parameters;
    private HashMap<String, Object> parametersFuncionario;
    private HashMap<String, Object> parametersDirectivo;
    private HashMap<String, Object> parametersOrdenCompra;
    private HashMap<String, Object> parametersOrdenServicio;
    private HashMap<String, Object> parametersPublicidad;
    private HashMap<String, Object> parametersTelefonia;
    private HashMap<String, Object> parametersVehiculo;
    private HashMap<String, Object> parametersProveedor;
    private static final Logger LOG = Logger.getLogger(GestionTransparente2WebAPI.class.getName());
    private String action;

    private OrdenCompraDAO ordenCompraDAO;
    private OrdenServicioDAO ordenServicioDAO;
    private PublicidadDAO publicidadDAO;
    private TelefoniaDAO telefoniaDAO;
    private VehiculoDAO vehiculoDAO;
    private ProveedorDAO proveedorDAO;

    private PersonalDAO personalDAO;
    private PersonalCategoriaDAO personalCategoriaDAO;
    private DirectivoDAO directivoDAO;
    private FuncionarioDAO funcionarioDAO;

    @Override
    public void init() throws ServletException {
        super.init(); // To change body of generated methods, choose Tools | Templates.
        this.json = new GsonBuilder().setDateFormat("dd/MM/yyyy").create();

        this.parameters = new HashMap<>();
        this.parametersFuncionario = new HashMap<>();
        this.parametersDirectivo = new HashMap<>();
        this.JSONROOT = new HashMap<>();

        this.parametersOrdenCompra = new HashMap<>();
        this.parametersOrdenServicio = new HashMap<>();
        this.parametersPublicidad = new HashMap<>();
        this.parametersTelefonia = new HashMap<>();
        this.parametersVehiculo = new HashMap<>();
        this.parametersProveedor = new HashMap<>();
        this.action = "";

        this.ordenCompraDAO = new OrdenCompraDAOImpl(this.pool);
        this.ordenServicioDAO = new OrdenServicioDAOImpl(this.pool);
        this.publicidadDAO = new PublicidadDAOImpl(this.pool);
        this.telefoniaDAO = new TelefoniaDAOImpl(this.pool);
        this.vehiculoDAO = new VehiculoDAOImpl(this.pool);
        this.proveedorDAO = new ProveedorDAOImpl(this.pool);

        this.personalDAO = new PersonalDAOImpl(this.pool);
        this.personalCategoriaDAO = new PersonalCategoriaDAOImpl(this.pool);
        this.directivoDAO = new DirectivoDAOImpl(this.pool);
        this.funcionarioDAO = new FuncionarioDAOImpl(this.pool);
    }

    /*
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
                case "getDataAdquisiciones":
                    procesarDataAdquisiciones(request, response);
                    break;
                case "paginarOrdenCompra":
                    procesarOrdenCompra(new BEAN_CRUD(this.ordenCompraDAO.getPagination(getParametersOrdenCompra(request))), response);
                    break;
                case "paginarOrdenServicio":
                    procesarOrdenServicio(new BEAN_CRUD(this.ordenServicioDAO.getPagination(getParametersOrdenServicio(request))), response);
                    break;
                case "paginarPublicidad":
                    procesarPublicidad(new BEAN_CRUD(this.publicidadDAO.getPagination(getParametersPublicidad(request))), response);
                    break;
                case "paginarTelefonia":
                    procesarTelefonia(new BEAN_CRUD(this.telefoniaDAO.getPagination(getParametersTelefonia(request))), response);
                    break;
                case "paginarVehiculo":
                    procesarVehiculo(new BEAN_CRUD(this.vehiculoDAO.getPagination(getParametersVehiculo(request))), response);
                    break;
                case "paginarProveedor":
                    procesarProveedor(new BEAN_CRUD(this.proveedorDAO.getPagination(getParametersProveedor(request))), response);
                    break;
                case "getDataOrganigrama":
                    procesarDataOrganigrama(request, response);
                    break;
                case "getDataRRHH":
                    procesarDataRRHH(request, response);
                    break;
                case "paginarPersonal":
                    procesarPersonal(new BEAN_CRUD(this.personalDAO.getPagination(getParametersPersonal(request))), response);
                    break;
                case "paginarPersonalCategoria":
                    procesarPersonalCategoria(new BEAN_CRUD(this.personalCategoriaDAO.getPagination(getParametersPersonalCategoria(request))), response);
                    break;
                default:
                    request.getRequestDispatcher("/jsp/web/gestiontransparente/" + getJSP(request)).forward(request, response);
                    break;
            }
        } catch (SQLException ex) {
            Logger.getLogger(GestionTransparente2WebAPI.class.getName()).log(Level.SEVERE, null, ex);
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

    private String getJSP(HttpServletRequest request) {
        String page;
        if (!request.getRequestURI().substring(request.getContextPath().length()).equals("/gestiontransparente/recursos-humanos")) {
            page = "documentoAdquisicionContratacion.jsp";
        } else {
            page = "rrhh.jsp";
        }
        return page;
    }

    private void procesarDataAdquisiciones(HttpServletRequest request, HttpServletResponse response) {
        try {
            this.JSONROOT.clear();
            this.JSONROOT.put("DATA_ORDEN_COMPRA", this.ordenCompraDAO.getPagination(getParametersOrdenCompra(request)));
            this.JSONROOT.put("DATA_ORDEN_SERVICIO", this.ordenServicioDAO.getPagination(getParametersOrdenServicio(request)));
            this.JSONROOT.put("DATA_PUBLICIDAD", this.publicidadDAO.getPagination(getParametersPublicidad(request)));
            this.JSONROOT.put("DATA_TELEFONIA", this.telefoniaDAO.getPagination(getParametersTelefonia(request)));
            this.JSONROOT.put("DATA_VEHICULO", this.vehiculoDAO.getPagination(getParametersVehiculo(request)));
            this.JSONROOT.put("DATA_PROVEEDOR", this.proveedorDAO.getPagination(getParametersProveedor(request)));
            this.jsonResponseOrdenCompra = this.json.toJson(this.JSONROOT);
            response.setContentType("application/json");
            response.getWriter().write(this.jsonResponseOrdenCompra);
            LOG.info(this.jsonResponseOrdenCompra);
        } catch (IOException | SQLException ex) {
            Logger.getLogger(GestionTransparenteAPI.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void procesarDataRRHH(HttpServletRequest request, HttpServletResponse response) {
        try {
            this.JSONROOT.clear();
            //this.JSONROOT.put("DATA_PERSONAL", this.personalDAO.getPagination(getParametersPersonal(request)));
            this.JSONROOT.put("DATA_PERSONAL_PORCATEGORIAS", this.personalCategoriaDAO.getPagination(getParametersPersonalCategoria(request)));
            this.JSONROOT.put("DATA_FUNCIONARIOS", this.funcionarioDAO.getPagination(getParametersFuncionarios()));
            this.JSONROOT.put("DATA_DIRECTIVOS", this.directivoDAO.getPagination(getParametersDirectivos()));
            this.jsonResponseRRHH = this.json.toJson(this.JSONROOT);
            response.setContentType("application/json");
            response.getWriter().write(this.jsonResponseRRHH);
            LOG.info(this.jsonResponseRRHH);
        } catch (IOException | SQLException ex) {
            Logger.getLogger(GestionTransparenteAPI.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void procesarDataOrganigrama(HttpServletRequest request, HttpServletResponse response) {
        try {
            this.JSONROOT.clear();
            this.JSONROOT.put("DATA_FUNCIONARIOS", this.funcionarioDAO.getPagination(getParametersFuncionarios()));
            this.JSONROOT.put("DATA_DIRECTIVOS", this.directivoDAO.getPagination(getParametersDirectivos()));
            this.jsonResponseRRHH = this.json.toJson(this.JSONROOT);
            response.setContentType("application/json");
            response.getWriter().write(this.jsonResponseRRHH);
            LOG.info(this.jsonResponseRRHH);
        } catch (IOException | SQLException ex) {
            Logger.getLogger(GestionTransparenteAPI.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private HashMap<String, Object> getParametersFuncionarios() {
        this.parametersFuncionario.clear();
        this.parametersFuncionario.put("FILTER", "");
        this.parametersFuncionario.put("SQL_ESTADO", "AND ESTADO = TRUE AND DESTACADO = TRUE ");
        this.parametersFuncionario.put("SQL_ORDERS", "NOMBRES_APELLIDOS");
        this.parametersFuncionario.put("LIMIT", "");
        return this.parametersFuncionario;
    }

    private HashMap<String, Object> getParametersDirectivos() {
        this.parametersDirectivo.clear();
        this.parametersDirectivo.put("FILTER", "");
        this.parametersDirectivo.put("SQL_ESTADO", "AND ESTADO = TRUE ");
        this.parametersDirectivo.put("SQL_ORDERS", "NOMBRES_APELLIDOS");
        this.parametersDirectivo.put("LIMIT", "");
        return this.parametersDirectivo;
    }

    private void procesarOrdenCompra(BEAN_CRUD beanCrud, HttpServletResponse response) {
        try {
            this.jsonResponseOrdenCompra = this.json.toJson(beanCrud);
            response.setContentType("application/json");
            response.getWriter().write(this.jsonResponseOrdenCompra);
            LOG.info(this.jsonResponseOrdenCompra);
        } catch (IOException ex) {
            Logger.getLogger(GestionTransparenteAPI.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private HashMap<String, Object> getParametersOrdenCompra(HttpServletRequest request) {
        this.parametersOrdenCompra.clear();
        this.parametersOrdenCompra.put("FILTER", request.getParameter("txtProveedorOrdenCompra").toLowerCase());
        this.parametersOrdenCompra.put("SQL_ORDERS", "FECHA_COMPRA DESC");
        if (request.getParameter("comboAnioOrdenCompra").equals("-1")) {
            this.parametersOrdenCompra.put("SQL_ESTADO", "AND ESTADO = TRUE ");
        } else {
            this.parametersOrdenCompra.put("SQL_ESTADO", "AND ESTADO = TRUE AND ANHO = '" + request.getParameter("comboAnioOrdenCompra") + "' ");
        }
        this.parametersOrdenCompra.put("LIMIT",
                " LIMIT " + request.getParameter("sizePageOrdenCompra") + " OFFSET "
                + (Integer.parseInt(request.getParameter("numberPageOrdenCompra")) - 1)
                * Integer.parseInt(request.getParameter("sizePageOrdenCompra")));
        return this.parametersOrdenCompra;
    }

    private void procesarOrdenServicio(BEAN_CRUD beanCrud, HttpServletResponse response) {
        try {
            this.jsonResponseOrdenServicio = this.json.toJson(beanCrud);
            response.setContentType("application/json");
            response.getWriter().write(this.jsonResponseOrdenServicio);
            LOG.info(this.jsonResponseOrdenServicio);
        } catch (IOException ex) {
            Logger.getLogger(GestionTransparenteAPI.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private HashMap<String, Object> getParametersOrdenServicio(HttpServletRequest request) {
        this.parametersOrdenServicio.clear();
        this.parametersOrdenServicio.put("FILTER", request.getParameter("txtProveedorOrdenServicio").toLowerCase());
        this.parametersOrdenServicio.put("SQL_ORDERS", "FECHA_COMPRA DESC");
        if (request.getParameter("comboAnioOrdenServicio").equals("-1")) {
            this.parametersOrdenServicio.put("SQL_ESTADO", "AND ESTADO = TRUE ");
        } else {
            this.parametersOrdenServicio.put("SQL_ESTADO", "AND ESTADO = TRUE AND ANHO = '" + request.getParameter("comboAnioOrdenServicio") + "' ");
        }
        this.parametersOrdenServicio.put("LIMIT",
                " LIMIT " + request.getParameter("sizePageOrdenServicio") + " OFFSET "
                + (Integer.parseInt(request.getParameter("numberPageOrdenServicio")) - 1)
                * Integer.parseInt(request.getParameter("sizePageOrdenServicio")));
        return this.parametersOrdenServicio;
    }

    private void procesarPublicidad(BEAN_CRUD beanCrud, HttpServletResponse response) {
        try {
            this.jsonResponsePublicidad = this.json.toJson(beanCrud);
            response.setContentType("application/json");
            response.getWriter().write(this.jsonResponsePublicidad);
            LOG.info(this.jsonResponsePublicidad);
        } catch (IOException ex) {
            Logger.getLogger(GestionTransparenteAPI.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private HashMap<String, Object> getParametersPublicidad(HttpServletRequest request) {
        this.parametersPublicidad.clear();
        this.parametersPublicidad.put("FILTER", request.getParameter("txtProveedorPublicidad").toLowerCase());
        this.parametersPublicidad.put("SQL_ORDERS", "ANHO DESC");
        if (request.getParameter("comboAnioPublicidad").equals("-1")) {
            this.parametersPublicidad.put("SQL_ESTADO", "AND ESTADO = TRUE ");
        } else {
            this.parametersPublicidad.put("SQL_ESTADO", "AND ESTADO = TRUE AND ANHO = '" + request.getParameter("comboAnioPublicidad") + "' ");
        }
        this.parametersPublicidad.put("LIMIT",
                " LIMIT " + request.getParameter("sizePagePublicidad") + " OFFSET "
                + (Integer.parseInt(request.getParameter("numberPagePublicidad")) - 1)
                * Integer.parseInt(request.getParameter("sizePagePublicidad")));
        return this.parametersPublicidad;
    }

    private void procesarTelefonia(BEAN_CRUD beanCrud, HttpServletResponse response) {
        try {
            this.jsonResponseTelefonia = this.json.toJson(beanCrud);
            response.setContentType("application/json");
            response.getWriter().write(this.jsonResponseTelefonia);
            LOG.info(this.jsonResponseTelefonia);
        } catch (IOException ex) {
            Logger.getLogger(GestionTransparenteAPI.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private HashMap<String, Object> getParametersTelefonia(HttpServletRequest request) {
        this.parametersTelefonia.clear();
        this.parametersTelefonia.put("FILTER", request.getParameter("txtAreaTelefonia").toLowerCase());
        this.parametersTelefonia.put("SQL_ORDERS", "AREA_OFICINA ASC");
        if (request.getParameter("comboAnioTelefonia").equals("-1")) {
            this.parametersTelefonia.put("SQL_ESTADO", "AND ESTADO = TRUE ");
        } else {
            this.parametersTelefonia.put("SQL_ESTADO", "AND ESTADO = TRUE AND ANHO = '" + request.getParameter("comboAnioTelefonia") + "' ");
        }
        this.parametersTelefonia.put("LIMIT",
                " LIMIT " + request.getParameter("sizePageTelefonia") + " OFFSET "
                + (Integer.parseInt(request.getParameter("numberPageTelefonia")) - 1)
                * Integer.parseInt(request.getParameter("sizePageTelefonia")));
        return this.parametersTelefonia;
    }

    private void procesarVehiculo(BEAN_CRUD beanCrud, HttpServletResponse response) {
        try {
            this.jsonResponseVehiculo = this.json.toJson(beanCrud);
            response.setContentType("application/json");
            response.getWriter().write(this.jsonResponseVehiculo);
            LOG.info(this.jsonResponseVehiculo);
        } catch (IOException ex) {
            Logger.getLogger(GestionTransparenteAPI.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private HashMap<String, Object> getParametersVehiculo(HttpServletRequest request) {
        this.parametersVehiculo.clear();
        this.parametersVehiculo.put("FILTER", request.getParameter("txtAreaVehiculo").toLowerCase());
        this.parametersVehiculo.put("SQL_ORDERS", "ID DESC");
        if (request.getParameter("comboAnioVehiculo").equals("-1")) {
            this.parametersVehiculo.put("SQL_ESTADO", "AND ESTADO = TRUE ");
        } else {
            this.parametersVehiculo.put("SQL_ESTADO", "AND ESTADO = TRUE AND ANHO = '" + request.getParameter("comboAnioVehiculo") + "' ");
        }
        this.parametersVehiculo.put("LIMIT",
                " LIMIT " + request.getParameter("sizePageVehiculo") + " OFFSET "
                + (Integer.parseInt(request.getParameter("numberPageVehiculo")) - 1)
                * Integer.parseInt(request.getParameter("sizePageVehiculo")));
        return this.parametersVehiculo;
    }

    private void procesarProveedor(BEAN_CRUD beanCrud, HttpServletResponse response) {
        try {
            this.jsonResponseProveedor = this.json.toJson(beanCrud);
            response.setContentType("application/json");
            response.getWriter().write(this.jsonResponseProveedor);
            LOG.info(this.jsonResponseProveedor);
        } catch (IOException ex) {
            Logger.getLogger(GestionTransparenteAPI.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private HashMap<String, Object> getParametersProveedor(HttpServletRequest request) {
        this.parametersProveedor.clear();
        this.parametersProveedor.put("FILTER", request.getParameter("txtProveedor").toLowerCase());
        this.parametersProveedor.put("SQL_ORDERS", "PROVEEDOR ASC");
        if (request.getParameter("comboAnioProveedor").equals("-1")) {
            this.parametersProveedor.put("SQL_ESTADO", "AND ESTADO = TRUE ");
        } else {
            this.parametersProveedor.put("SQL_ESTADO", "AND ESTADO = TRUE AND ANHO = '" + request.getParameter("comboAnioProveedor") + "' ");
        }
        this.parametersProveedor.put("LIMIT",
                " LIMIT " + request.getParameter("sizePageProveedor") + " OFFSET "
                + (Integer.parseInt(request.getParameter("numberPageProveedor")) - 1)
                * Integer.parseInt(request.getParameter("sizePageProveedor")));
        return this.parametersProveedor;
    }

    private void procesarPersonal(BEAN_CRUD beanCrud, HttpServletResponse response) {
        try {
            this.jsonResponse = this.json.toJson(beanCrud);
            response.setContentType("application/json");
            response.getWriter().write(this.jsonResponse);
            LOG.info(this.jsonResponse);
        } catch (IOException ex) {
            Logger.getLogger(GestionTransparenteAPI.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private HashMap<String, Object> getParametersPersonal(HttpServletRequest request) {
        this.parameters.clear();
        String complemento = request.getParameter("complemento") == null ? "" : request.getParameter("complemento");
        this.parameters.put("FILTER", request.getParameter("txtPersonal" + complemento).toLowerCase());
        this.parameters.put("SQL_ORDERS", "ID DESC, APELLIDOS_NOMBRES ASC");
        this.parameters.put("SQL_ESTADO", "AND TIPO = " + request.getParameter("cboTipoPersonal"));
        if (request.getParameter("comboAnioPersonal" + complemento).equals("-1")) {
            if (request.getParameter("cboTipoPersonal").equals("3")) {
                this.parameters.put("SQL_ANIO", "");
            } else {
                this.parameters.put("SQL_ANIO", "AND ESTADO = TRUE ");
            }
        } else {
            if (request.getParameter("cboTipoPersonal").equals("3")) {
                this.parameters.put("SQL_ANIO", " AND ANHO = '" + request.getParameter("comboAnioPersonal" + complemento) + "' ");
            } else {
                this.parameters.put("SQL_ANIO", "AND ESTADO = TRUE AND ANHO = '" + request.getParameter("comboAnioPersonal" + complemento) + "' ");

            }
        }
        this.parameters.put("LIMIT",
                " LIMIT " + request.getParameter("sizePagePersonal" + complemento) + " OFFSET "
                + (Integer.parseInt(request.getParameter("numberPagePersonal" + complemento)) - 1)
                * Integer.parseInt(request.getParameter("sizePagePersonal" + complemento)));
        return this.parameters;
    }

    private void procesarPersonalCategoria(BEAN_CRUD beanCrud, HttpServletResponse response) {
        try {
            this.jsonResponse = this.json.toJson(beanCrud);
            response.setContentType("application/json");
            response.getWriter().write(this.jsonResponse);
            LOG.info(this.jsonResponse);
        } catch (IOException ex) {
            Logger.getLogger(GestionTransparenteAPI.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private HashMap<String, Object> getParametersPersonalCategoria(HttpServletRequest request) {
        this.parameters.clear();
        this.parameters.put("FILTER", request.getParameter("txtCategoriaPersonalCategoria").toLowerCase());
        this.parameters.put("SQL_ORDERS", "TRIMESTRE DESC,ID ASC");
        String trimestre = "";
        if (!request.getParameter("comboTrimestrePersonalCategoria").equals("-1")) {
            trimestre = " AND TRIMESTRE = " + request.getParameter("comboTrimestrePersonalCategoria");
        }
        if (request.getParameter("comboAnioPersonalCategoria").equals("-1")) {
            this.parameters.put("SQL_ANIO", trimestre + " AND ESTADO = TRUE ");
        } else {
            this.parameters.put("SQL_ANIO", trimestre + " AND ESTADO = TRUE AND ANHO = '" + request.getParameter("comboAnioPersonalCategoria") + "' ");
        }
        this.parameters.put("LIMIT",
                " LIMIT " + request.getParameter("sizePagePersonalCategoria") + " OFFSET "
                + (Integer.parseInt(request.getParameter("numberPagePersonalCategoria")) - 1)
                * Integer.parseInt(request.getParameter("sizePagePersonalCategoria")));
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
