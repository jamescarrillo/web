/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gob.peam.web.api;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 *
 * @author JamesCarrillo
 */
@WebServlet(name = "DownloadFileAPI", urlPatterns = {"/downloadfile"})
public class DownloadFileAPI extends HttpServlet {

    private HttpSession session;
    private final Log logger = LogFactory.getLog(DownloadFileAPI.class);
    private String type_file;

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
        this.type_file = request.getParameter("type_file") == null ? "" : request.getParameter("type_file");
        switch (this.type_file) {
            case "cvs":
                download(response, request.getParameter("file"), getServletContext().getRealPath("/peam_resources_app/cvs/"));
                break;
            default:
                response.sendRedirect("403.jsp");
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

    private void download(HttpServletResponse response, String file, String path) throws IOException {
        try (PrintWriter out = response.getWriter()) {
            //String file = "ava_sisbu.png";
            //String path = getServletContext().getRealPath("/img/");
            response.setContentType("APPLICATION/OCTET-STREAM");
            response.setHeader("Content-Disposition", "attachment; filename=\""
                    + file + "\"");
            try (FileInputStream fileInputStream = new FileInputStream(path + file)) {
                int i;
                while ((i = fileInputStream.read()) != -1) {
                    out.write(i);
                }
            }
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
