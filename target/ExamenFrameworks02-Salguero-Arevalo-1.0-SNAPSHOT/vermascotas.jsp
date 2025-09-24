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
        <title>Mascotas - Sistema de Mascotas</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
        <link rel="stylesheet" href="vermascotas.css"/>
    </head>
    <body>
        <%@ include file="header.jsp" %>
    <div class="container mt-4">
        <div class="row">
            <div class="col-12">
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <h2><i class="fas fa-dog"></i> Mascotas Registradas</h2>
                    <a class="btn btn-primary" href="mascotasController?accion=agregar">
                        <i class="fas fa-plus"></i> Agregar Mascota
                    </a>
                </div>
                
                <!-- Formulario de Búsqueda y Filtros -->
                <div class="card mb-4">
                    <div class="card-header">
                        <h5 class="mb-0">
                            <i class="fas fa-search"></i> Buscar y Filtrar Mascotas
                        </h5>
                    </div>
                    <div class="card-body">
                        <form method="get" action="mascotasController" id="formBusqueda">
                            <div class="row g-3">
                                <div class="col-md-4">
                                    <label for="busqueda" class="form-label">Buscar por nombre:</label>
                                    <input type="text" class="form-control" id="busqueda" name="busqueda" 
                                           value="${busquedaActual}" placeholder="Nombre de la mascota...">
                                </div>
                                <div class="col-md-4">
                                    <label for="tipoFiltro" class="form-label">Filtrar por tipo:</label>
                                    <select class="form-select" id="tipoFiltro" name="tipoFiltro">
                                        <option value="0">Todos los tipos</option>
                                        <c:forEach var="tipo" items="${tipos}">
                                            <option value="${tipo.id_tipo}" 
                                                    <c:if test="${tipoFiltroActual != null && tipoFiltroActual == tipo.id_tipo}">selected</c:if>>
                                                ${tipo.nombre}
                                            </option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="col-md-4 d-flex align-items-end">
                                    <div class="btn-group w-100" role="group">
                                        <button type="submit" class="btn btn-outline-primary">
                                            <i class="fas fa-search"></i> Buscar
                                        </button>
                                        <button type="button" class="btn btn-outline-secondary" onclick="limpiarFiltros()">
                                            <i class="fas fa-times"></i> Limpiar
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="table-responsive">
                    <table class="table table-striped table-hover">
                        <thead class="table-dark">
                            <tr>
                                <th>Foto</th>
                                <th>ID</th> 
                                <th>Nombre</th>
                                <th>Tipo</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
        <tbody>
          <c:choose>
            <c:when test="${empty mascotas}">
              <tr>
                <td colspan="5" style="text-align:center; color:#888; padding:32px;">No hay mascotas registradas.</td>
              </tr>
            </c:when>
            <c:otherwise>
              <c:forEach var="mascota" items="${mascotas}">
                <tr>
                  <td><img src="${mascota.foto}" alt="Foto Mascota" class="mascota-foto-tabla"></td>
                  <td>${mascota.id_mascota}</td>
                  <td>${mascota.nombre}</td>
                  <td>
                    <c:choose>
                      <c:when test="${not empty mascota.tipoNombre}">
                        ${mascota.tipoNombre}
                      </c:when>
                      <c:otherwise>
                        <span style="color: #888; font-style: italic;">Tipo no definido</span>
                      </c:otherwise>
                    </c:choose>
                  </td>
                  <td>
                    <a class="btn btn-warning btn-sm me-1" href="mascotasController?accion=editar&id=${mascota.id_mascota}">
                        <i class="fas fa-edit"></i> Editar
                    </a>
                    <a class="btn btn-danger btn-sm" href="mascotasController?accion=eliminar&id=${mascota.id_mascota}" 
                       onclick="return confirm('¿Está seguro de eliminar esta mascota?')">
                        <i class="fas fa-trash"></i> Eliminar
                    </a>
                  </td>
                </tr>
              </c:forEach>
            </c:otherwise>
          </c:choose>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    
    <script>
        // Función para limpiar filtros
        function limpiarFiltros() {
            document.getElementById('busqueda').value = '';
            document.getElementById('tipoFiltro').value = '0';
            // Enviar formulario automáticamente después de limpiar
            document.getElementById('formBusqueda').submit();
        }
        
        // Búsqueda en tiempo real (opcional)
        let timeoutId;
        document.getElementById('busqueda').addEventListener('input', function() {
            clearTimeout(timeoutId);
            timeoutId = setTimeout(function() {
                // Comentado para evitar demasiadas consultas
                // document.getElementById('formBusqueda').submit();
            }, 500);
        });
        
        // Filtro automático al cambiar tipo
        document.getElementById('tipoFiltro').addEventListener('change', function() {
            document.getElementById('formBusqueda').submit();
        });
        
        // Mostrar contador de resultados
        window.addEventListener('DOMContentLoaded', function() {
            const filas = document.querySelectorAll('tbody tr');
            let contador = 0;
            
            filas.forEach(function(fila) {
                // Contar solo las filas que no son el mensaje "No hay mascotas"
                if (!fila.textContent.includes('No hay mascotas registradas')) {
                    contador++;
                }
            });
            
            // Crear elemento contador si hay resultados
            if (contador > 0) {
                const contadorDiv = document.createElement('div');
                contadorDiv.className = 'alert alert-info mb-3';
                contadorDiv.innerHTML = '<i class="fas fa-info-circle me-2"></i>Mostrando ' + contador + ' mascota(s)';
                
                const tabla = document.querySelector('.table-responsive');
                tabla.parentNode.insertBefore(contadorDiv, tabla);
            }
        });
    </script>
    </body>
</html>
