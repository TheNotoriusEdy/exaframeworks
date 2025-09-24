<%-- 
    Document   : agregarTipos
    Created on : 23 sep. 2025, 20:48:58
    Author     : Xavier
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar Tipo de Mascota - Sistema de Mascotas</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
        <link rel="stylesheet" href="vermascotas.css"/>
    </head>
    <body>
        <%@ include file="header.jsp" %>
        <div class="container mt-4">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-header">
                            <h4 class="mb-0"><i class="fas fa-plus"></i> Agregar Nuevo Tipo de Mascota</h4>
                        </div>
                        <div class="card-body">
                            <form method="post" action="tipomascotacontroller">
                                <input type="hidden" name="accion" value="agregar">
                                
                                <div class="mb-3">
                                    <label for="nombre" class="form-label">Nombre del Tipo</label>
                                    <input type="text" class="form-control" id="nombre" name="nombre" 
                                           required maxlength="50" placeholder="Ej: Perro, Gato, Ave">
                                </div>
                                
                                <div class="mb-3">
                                    <label for="descripcion" class="form-label">Descripción</label>
                                    <textarea class="form-control" id="descripcion" name="descripcion" 
                                              rows="3" maxlength="255" 
                                              placeholder="Descripción del tipo de mascota"></textarea>
                                </div>
                                
                                <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                                    <a href="tipomascotacontroller?accion=listar" class="btn btn-secondary me-md-2">
                                        <i class="fas fa-arrow-left"></i> Volver
                                    </a>
                                    <button type="submit" class="btn btn-primary">
                                        <i class="fas fa-save"></i> Guardar
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
