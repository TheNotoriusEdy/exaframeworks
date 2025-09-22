<%-- 
    Document   : vermascotas
    Created on : 19 sept 2025, 9:58:41 a. m.
    Author     : loled
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="vermascotas.css"/>
    </head>
    <body>
    <div class="mascotas-lista">
      <h2>Mascotas Registradas</h2>
      <a class="btn-agregar" href="mascotasController?accion=agregar" style="margin-bottom:18px;">Agregar Mascota</a>
      <table class="tabla-mascotas">
        <thead>
          <tr>
            <th>Foto</th>
            <th>ID</th> 
            <th>Nombre</th>
            <th>Tipo</th>
            <th>Descripción</th>
            <th>Acciones</th>
          </tr>
        </thead>
        <tbody>
          <c:choose>
            <c:when test="${empty mascotas}">
              <tr>
                <td colspan="6" style="text-align:center; color:#888; padding:32px;">No hay mascotas registradas.</td>
              </tr>
            </c:when>
            <c:otherwise>
              <c:forEach var="mascota" items="${mascotas}">
                <tr>
                  <td><img src="${mascota.foto}" alt="Foto Mascota" class="mascota-foto-tabla"></td>
                  <td>${mascota.id_mascota}</td>
                  <td>${mascota.nombre}</td>
                  <td>${mascota.id_tipo}</td>
                  <td>${mascota.descripcion}</td>
                  <td>
                    <a class="btn-editar" href="mascotasController?accion=editar&id=${mascota.id_mascota}">Editar</a>
                    <a class="btn-eliminar" href="mascotasController?accion=eliminar&id=${mascota.id_mascota}">Eliminar</a>
                    <br style="margin-bottom: 18px;"/>
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
