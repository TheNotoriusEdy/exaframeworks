/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controladores;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import modelosDAO.adoptantesDAO;

/**
 *
 * @author loled
 */
@WebServlet(name = "AdoptantesController", urlPatterns = {"/adoptantesController"})
public class adoptantesController extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet adoptantesController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet adoptantesController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        String accion = request.getParameter("accion");
        try {
            adoptantesDAO aDAO = new adoptantesDAO();
            if ("editar".equals(accion)) {
                int id = Integer.parseInt(request.getParameter("id"));
                request.setAttribute("adoptante", aDAO.getAdoptanteById(id));
                request.getRequestDispatcher("editaradoptante.jsp").forward(request, response);
            } else if ("eliminar".equals(accion)) {
                int id = Integer.parseInt(request.getParameter("id"));
                aDAO.eliminar(id);
                response.sendRedirect("veradoptantes.jsp");
            }
            else if ("agregar".equals(accion)) {
                modelosDAO.mascotasDAO mDAO = new modelosDAO.mascotasDAO();
                java.util.List<modelos.mascotas> mascotas = mDAO.listar();
                request.setAttribute("mascotas", mascotas);
                request.getRequestDispatcher("agregaradoptante.jsp").forward(request, response);
            }
            else {
                java.util.List<modelos.adoptantes> adoptantes = aDAO.listar();
                request.setAttribute("adoptantes", adoptantes);
                request.getRequestDispatcher("veradoptantes.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("veradoptantes.jsp");
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
        String accion = request.getParameter("accion");
        try {
            adoptantesDAO aDAO = new adoptantesDAO();
            if ("insertar".equals(accion)) {
                String nombre = request.getParameter("nombre");
                String telefono = request.getParameter("telefono");
                int id_mascota = Integer.parseInt(request.getParameter("id_mascota"));
                modelos.adoptantes a = new modelos.adoptantes();
                a.setNombre(nombre);
                a.setTelefono(telefono);
                a.setId_mascota(id_mascota);
                aDAO.insertar(a);
                response.sendRedirect("veradoptantes.jsp");
            } else if ("actualizar".equals(accion)) {
                int id_adoptante = Integer.parseInt(request.getParameter("id_adoptante"));
                String nombre = request.getParameter("nombre");
                String telefono = request.getParameter("telefono");
                int id_mascota = Integer.parseInt(request.getParameter("id_mascota"));
                modelos.adoptantes a = new modelos.adoptantes();
                a.setId_adoptante(id_adoptante);
                a.setNombre(nombre);
                a.setTelefono(telefono);
                a.setId_mascota(id_mascota);
                aDAO.actualizar(a);
                response.sendRedirect("veradoptantes.jsp");
            } else {
                response.sendRedirect("veradoptantes.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("veradoptantes.jsp");
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
