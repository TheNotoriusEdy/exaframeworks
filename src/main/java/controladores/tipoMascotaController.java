/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controladores;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import modelos.tipomascota;
import modelosDAO.tiposDAO;

/**
 *
 * @author Xavier
 */
@WebServlet(name = "tipoMascotaController", urlPatterns = {"/tipomascotacontroller"})
public class tipoMascotaController extends HttpServlet {

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
            out.println("<title>Servlet tipoMascotaController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet tipoMascotaController at " + request.getContextPath() + "</h1>");
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
        
        if (accion == null || accion.equals("listar")) {
            listarTipos(request, response);
        } else if (accion.equals("nuevo")) {
            RequestDispatcher dispatcher = request.getRequestDispatcher("agregarTipos.jsp");
            dispatcher.forward(request, response);
        } else if (accion.equals("editar")) {
            editarTipo(request, response);
        } else if (accion.equals("eliminar")) {
            eliminarTipo(request, response);
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
        
        if (accion != null) {
            if (accion.equals("agregar")) {
                agregarTipo(request, response);
            } else if (accion.equals("actualizar")) {
                actualizarTipo(request, response);
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
    
    // Métodos auxiliares para operaciones CRUD
    private void listarTipos(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            tiposDAO dao = new tiposDAO();
            List<tipomascota> tipos = dao.listar();
            request.setAttribute("tipos", tipos);
            RequestDispatcher dispatcher = request.getRequestDispatcher("verTipos.jsp");
            dispatcher.forward(request, response);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }
    
    private void editarTipo(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            tiposDAO dao = new tiposDAO();
            tipomascota tipo = dao.listarId(id);
            request.setAttribute("tipo", tipo);
            RequestDispatcher dispatcher = request.getRequestDispatcher("editarTipos.jsp");
            dispatcher.forward(request, response);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }
    
    private void eliminarTipo(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            tiposDAO dao = new tiposDAO();
            dao.eliminar(id);
            response.sendRedirect("tipomascotacontroller?accion=listar");
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }
    
    private void agregarTipo(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String nombre = request.getParameter("nombre");
            String descripcion = request.getParameter("descripcion");
            
            tipomascota tipo = new tipomascota();
            tipo.setNombre(nombre);
            tipo.setDescripcion(descripcion);
            
            tiposDAO dao = new tiposDAO();
            dao.agregar(tipo);
            response.sendRedirect("tipomascotacontroller?accion=listar");
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }
    
    private void actualizarTipo(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            String nombre = request.getParameter("nombre");
            String descripcion = request.getParameter("descripcion");
            
            tipomascota tipo = new tipomascota();
            tipo.setId_tipo(id);
            tipo.setNombre(nombre);
            tipo.setDescripcion(descripcion);
            
            tiposDAO dao = new tiposDAO();
            dao.actualizar(tipo);
            response.sendRedirect("tipomascotacontroller?accion=listar");
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

}
