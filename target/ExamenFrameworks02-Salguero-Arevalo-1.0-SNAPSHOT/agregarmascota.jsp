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
  <form class="formulario-mascota" action="mascotasController?accion=insertar" method="post">
          <h2>Registrar Mascota</h2>
          <div class="form-group">
            <label for="nombre">Nombre:</label>
            <input type="text" id="nombre" name="nombre" required>
          </div>
          <div class="form-group">
            <label for="tipo">Tipo:</label>
            
            <select id="tipo" name="id_tipo" required>
              <option value="">Selecciona un tipo</option>
              <!-- Opciones se llenarán dinámicamente desde la BD -->
              <c:forEach var="tipo" items="${tipos}">
                <option value="${tipo.id_tipo}">${tipo.nombre}</option>
              </c:forEach>
            </select>
          </div>
          <div class="form-group">
            <label for="foto">URL de la Foto:</label>
            <input type="url" id="foto" name="foto" placeholder="https://ejemplo.com/imagen.jpg">
          </div>
          <div class="form-buttons">
            <a href="mascotasController" class="btn-cancelar">Cancelar</a>
            <button type="submit" class="btn-registrar">Registrar</button>
          </div>
        </form>
        
    </body>
</html>
