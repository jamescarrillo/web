/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gob.peam.web.service;

import com.google.gson.Gson;
import gob.peam.web.dao.DirectivoDAO;
import gob.peam.web.dao.FuncionarioDAO;
import java.io.IOException;
import java.util.HashMap;
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
@WebServlet(name = "GestionTransparenteController",
        urlPatterns = {
            "/gestiontransparente/actasconciliacion",
            "/gestiontransparente/actassesion",
            "/gestiontransparente/adquisiciones",
            "/gestiontransparente/declaracionjurada",
            "/gestiontransparente/evaluacionactualizacion",
            "/gestiontransparente/gestiondocumentos",
            "/gestiontransparente/indicadoresdesempenio",
            "/gestiontransparente/itp",
            "/gestiontransparente/laudos",
            "/gestiontransparente/modificatoriaspac",
            "/gestiontransparente/personal",
            "/gestiontransparente/directivos",
            "/gestiontransparente/proyectosinversion",
            "/gestiontransparente/recomendacionesauditorias",
            "/gestiontransparente/viaticos"
        })
public class GestionTransparenteController extends HttpServlet {

    @Resource(name = "jdbc/dbweb")
    private DataSource pool;
    private HttpSession session;
    private Gson json;
    private HashMap<String, Object> parametros;

    private String action;
    private DirectivoDAO directivoDAO;
    private FuncionarioDAO funcionarioDAO;

    @Override
    public void init() throws ServletException {
        super.init(); //To change body of generated methods, choose Tools | Templates.
        this.json = new Gson();
        this.parametros = new HashMap<>();
        
        this.action = "";
        this.directivoDAO = new DirectivoDAO();
        this.funcionarioDAO = new FuncionarioDAO();
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
            case "/gestiontransparente/actasconciliacion":
                break;
            case "/gestiontransparente/actassesion":
                break;
            case "/gestiontransparente/adquisiciones":
                break;
            case "/gestiontransparente/declaracionjurada":
                break;
            case "/gestiontransparente/evaluacionactualizacion":
                break;
            case "/gestiontransparente/gestiondocumentos":
                break;
            case "/gestiontransparente/indicadoresdesempenio":
                break;
            case "/gestiontransparente/itp":
                break;
            case "/gestiontransparente/laudos":
                break;
            case "/gestiontransparente/modificatoriaspac":
                break;
            case "/gestiontransparente/personal":
                break;
            case "/gestiontransparente/directivos":
                action = request.getParameter("action") == null ? "" : request.getParameter("action");
                switch (action) {
                    case "paginar":
                        break;
                    case "add":
                        break;
                    case "update":
                        break;
                    case "delete":
                        break;
                    default:
                        request.getRequestDispatcher("/jsp/gc/gestion_transparente/directivos.jsp").forward(request, response);
                        break;
                }
                break;
            case "/gestiontransparente/proyectosinversion":
                break;
            case "/gestiontransparente/recomendacionesauditorias":
                break;
            case "/gestiontransparente/viaticos":
                break;
            default:
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
