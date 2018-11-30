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
import gob.peam.web.dao.ConvocatoriaBienDAO;
import gob.peam.web.dao.impl.ActividadDAOImpl;
import gob.peam.web.dao.impl.CalendarioConvDAOImpl;
import gob.peam.web.dao.impl.ConvocatoriaBienDAOImpl;
import gob.peam.web.model.Actividad;
import gob.peam.web.model.CalendarioConv;
import gob.peam.web.model.ConvocatoriaBien;
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
 * @author JhanxD
 */
@MultipartConfig
@WebServlet(name = "ConvocatoriaBien", urlPatterns = {"/convocatorias/bsc"})
public class ConvocatoriaBienAPI extends HttpServlet {

    @Resource(name = "jdbc/dbweb")
    private DataSource pool;
    private HttpSession session;
    private Gson json;
    private String jsonResponse;
    private HashMap<String, Object> parameters;
    private final Log logger = LogFactory.getLog(DocumentoAPI.class);
    private String action;

    private ConvocatoriaBienDAO convocatoriabienDAO;
    private CalendarioConvDAO calendarioconvDAO;
    private ActividadDAO actividadDAO;

    @Override
    public void init() throws ServletException {
        super.init(); // To change body of generated methods, choose Tools | Templates.
        this.json = new GsonBuilder().setDateFormat("dd/MM/yyyy").create();
        this.parameters = new HashMap<>();
        this.action = "";

        this.convocatoriabienDAO = new ConvocatoriaBienDAOImpl(this.pool);
        this.calendarioconvDAO = new CalendarioConvDAOImpl(this.pool);
        this.actividadDAO = new ActividadDAOImpl(this.pool);
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
                case "paginarConvocatoriaBien":
                    procesarConvocatoriaBien(new BEAN_CRUD(this.convocatoriabienDAO.getPagination(getParametersConvocatoriaBien(request))), response);
                    break;
                case "addConvocatoriaBien":
                    procesarConvocatoriaBien(this.convocatoriabienDAO.add(getConvocatoriaBien(request), getParametersConvocatoriaBien(request)), response);
                    break;
                case "updateConvocatoriaBien":
                    procesarConvocatoriaBien(this.convocatoriabienDAO.update(getConvocatoriaBien(request), getParametersConvocatoriaBien(request)), response);
                    break;
                case "deleteConvocatoriaBien":
                    procesarConvocatoriaBien(this.convocatoriabienDAO.delete(Long.parseLong(request.getParameter("txtConvoIdER")), getParametersConvocatoriaBien(request)), response);
                    break;
                case "activateConvocatoriaBien":
                    procesarConvocatoriaBien(this.convocatoriabienDAO.activate(Long.parseLong(request.getParameter("txtConvoIdER")), getParametersConvocatoriaBien(request)), response);
                    break;
                case "uploadConvocatoriaBien":
                    procesarConvocatoriaBien(this.convocatoriabienDAO.upload(getArchvivos(request), getParametersConvocatoriaBien(request)), response);
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
                default:
                    request.getRequestDispatcher("/jsp/gc/convocatorias/convocatoriabien.jsp").forward(request, response);
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

    private void procesarConvocatoriaBien(BEAN_CRUD bean_crud, HttpServletResponse response) {
        try {
            this.jsonResponse = this.json.toJson(bean_crud);
            response.setContentType("application/json");
            response.getWriter().write(this.jsonResponse);
            this.logger.info(this.jsonResponse);
        } catch (IOException ex) {
            Logger.getLogger(GestionTransparenteAPI.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private HashMap<String, Object> getParametersConvocatoriaBien(HttpServletRequest request) {
        this.parameters.clear();
        if (request.getParameter("action").equals("uploadConvocatoriaBien")) {
            this.parameters.put("ARCHIVO", String.valueOf(request.getParameter("txtCadena")).substring(1));
        }
        this.parameters.put("FILTER", request.getParameter("txtConvocatoriaBien").toLowerCase());
        if (request.getParameter("comboAnio").equals("-1")) {
            this.parameters.put("SQL_ANIO", "");
        } else {
            this.parameters.put("SQL_ANIO", "AND ANHO = '1" + String.valueOf(request.getParameter("comboAnio")).substring(2, 4) + "' ");
        }
        if (request.getParameter("comboTipoListaConvocatoriaBien").equals("-1")) {
            this.parameters.put("SQL_ESTADO", "");
        } else {
            this.parameters.put("SQL_ESTADO", "AND ESTADO = " + request.getParameter("comboTipoListaConvocatoriaBien") + " ");
        }
        if (request.getParameter("txtEstadoER").equals("true")) {
            this.parameters.put("ESTADO", "false");
        } else {
            this.parameters.put("ESTADO", "true");
        }
        this.parameters.put("SQL_ORDERS", "FECHA DESC");
        this.parameters.put("LIMIT",
                " LIMIT " + request.getParameter("sizePageConvocatoriaBien") + " OFFSET "
                + (Integer.parseInt(request.getParameter("numberPageConvocatoriaBien")) - 1)
                * Integer.parseInt(request.getParameter("sizePageConvocatoriaBien")));
        return this.parameters;
    }

    private ConvocatoriaBien getConvocatoriaBien(HttpServletRequest request) {
        ConvocatoriaBien obj = new ConvocatoriaBien();
        if (request.getParameter("action").equals("updateConvocatoriaBien")) {
            obj.setConvo_id(Integer.parseInt(request.getParameter("txtConvoIdER")));
            obj.setEstado(Boolean.parseBoolean(String.valueOf(request.getParameter("txtEstadoER"))));
        } else {
            obj.setEstado(false);
        }
        obj.setTitulo(request.getParameter("txtTituloER"));
        obj.setReferencia(request.getParameter("txtReferenciaER"));
        obj.setFecha(Utilities.getDateSQLFORMAT(request.getParameter("txtFechaER"), "dd/MM/yyyy"));
        obj.setAnho("1" + String.valueOf(request.getParameter("txtFechaER")).substring(8, 10));
        obj.setTipo(Integer.parseInt(request.getParameter("txtTipoER")));
        obj.setVal_referencial(request.getParameter("txtValorReferencialER"));
        obj.setLug_reg_participante(request.getParameter("txtLugarRegistroER"));
        obj.setCost_participacion(request.getParameter("txtCostoParticipacionER"));
        obj.setProceso(Integer.parseInt(request.getParameter("txtProcesoER")));
        return obj;
    }

    private ConvocatoriaBien getArchvivos(HttpServletRequest request) {
        ConvocatoriaBien obj = new ConvocatoriaBien();
        try {
            obj.setConvo_id(Integer.parseInt(request.getParameter("txtConvoIdER")));
            ///PARTE DOCUMENTO
            String longi = String.valueOf(request.getParameter("txtCantidad")).substring(1);
            logger.info(longi);
            String[] longitud = longi.split(",");
            for (int i = 0; i < longitud.length; i++) {
                Part filePart = request.getPart("fileArchivoCB" + longitud[i]);
                boolean copiar = true;
                File fileTemp = null;
                switch (request.getParameter("txtValidacionArchivoCB" + longitud[i])) {
                    case "SI":
                        //HAY UN ARCHIVO QUE HA VENIDO
                        if (!request.getParameter("txtNombreFileResultadoActualCB" + longitud[i]).equals("")) {
                            fileTemp = new File(getServletContext().getRealPath("/peam_resources_app/conf_app/ArchvivosConvocatorias/C_" + String.valueOf(request.getParameter("txtNombreFileResultadoActualCB" + longitud[i]))));
                        }
                        break;
                    default:
                        copiar = false; //YA NO SE COPIA PORQUE ES EL MISMO, NO HAY ARCHIVO
                        break;
                }
                if (fileTemp != null && fileTemp.exists()) {
                    fileTemp.delete();
                }
                if (copiar) {
                    obj = uploadFile(filePart, obj);
                }
            }

        } catch (IOException | ServletException ex) {
            Logger.getLogger(GestionTransparenteAPI.class.getName()).log(Level.SEVERE, null, ex);
        }
        return obj;
    }

    private ConvocatoriaBien uploadFile(Part filePart, ConvocatoriaBien obj) {
        String path = getServletContext().getRealPath("/peam_resources_app/conf_app/ArchvivosConvocatorias/C_");
        File file = new File(path + Paths.get(filePart.getSubmittedFileName()).getFileName().toString());
        //VALIDAMOS EL NUEVO ARCHIVO
        if (file.exists()) {
            file = new File(path + Paths.get(filePart.getSubmittedFileName()).getFileName().toString());
        }
        try (InputStream input = filePart.getInputStream()) {
            Files.copy(input, file.toPath());
        } catch (IOException ex) {
            Logger.getLogger(GestionTransparenteAPI.class.getName()).log(Level.SEVERE, null, ex);
        }
        return obj;
    }

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
        this.parameters.put("ORIGEN", (int) 1);
        this.parameters.put("TIPO", " AND TIPO = 1 ");
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
        obj.setTipo((int) 1);
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
        this.parameters.put("ATIPO", " ACTI_TIPO = 1");
        if (String.valueOf(request.getParameter("txtEditar")).equals("true")) {
            this.parameters.put("TIPO", "");
        } else {
            this.parameters.put("TIPO", "  AND ACTI_ID NOT IN (SELECT ACTI_ID from WEB.CALENDARIO_CONV WHERE TIPO = 1 AND CONVO_ID = " + String.valueOf(request.getParameter("txtConvoPersIdER")) + ")");
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
        obj.setActi_tipo((int) 1);
        return obj;
    }

}
