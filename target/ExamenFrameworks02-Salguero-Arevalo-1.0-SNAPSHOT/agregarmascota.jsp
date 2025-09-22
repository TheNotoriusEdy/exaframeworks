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
  <form class="formulario-mascota" action="mascotasController?accion=insertar" method="post" enctype="multipart/form-data">
          <h2>Registrar Mascota</h2>
          <div class="form-group">
            <label for="nombre">Nombre:</label>
            <input type="text" id="nombre" name="nombre" required>
          </div>
          <div class="form-group">
            <label for="tipo">Tipo:</label>
            
            <select id="tipo" name="id_tipo" required>
              <!-- Opciones se llenarán dinámicamente desde la BD -->
              <c:forEach var="tipo" items="${tipos}">
                <option value="${tipo.id_tipo}">${tipo.nombre}</option>
              </c:forEach>
            </select>
          </div>
          <div class="form-group">
            <label for="foto">Foto:</label>
            <input type="file" id="foto" name="foto" accept="image/*">
          </div>
          <button type="submit" class="btn-registrar">Registrar</button>
        </form>
        
    </body>
</html>
