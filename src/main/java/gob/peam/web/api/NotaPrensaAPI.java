/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gob.peam.web.api;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import gob.peam.web.dao.DestacadoDAO;
import gob.peam.web.dao.NotaPrensaDAO;
import gob.peam.web.dao.impl.DestacadoDAOImpl;
import gob.peam.web.dao.impl.NotaPrensaDAOImpl;
import gob.peam.web.model.Destacado;
import gob.peam.web.model.NotaPrensa;
import gob.peam.web.model.Persona;
import gob.peam.web.model.Usuario;
import gob.peam.web.utilities.BEAN_CRUD;
import gob.peam.web.utilities.Utilities;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
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

/**
 *
 * @author JhanxD
 */
@WebServlet(name = "NotaPrensaAPI", urlPatterns = {"/publicaciones/notasprensa"})
public class NotaPrensaAPI extends HttpServlet {

    @Resource(name = "jdbc/dbweb")
    private DataSource pool;
    private HttpSession session;
    private Gson json;
    private String jsonResponse;
    private HashMap<String, Object> parameters;
    private static final Logger LOG = Logger.getLogger(NotaPrensaAPI.class.getName());
    private String action;

    private NotaPrensaDAO notaPrensaDAO;
    private DestacadoDAO destacadoDAO;

    @Override
    public void init() throws ServletException {
        super.init(); // To change body of generated methods, choose Tools | Templates.
        this.json = new GsonBuilder().setDateFormat("dd/MM/yyyy").create();
        this.parameters = new HashMap<>();
        this.action = "";

        this.notaPrensaDAO = new NotaPrensaDAOImpl(this.pool);
        this.destacadoDAO = new DestacadoDAOImpl(this.pool);

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
            LOG.log(Level.INFO, "-->{0}", action);
            switch (this.action) {
                case "paginarNotaPrensa":
                    procesarNotaPrensa(new BEAN_CRUD(this.notaPrensaDAO.getPagination(getParametersNotasPrensa(request))), response);
                    break;
                case "addNotaPrensa":
                    procesarNotaPrensa(this.notaPrensaDAO.add(getNotaPrensa(request), getParametersNotasPrensa(request)), response);
                    break;
                case "updateNotaPrensa":
                    procesarNotaPrensa(this.notaPrensaDAO.update(getNotaPrensa(request), getParametersNotasPrensa(request)), response);
                    break;
                case "deleteNotaPrensa":
                    procesarNotaPrensa(this.notaPrensaDAO.delete(Long.parseLong(request.getParameter("txtIdNotaPrensaER")), getParametersNotasPrensa(request)), response);
                    break;
                case "activateNotaPrensa":
                    LOG.info(request.getParameter("txtEstadoNotaPrensaER"));
                    procesarNotaPrensa(this.notaPrensaDAO.cambiarEstado(Integer.parseInt(request.getParameter("txtIdNotaPrensaER")), Boolean.parseBoolean(request.getParameter("txtEstadoNotaPrensaER")), getParametersNotasPrensa(request)), response);
                    break;
                case "paginarDestacado":
                    procesarDestacados(new BEAN_CRUD(this.destacadoDAO.getPagination(getParametersDestacado(request))), response);
                    break;
                case "addDestacado":
                    procesarDestacados(this.destacadoDAO.add(getDestacado(request), getParametersDestacado(request)), response);
                    break;
                case "updateDestacado":
                    procesarDestacados(this.destacadoDAO.update(getDestacado(request), getParametersDestacado(request)), response);
                    break;
                case "deleteDestacado":
                    procesarDestacados(this.destacadoDAO.delete(Long.parseLong(request.getParameter("txtIdDestacadoER")), getParametersDestacado(request)), response);
                    break;
                case "activateDestacado":
                    LOG.info(request.getParameter("txtEstadoDestacadoER"));
                    procesarDestacados(this.destacadoDAO.cambiarEstado(Integer.parseInt(request.getParameter("txtIdDestacadoER")), Boolean.parseBoolean(request.getParameter("txtEstadoDestacadoER")), getParametersDestacado(request)), response);
                    break;
                default:
                    request.getRequestDispatcher("/jsp/gc/publicaciones/notaPrensa.jsp").forward(request, response);
                    break;
            }
        } catch (SQLException ex) {
            Logger.getLogger(NotaPrensaAPI.class.getName()).log(Level.SEVERE, null, ex);
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

    /*NOTAS DE PRENSA*/
    private void procesarNotaPrensa(BEAN_CRUD beanCrud, HttpServletResponse response) {
        try {
            this.jsonResponse = this.json.toJson(beanCrud);
            response.setContentType("application/json");
            response.getWriter().write(this.jsonResponse);
            LOG.info(this.jsonResponse);
        } catch (IOException ex) {
            Logger.getLogger(NotaPrensaAPI.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void procesarDestacados(BEAN_CRUD beanCrud, HttpServletResponse response) {
        try {
            this.jsonResponse = this.json.toJson(beanCrud);
            response.setContentType("application/json");
            response.getWriter().write(this.jsonResponse);
            LOG.info(this.jsonResponse);
        } catch (IOException ex) {
            Logger.getLogger(NotaPrensaAPI.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private HashMap getParametersNotasPrensa(HttpServletRequest request) {
        this.parameters.clear();
        this.parameters.put("FILTER", request.getParameter("txtTituloNotaPrensa").toLowerCase());
        if (request.getParameter("comboAnio").equals("-1")) {
            this.parameters.put("SQL_ANIO", "");
        } else {
            this.parameters.put("SQL_ANIO", "AND ANHO = '" + request.getParameter("comboAnio") + "' ");
        }
        if (request.getParameter("estadoNotaPrensa").equals("-1")) {
            this.parameters.put("SQL_ESTADO", "");
        } else {
            this.parameters.put("SQL_ESTADO", "AND ESTADO = " + request.getParameter("estadoNotaPrensa"));
        }
        this.parameters.put("SQL_ORDERS", "FECHA DESC");
        this.parameters.put("LIMIT",
                " LIMIT " + request.getParameter("sizePageNotaPrensa") + " OFFSET "
                + (Integer.parseInt(request.getParameter("numberPageNotaPrensa")) - 1)
                * Integer.parseInt(request.getParameter("sizePageNotaPrensa")));
        return this.parameters;
    }

    private HashMap getParametersDestacado(HttpServletRequest request) {
        this.parameters.clear();
        this.parameters.put("FILTER", request.getParameter("txtTituloDestacado").toLowerCase());
        if (request.getParameter("comboAnioDestacado").equals("-1")) {
            this.parameters.put("SQL_ANIO", "");
        } else {
            this.parameters.put("SQL_ANIO", "AND ANHO = '" + request.getParameter("comboAnioDestacado") + "' ");
        }
        if (request.getParameter("estadoDestacado").equals("-1")) {
            this.parameters.put("SQL_ESTADO", "");
        } else {
            this.parameters.put("SQL_ESTADO", "AND ESTADO = " + request.getParameter("estadoDestacado"));
        }
        this.parameters.put("SQL_ORDERS", "FECHA DESC");
        this.parameters.put("LIMIT",
                " LIMIT " + request.getParameter("sizePageDestacado") + " OFFSET "
                + (Integer.parseInt(request.getParameter("numberPageDestacado")) - 1)
                * Integer.parseInt(request.getParameter("sizePageDestacado")));
        return this.parameters;
    }

    private Destacado getDestacado(HttpServletRequest request) {
        Destacado destacado = new Destacado();
        Persona per = ((Usuario) this.session.getAttribute("user")).getPersona();
        if (request.getParameter("action").equals("updateDestacado")) {
            destacado.setId(Integer.parseInt(request.getParameter("txtIdDestacadoER")));
            destacado.setEditado_por(per);
        } else {
            destacado.setCreado_por(per);
            destacado.setEditado_por(per);
        }
        destacado.setAnho(request.getParameter("txtAnhoDestacadoER"));
        destacado.setFecha(Utilities.getDateSQLFORMAT(request.getParameter("datePickerFechaDestacadoER"), "dd/MM/yyyy"));
        destacado.setTitulo(request.getParameter("txtTituloDestacadoER"));
        destacado.setContenido(request.getParameter("txtContenidoDestacadoER"));
        destacado.setUrl(request.getParameter("txtUrlDestacadoER"));
        destacado.setFoto(request.getParameter("txtFotoDestacadoER"));
        destacado.setEstado(Boolean.parseBoolean(request.getParameter("txtEstadoDestacadoER")));

        return destacado;
    }

    private NotaPrensa getNotaPrensa(HttpServletRequest request) {
        NotaPrensa obj = new NotaPrensa();
        if (request.getParameter("action").equals("updateNotaPrensa")) {
            obj.setId(Integer.parseInt(request.getParameter("txtIdNotaPrensaER")));
            obj.setFecha_creacion(Utilities.getDateSQLFORMAT(request.getParameter("txtFechaCreacionER"), "dd/MM/yyyy"));
        }
        obj.setAnho(request.getParameter("txtAnhoNotaPrensaER"));
        obj.setEstado(Boolean.parseBoolean(request.getParameter("txtEstadoNotaPrensaER")));
        obj.setFecha(Utilities.getDateSQLFORMAT(request.getParameter("datePickerFechaER"), "dd/MM/yyyy"));
        obj.setTitulo(request.getParameter("txtTituloNotaPrensaER"));
        try {
            LOG.info(request.getParameter("txtContenidoNotaPrensaER"));
            LOG.info(URLDecoder.decode(request.getParameter("txtContenidoNotaPrensaER"), "UTF-8"));
            obj.setContenido(URLDecoder.decode(request.getParameter("txtContenidoNotaPrensaER"), "UTF-8"));
        } catch (UnsupportedEncodingException ex) {
            Logger.getLogger(NotaPrensaAPI.class.getName()).log(Level.SEVERE, null, ex);
        }
        obj.setFuente(request.getParameter("txtFuenteNotaPrensaER"));
        obj.setFoto(request.getParameter("txtFotoNotaPrensaER"));
        Persona per = ((Usuario) this.session.getAttribute("user")).getPersona();
        obj.setSubido_por(per);
        return obj;
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
