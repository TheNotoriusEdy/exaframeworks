<%-- 
    Document   : editarTipos
    Created on : 23 sep. 2025, 20:53:14
    Author     : Xavier
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Tipo de Mascota</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <%@ include file="header.jsp" %>
        <div class="container mt-4">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-header">
                            <h4 class="mb-0">Editar Tipo de Mascota</h4>
                        </div>
                        <div class="card-body">
                            <form method="post" action="tipomascotacontroller">
                                <input type="hidden" name="accion" value="actualizar">
                                <input type="hidden" name="id" value="${tipo.id_tipo}">
                                
                                <div class="mb-3">
                                    <label for="nombre" class="form-label">Nombre del Tipo</label>
                                    <input type="text" class="form-control" id="nombre" name="nombre" 
                                           value="${tipo.nombre}" required maxlength="50" 
                                           placeholder="Ej: Perro, Gato, Ave">
                                </div>
                                
                                <div class="mb-3">
                                    <label for="descripcion" class="form-label">Descripción</label>
                                    <textarea class="form-control" id="descripcion" name="descripcion" 
                                              rows="3" maxlength="255" 
                                              placeholder="Descripción del tipo de mascota">${tipo.descripcion}</textarea>
                                </div>
                                
                                <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                                    <a href="tipomascotacontroller?accion=listar" class="btn btn-secondary me-md-2">
                                        <i class="fas fa-arrow-left"></i> Volver
                                    </a>
                                    <button type="submit" class="btn btn-warning">
                                        <i class="fas fa-save"></i> Actualizar
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/js/all.min.js"></script>
    </body>
</html>
