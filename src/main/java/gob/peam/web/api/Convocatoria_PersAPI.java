/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gob.peam.web.api;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import gob.peam.web.dao.ActividadDAO;
import gob.peam.web.dao.CalendarioConvDAO;
import gob.peam.web.dao.Convocatoria_PersDAO;
import gob.peam.web.dao.DocumentCalDAO;
import gob.peam.web.dao.PuestoConvDAO;
import gob.peam.web.dao.impl.ActividadDAOImpl;
import gob.peam.web.dao.impl.CalendarioConvDAOImpl;
import gob.peam.web.dao.impl.Convocatoria_PersDAOImpl;
import gob.peam.web.dao.impl.DocumentCalDAOImpl;
import gob.peam.web.dao.impl.PuestoConvDAOImpl;
import gob.peam.web.model.Actividad;
import gob.peam.web.model.CalendarioConv;
import gob.peam.web.model.Convocatoria_Pers;
import gob.peam.web.model.DocumentCal;
import gob.peam.web.model.PuestoConv;
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
 * @author JamesCarrillo
 */
@MultipartConfig
@WebServlet(name = "Convocatoria_PersAPI", urlPatterns = {"/convocatorias/personal"})
public class Convocatoria_PersAPI extends HttpServlet {

    @Resource(name = "jdbc/dbweb")
    private DataSource pool;
    private HttpSession session;
    private Gson json;
    private String jsonResponse;
    private HashMap<String, Object> parameters;
    private final Log logger = LogFactory.getLog(DocumentoAPI.class);
    private String action;

    private Convocatoria_PersDAO convocatoria_persDAO;
    private CalendarioConvDAO calendarioconvDAO;
    private ActividadDAO actividadDAO;
    private PuestoConvDAO puestoConvDAO;
    private DocumentCalDAO documentCalDAO;

    @Override
    public void init() throws ServletException {
        super.init(); // To change body of generated methods, choose Tools | Templates.
        this.json = new GsonBuilder().setDateFormat("dd/MM/yyyy").create();
        this.parameters = new HashMap<>();
        this.action = "";

        this.convocatoria_persDAO = new Convocatoria_PersDAOImpl(this.pool);
        this.calendarioconvDAO = new CalendarioConvDAOImpl(this.pool);
        this.actividadDAO = new ActividadDAOImpl(this.pool);
        this.puestoConvDAO = new PuestoConvDAOImpl(this.pool);
        this.documentCalDAO = new DocumentCalDAOImpl(this.pool);
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
                case "paginarConvocatoriaPers":
                    procesarConvocatoria_Pers(new BEAN_CRUD(this.convocatoria_persDAO.getPagination(getParametersConvocatoria_Pers(request))), response);
                    break;
                case "addConvocatoriaPers":
                    procesarConvocatoria_Pers(this.convocatoria_persDAO.add(getConvocatoria_Pers(request), getParametersConvocatoria_Pers(request)), response);
                    break;
                case "updateConvocatoriaPers":
                    procesarConvocatoria_Pers(this.convocatoria_persDAO.update(getConvocatoria_Pers(request), getParametersConvocatoria_Pers(request)), response);
                    break;
                case "deleteConvocatoriaPers":
                    procesarConvocatoria_Pers(this.convocatoria_persDAO.delete(Long.parseLong(request.getParameter("txtCoperIdER")), getParametersConvocatoria_Pers(request)), response);
                    break;
                case "activateConvocatoriaPers":
                    procesarConvocatoria_Pers(this.convocatoria_persDAO.activate(Long.parseLong(request.getParameter("txtCoperIdER")), getParametersConvocatoria_Pers(request)), response);
                    break;
                case "paginarCalendarioConv":
                    procesarCalendario_Conv(new BEAN_CRUD(this.calendarioconvDAO.getPagination(getParametersCalendario_Conv(request))), response);
                    break;
                case "addCalendarioConv":
                    procesarCalendario_Conv(this.calendarioconvDAO.add(getCalendario_Conv(request), getParametersCalendario_Conv(request)), response);
                    break;
                case "updateCalendarioConv":
                    procesarCalendario_Conv(this.calendarioconvDAO.update(getCalendario_Conv(request), getParametersCalendario_Conv(request)), response);
                    break;
                case "deleteCalendarioConv":
                    procesarCalendario_Conv(this.calendarioconvDAO.delete(Long.parseLong(request.getParameter("txtIdERCC")), getParametersCalendario_Conv(request)), response);
                    break;
                case "paginarActividad":
                    procesarActividad(new BEAN_CRUD(this.actividadDAO.getPagination(getParametersActividad(request))), response);
                    break;
                case "addActividad":
                    procesarActividad(this.actividadDAO.add(getActividad(request), getParametersActividad(request)), response);
                    break;
                case "updateActividad":
                    procesarActividad(this.actividadDAO.update(getActividad(request), getParametersActividad(request)), response);
                    break;
                case "deleteActividad":
                    procesarActividad(this.actividadDAO.delete(Long.parseLong(request.getParameter("txtActiIdERAC")), getParametersActividad(request)), response);
                    break;
                case "paginarPuestoConv":
                    procesarPuestoConv(new BEAN_CRUD(this.puestoConvDAO.getPagination(getParametersPuestoConv(request))), response);
                    break;
                case "addPuestoConv":
                    procesarPuestoConv(this.puestoConvDAO.add(getPuestoConv(request), getParametersPuestoConv(request)), response);
                    break;
                case "updatePuestoConv":
                    procesarPuestoConv(this.puestoConvDAO.update(getPuestoConv(request), getParametersPuestoConv(request)), response);
                    break;
                case "deletePuestoConv":
                    procesarPuestoConv(this.puestoConvDAO.delete(Long.parseLong(request.getParameter("txtPues_IdER")), getParametersPuestoConv(request)), response);
                    break;
                case "paginarDocumentCal":
                    procesarDocumentCal(new BEAN_CRUD(this.documentCalDAO.getPagination(getParametersDocumentCal(request))), response);
                    break;
                case "addDocumentCal":
                    procesarDocumentCal(this.documentCalDAO.add(getDocumentCal(request), getParametersDocumentCal(request)), response);
                    break;
                case "deleteDocumentCal":
                    procesarDocumentCal(this.documentCalDAO.delete(Long.parseLong(request.getParameter("txtDoco_IdER")), getParametersDocumentCal(request)), response);
                    break;
                default:
                    request.getRequestDispatcher("/jsp/gc/convocatorias/convocatoria_pers.jsp").forward(request, response);
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

    ////CONVOCATORIAS PERSONAL
    private void procesarConvocatoria_Pers(BEAN_CRUD bean_crud, HttpServletResponse response) {
        try {
            this.jsonResponse = this.json.toJson(bean_crud);
            response.setContentType("application/json");
            response.getWriter().write(this.jsonResponse);
            this.logger.info(this.jsonResponse);
        } catch (IOException ex) {
            Logger.getLogger(DocumentoWebAPI.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private HashMap<String, Object> getParametersConvocatoria_Pers(HttpServletRequest request) {
        this.parameters.clear();
        this.parameters.put("FILTER", request.getParameter("txtConvocatoriaPers").toLowerCase());
        if (request.getParameter("comboAnio").equals("-1")) {
            this.parameters.put("SQL_ANIO", "");
        } else {
            this.parameters.put("SQL_ANIO", "AND ANHO = '" + request.getParameter("comboAnio") + "' ");
        }
        if (request.getParameter("comboTipoListaConvocatoriaPers").equals("-1")) {
            this.parameters.put("SQL_ESTADO", "");
        } else {
            this.parameters.put("SQL_ESTADO", "AND ESTADO = " + request.getParameter("comboTipoListaConvocatoriaPers") + " ");
        }
        if (request.getParameter("txtEstadoER").equals("true")) {
            this.parameters.put("ESTADO", "false");
        } else {
            this.parameters.put("ESTADO", "true");
        }
        this.parameters.put("SQL_ORDERS", "ANHO DESC");
        this.parameters.put("LIMIT",
                " LIMIT " + request.getParameter("sizePageConvocatoriaPers") + " OFFSET "
                + (Integer.parseInt(request.getParameter("numberPageConvocatoriaPers")) - 1)
                * Integer.parseInt(request.getParameter("sizePageConvocatoriaPers")));
        return this.parameters;
    }

    private Convocatoria_Pers getConvocatoria_Pers(HttpServletRequest request) {
        Convocatoria_Pers obj = new Convocatoria_Pers();
        if (request.getParameter("action").equals("updateConvocatoriaPers")) {
            obj.setCoper_id(Integer.parseInt(request.getParameter("txtCoperIdER")));
        }
        obj.setConvocatoria(request.getParameter("txtConvocatoriaER"));
        obj.setDescripcion(request.getParameter("txtSintesisER"));
        obj.setEstado(false);
        return obj;
    }

    ///CALENDARIO DE CONVOCTORIAS
    private void procesarCalendario_Conv(BEAN_CRUD bean_crud, HttpServletResponse response) {
        try {
            this.jsonResponse = this.json.toJson(bean_crud);
            response.setContentType("application/json");
            response.getWriter().write(this.jsonResponse);
            this.logger.info(this.jsonResponse);
        } catch (IOException ex) {
            Logger.getLogger(GestionTransparenteAPI.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private HashMap<String, Object> getParametersCalendario_Conv(HttpServletRequest request) {
        this.parameters.clear();
        this.parameters.put("FILTER", request.getParameter("txtCalendarioConv").toLowerCase());
        this.parameters.put("CONVOCATORIA_PERS", " AND WEB.CALENDARIO_CONV.CONVO_ID = " + String.valueOf(request.getParameter("txtConvoPersIdER")));
        this.parameters.put("TIPO", " AND TIPO = 2 ");
        this.parameters.put("LIMIT",
                " LIMIT " + request.getParameter("sizePageCalendarioConv") + " OFFSET "
                + (Integer.parseInt(request.getParameter("numberPageCalendarioConv")) - 1)
                * Integer.parseInt(request.getParameter("sizePageCalendarioConv")));
        return this.parameters;
    }

    private CalendarioConv getCalendario_Conv(HttpServletRequest request) {
        CalendarioConv obj = new CalendarioConv();
        if (request.getParameter("action").equals("updateCalendarioConv")) {
            obj.setId(Integer.parseInt(request.getParameter("txtIdERCC")));
        }
        obj.setFecha_inicio(Utilities.getDateSQLFORMAT(request.getParameter("txtFechaInicioERCC"), "dd/MM/yyyy"));
        obj.setFecha_fin(Utilities.getDateSQLFORMAT(request.getParameter("txtFechaFinERCC"), "dd/MM/yyyy"));
        obj.setEstado(true);
        obj.setConvo_id(Integer.parseInt(request.getParameter("txtConvoPersIdER")));
        obj.setActi_id(new Actividad(Integer.parseInt(request.getParameter("comboActividadCC"))));
        obj.setTipo((int) 2);
        return obj;
    }

    /// ACTIVIDADES
    private void procesarActividad(BEAN_CRUD beanCrud, HttpServletResponse response) {
        try {
            this.jsonResponse = this.json.toJson(beanCrud);
            response.setContentType("application/json");
            response.getWriter().write(this.jsonResponse);
            this.logger.info(this.jsonResponse);
        } catch (IOException ex) {
            Logger.getLogger(GestionTransparenteAPI.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private HashMap<String, Object> getParametersActividad(HttpServletRequest request) {
        this.parameters.clear();
        this.parameters.put("ATIPO", " ACTI_TIPO = 2");
        if (String.valueOf(request.getParameter("txtEditar")).equals("true")) {
            this.parameters.put("TIPO", "");
        } else {
            this.parameters.put("TIPO", "  AND ACTI_ID NOT IN (SELECT ACTI_ID from WEB.CALENDARIO_CONV WHERE TIPO = 2 AND CONVO_ID = " + String.valueOf(request.getParameter("txtConvoPersIdER")) + ")");
        }
        return this.parameters;
    }

    private Actividad getActividad(HttpServletRequest request) {
        Actividad obj = new Actividad();
        if (request.getParameter("action").equals("updateActividad")) {
            obj.setActi_id(Integer.parseInt(request.getParameter("txtActiIdERAC")));
        }
        obj.setDescripcion(request.getParameter("txtActividadERAC"));
        obj.setEstado(true);
        obj.setActi_tipo((int) 2);
        return obj;
    }

    /// PUESTO DE CONVOCATORIAS
    private void procesarPuestoConv(BEAN_CRUD bean_crud, HttpServletResponse response) {
        try {
            this.jsonResponse = this.json.toJson(bean_crud);
            response.setContentType("application/json");
            response.getWriter().write(this.jsonResponse);
            this.logger.info(this.jsonResponse);
        } catch (IOException ex) {
            Logger.getLogger(GestionTransparenteAPI.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private HashMap<String, Object> getParametersPuestoConv(HttpServletRequest request) {
        this.parameters.clear();
        this.parameters.put("FILTER", request.getParameter("txtPuestoConv").toLowerCase());
        this.parameters.put("IDCONVO", " AND COPER_ID = " + Integer.parseInt(request.getParameter("txtCoperIdERPC")));
        return this.parameters;
    }

    private PuestoConv getPuestoConv(HttpServletRequest request) {
        PuestoConv obj = new PuestoConv();
        if (request.getParameter("action").equals("updatePuestoConv")) {
            obj.setPues_id(Integer.parseInt(request.getParameter("txtPues_IdER")));
        }
        obj.setCargo(request.getParameter("txtCargoERPC"));
        obj.setModaidad(request.getParameter("txtModalidadERPC"));
        obj.setNroplaza(Integer.parseInt(request.getParameter("txtNroPlazaERPC")));
        obj.setIngre_mensual(request.getParameter("txtIngreMensualERPC"));
        obj.setCoper_id(new Convocatoria_Pers(Integer.parseInt(request.getParameter("txtCoperIdERPC"))));
        obj.setEstado(true);
        return obj;
    }

    //// DOCUMENTOS DE CALENDARIOS
    private void procesarDocumentCal(BEAN_CRUD bean_crud, HttpServletResponse response) {
        try {
            this.jsonResponse = this.json.toJson(bean_crud);
            response.setContentType("application/json");
            response.getWriter().write(this.jsonResponse);
            this.logger.info(this.jsonResponse);
        } catch (IOException ex) {
            Logger.getLogger(GestionTransparenteAPI.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private HashMap<String, Object> getParametersDocumentCal(HttpServletRequest request) {
        this.parameters.clear();
        this.parameters.put("IDCALENDARIO", " ID = " + Integer.parseInt(request.getParameter("txtCalendarioId")));
        return this.parameters;
    }

    private DocumentCal getDocumentCal(HttpServletRequest request) {
        DocumentCal obj = new DocumentCal();
        try {
            ///PARTE DOCUMENTO
            Part filePart = request.getPart("fileArchivo");
            boolean copiar = true;
            File fileTemp = null;
            switch (request.getParameter("txtValidacionArchivo")) {
                case "SI":
                    //HAY UN ARCHIVO QUE HA VENIDO
                    if (!request.getParameter("txtNombreFileResultadoActual").equals("")) {
                        fileTemp = new File(getServletContext().getRealPath("/peam_resources_app/conf_app/ArchvivosConvocatorias/C_" + String.valueOf(request.getParameter("txtNombreFileResultadoActual"))));
                    }
                    obj.setUrl_file("C_" + Paths.get(filePart.getSubmittedFileName()).getFileName().toString());
                    break;
                case "DEFECTO":
                    fileTemp = new File(getServletContext().getRealPath("/peam_resources_app/conf_app/ArchvivosConvocatorias/C_" + String.valueOf(request.getParameter("txtNombreFileResultadoActual"))));
                    obj.setUrl_file("");
                    copiar = false;
                    break;
                default:
                    copiar = false; //YA NO SE COPIA PORQUE ES EL MISMO, NO HAY ARCHIVO
                    obj.setUrl_file("C_"+String.valueOf(request.getParameter("txtNombreFileResultadoActual")));
                    break;
            }
            if (fileTemp != null && fileTemp.exists()) {
                fileTemp.delete();
            }
            if (copiar) {
                obj = uploadFile(filePart, obj);
            }

            obj.setNombre(request.getParameter("txtNombreERDC"));
            obj.setId(new CalendarioConv(Integer.parseInt(request.getParameter("txtCalendarioId"))));
            obj.setEstado(true);
        } catch (IOException | ServletException ex) {
            Logger.getLogger(GestionTransparenteAPI.class.getName()).log(Level.SEVERE, null, ex);
        }
        return obj;
    }
    
    private DocumentCal uploadFile(Part filePart, DocumentCal obj) {
        String path = getServletContext().getRealPath("/peam_resources_app/conf_app/ArchvivosConvocatorias/C_");
        File file = new File(path + Paths.get(filePart.getSubmittedFileName()).getFileName().toString());
        //VALIDAMOS EL NUEVO ARCHIVO
        if (file.exists()) {
            String prefijo = "C_";
            file = new File(path+Paths.get(filePart.getSubmittedFileName()).getFileName().toString());
                obj.setUrl_file(prefijo + Paths.get(filePart.getSubmittedFileName()).getFileName().toString());
        }
        try (InputStream input = filePart.getInputStream()) {
            Files.copy(input, file.toPath());
        } catch (IOException ex) {
            Logger.getLogger(GestionTransparenteAPI.class.getName()).log(Level.SEVERE, null, ex);
        }
            return obj;
    }

}
