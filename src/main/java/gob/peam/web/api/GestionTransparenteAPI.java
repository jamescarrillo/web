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
import gob.peam.web.dao.ProveedorDAO;
import gob.peam.web.dao.PublicidadDAO;
import gob.peam.web.dao.TelefoniaDAO;
import gob.peam.web.dao.VehiculoDAO;
import gob.peam.web.dao.ViaticoDAO;
import gob.peam.web.dao.impl.DirectivoDAOImpl;
import gob.peam.web.dao.impl.FuncionarioDAOImpl;
import gob.peam.web.dao.impl.OrdenCompraDAOImpl;
import gob.peam.web.dao.impl.OrdenServicioDAOImpl;
import gob.peam.web.dao.impl.ProveedorDAOImpl;
import gob.peam.web.dao.impl.PublicidadDAOImpl;
import gob.peam.web.dao.impl.TelefoniaDAOImpl;
import gob.peam.web.dao.impl.VehiculoDAOImpl;
import gob.peam.web.dao.impl.ViaticoDAOImpl;
import gob.peam.web.model.Directivo;
import gob.peam.web.model.Funcionario;
import gob.peam.web.model.OrdenCompra;
import gob.peam.web.model.OrdenServicio;
import gob.peam.web.model.Proveedor;
import gob.peam.web.model.Publicidad;
import gob.peam.web.model.Telefonia;
import gob.peam.web.model.Vehiculo;
import gob.peam.web.model.Viatico;
import gob.peam.web.utilities.BEAN_CRUD;
import gob.peam.web.utilities.Utilities;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
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
import javax.servlet.http.Part;
import javax.sql.DataSource;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 *
 * @author James Carrillo
 */
@MultipartConfig
@WebServlet(name = "GestionTransparenteController", urlPatterns = {
    "/gestiontransparente/adquisiciones",
    "/gestiontransparente/gestiondocumentos",
    "/gestiontransparente/personal",
    "/gestiontransparente/directivos",
    "/gestiontransparente/viaticos"})
public class GestionTransparenteAPI extends HttpServlet {

    private static final long serialVersionUID = 1L;
    @Resource(name = "jdbc/dbweb")
    private DataSource pool;
    private HttpSession session;
    private Gson json;
    private String jsonResponse;
    private String jsonResponseOrdenCompra;
    private String jsonResponseOrdenServicio;
    private String jsonResponsePublicidad;
    private String jsonResponseTelefonia;
    private String jsonResponseVehiculo;
    private String jsonResponseProveedor;
    private HashMap<String, Object> parameters;
    private HashMap<String, Object> parametersOrdenCompra;
    private HashMap<String, Object> parametersOrdenServicio;
    private HashMap<String, Object> parametersPublicidad;
    private HashMap<String, Object> parametersTelefonia;
    private HashMap<String, Object> parametersVehiculo;
    private HashMap<String, Object> parametersProveedor;
    private HashMap<String, Object> jsonROOT;
    private final Log logger = LogFactory.getLog(GestionTransparenteAPI.class);

    private String action;
    private String actionOrdenCompra;
    private String actionOrdenServicio;
    private String actionOrdenPublicidad;
    private String actionOrdenTelefonia;
    private String actionOrdenVehiculo;
    private String actionOrdenProveedor;
    private DirectivoDAO directivoDAO;
    private FuncionarioDAO funcionarioDAO;
    private ViaticoDAO viaticoDAO;

    private OrdenCompraDAO ordenCompraDAO;
    private OrdenServicioDAO ordenServicioDAO;
    private PublicidadDAO publicidadDAO;
    private TelefoniaDAO telefoniaDAO;
    private VehiculoDAO vehiculoDAO;
    private ProveedorDAO proveedorDAO;

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
        this.viaticoDAO = new ViaticoDAOImpl(this.pool);

        this.ordenCompraDAO = new OrdenCompraDAOImpl(this.pool);
        this.ordenServicioDAO = new OrdenServicioDAOImpl(this.pool);
        this.publicidadDAO = new PublicidadDAOImpl(this.pool);
        this.telefoniaDAO = new TelefoniaDAOImpl(this.pool);
        this.vehiculoDAO = new VehiculoDAOImpl(this.pool);
        this.proveedorDAO = new ProveedorDAOImpl(this.pool);
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
            logger.info(request.getRequestURI().substring(request.getContextPath().length()));
            switch (request.getRequestURI().substring(request.getContextPath().length())) {
                case "/gestiontransparente/adquisiciones":
                    this.action = request.getParameter("action") == null ? "" : request.getParameter("action");
                    this.logger.info(action);
                    switch (action) {
                        case "paginarOrdenCompra":
                            procesarOrdenCompra(new BEAN_CRUD(this.ordenCompraDAO.getPagination(getParametersOrdenCompra(request))), response);
                            break;
                        case "addOrdenCompra":
                            procesarOrdenCompra(this.ordenCompraDAO.add(getOrdenCompra(request), getParametersOrdenCompra(request)), response);
                            break;
                        case "deleteOrdenCompra":
                            procesarOrdenCompra(this.ordenCompraDAO.delete(Long.parseLong(request.getParameter("txtIdOrdenCompraER")), getParametersOrdenCompra(request)), response);
                            break;
                        case "paginarOrdenServicio":
                            procesarOrdenServicio(new BEAN_CRUD(this.ordenServicioDAO.getPagination(getParametersOrdenServicio(request))), response);
                            break;
                        case "addOrdenServicio":
                            procesarOrdenServicio(this.ordenServicioDAO.add(getOrdenServicio(request), getParametersOrdenCompra(request)), response);
                            break;
                        case "deleteOrdenServicio":
                            procesarOrdenServicio(this.ordenServicioDAO.delete(Long.parseLong(request.getParameter("txtIdOrdenServicioER")), getParametersOrdenServicio(request)), response);
                            break;
                        case "paginarPublicidad":
                            procesarPublicidad(new BEAN_CRUD(this.publicidadDAO.getPagination(getParametersPublicidad(request))), response);
                            break;
                        case "addPublicidad":
                            procesarPublicidad(this.publicidadDAO.add(getPublicidad(request), getParametersOrdenCompra(request)), response);
                            break;
                        case "deletePublicidad":
                            procesarPublicidad(this.publicidadDAO.delete(Long.parseLong(request.getParameter("txtIdPublicidadER")), getParametersPublicidad(request)), response);
                            break;
                        case "paginarTelefonia":
                            procesarTelefonia(new BEAN_CRUD(this.telefoniaDAO.getPagination(getParametersTelefonia(request))), response);
                            break;
                        case "addTelefonia":
                            procesarTelefonia(this.telefoniaDAO.add(getTelefonia(request), getParametersOrdenCompra(request)), response);
                            break;
                        case "deleteTelefonia":
                            procesarTelefonia(this.telefoniaDAO.delete(Long.parseLong(request.getParameter("txtIdTelefoniaER")), getParametersTelefonia(request)), response);
                            break;
                        case "paginarVehiculo":
                            procesarVehiculo(new BEAN_CRUD(this.vehiculoDAO.getPagination(getParametersVehiculo(request))), response);
                            break;
                        case "addVehiculo":
                            procesarVehiculo(this.vehiculoDAO.add(getVehiculo(request), getParametersOrdenCompra(request)), response);
                            break;
                        case "deleteVehiculo":
                            procesarVehiculo(this.vehiculoDAO.delete(Long.parseLong(request.getParameter("txtIdVehiculoER")), getParametersVehiculo(request)), response);
                            break;
                        case "paginarProveedor":
                            procesarProveedor(new BEAN_CRUD(this.proveedorDAO.getPagination(getParametersProveedor(request))), response);
                            break;
                        case "addProveedor":
                            procesarProveedor(this.proveedorDAO.add(getProveedor(request), getParametersOrdenCompra(request)), response);
                            break;
                        case "deleteProveedor":
                            procesarProveedor(this.proveedorDAO.delete(Long.parseLong(request.getParameter("txtIdProveedorER")), getParametersProveedor(request)), response);
                            break;
                        default:
                            request.getRequestDispatcher("/jsp/gc/gestion_transparente/adquisiciones_contrataciones.jsp").forward(request, response);
                            break;
                    }
                    break;
                case "/gestiontransparente/gestiondocumentos":
                    request.getRequestDispatcher("/estamos_trabajando.jsp").forward(request, response);
                    break;
                case "/gestiontransparente/personal":
                    request.getRequestDispatcher("/estamos_trabajando.jsp").forward(request, response);
                    break;
                case "/gestiontransparente/directivos":
                    this.action = request.getParameter("action") == null ? "" : request.getParameter("action");
                    this.logger.info(action);
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
                        case "activateFuncionario":
                            procesarFuncionario(this.funcionarioDAO.activate(Long.parseLong(request.getParameter("txtIdFuncionarioER")), getParametersFuncionarios(request)), response);
                            break;
                        case "paginarDirectivo":
                            procesarDirectivo(new BEAN_CRUD(this.directivoDAO.getPagination(getParametersDirectivos(request))), response);
                            break;
                        case "addDirectivo":
                            procesarDirectivo(this.directivoDAO.add(getDirectivo(request), getParametersDirectivos(request)), response);
                            break;
                        case "updateDirectivo":
                            procesarDirectivo(this.directivoDAO.update(getDirectivo(request), getParametersDirectivos(request)), response);
                            break;
                        case "deleteDirectivo":
                            procesarDirectivo(this.directivoDAO.delete(Long.parseLong(request.getParameter("txtIdDirectivoERDIR")), getParametersDirectivos(request)), response);
                            break;
                        case "activateDirectivo":
                            procesarDirectivo(this.directivoDAO.activate(Long.parseLong(request.getParameter("txtIdDirectivoERDIR")), getParametersDirectivos(request)), response);
                            break;
                        default:
                            request.getRequestDispatcher("/jsp/gc/gestion_transparente/directivos.jsp").forward(request, response);
                            break;
                    }
                    break;
                case "/gestiontransparente/viaticos":
                    this.action = request.getParameter("action") == null ? "" : request.getParameter("action");
                    this.logger.info(action);
                    switch (action) {
                        case "paginarViatico":
                            procesarViatico(new BEAN_CRUD(this.viaticoDAO.getPagination(getParametersViatico(request))), response);
                            break;
                        case "addViatico":
                            procesarViatico(this.viaticoDAO.add(getViatico(request), getParametersViatico(request)), response);
                            break;
                        case "updateViatico":
                            procesarViatico(this.viaticoDAO.update(getViatico(request), getParametersViatico(request)), response);
                            break;
                        case "deleteViatico":
                            procesarViatico(this.viaticoDAO.delete(Long.parseLong(request.getParameter("txtIdER")), getParametersViatico(request)), response);
                            break;
                        default:
                            request.getRequestDispatcher("/jsp/gc/gestion_transparente/viaticos.jsp").forward(request, response);
                            break;
                    }
            }
        } catch (IOException | SQLException ex) {
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
        if (request.getParameter("comboTipoListaFuncionario").equals("-1")) {
            this.parameters.put("SQL_ESTADO", "");
        } else {
            this.parameters.put("SQL_ESTADO", "AND ESTADO = " + request.getParameter("comboTipoListaFuncionario") + " ");
        }
        this.parameters.put("SQL_ORDERS", "NOMBRES_APELLIDOS");
        if (request.getParameter("txtEstadoER").equals("true")) {
            this.parameters.put("ESTADO", "false");
        } else {
            this.parameters.put("ESTADO", "true");
        }
        this.parameters.put("LIMIT",
                " LIMIT " + request.getParameter("sizePageFuncionario") + " OFFSET "
                + (Integer.parseInt(request.getParameter("numberPageFuncionario")) - 1)
                * Integer.parseInt(request.getParameter("sizePageFuncionario")));
        return this.parameters;
    }

    private Object uploadFile(Part filePart, Funcionario fun, Directivo dir) {
        String path = getServletContext().getRealPath("/peam_resources_app/conf_app/DirectivoFuncionario/img/C_");
        File file = new File(path + Paths.get(filePart.getSubmittedFileName()).getFileName().toString());
        //VALIDAMOS EL NUEVO ARCHIVO
        if (file.exists()) {
            String prefijo = "C_";
            file = new File(path + Paths.get(filePart.getSubmittedFileName()).getFileName().toString());
            if (fun == null) {
                dir.setFoto(prefijo + Paths.get(filePart.getSubmittedFileName()).getFileName().toString());
            } else {
                fun.setFoto(prefijo + Paths.get(filePart.getSubmittedFileName()).getFileName().toString());
            }
        }
        try (InputStream input = filePart.getInputStream()) {
            Files.copy(input, file.toPath());
        } catch (IOException ex) {
            Logger.getLogger(GestionTransparenteAPI.class.getName()).log(Level.SEVERE, null, ex);
        }
        if (fun == null) {
            return dir;
        } else {
            return fun;
        }
    }

    private Object uploadCV(Part filePart, Funcionario fun, Directivo dir) {
        String path = getServletContext().getRealPath("/peam_resources_app/conf_app/DirectivoFuncionario/cv/C_");
        File file = new File(path + Paths.get(filePart.getSubmittedFileName()).getFileName().toString());
        //VALIDAMOS EL NUEVO ARCHIVO
        if (file.exists()) {
            String prefijo = "C_";
            file = new File(path + Paths.get(filePart.getSubmittedFileName()).getFileName().toString());
            if (fun == null) {
                dir.setHoja_vida(prefijo + Paths.get(filePart.getSubmittedFileName()).getFileName().toString());
            } else {
                fun.setHoja_vida(prefijo + Paths.get(filePart.getSubmittedFileName()).getFileName().toString());
            }
        }
        try (InputStream input = filePart.getInputStream()) {
            Files.copy(input, file.toPath());
        } catch (IOException ex) {
            Logger.getLogger(GestionTransparenteAPI.class.getName()).log(Level.SEVERE, null, ex);
        }
        if (fun == null) {
            return dir;
        } else {
            return fun;
        }
    }

    private Funcionario getFuncionario(HttpServletRequest request) {
        Funcionario funcionario = new Funcionario();
        try {
            ///PARTE FOTO
            Part filePart = request.getPart("fileFoto");
            boolean copiar = true;
            File fileTemp = null;
            switch (request.getParameter("txtValidacionFoto")) {
                case "SI":
                    //HAY UN ARCHIVO QUE HA VENIDO
                    if (!request.getParameter("txtNombreFoto").equals("")) {
                        fileTemp = new File(getServletContext().getRealPath("/peam_resources_app/conf_app/DirectivoFuncionario/img/C_" + String.valueOf(request.getParameter("txtNombreFoto"))));
                    }
                    funcionario.setFoto("C_" + Paths.get(filePart.getSubmittedFileName()).getFileName().toString());
                    break;
                case "DEFECTO":
                    fileTemp = new File(getServletContext().getRealPath("/peam_resources_app/conf_app/DirectivoFuncionario/img/C_" + String.valueOf(request.getParameter("txtNombreFoto"))));
                    funcionario.setFoto("");
                    copiar = false;
                    break;
                default:
                    copiar = false; //YA NO SE COPIA PORQUE ES EL MISMO, NO HAY ARCHIVO
                    funcionario.setFoto("C_" + String.valueOf(request.getParameter("txtNombreFoto")));
                    break;
            }
            if (fileTemp != null && fileTemp.exists()) {
                fileTemp.delete();
            }
            if (copiar) {
                funcionario = (Funcionario) uploadFile(filePart, funcionario, null);
            }
            ///PARTE HOJA DE VIDA
            Part fileCV = request.getPart("fileCV");
            boolean copiarCV = true;
            File fileTempCV = null;
            switch (request.getParameter("txtValidacionCv")) {
                case "SI":
                    //HAY UN ARCHIVO QUE HA VENIDO
                    if (!request.getParameter("txtNombreFileResultadoActual").equals("")) {
                        fileTempCV = new File(getServletContext().getRealPath("/peam_resources_app/conf_app/DirectivoFuncionario/cv/C_" + String.valueOf(request.getParameter("txtNombreFileResultadoActual"))));
                    }
                    funcionario.setHoja_vida("C_" + Paths.get(fileCV.getSubmittedFileName()).getFileName().toString());
                    break;
                case "DEFECTO":
                    fileTempCV = new File(getServletContext().getRealPath("/peam_resources_app/conf_app/DirectivoFuncionario/cv/C_" + String.valueOf(request.getParameter("txtNombreFileResultadoActual"))));
                    funcionario.setHoja_vida("");
                    copiar = false;
                    break;
                default:
                    copiarCV = false; //YA NO SE COPIA PORQUE ES EL MISMO, NO HAY ARCHIVO
                    funcionario.setHoja_vida("C_" + String.valueOf(request.getParameter("txtNombreFileResultadoActual")));
                    break;
            }
            if (fileTempCV != null && fileTempCV.exists()) {
                fileTempCV.delete();
            }
            if (copiarCV) {
                funcionario = (Funcionario) uploadCV(fileCV, funcionario, null);
            }
            ////

            if (request.getParameter("action").equals("updateFuncionario")) {
                funcionario.setId(Integer.parseInt(request.getParameter("txtIdFuncionarioER")));
            }
            funcionario.setOrganigrama(request.getParameter("comboOficinaER"));
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
            //funcionario.setFoto(request.getParameter(""));
            funcionario.setProfesion(request.getParameter("txtProfesionER"));
            funcionario.setResumen(request.getParameter("txtResumenER"));
            funcionario.setRegimen_laboral(request.getParameter("txtRegimenLaboralER"));
            funcionario.setRetribucion_mensual(Double.parseDouble(request.getParameter("txtRetribucionMensualER")));
            //funcionario.setHoja_vida(request.getParameter("txtNombreFileResultadoActual"));
            funcionario.setEstado(Boolean.parseBoolean(request.getParameter("comboEstadoER")));
            funcionario.setDestacado(Boolean.parseBoolean(request.getParameter("comboDestacadoER")));

        } catch (IOException | ServletException ex) {
            Logger.getLogger(GestionTransparenteAPI.class.getName()).log(Level.SEVERE, null, ex);
        }
        return funcionario;
    }

    /*DIRECTIVOS*/
    private void procesarDirectivo(BEAN_CRUD beanCrud, HttpServletResponse response) throws IOException {
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

    private HashMap<String, Object> getParametersDirectivos(HttpServletRequest request) {
        this.parameters.clear();
        this.parameters.put("FILTER", request.getParameter("txtNombreDirectivo").toLowerCase());
        if (request.getParameter("comboTipoListaDirectivo").equals("-1")) {
            this.parameters.put("SQL_ESTADO", "");
        } else {
            this.parameters.put("SQL_ESTADO", "AND ESTADO = " + request.getParameter("comboTipoListaDirectivo") + " ");
        }
        this.parameters.put("SQL_ORDERS", "NOMBRES_APELLIDOS");
        if (request.getParameter("txtEstadoERDIR").equals("true")) {
            this.parameters.put("ESTADO", "false");
        } else {
            this.parameters.put("ESTADO", "true");
        }
        this.parameters.put("LIMIT",
                " LIMIT " + request.getParameter("sizePageDirectivo") + " OFFSET "
                + (Integer.parseInt(request.getParameter("numberPageDirectivo")) - 1)
                * Integer.parseInt(request.getParameter("sizePageDirectivo")));
        return this.parameters;
    }

    private Directivo getDirectivo(HttpServletRequest request) {
        Directivo directivo = new Directivo();
        try {
            ///PARTE FOTO
            Part filePart = request.getPart("fileFotoDIR");
            boolean copiar = true;
            File fileTemp = null;
            switch (request.getParameter("txtValidacionFotoDIR")) {
                case "SI":
                    //HAY UN ARCHIVO QUE HA VENIDO
                    if (!request.getParameter("txtNombreFotoDIR").equals("")) {
                        fileTemp = new File(getServletContext().getRealPath("/peam_resources_app/conf_app/DirectivoFuncionario/img/C_" + String.valueOf(request.getParameter("txtNombreFotoDIR"))));
                    }
                    directivo.setFoto("C_" + Paths.get(filePart.getSubmittedFileName()).getFileName().toString());
                    break;
                case "DEFECTO":
                    fileTemp = new File(getServletContext().getRealPath("/peam_resources_app/conf_app/DirectivoFuncionario/img/C_" + String.valueOf(request.getParameter("txtNombreFotoDIR"))));
                    directivo.setFoto("");
                    copiar = false;
                    break;
                default:
                    copiar = false; //YA NO SE COPIA PORQUE ES EL MISMO, NO HAY ARCHIVO
                    directivo.setFoto("C_" + String.valueOf(request.getParameter("txtNombreFotoDIR")));
                    break;
            }
            if (fileTemp != null && fileTemp.exists()) {
                fileTemp.delete();
            }
            if (copiar) {
                directivo = (Directivo) uploadFile(filePart, null, directivo);
            }
            ///PARTE HOJA DE VIDA
            Part fileCV = request.getPart("fileCVDIR");
            boolean copiarCV = true;
            File fileTempCV = null;
            switch (request.getParameter("txtValidacionCvDIR")) {
                case "SI":
                    //HAY UN ARCHIVO QUE HA VENIDO
                    if (!request.getParameter("txtNombreFileResultadoActualDIR").equals("")) {
                        fileTempCV = new File(getServletContext().getRealPath("/peam_resources_app/conf_app/DirectivoFuncionario/cv/C_" + String.valueOf(request.getParameter("txtNombreFileResultadoActualDIR"))));
                    }
                    directivo.setHoja_vida("C_" + Paths.get(fileCV.getSubmittedFileName()).getFileName().toString());
                    break;
                case "DEFECTO":
                    fileTempCV = new File(getServletContext().getRealPath("/peam_resources_app/conf_app/DirectivoFuncionario/cv/C_" + String.valueOf(request.getParameter("txtNombreFileResultadoActualDIR"))));
                    directivo.setHoja_vida("");
                    copiar = false;
                    break;
                default:
                    copiarCV = false; //YA NO SE COPIA PORQUE ES EL MISMO, NO HAY ARCHIVO
                    directivo.setHoja_vida("C_" + String.valueOf(request.getParameter("txtNombreFileResultadoActualDIR")));
                    break;
            }
            if (fileTempCV != null && fileTempCV.exists()) {
                fileTempCV.delete();
            }
            if (copiarCV) {
                directivo = (Directivo) uploadCV(fileCV, null, directivo);
            }
            ////
            if (request.getParameter("action").equals("updateDirectivo")) {
                directivo.setId(Integer.parseInt(request.getParameter("txtIdDirectivoERDIR")));
            }
            directivo.setInstitucion(request.getParameter("comboInstitucionERDIR"));
            directivo.setNombres_apellidos(request.getParameter("txtNombreCompletoERDIR"));
            directivo.setCargo(request.getParameter("txtCargoERDIR"));
            directivo.setNivel_remunerativo(request.getParameter("txtNivelERDIR"));
            directivo.setNumero_dni(request.getParameter("txtDniERDIR"));
            directivo.setResolucion(request.getParameter("txtDesignadoPorERDIR"));
            if (!request.getParameter("datePickerFechaDesignacionDIR").equals("")) {
                directivo.setFecha_designacion(Utilities.getDateSQLFORMAT(request.getParameter("datePickerFechaDesignacionDIR"), "dd/MM/yyyy"));
            }
            directivo.setTelefono(request.getParameter("txtTelefonoERDIR"));
            directivo.setFax(request.getParameter("txtFaxERDIR"));
            directivo.setE_mail(request.getParameter("txtEmailERDIR"));
            //directivo.setFoto(request.getParameter(""));
            directivo.setProfesion(request.getParameter("txtProfesionERDIR"));
            directivo.setResumen(request.getParameter("txtResumenERDIR"));
            directivo.setRegimen_laboral(request.getParameter("txtRegimenLaboralERDIR"));
            directivo.setRetribucion_mensual(Double.parseDouble(request.getParameter("txtRetribucionMensualERDIR")));
            //directivo.setHoja_vida(request.getParameter("txtNombreFileResultadoActual"));
            directivo.setEstado(Boolean.parseBoolean(request.getParameter("comboEstadoERDIR")));

        } catch (IOException | ServletException ex) {
            Logger.getLogger(GestionTransparenteAPI.class.getName()).log(Level.SEVERE, null, ex);
        }
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

    private void procesarViatico(BEAN_CRUD beanCrud, HttpServletResponse response) {
        try {
            this.jsonResponse = this.json.toJson(beanCrud);
            response.setContentType("application/json");
            response.getWriter().write(this.jsonResponse);
            logger.info(this.jsonResponse);
        } catch (IOException ex) {
            Logger.getLogger(PublicacionAPI.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private HashMap<String, Object> getParametersViatico(HttpServletRequest request) {
        this.parameters.clear();
        this.parameters.put("FILTER", request.getParameter("txtTituloViatico").toLowerCase());
        if (request.getParameter("comboAnioViatico").equals("-1")) {
            this.parameters.put("SQL_ANIO", "");
        } else {
            this.parameters.put("SQL_ANIO", "AND ANHO = '" + request.getParameter("comboAnioViatico") + "' ");
        }
        this.parameters.put("SQL_ORDERS", "ID DESC");
        this.parameters.put("LIMIT",
                " LIMIT " + request.getParameter("sizePageViatico") + " OFFSET "
                + (Integer.parseInt(request.getParameter("numberPageViatico")) - 1)
                * Integer.parseInt(request.getParameter("sizePageViatico")));
        return this.parameters;
    }

    private Viatico getViatico(HttpServletRequest request) {
        Viatico viatico = new Viatico();
        if (request.getParameter("action").equals("updateViatico")) {
            viatico.setId(Integer.parseInt(request.getParameter("txtIdER")));
        }
        viatico.setAnho(request.getParameter("txtFechaSalidaER").substring(6, 10));
        viatico.setMes(request.getParameter("txtFechaSalidaER").substring(3, 5));
        viatico.setTipo_viatico(request.getParameter("comboTipoViaticoER"));
        viatico.setModalidad(request.getParameter("comboModalidadER"));
        viatico.setArea_oficina(request.getParameter("txtAreaOficinaER"));
        viatico.setUsuarios(request.getParameter("txtUsuariosER"));
        viatico.setFuente_financiamiento(request.getParameter("txtFuenteFinanciamientoER"));
        viatico.setFecha_salida(Utilities.getDateSQLFORMAT(request.getParameter("txtFechaSalidaER"), "dd/MM/yyyy"));
        viatico.setFecha_retorno(Utilities.getDateSQLFORMAT(request.getParameter("txtFechaRetornoER"), "dd/MM/yyyy"));
        viatico.setRuta(request.getParameter("txtRutaER"));
        viatico.setAutorizacion_viaje(request.getParameter("txtAutorizacionViajeER"));
        viatico.setCosto_pasajes(Double.parseDouble(request.getParameter("txtCostoPasajesER")));
        viatico.setViaticos(Double.parseDouble(request.getParameter("txtViaticosER")));
        viatico.setEstado(Boolean.parseBoolean(request.getParameter("txtEstadoViaticoER")));

        return viatico;
    }

    private void procesarOrdenCompra(BEAN_CRUD beanCrud, HttpServletResponse response) {
        try {
            this.jsonResponseOrdenCompra = this.json.toJson(beanCrud);
            response.setContentType("application/json");
            response.getWriter().write(this.jsonResponseOrdenCompra);
            logger.info(this.jsonResponseOrdenCompra);
        } catch (IOException ex) {
            Logger.getLogger(GestionTransparenteAPI.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private HashMap<String, Object> getParametersOrdenCompra(HttpServletRequest request) {
        this.parametersOrdenCompra.clear();
        this.parametersOrdenCompra.put("FILTER", request.getParameter("txtProveedorOrdenCompra").toLowerCase());
        this.parametersOrdenCompra.put("SQL_ORDERS", "FECHA_COMPRA DESC");
        this.parametersOrdenCompra.put("LIMIT",
                " LIMIT " + request.getParameter("sizePageOrdenCompra") + " OFFSET "
                + (Integer.parseInt(request.getParameter("numberPageOrdenCompra")) - 1)
                * Integer.parseInt(request.getParameter("sizePageOrdenCompra")));
        return this.parametersOrdenCompra;
    }

    private OrdenCompra getOrdenCompra(HttpServletRequest request) {
        OrdenCompra orden = new OrdenCompra();
        orden.setMes(request.getParameter(""));
        orden.setAnho(request.getParameter(""));
        orden.setOrden_compra(request.getParameter(""));
        orden.setFecha_compra(Utilities.getDateSQLFORMAT(request.getParameter(""), "dd/MM/yyyy"));
        orden.setFuente_financiamiento(request.getParameter(""));
        orden.setProveedor(request.getParameter(""));
        orden.setMonto(Double.parseDouble(request.getParameter("")));
        orden.setFinanciamiento(request.getParameter(""));
        orden.setEstado(true);
        orden.setNro_siaf(request.getParameter(""));
        return orden;
    }

    private void procesarOrdenServicio(BEAN_CRUD beanCrud, HttpServletResponse response) {
        try {
            this.jsonResponseOrdenServicio = this.json.toJson(beanCrud);
            response.setContentType("application/json");
            response.getWriter().write(this.jsonResponseOrdenServicio);
            logger.info(this.jsonResponseOrdenServicio);
        } catch (IOException ex) {
            Logger.getLogger(GestionTransparenteAPI.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private HashMap<String, Object> getParametersOrdenServicio(HttpServletRequest request) {
        this.parametersOrdenServicio.clear();
        this.parametersOrdenServicio.put("FILTER", request.getParameter("txtProveedorOrdenServicio").toLowerCase());
        this.parametersOrdenServicio.put("SQL_ORDERS", "FECHA_COMPRA DESC");
        this.parametersOrdenServicio.put("LIMIT",
                " LIMIT " + request.getParameter("sizePageOrdenServicio") + " OFFSET "
                + (Integer.parseInt(request.getParameter("numberPageOrdenServicio")) - 1)
                * Integer.parseInt(request.getParameter("sizePageOrdenServicio")));
        return this.parametersOrdenServicio;
    }

    private OrdenServicio getOrdenServicio(HttpServletRequest request) {
        OrdenServicio orden = new OrdenServicio();
        orden.setMes(request.getParameter(""));
        orden.setAnho(request.getParameter(""));
        orden.setOrden_servicio(request.getParameter(""));
        orden.setFecha_compra(Utilities.getDateSQLFORMAT(request.getParameter(""), "dd/MM/yyyy"));
        orden.setFuente_financiamiento(request.getParameter(""));
        orden.setProveedor(request.getParameter(""));
        orden.setMonto(Double.parseDouble(request.getParameter("")));
        orden.setFinanciamiento(request.getParameter(""));
        orden.setEstado(true);
        orden.setNro_siaf(request.getParameter(""));
        return orden;
    }

    private void procesarPublicidad(BEAN_CRUD beanCrud, HttpServletResponse response) {
        try {
            this.jsonResponsePublicidad = this.json.toJson(beanCrud);
            response.setContentType("application/json");
            response.getWriter().write(this.jsonResponsePublicidad);
            logger.info(this.jsonResponsePublicidad);
        } catch (IOException ex) {
            Logger.getLogger(GestionTransparenteAPI.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private HashMap<String, Object> getParametersPublicidad(HttpServletRequest request) {
        this.parametersPublicidad.clear();
        this.parametersPublicidad.put("FILTER", request.getParameter("txtProveedorPublicidad").toLowerCase());
        this.parametersPublicidad.put("SQL_ORDERS", "CONTRATO DESC");
        this.parametersPublicidad.put("LIMIT",
                " LIMIT " + request.getParameter("sizePagePublicidad") + " OFFSET "
                + (Integer.parseInt(request.getParameter("numberPagePublicidad")) - 1)
                * Integer.parseInt(request.getParameter("sizePagePublicidad")));
        return this.parametersPublicidad;
    }

    private Publicidad getPublicidad(HttpServletRequest request) {
        Publicidad publicidad = new Publicidad();
        publicidad.setAnho(request.getParameter(""));
        publicidad.setBienes_servicios(request.getParameter(""));
        publicidad.setFuente_financiamiento(request.getParameter(""));
        publicidad.setProceso(request.getParameter(""));
        publicidad.setContrato(request.getParameter(""));
        publicidad.setObjeto_contrato(request.getParameter(""));
        publicidad.setValor_referencia(Double.parseDouble(request.getParameter("")));
        publicidad.setProveedor(request.getParameter(""));
        publicidad.setRuc(request.getParameter(""));
        publicidad.setNumero_contrato(Double.parseDouble(request.getParameter("")));
        publicidad.setPenalidad(Double.parseDouble(request.getParameter("")));
        publicidad.setCosto_final(Double.parseDouble(request.getParameter("")));
        publicidad.setObservaciones(request.getParameter(""));
        publicidad.setEstado(true);
        return publicidad;
    }

    private void procesarTelefonia(BEAN_CRUD beanCrud, HttpServletResponse response) {
        try {
            this.jsonResponseTelefonia = this.json.toJson(beanCrud);
            response.setContentType("application/json");
            response.getWriter().write(this.jsonResponseTelefonia);
            logger.info(this.jsonResponseTelefonia);
        } catch (IOException ex) {
            Logger.getLogger(GestionTransparenteAPI.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private HashMap<String, Object> getParametersTelefonia(HttpServletRequest request) {
        this.parametersTelefonia.clear();
        this.parametersTelefonia.put("FILTER", request.getParameter("txtProveedorTelefonia").toLowerCase());
        this.parametersTelefonia.put("SQL_ORDERS", "AREA_OFICINA ASC");
        this.parametersTelefonia.put("LIMIT",
                " LIMIT " + request.getParameter("sizePageTelefonia") + " OFFSET "
                + (Integer.parseInt(request.getParameter("numberPageTelefonia")) - 1)
                * Integer.parseInt(request.getParameter("sizePageTelefonia")));
        return this.parametersTelefonia;
    }

    private Telefonia getTelefonia(HttpServletRequest request) {
        Telefonia telefonia = new Telefonia();
        telefonia.setAnho(request.getParameter(""));
        telefonia.setMes(request.getParameter(""));
        telefonia.setArea_oficina(request.getParameter(""));
        telefonia.setAsignado_a(request.getParameter(""));
        telefonia.setCargo_actividad(request.getParameter(""));
        telefonia.setImporte(Double.parseDouble(request.getParameter("")));
        telefonia.setEstado(true);
        telefonia.setTipo(request.getParameter(""));
        telefonia.setNumero(request.getParameter(""));
        return telefonia;
    }

    private void procesarVehiculo(BEAN_CRUD beanCrud, HttpServletResponse response) {
        try {
            this.jsonResponseVehiculo = this.json.toJson(beanCrud);
            response.setContentType("application/json");
            response.getWriter().write(this.jsonResponseVehiculo);
            logger.info(this.jsonResponseVehiculo);
        } catch (IOException ex) {
            Logger.getLogger(GestionTransparenteAPI.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private HashMap<String, Object> getParametersVehiculo(HttpServletRequest request) {
        this.parametersVehiculo.clear();
        this.parametersVehiculo.put("FILTER", request.getParameter("txtProveedorVehiculo").toLowerCase());
        this.parametersVehiculo.put("SQL_ORDERS", "");
        this.parametersVehiculo.put("LIMIT",
                " LIMIT " + request.getParameter("sizePageVehiculo") + " OFFSET "
                + (Integer.parseInt(request.getParameter("numberPageVehiculo")) - 1)
                * Integer.parseInt(request.getParameter("sizePageVehiculo")));
        return this.parametersVehiculo;
    }

    private Vehiculo getVehiculo(HttpServletRequest request) {
        Vehiculo vehiculo = new Vehiculo();
        vehiculo.setAnho(request.getParameter(""));
        vehiculo.setMes(request.getParameter(""));
        vehiculo.setTipo_clase(request.getParameter(""));
        vehiculo.setClase_vehiculo(request.getParameter(""));
        vehiculo.setCargo_actividad(request.getParameter(""));
        vehiculo.setTipo_combustible(request.getParameter(""));
        vehiculo.setRecorrido_km(Double.parseDouble(request.getParameter("")));
        vehiculo.setCosto_combustible(Double.parseDouble(request.getParameter("")));
        vehiculo.setSoat_fecha_vencimiento(Utilities.getDateSQLFORMAT(request.getParameter(""), "dd/MM/yyyy"));
        vehiculo.setPlaca(request.getParameter(""));
        vehiculo.setObservaciones(request.getParameter(""));
        vehiculo.setEstado(true);
        return vehiculo;
    }

    private void procesarProveedor(BEAN_CRUD beanCrud, HttpServletResponse response) {
        try {
            this.jsonResponseProveedor = this.json.toJson(beanCrud);
            response.setContentType("application/json");
            response.getWriter().write(this.jsonResponseProveedor);
            logger.info(this.jsonResponseProveedor);
        } catch (IOException ex) {
            Logger.getLogger(GestionTransparenteAPI.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private HashMap<String, Object> getParametersProveedor(HttpServletRequest request) {
        this.parametersProveedor.clear();
        this.parametersProveedor.put("FILTER", request.getParameter("txtProveedor").toLowerCase());
        this.parametersProveedor.put("SQL_ORDERS", "");
        this.parametersProveedor.put("LIMIT",
                " LIMIT " + request.getParameter("sizePageProveedor") + " OFFSET "
                + (Integer.parseInt(request.getParameter("numberPageProveedor")) - 1)
                * Integer.parseInt(request.getParameter("sizePageProveedor")));
        return this.parametersProveedor;
    }

    private Proveedor getProveedor(HttpServletRequest request) {
        Proveedor proveedor = new Proveedor();
        proveedor.setAnho(request.getParameter(""));
        proveedor.setTrimestre(request.getParameter(""));
        proveedor.setRuc(request.getParameter(""));
        proveedor.setProveedor(request.getParameter(""));
        proveedor.setImporte(Double.parseDouble(request.getParameter("")));
        proveedor.setEstado(true);
        return proveedor;
    }

}
