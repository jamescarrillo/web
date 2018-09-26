/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gob.peam.web.service.session;

import com.google.gson.Gson;
import gob.peam.web.dao.UsuarioDAO;
import gob.peam.web.model.Usuario;
import gob.peam.web.utilities.Encriptar;
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
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

/**
 *
 * @author James Carrillo
 */
@WebServlet(name = "SessionController", urlPatterns = {"/session"})
public class SessionController extends HttpServlet {

    @Resource(name = "jdbc/dbweb")
    private DataSource pool;

    private UsuarioDAO usuarioDAO;
    private Gson json;

    @Override
    public void init() throws ServletException {
        super.init(); //To change body of generated methods, choose Tools | Templates.
        usuarioDAO = new UsuarioDAO(pool);
        json = new Gson();
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
        HttpSession session = request.getSession();
        if (session.getAttribute("user") == null) {
            // si no hay sesiones iniciadas
            try {
                String login = request.getParameter("txtUsuario") == null ? "" : request.getParameter("txtUsuario");
                String pass = request.getParameter("txtPass") == null ? "" : request.getParameter("txtPass");
                String respuesta;
                Usuario usuario = usuarioDAO.getUserValidation(login);
                if (usuario != null) {
                    System.out.println("comparando " + usuario.getUsua_clave() + " con  "+ Encriptar.md5(Encriptar.md5(Encriptar.md5(pass))) + " viene : " + pass);
                    if (!usuario.isUsua_estado()) {
                        respuesta = "El Usuario ingresado no está habilitado";
                    } else if (usuario.getUsua_clave().equals(Encriptar.md5(Encriptar.md5(Encriptar.md5(pass))))) {
                        //MANDAMOS AL INDEX
                        respuesta = "CORRECTO";
                        session.setAttribute("user", usuario);
                    } else {
                        respuesta = "Contraseña incorrecta";
                    }
                } else {
                    respuesta = "El Usuario ingresado no existe";
                }
                HashMap<String, Object> JSONROOT = new HashMap<>();
                JSONROOT.put("AUTENTICACION", respuesta);
                String cadenajson = json.toJson(JSONROOT);
                response.setContentType("application/json");
                response.getWriter().write(cadenajson);
            } catch (SQLException ex) {
                Logger.getLogger(SessionController.class.getName()).log(Level.SEVERE, null, ex);
            } catch (Exception ex) {
                Logger.getLogger(SessionController.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            response.sendRedirect("indexgc");
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
