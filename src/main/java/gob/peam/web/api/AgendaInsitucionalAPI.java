/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gob.peam.web.api;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import gob.peam.web.dao.impl.DirectivoDAOImpl;
import gob.peam.web.dao.impl.FuncionarioDAOImpl;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 *
 * @author JamesCarrillo
 */
@WebServlet(name = "AgendaInsitucionalAPI", urlPatterns = {
    "/agendainstitucional/agendagerencial",
    "/agendainstitucional/directordesarrollo",
    "/agendainstitucional/directorinfraestructura",
    "/agendainstitucional/directormanejoambiental"
})
public class AgendaInsitucionalAPI extends HttpServlet {

    @Resource(name = "jdbc/dbweb")
    private DataSource pool;
    private HttpSession session;
    private Gson json;
    private String jsonResponse;
    private HashMap<String, Object> parameters;
    private HashMap<String, Object> jsonROOT;
    private final Log logger = LogFactory.getLog(GestionTransparenteAPI.class);

    private String action;

    @Override
    public void init() throws ServletException {
        super.init(); // To change body of generated methods, choose Tools | Templates.
        //this.json = new GsonBuilder().setDateFormat("dd/MM/yyyy HH:mm:ss").create();
        this.json = new GsonBuilder().setDateFormat("dd/MM/yyyy").create();
        this.parameters = new HashMap<>();
        this.jsonROOT = new HashMap<>();
        this.action = "";
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
        switch (request.getRequestURI().substring(request.getContextPath().length())) {
            case "/agendainstitucional/agendagerencial":
                request.getRequestDispatcher("/jsp/gc/agenda_institucional/agendainstitucional.jsp").forward(request, response);
                break;
            case "/agendainstitucional/directordesarrollo":
                request.getRequestDispatcher("/jsp/gc/agenda_institucional/agendainstitucional.jsp").forward(request, response);
                break;
            case "/agendainstitucional/directorinfraestructura":
                request.getRequestDispatcher("/jsp/gc/agenda_institucional/agendainstitucional.jsp").forward(request, response);
                break;
            case "/agendainstitucional/directormanejoambiental":
                request.getRequestDispatcher("/jsp/gc/agenda_institucional/agendainstitucional.jsp").forward(request, response);
                break;
            default:
                break;
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

}
