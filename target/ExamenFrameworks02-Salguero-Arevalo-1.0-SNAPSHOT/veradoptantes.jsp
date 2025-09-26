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
        <title>Adoptantes - Sistema de Mascotas</title>
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
                    <h2><i class="fas fa-users"></i> Adoptantes Registrados</h2>
                    <a class="btn btn-primary" href="adoptantesController?accion=agregar">
                        <i class="fas fa-user-plus"></i> Agregar Adoptante
                    </a>
                </div>
                
                <!-- Filtros de Búsqueda -->
                <div class="card mb-4">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-4">
                                <label for="filtroNombre" class="form-label">Buscar por Nombre:</label>
                                <input type="text" class="form-control" id="filtroNombre" placeholder="Nombre del adoptante...">
                            </div>
                            <div class="col-md-3">
                                <label for="filtroTelefono" class="form-label">Buscar por Teléfono:</label>
                                <input type="text" class="form-control" id="filtroTelefono" placeholder="Número de teléfono...">
                            </div>
                            <div class="col-md-3">
                                <label for="filtroMascota" class="form-label">Buscar por Mascota:</label>
                                <input type="text" class="form-control" id="filtroMascota" placeholder="Nombre o tipo de mascota...">
                            </div>
                            <div class="col-md-2 d-flex align-items-end">
                                <button type="button" class="btn btn-outline-secondary w-100" onclick="limpiarFiltros()">
                                    <i class="fas fa-eraser"></i> Limpiar
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="table-responsive">
                    <table class="table table-striped table-hover">
                        <thead class="table-dark">
                            <tr>
                                <th>ID</th>
                                <th>Adoptante</th>
                                <th>Teléfono</th>
                                <th>Mascota</th>
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
                                                <a class="btn btn-warning btn-sm me-1" href="adoptantesController?accion=editar&id=${adoptante.id_adoptante}">
                                                    <i class="fas fa-edit"></i> Editar
                                                </a>
                                                <a class="btn btn-danger btn-sm" href="adoptantesController?accion=eliminar&id=${adoptante.id_adoptante}" 
                                                   onclick="return confirm('¿Está seguro de eliminar este adoptante?')">
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
        // Función para filtrar la tabla de adoptantes
        function filtrarTabla() {
            const filtroNombre = document.getElementById('filtroNombre').value.toLowerCase();
            const filtroTelefono = document.getElementById('filtroTelefono').value.toLowerCase();
            const filtroMascota = document.getElementById('filtroMascota').value.toLowerCase();
            
            const filas = document.querySelectorAll('tbody tr');
            let filasVisibles = 0;
            
            filas.forEach(function(fila) {
                // Evitar procesar la fila de "no hay adoptantes"
                if (fila.children.length < 5) return;
                
                const nombre = fila.children[1].textContent.toLowerCase();
                const telefono = fila.children[2].textContent.toLowerCase();
                const mascota = fila.children[3].textContent.toLowerCase();
                
                const coincideNombre = filtroNombre === '' || nombre.includes(filtroNombre);
                const coincideTelefono = filtroTelefono === '' || telefono.includes(filtroTelefono);
                const coincideMascota = filtroMascota === '' || mascota.includes(filtroMascota);
                
                if (coincideNombre && coincideTelefono && coincideMascota) {
                    fila.style.display = '';
                    filasVisibles++;
                } else {
                    fila.style.display = 'none';
                }
            });
            
            // Mostrar mensaje si no hay resultados
            mostrarMensajeSinResultados(filasVisibles);
        }
        
        function mostrarMensajeSinResultados(filasVisibles) {
            let mensajeExistente = document.getElementById('mensaje-sin-resultados');
            
            if (filasVisibles === 0) {
                if (!mensajeExistente) {
                    const tbody = document.querySelector('tbody');
                    const fila = document.createElement('tr');
                    fila.id = 'mensaje-sin-resultados';
                    fila.innerHTML = '<td colspan="5" style="text-align:center; color:#888; padding:32px;"><i class="fas fa-search me-2"></i>No se encontraron adoptantes que coincidan con los filtros.</td>';
                    tbody.appendChild(fila);
                }
            } else {
                if (mensajeExistente) {
                    mensajeExistente.remove();
                }
            }
        }
        
        function limpiarFiltros() {
            document.getElementById('filtroNombre').value = '';
            document.getElementById('filtroTelefono').value = '';
            document.getElementById('filtroMascota').value = '';
            filtrarTabla();
        }
        
        // Agregar eventos de filtrado en tiempo real
        document.getElementById('filtroNombre').addEventListener('input', filtrarTabla);
        document.getElementById('filtroTelefono').addEventListener('input', filtrarTabla);
        document.getElementById('filtroMascota').addEventListener('input', filtrarTabla);
        
        // Mostrar contador de resultados al cargar la página
        window.addEventListener('DOMContentLoaded', function() {
            mostrarContadorTotal();
        });
        
        function mostrarContadorTotal() {
            const filas = document.querySelectorAll('tbody tr');
            let contador = 0;
            
            filas.forEach(function(fila) {
                // Contar solo las filas que no son el mensaje "No hay adoptantes"
                if (!fila.textContent.includes('No hay adoptantes registrados')) {
                    contador++;
                }
            });
            
            // Crear elemento contador si hay resultados
            if (contador > 0) {
                // Remover contador existente si existe
                const contadorExistente = document.getElementById('contador-adoptantes');
                if (contadorExistente) {
                    contadorExistente.remove();
                }
                
                const contadorDiv = document.createElement('div');
                contadorDiv.id = 'contador-adoptantes';
                contadorDiv.className = 'alert alert-info mb-3';
                contadorDiv.innerHTML = '<i class="fas fa-info-circle me-2"></i>Mostrando ' + contador + ' adoptante(s)';
                
                const tabla = document.querySelector('.table-responsive');
                tabla.parentNode.insertBefore(contadorDiv, tabla);
            }
        }
    </script>
    </body>
</html>

