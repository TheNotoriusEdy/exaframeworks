<%-- 
    Document   : agregaradoptante
    Created on : 23 sept 2025, 9:43:42 p. m.
    Author     : loled
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar Adoptante</title>
        <link rel="stylesheet" href="vermascotas.css"/>
    </head>
    <body>
        <form class="formulario-mascota" action="adoptantesController?accion=insertar" method="post">
          <h2>Registrar Adoptante</h2>
          <div class="form-group">
            <label for="nombre">Nombre:</label>
            <input type="text" id="nombre" name="nombre" required>
          </div>
          <div class="form-group">
            <label for="telefono">Teléfono:</label>
            <input type="tel" id="telefono" name="telefono" required>
          </div>
          <div class="form-group">
            <label for="id_mascota">Mascota:</label>
            <select id="id_mascota" name="id_mascota" required>
              <option value="">Selecciona una mascota</option>
              <c:forEach var="mascota" items="${mascotas}">
                <option value="${mascota.id_mascota}">${mascota.nombre} (ID: ${mascota.id_mascota})</option>
              </c:forEach>
            </select>
          </div>
          <button type="submit" class="btn-registrar">Registrar</button>
        </form>
        
    </body>
</html>
