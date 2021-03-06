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
import gob.peam.web.model.others.Conf_Web;
import gob.peam.web.utilities.BEAN_CRUD;
import gob.peam.web.utilities.Utilities;
import java.io.File;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
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
@WebServlet(name = "LineasAccionWebAPI", urlPatterns = {
    "/lineas-de-accion/operaciones",
    "/lineas-de-accion/direccion-de-infraestructura",
    "/lineas-de-accion/direccion-de-manejo-ambiental",
    "/lineas-de-accion/direccion-de-desarrollo-agropecuario",
    "/lineas-de-accion/estudios"})
public class LineasAccionWebAPI extends HttpServlet {

    @Resource(name = "jdbc/dbweb")
    private DataSource pool;
    private Gson json;
    private String jsonResponse;
    private HashMap<String, Object> parameters;
    private static final Logger LOG = Logger.getLogger(LineasAccionWebAPI.class.getName());
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
            LOG.info(this.action);
            switch (this.action) {
                case "paginarObra":
                    procesarObra(new BEAN_CRUD(this.ObraDAO.getPagination(getParametersObra(request))), response);
                    break;
                default:
                    Conf_Web conf_web = Utilities.getConf_Web(getServletContext().getRealPath("/peam_resources_app/conf_app/files/"), "conf_web.properties");
                    request.setAttribute("foto_banner", getFotoBanner(request));
                    request.setAttribute("foto_director", getFotoDirector(request, conf_web));
                    request.setAttribute("title_linea_accion", getTituloLineaAccion(request));
                    request.setAttribute("director_cargo", getDirectorCargoLineaAccion(request, conf_web));
                    request.setAttribute("funciones", getListFunciones(request));
                    request.getRequestDispatcher("/jsp/web/lineasaccion/" + getJSP(request)).forward(request, response);
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

    private String getTituloLineaAccion(HttpServletRequest request) {
        String r = "";
        switch (request.getRequestURI().substring(request.getContextPath().length())) {
            case "/lineas-de-accion/direccion-de-infraestructura":
                r = "Dirección de Infraestructura";
                break;
            case "/lineas-de-accion/direccion-de-manejo-ambiental":
                r = "Dirección de Manejo Ambiental";
                break;
            case "/lineas-de-accion/direccion-de-desarrollo-agropecuario":
                r = "Dirección de Desarrollo Agropecuario";
                break;
            case "/lineas-de-accion/estudios":
                r = "Estudios";
                break;
        }
        return r;
    }

    private String getJSP(HttpServletRequest request) {
        String r;
        if (request.getRequestURI().substring(request.getContextPath().length()).equals("/lineas-de-accion/estudios")) {
            r = "estudio.jsp";
        } else {
            r = "linea_accion_manager.jsp";
        }
        return r;
    }

    private List<String> getListFunciones(HttpServletRequest request) {
        List<String> list = null;
        switch (request.getRequestURI().substring(request.getContextPath().length())) {
            case "/lineas-de-accion/direccion-de-infraestructura":
                list = getFuncionesDireccionInfraestructura();
                break;
            case "/lineas-de-accion/direccion-de-manejo-ambiental":
                list = getFuncionesDireccionManejoAmbiental();
                break;
            case "/lineas-de-accion/direccion-de-desarrollo-agropecuario":
                list = getFuncionesDireccionDesarrolloAgropecuario();
                break;
            case "/lineas-de-accion/estudios":
                list = getFuncionesEstudios();
                break;
        }
        return list;
    }

    private List<String> getFuncionesDireccionInfraestructura() {
        List<String> list = new ArrayList<>();
        list.add("Programar, controlar y supervisar la ejecución de obras que ejecute el Proyecto Especial.");
        list.add("Controlar y archivar los expedientes técnicos y planoteca especializada correspondientes a las obras dentro del ámbito del Proyecto Especial.");
        list.add("Efectuar el seguimiento a los contratos de ejecución y supervisión de obras, así como los contratos de bienes y servicios relacionados con la ejecución de obras por ejecución presupuestaria directa.");
        list.add("Supervisar las labores de mantenimiento y operación de las obras y equipos designados a su Dirección.");
        list.add("Dirigir y supervisar los cálculos de valorizaciones de obras y servicios que el Proyecto Especial ejecute.");
        list.add("Proponer a la Gerencia General la designación de los Comités para efectos de convocatorias y para la recepción y liquidaciones de obras.");
        list.add("Formular informes periódicos de avances de las obras y servicios.");
        list.add("Formular el Plan de Actividades y evaluar su cumplimiento.");
        return list;
    }

    private List<String> getFuncionesDireccionManejoAmbiental() {
        List<String> list = new ArrayList<>();
        list.add("Ejecutar, supervisar, controlar y monitorear las actividades para la conservación de los recursos naturales.");
        list.add("Promover y conducir la ejecuci&oacute;n de estudios sobre inventarios, diagnósticos y potencialidades de los recursos naturales en el &aacute;mbito del PEAM.");
        list.add("Promover, capacitar y sensibilizar a los diferentes grupos sociales de la población, para que asuman actitudes con sentido de responsabilidad frente al tratamiento de la problemática ambiental.");
        list.add("Proponer y diseñar alternativas de uso sostenible de los recursos naturales.");
        list.add("Proponer a la Gerencia General la pol&iacute;tica medioambiental en el sector agrario y otros, con la participación de los demás órganos de Línea; incorporándolos en los respectivos expedientes técnicos de las obras y actividades.");
        list.add("Formular y elaborar estudios de impacto ambiental en el sector agrario y otros.");
        list.add("Monitorear y evaluar el proceso de ejecuci&oacute;n de las actividades a su cargo e informar a la Gerencia General.");
        list.add("Facilitar el cumplimiento de las normas legales vigentes inherentes a la protecci&oacute;n y utilizaci&oacute;n de los recursos naturales y el medio ambiente.");
        return list;
    }

    private List<String> getFuncionesDireccionDesarrolloAgropecuario() {
        List<String> list = new ArrayList<>();
        list.add("Formular el Plan de Desarrollo Agropecuario en armonía, con el plan integral de desarrollo del PEAM.");
        list.add("Programar, dirigir, ejecutar, supervisar y evaluar las actividades y acciones para el cumplimiento de los planes anuales de desarrollo agropecuario del PEAM en función a los recursos presupuestales que se designen.");
        list.add("Brindar asistencia técnica integral promoviendo la agro exportación y agroindustria.");
        list.add("Coordinar con los demás Órganos de Línea de programaci&oacute;n y ejecución de actividades tendentes al manejo y conservación de los recursos naturales.");
        list.add("Coordinar con los Proyectos y Unidades Operativas del sector Agricultura y otras instituciones para planificar, programar y ejecutar acciones de desarrollo agropecuario.");
        list.add("Promover la formación de organizaciones de base, fomentando la participación de Genero y fortaleciendo su capacidad de autoayuda y gestión");
        list.add("Formular y elaborar estudios de desarrollo agropecuario, así como emitir opinión cuando sea necesario o lo requieran las demás Direcciones de Líneas en coordinación con la Gerencia General.");
        list.add("Evaluar el avance de las actividades y acciones a su cargo e informar a la Gerencia General.");
        return list;
    }

    private List<String> getFuncionesEstudios() {
        List<String> list = new ArrayList<>();
        list.add("Dirigir los estudios a nivel de perfil, pre factibilidad y factibilidad, según los lineamientos establecidos en las Directivas Generales del Sistema Nacional de Inversión Pública y sus modificatorias.");
        list.add("Dirigir y supervisar la formulación, el seguimiento y la evaluación de los sistemas de planificación e inversión pública.");
        list.add("Dirigir y supervisar el proceso de aplicación del sistema de inversión pública.");
        list.add("Observar obligatoriamente los procedimientos establecidos en la normatividad vigente, para la declaración de viabilidad de los perfiles como requisito previo a su programación y ejecución.");
        list.add("Supervisa la elaboración de los Planes de Desarrollo del ámbito de acción del proyecto: agroindustriales, de riego, de electrificación, viales, saneamiento, etc., concordantes con los Planes de Desarrollo Regional, Local, y Estratégico Institucional, con criterios de rentabilidad económica");
        list.add("Desarrollar las demás funciones de su competencia que le asigne la Oficina de Presupuesto, Planificación, Estudios y O.T.");
        return list;
    }

    private String getDirectorCargoLineaAccion(HttpServletRequest request, Conf_Web conf) {
        String r = "";
        switch (request.getRequestURI().substring(request.getContextPath().length())) {
            case "/lineas-de-accion/direccion-de-infraestructura":
                //r = "Ing. John William Sanchez Rodriguez - DIRECTOR DE INFRAESTRUCTURA";
                r = conf.getDirector_infraestructura() + " - DIRECTOR DE INFRAESTRUCTURA";
                break;
            case "/lineas-de-accion/direccion-de-manejo-ambiental":
                //r = "Ing. Marilyn Rivera Briones - DIRECTOR DE MANEJO AMBIENTAL";
                r = conf.getDirector_manejo_ambiental() + " - DIRECTOR DE MANEJO AMBIENTAL";
                break;
            case "/lineas-de-accion/direccion-de-desarrollo-agropecuario":
                //r = "Ing. Luis Alberto Villavicencio Zuasnabar - DIRECTOR DE DESARROLLO AGROPECUARIO";
                r = conf.getDirector_desarrollo_agropecuario() + " - DIRECTOR DE DESARROLLO AGROPECUARIO";
                break;
            case "/lineas-de-accion/estudios":
                //r = "Adan Fabian Vergara - RESPONSABLE ÁREA DE ESTUDIOS";
                r = conf.getDirector_area_estudios() + " - RESPONSABLE ÁREA DE ESTUDIOS";
                break;
        }
        return r;
    }

    private String getFotoDirector(HttpServletRequest request, Conf_Web conf) {
        String r = "";
        conf.setDirector_infraestructura(new String(conf.getDirector_infraestructura().getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8));
        conf.setDirector_desarrollo_agropecuario(new String(conf.getDirector_desarrollo_agropecuario().getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8));
        conf.setDirector_manejo_ambiental(new String(conf.getDirector_manejo_ambiental().getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8));
        conf.setDirector_area_estudios(new String(conf.getDirector_area_estudios().getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8));
        switch (request.getRequestURI().substring(request.getContextPath().length())) {
            case "/lineas-de-accion/direccion-de-infraestructura":
                //r = "director_infraestructura.jpg";
                r = conf.getNombre_foto_director_infraestructura();
                break;
            case "/lineas-de-accion/direccion-de-manejo-ambiental":
                //r = "director_ambiental.jpg";
                r = conf.getNombre_foto_director_manejo_ambiental();
                break;
            case "/lineas-de-accion/direccion-de-desarrollo-agropecuario":
                //r = "director_agropecuario.jpg";
                r = conf.getNombre_foto_director_desarrollo_agropecuario();
                break;
            case "/lineas-de-accion/estudios":
                //r = "responsable_estudios.jpg";
                r = conf.getNombre_foto_director_area_estudios();
                break;
        }
        if (!new File(getServletContext().getRealPath("/peam_resources/logos_complementos/lineas_accion/directores/" + r)).exists()) {
            r = "default_usuario.png";
        }
        return r;
    }

    private String getFotoBanner(HttpServletRequest request) {
        String r = "";
        switch (request.getRequestURI().substring(request.getContextPath().length())) {
            case "/lineas-de-accion/direccion-de-infraestructura":
                r = "infraestructura.jpg";
                break;
            case "/lineas-de-accion/direccion-de-manejo-ambiental":
                r = "ambiental.jpg";
                break;
            case "/lineas-de-accion/direccion-de-desarrollo-agropecuario":
                r = "agropecuario.jpg";
                break;
            case "/lineas-de-accion/estudios":
                r = "estudio.jpg";
                break;
        }
        return r;
    }

    private void procesarObra(BEAN_CRUD bean_crud, HttpServletResponse response) {
        try {
            this.jsonResponse = this.json.toJson(bean_crud);
            response.setContentType("application/json");
            response.getWriter().write(this.jsonResponse);
            LOG.info(this.jsonResponse);
        } catch (IOException ex) {
            Logger.getLogger(GestionTransparenteAPI.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private HashMap<String, Object> getParametersObra(HttpServletRequest request) {
        this.parameters.clear();
        this.parameters.put("FILTER", request.getParameter("txtDescripcion").toLowerCase());
        String sql_anio = " AND ESTADO = true ";
        if (!request.getParameter("comboAnioObra").equals("-1")) {
            sql_anio += " AND ANHO = '" + request.getParameter("comboAnioObra") + "' ";
        }
        if (!request.getParameter("cboSeguimiento").equals("-1")) {
            sql_anio += " AND SEGUIMIENTO = '" + request.getParameter("cboSeguimiento") + "' ";
        }
        sql_anio += " AND AREA = " + getIdArea(request) + " ";
        this.parameters.put("SQL_ANIO", sql_anio);
        this.parameters.put("SQL_ORDERS", "ANHO DESC");
        this.parameters.put("LIMIT",
                " LIMIT " + request.getParameter("sizePageObra") + " OFFSET "
                + (Integer.parseInt(request.getParameter("numberPageObra")) - 1)
                * Integer.parseInt(request.getParameter("sizePageObra")));
        return this.parameters;
    }

    private int getIdArea(HttpServletRequest request) {
        int id = 0;
        switch (request.getParameter("url")) {
            case "/lineas-de-accion/direccion-de-infraestructura":
                id = 1;
                break;
            case "/lineas-de-accion/direccion-de-manejo-ambiental":
                id = 2;
                break;
            case "/lineas-de-accion/direccion-de-desarrollo-agropecuario":
                id = 3;
                break;
        }
        return id;
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
