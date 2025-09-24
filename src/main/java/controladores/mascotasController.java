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
import modelosDAO.mascotasDAO;

/**
 *
 * @author loled
 */
@WebServlet(name = "MascotasController", urlPatterns = {"/mascotasController"})
public class mascotasController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods. kaka adhdadhkjashkjahdkjahdkahskdasi
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
            out.println("<title>Servlet mascotasController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet mascotasController at " + request.getContextPath() + "</h1>");
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
                mascotasDAO mDAO = new mascotasDAO();
                if ("editar".equals(accion)) {
                    int id = Integer.parseInt(request.getParameter("id"));
                    modelos.mascotas mascota = mDAO.getMascotaById(id);
                    request.setAttribute("mascota", mascota);
                    
                    // Cargar tipos de mascotas para el select
                    modelosDAO.tiposDAO tDAO = new modelosDAO.tiposDAO();
                    java.util.List<modelos.tipomascota> tipos = tDAO.listar();
                    request.setAttribute("tipos", tipos);
                    
                    request.getRequestDispatcher("editarmascota.jsp").forward(request, response);
                } else if ("eliminar".equals(accion)) {
                    int id = Integer.parseInt(request.getParameter("id"));
                    mDAO.eliminar(id);
                    response.sendRedirect("mascotasController");
                }
                else if ("agregar".equals(accion)) {
                    modelosDAO.tiposDAO tDAO = new modelosDAO.tiposDAO();
                    java.util.List<modelos.tipomascota> tipos = tDAO.listar();
                    request.setAttribute("tipos", tipos);
                    request.getRequestDispatcher("agregarmascota.jsp").forward(request, response);
                }
                else {
                    // Obtener parámetros de búsqueda y filtros
                    String nombreBusqueda = request.getParameter("busqueda");
                    String tipoFiltroStr = request.getParameter("tipoFiltro");
                    Integer tipoFiltro = null;
                    
                    if (tipoFiltroStr != null && !tipoFiltroStr.trim().isEmpty() && !tipoFiltroStr.equals("0")) {
                        try {
                            tipoFiltro = Integer.parseInt(tipoFiltroStr);
                        } catch (NumberFormatException e) {
                            // Ignorar error de conversión
                        }
                    }
                    
                    java.util.List<modelos.mascotas> mascotas;
                    
                    // Si hay filtros, usar búsqueda con filtros, sino usar listado normal
                    if ((nombreBusqueda != null && !nombreBusqueda.trim().isEmpty()) || tipoFiltro != null) {
                        mascotas = mDAO.buscarConFiltros(nombreBusqueda, tipoFiltro);
                    } else {
                        mascotas = mDAO.listar();
                    }
                    
                    // Cargar tipos para el filtro
                    modelosDAO.tiposDAO tDAO = new modelosDAO.tiposDAO();
                    java.util.List<modelos.tipomascota> tipos = tDAO.listar();
                    
                    request.setAttribute("mascotas", mascotas);
                    request.setAttribute("tipos", tipos);
                    request.setAttribute("busquedaActual", nombreBusqueda);
                    request.setAttribute("tipoFiltroActual", tipoFiltro);
                    request.getRequestDispatcher("vermascotas.jsp").forward(request, response);
                }
            } catch (Exception e) {
                e.printStackTrace();
                response.sendRedirect("mascotasController");
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
            mascotasDAO mDAO = new mascotasDAO();
            if ("insertar".equals(accion)) {
                String nombre = request.getParameter("nombre");
                int id_tipo = Integer.parseInt(request.getParameter("id_tipo"));
                String foto = request.getParameter("foto");
                modelos.mascotas m = new modelos.mascotas();
                m.setNombre(nombre);
                m.setId_tipo(id_tipo);
                m.setFoto(foto);
                mDAO.insertar(m);
                response.sendRedirect("mascotasController");
            } else if ("actualizar".equals(accion)) {
                int id_mascota = Integer.parseInt(request.getParameter("id_mascota"));
                String nombre = request.getParameter("nombre");
                int id_tipo = Integer.parseInt(request.getParameter("id_tipo"));
                String foto = request.getParameter("foto");
                modelos.mascotas m = new modelos.mascotas();
                m.setId_mascota(id_mascota);
                m.setNombre(nombre);
                m.setId_tipo(id_tipo);
                m.setFoto(foto);
                mDAO.actualizar(m);
                response.sendRedirect("mascotasController");
            } else {
                response.sendRedirect("mascotasController");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("mascotasController");
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
