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
            logger.info("-> " + request.getRequestURI().substring(request.getContextPath().length()));
            switch (request.getRequestURI().substring(request.getContextPath().length())) {
                case "/gestiontransparente/adquisiciones":
                    request.getRequestDispatcher("/estamos_trabajando.jsp").forward(request, response);
                    break;
                case "/gestiontransparente/gestiondocumentos":

                    break;
                case "/gestiontransparente/personal":
                    request.getRequestDispatcher("/estamos_trabajando.jsp").forward(request, response);
                    break;
                case "/gestiontransparente/directivos":
                    action = request.getParameter("action") == null ? "" : request.getParameter("action");
                    logger.info("--jcc-->" + action);
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
                    request.getRequestDispatcher("/estamos_trabajando.jsp").forward(request, response);
                    break;
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

}
