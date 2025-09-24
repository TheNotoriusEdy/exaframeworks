<%-- 
    Document   : veradoptantes
    Created on : 23    </body>
</html>10 p. m.
    Author     : loled
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ver Adoptantes</title>
        <link rel="stylesheet" href="vermascotas.css"/>
    </head>
    <body>
    <div class="mascotas-lista">
      <h2>Adoptantes Registrados</h2>
      <a class="btn-agregar" href="adoptantesController?accion=agregar" style="margin-bottom:18px;">Agregar Adoptante</a>
      <table class="tabla-mascotas">
        <thead>
          <tr>
            <th>ID</th>
            <th>Nombre</th>
            <th>Teléfono</th>
            <th>ID Mascota</th>
            <th>Acciones</th>
          </tr>
        </thead>
        <tbody>
          <c:choose>
            <c:when test="${empty adoptantes}">
              <tr>
                <td colspan="5" style="text-align:center; color:#888; padding:32px;">No hay adoptantes registrados.</td>
              </tr>
            </c:when>
            <c:otherwise>
              <c:forEach var="adoptante" items="${adoptantes}">
                <tr>
                  <td>${adoptante.id_adoptante}</td>
                  <td>${adoptante.nombre}</td>
                  <td>${adoptante.telefono}</td>
                  <td>${adoptante.id_mascota}</td>
                  <td>
                    <a class="btn-editar" href="adoptantesController?accion=editar&id=${adoptante.id_adoptante}">Editar</a>
                    <a class="btn-eliminar" href="adoptantesController?accion=eliminar&id=${adoptante.id_adoptante}">Eliminar</a>
                  </td>
                </tr>
              </c:forEach>
            </c:otherwise>
          </c:choose>
        </tbody>
      </table>
    </div>

    </body>
</html>

