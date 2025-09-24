<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Mascota</title>
        <link rel="stylesheet" href="vermascotas.css"/>
    </head>
    <body>
        <form class="formulario-mascota" action="mascotasController?accion=actualizar" method="post">
            <h2>Editar Mascota</h2>
            
            <!-- Campo oculto para el ID de la mascota -->
            <input type="hidden" name="id_mascota" value="${mascota.id_mascota}">
            
            <div class="form-group">
                <label for="nombre">Nombre:</label>
                <input type="text" id="nombre" name="nombre" value="${mascota.nombre}" required>
            </div>
            
            <div class="form-group">
                <label for="tipo">Tipo:</label>
                <select id="tipo" name="id_tipo" required>
                    <option value="">Selecciona un tipo</option>
                    <c:forEach var="tipo" items="${tipos}">
                        <option value="${tipo.id_tipo}" 
                                <c:if test="${tipo.id_tipo == mascota.id_tipo}">selected</c:if>>
                            ${tipo.nombre}
                        </option>
                    </c:forEach>
                </select>
            </div>
            
            <div class="form-group">
                <label for="foto">URL de la Foto:</label>
                <input type="url" id="foto" name="foto" value="${mascota.foto}" 
                       placeholder="https://ejemplo.com/imagen.jpg">
            </div>
            
            <div class="form-buttons">
                <a href="mascotasController" class="btn-cancelar">Cancelar</a>
                <button type="submit" class="btn-registrar">Actualizar</button>
            </div>
        </form>
        
    </body>
</html>