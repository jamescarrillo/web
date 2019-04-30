/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gob.peam.web.api;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import gob.peam.web.dao.CorreoDAO;
import gob.peam.web.dao.impl.CorreoDAOImpl;
import gob.peam.web.model.Correo;
import gob.peam.web.model.others.Conf_Web;
import gob.peam.web.utilities.BEAN_CRUD;
import gob.peam.web.utilities.Utilities;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
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

/**
 *
 * @author Juan Jose
 */
@MultipartConfig
@WebServlet(name = "PersonalizacionAPI", urlPatterns = {
    "/personalizacion/web",
    "/personalizacion/correo"
})
public class PersonalizacionAPI extends HttpServlet {

    @Resource(name = "jdbc/dbweb")
    private DataSource pool;
    private HttpSession session;
    private Gson json;
    private String jsonResponse;
    private HashMap<String, Object> parameters;
    private static final Logger LOG = Logger.getLogger(DocumentoAPI.class.getName());
    private String action;

    private CorreoDAO correoDAO;

    @Override
    public void init() throws ServletException {
        super.init(); // To change body of generated methods, choose Tools | Templates.
        this.json = new GsonBuilder().setDateFormat("dd/MM/yyyy").create();
        this.parameters = new HashMap<>();
        this.action = "";

        this.correoDAO = new CorreoDAOImpl(this.pool);

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
                case "/personalizacion/web":
                    this.action = request.getParameter("action") == null ? "" : request.getParameter("action");
                    LOG.info(action);
                    switch (this.action) {
                        case "guardarPersonalizacionWeb":
                            BEAN_CRUD beancrud = new BEAN_CRUD();
                            beancrud.setMESSAGE_SERVER(Utilities.setConf_Web(getConf_Web(request), getServletContext().getRealPath("/peam_resources_app/conf_app/files/"), "conf_web.properties"));
                            procesarPersonalizacion(beancrud, response);
                            break;
                        default:
                            request.setAttribute("conf_web", Utilities.getConf_Web(getServletContext().getRealPath("/peam_resources_app/conf_app/files/"), "conf_web.properties"));
                            LOG.info(Utilities.getConf_Web(getServletContext().getRealPath("/peam_resources_app/conf_app/files/"), "conf_web.properties").toString());
                            request.getRequestDispatcher("/jsp/gc/global/personalizacion_web.jsp").forward(request, response);
                            break;
                    }
                    break;
                case "/personalizacion/correo":
                    this.action = request.getParameter("action") == null ? "" : request.getParameter("action");
                    switch (this.action) {
                        case "paginarCorreo":
                            procesarCorreo(new BEAN_CRUD(this.correoDAO.getPagination(getParametersCorreo(request))), response);
                            break;
                        case "guardarPersonalizacionCorreo":
                            procesarCorreo(this.correoDAO.update(getCorreo(request), getParametersCorreo(request)), response);
                            break;
                        default:
                            request.getRequestDispatcher("/jsp/gc/global/personalizacion_correo.jsp").forward(request, response);
                            break;
                    }
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
        this.session = request.getSession();
        if (this.session.getAttribute("user") == null) {
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
        this.session = request.getSession();
        if (this.session.getAttribute("user") == null) {
            response.sendRedirect("../login");
        } else {
            processRequest(request, response);
        }
    }

    private void procesarPersonalizacion(BEAN_CRUD bean_crud, HttpServletResponse response) {
        try {
            this.jsonResponse = this.json.toJson(bean_crud);
            response.setContentType("application/json");
            response.getWriter().write(this.jsonResponse);
            LOG.info(this.jsonResponse);
        } catch (IOException ex) {
            Logger.getLogger(GestionTransparenteAPI.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private Conf_Web getConf_Web(HttpServletRequest request) {
        Conf_Web conf = new Conf_Web();
        conf.setNumero_fotos_galeria(request.getParameter("numero_fotos_galeria"));
        conf.setNumero_videos_multimedia(request.getParameter("numero_videos_multimedia"));
        conf.setNumero_anuncios_mostrar(request.getParameter("numero_anuncios_mostrar"));
        conf.setIcono_pagina(request.getParameter("icono_pagina"));
        conf.setRedes_sociales(request.getParameter("redes_sociales"));
        conf.setUrl_logo_goresam(request.getParameter("url_goresam"));
        conf.setUrl_logo_portal(request.getParameter("url_portal_transparencia"));
        conf.setApikey(request.getParameter("apikey"));
        conf.setIdusuario(request.getParameter("idusuario"));
        conf.setIdalbum(request.getParameter("idalbum"));
        //DIRECTORES
        conf.setDirector_infraestructura(new String(request.getParameter("txtDirectorInfraestructura").getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8));
        conf.setDirector_manejo_ambiental(new String(request.getParameter("txtDirectorManejoAmbiental").getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8));
        conf.setDirector_desarrollo_agropecuario(new String(request.getParameter("txtDirectorManejoAmbiental").getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8));
        conf.setDirector_area_estudios(new String(request.getParameter("txtResponsableEstudios").getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8));
        boolean copiar;
        try {
            Part filePart = request.getPart("fileFotoLogoPeam");
            switch (request.getParameter("txtValidacionFotoLogoPeam")) {
                case "SI":
                    copiar = true;
                    break;
                case "DEFECTO":
                    conf.setNombre_logo_peam("logo_peam_combinado_large.png");
                    copiar = false;
                    break;
                default:
                    copiar = false;
                    conf.setNombre_logo_peam(request.getParameter("txtNombreFotoLogoPeam"));
                    break;
            }
            if (copiar) {
                conf = uploadFile(filePart, conf, "logo_peam");
            }
            filePart = request.getPart("fileFotoLogoGoresam");
            switch (request.getParameter("txtValidacionFotoLogoGoresam")) {
                case "SI":
                    copiar = true;
                    break;
                case "DEFECTO":
                    conf.setNombre_logo_goresam("logo-goresam.png");
                    copiar = false;
                    break;
                default:
                    copiar = false;
                    conf.setNombre_logo_goresam(request.getParameter("txtNombreFotoLogoGoresam"));
                    break;
            }
            if (copiar) {
                conf = uploadFile(filePart, conf, "logo_goresam");
            }
            filePart = request.getPart("fileFotoLogoPortal");
            switch (request.getParameter("txtValidacionFotoLogoPortal")) {
                case "SI":
                    copiar = true;
                    break;
                case "DEFECTO":
                    conf.setNombre_logo_portal("portal_transparencia.png");
                    copiar = false;
                    break;
                default:
                    copiar = false;
                    conf.setNombre_logo_portal(request.getParameter("txtNombreFotoLogoPortal"));
                    break;
            }
            if (copiar) {
                conf = uploadFile(filePart, conf, "logo_portal");
            }
            filePart = request.getPart("fileFotoLogoPresentacionActualidad");
            switch (request.getParameter("txtValidacionFotoPresentacionActualidad")) {
                case "SI":
                    copiar = true;
                    break;
                case "DEFECTO":
                    conf.setNombre_logo_presentacion_actualidad("fachada_peam.png");
                    copiar = false;
                    break;
                default:
                    copiar = false;
                    conf.setNombre_logo_presentacion_actualidad(request.getParameter("txtNombreFotoLogoPresentacionActualidad"));
                    break;
            }
            if (copiar) {
                conf = uploadFile(filePart, conf, "logo_presentacion_actualidad");
            }
            //DIRECTORES
            filePart = request.getPart("fileFotoDirInfra");
            switch (request.getParameter("txtValidacionFotoDirInfra")) {
                case "SI":
                    copiar = true;
                    break;
                case "DEFECTO":
                    conf.setNombre_foto_director_infraestructura("default_director.png");
                    copiar = false;
                    break;
                default:
                    copiar = false;
                    conf.setNombre_foto_director_infraestructura(request.getParameter("txtNombreFotoDirInfra"));
                    break;
            }
            if (copiar) {
                conf = uploadFileDirector(filePart, conf, "infraestructura");
            }
            filePart = request.getPart("fileFotoDirManAmbi");
            switch (request.getParameter("txtValidacionFotoDirManAmbi")) {
                case "SI":
                    copiar = true;
                    break;
                case "DEFECTO":
                    conf.setNombre_foto_director_manejo_ambiental("default_director.png");
                    copiar = false;
                    break;
                default:
                    copiar = false;
                    conf.setNombre_foto_director_manejo_ambiental(request.getParameter("txtNombreFotoDirManAmbi"));
                    break;
            }
            if (copiar) {
                conf = uploadFileDirector(filePart, conf, "ambiental");
            }
            filePart = request.getPart("fileFotoDirDesAgro");
            switch (request.getParameter("txtValidacionFotoDirDesAgro")) {
                case "SI":
                    copiar = true;
                    break;
                case "DEFECTO":
                    conf.setNombre_foto_director_desarrollo_agropecuario("default_director.png");
                    copiar = false;
                    break;
                default:
                    copiar = false;
                    conf.setNombre_foto_director_desarrollo_agropecuario(request.getParameter("txtNombreFotoDirDesAgro"));
                    break;
            }
            if (copiar) {
                conf = uploadFileDirector(filePart, conf, "agropecuario");
            }
            filePart = request.getPart("fileFotoDirEstudios");
            switch (request.getParameter("txtValidacionFotoDirEstudios")) {
                case "SI":
                    copiar = true;
                    break;
                case "DEFECTO":
                    conf.setNombre_foto_director_area_estudios("default_director.png");
                    copiar = false;
                    break;
                default:
                    copiar = false;
                    conf.setNombre_foto_director_area_estudios(request.getParameter("txtNombreFotoDirEstudios"));
                    break;
            }
            if (copiar) {
                conf = uploadFileDirector(filePart, conf, "estudios");
            }
            LOG.info(conf.toString());
        } catch (IOException | ServletException e) {
            try {
                throw e;
            } catch (IOException | ServletException ex) {
                Logger.getLogger(PersonalizacionAPI.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return conf;
    }

    private Conf_Web uploadFile(Part filePart, Conf_Web conf_web, String campo) {
        String path = getServletContext().getRealPath("/peam_resources/logos_principales/");
        File file = new File(path + Paths.get(filePart.getSubmittedFileName()).getFileName().toString());
        if (file.exists()) {
            //file.delete();
            String prefijo = Utilities.getCadenaAleatoria("PROYECTOESPECIALALTOMAYO-PEAM", 5);
            file = new File(path + prefijo + Paths.get(filePart.getSubmittedFileName()).getFileName().toString());
        }
        switch (campo) {
            case "logo_peam":
                conf_web.setNombre_logo_peam(file.getName());
                break;
            case "logo_goresam":
                conf_web.setNombre_logo_goresam(file.getName());
                break;
            case "logo_portal":
                conf_web.setNombre_logo_portal(file.getName());
                break;
            case "logo_presentacion_actualidad":
                conf_web.setNombre_logo_presentacion_actualidad(file.getName());
                break;
        }
        try (InputStream input = filePart.getInputStream()) {
            Files.copy(input, file.toPath());
        } catch (IOException ex) {
            Logger.getLogger(PersonalizacionAPI.class.getName()).log(Level.SEVERE, null, ex);
        }
        return conf_web;
    }

    private Conf_Web uploadFileDirector(Part filePart, Conf_Web conf_web, String campo) {
        String path = getServletContext().getRealPath("/peam_resources/logos_complementos/lineas_accion/directores/");
        File file = new File(path + Paths.get(filePart.getSubmittedFileName()).getFileName().toString());
        if (file.exists()) {
            //file.delete();
            String prefijo = Utilities.getCadenaAleatoria("PROYECTOESPECIALALTOMAYO-PEAM", 5);
            file = new File(path + prefijo + Paths.get(filePart.getSubmittedFileName()).getFileName().toString());
        }
        switch (campo) {
            case "infraestructura":
                conf_web.setNombre_foto_director_infraestructura(file.getName());
                break;
            case "ambiental":
                conf_web.setNombre_foto_director_manejo_ambiental(file.getName());
                break;
            case "agropecuario":
                conf_web.setNombre_foto_director_desarrollo_agropecuario(file.getName());
                break;
            case "estudios":
                conf_web.setNombre_foto_director_area_estudios(file.getName());
                break;
        }
        try (InputStream input = filePart.getInputStream()) {
            Files.copy(input, file.toPath());
        } catch (IOException ex) {
            Logger.getLogger(PersonalizacionAPI.class.getName()).log(Level.SEVERE, null, ex);
        }
        return conf_web;
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

    private void procesarCorreo(BEAN_CRUD bean_crud, HttpServletResponse response) {
        try {
            this.jsonResponse = this.json.toJson(bean_crud);
            response.setContentType("application/json");
            response.getWriter().write(this.jsonResponse);
            LOG.info(this.jsonResponse);
        } catch (IOException ex) {
            Logger.getLogger(PersonalizacionAPI.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private HashMap<String, Object> getParametersCorreo(HttpServletRequest request) {
        this.parameters.clear();
        return this.parameters;
    }

    private Correo getCorreo(HttpServletRequest request) {
        Correo obj = new Correo();
        obj.setId(Integer.parseInt(request.getParameter("txtIdER")));
        obj.setPara_correo(request.getParameter("txtParaER"));
        obj.setParte_correo(request.getParameter("txtDeParteER"));
        obj.setCc_correo(request.getParameter("txtCC_CorreoER"));
        obj.setMensaje_correo(request.getParameter("txtMensajeER"));
        obj.setEstado(Boolean.parseBoolean(request.getParameter("comboEstadoER")));
        return obj;
    }
}
