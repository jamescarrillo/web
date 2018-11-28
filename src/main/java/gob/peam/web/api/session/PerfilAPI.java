/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gob.peam.web.api.session;

import com.google.gson.Gson;
import gob.peam.web.dao.impl.UsuarioDAOImpl;
import gob.peam.web.model.Usuario;
import gob.peam.web.utilities.Encriptar;
import java.io.IOException;
import java.io.PrintWriter;
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
 * @author JamesCarrillo
 */
@WebServlet(name = "PerfilAPI", urlPatterns = {"/perfil"})
public class PerfilAPI extends HttpServlet {

    private static final Logger LOG = Logger.getLogger(PerfilAPI.class.getName());
    @Resource(name = "jdbc/dbweb")
    private DataSource pool;
    private HttpSession session;
    private Gson json;
    private String action;
    private UsuarioDAOImpl usuarioDAO;
    private HashMap<String, Object> jsonROOT;

    @Override
    public void init() throws ServletException {
        super.init(); //To change body of generated methods, choose Tools | Templates.
        this.usuarioDAO = new UsuarioDAOImpl(pool);
        this.json = new Gson();
        this.jsonROOT = new HashMap<>();
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
            switch (this.action) {
                case "updateUsuario":
                    Usuario usuario = new Usuario();
                    usuario.setUsua_id(Integer.parseInt(request.getParameter("txtIdUsuarioER")));
                    usuario.setUsua_login(request.getParameter("txtLoginER"));
                    usuario.setUsua_clave(Encriptar.md5(Encriptar.md5(Encriptar.md5(request.getParameter("txtPassER")))));
                    LOG.info(usuario.toString());
                    String res = this.usuarioDAO.updateUser(usuario);
                    this.jsonROOT.put("MESSAGE_SERVER", res);
                    String jsonResponse = this.json.toJson(jsonROOT);
                    LOG.info(jsonResponse);
                    response.setContentType("application/json");
                    response.getWriter().write(jsonResponse);
                    break;
                default:
                    request.getRequestDispatcher("perfil.jsp").forward(request, response);
                    break;
            }
        } catch (Exception ex) {
            Logger.getLogger(PerfilAPI.class.getName()).log(Level.SEVERE, null, ex);
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
            response.sendRedirect("login");
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
            response.sendRedirect("login");
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

}
