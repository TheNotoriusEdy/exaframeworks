<%-- 
    Document   : verTipos
    Created on : 23 sep. 2025, 20:48:42
    Author     : Xavier
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tipos de Mascotas - Sistema de Mascotas</title>
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
                        <h2><i class="fas fa-tags"></i> Tipos de Mascotas</h2>
                        <a href="tipomascotacontroller?accion=nuevo" class="btn btn-primary">
                            <i class="fas fa-plus"></i> Agregar Nuevo Tipo
                        </a>
                    </div>
                    
                    <div class="table-responsive">
                        <table class="table table-striped table-hover">
                            <thead class="table-dark">
                                <tr>
                                    <th>ID</th>
                                    <th>Nombre</th>
                                    <th>Descripción</th>
                                    <th>Acciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="tipo" items="${tipos}">
                                    <tr>
                                        <td>${tipo.id_tipo}</td>
                                        <td>${tipo.nombre}</td>
                                        <td>${tipo.descripcion}</td>
                                        <td>
                                            <a href="tipomascotacontroller?accion=editar&id=${tipo.id_tipo}" 
                                               class="btn btn-warning btn-sm me-1">
                                                <i class="fas fa-edit"></i> Editar
                                            </a>
                                            <a href="tipomascotacontroller?accion=eliminar&id=${tipo.id_tipo}" 
                                               class="btn btn-danger btn-sm"
                                               onclick="return confirm('¿Está seguro de eliminar este tipo de mascota?')">
                                                <i class="fas fa-trash"></i> Eliminar
                                            </a>
                                        </td>
                                    </tr>
                                </c:forEach>
                                <c:if test="${empty tipos}">
                                    <tr>
                                        <td colspan="4" style="text-align:center; color:#888; padding:32px;">
                                            No hay tipos de mascotas registrados.
                                        </td>
                                    </tr>
                                </c:if>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
