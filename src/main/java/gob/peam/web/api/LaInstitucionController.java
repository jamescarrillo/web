/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gob.peam.web.api;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author James Carrillo
 */
@WebServlet(name = "LaInstitucionController",
        urlPatterns = {
            "/institucion/quienessomos",
            "/institucion/visionmision",
            "/institucion/objetivofunciones",
            "/institucion/etica",
            "/institucion/ubicacion",
            "/institucion/estructuraorganica",
            "/institucion/directorios"})
public class LaInstitucionController extends HttpServlet {

    /**
     * |
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
        //System.out.println("->  " + request.getRequestURI().substring(request.getContextPath().length()));
        //System.out.println("->  " + request.getRequestURI());
        //getServletContext().getContextPath() = web
        //sin el /web
        switch (request.getRequestURI().substring(request.getContextPath().length())) {
            case "/institucion/quienessomos":
                request.getRequestDispatcher("/jsp/web/institucion/quienessomos.jsp").forward(request, response);
                break;
            case "/institucion/visionmision":
                request.getRequestDispatcher("/jsp/web/institucion/visionmision.jsp").forward(request, response);
                break;
            case "/institucion/objetivofunciones":
                request.getRequestDispatcher("/jsp/web/institucion/objetivofunciones.jsp").forward(request, response);
                break;
            case "/institucion/etica":
                request.getRequestDispatcher("/jsp/web/institucion/codigoetica.jsp").forward(request, response);
                break;
            case "/institucion/ubicacion":
                request.getRequestDispatcher("/jsp/web/institucion/ubicacion.jsp").forward(request, response);
                break;
            case "/institucion/estructuraorganica":
                request.getRequestDispatcher("/jsp/web/institucion/estructuraorganica.jsp").forward(request, response);
                break;
            case "/institucion/directorios":
                String accion = request.getParameter("accion") == null ? "" : request.getParameter("accion");
                switch (accion) {
                    case "registrar_directorio":

                        break;
                    case "modificar_directorio":

                        break;
                    case "eliminar_directorio":

                        break;
                    default:
                        request.getRequestDispatcher("/jsp/web/institucion/directorios.jsp").forward(request, response);
                        break;
                }
                break;
            default:
                request.getRequestDispatcher("/jsp/web/institucion/quienessomos.jsp").forward(request, response);
                break;
        }
        //dp.forward(request, response);
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
