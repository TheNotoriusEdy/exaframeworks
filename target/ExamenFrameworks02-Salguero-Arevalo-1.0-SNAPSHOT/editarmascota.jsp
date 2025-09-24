<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Mascota - Sistema de Mascotas</title>
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
                            <h4 class="mb-0"><i class="fas fa-edit"></i> Editar Mascota</h4>
                        </div>
                        <div class="card-body">
                            <form action="mascotasController?accion=actualizar" method="post">
                                <!-- Campo oculto para el ID de la mascota -->
                                <input type="hidden" name="id_mascota" value="${mascota.id_mascota}">
                                
                                <div class="mb-3">
                                    <label for="nombre" class="form-label">Nombre:</label>
                                    <input type="text" class="form-control" id="nombre" name="nombre" 
                                           value="${mascota.nombre}" required placeholder="Nombre de la mascota">
                                </div>
                                
                                <div class="mb-3">
                                    <label for="tipo" class="form-label">Tipo:</label>
                                    <select class="form-select" id="tipo" name="id_tipo" required>
                                        <option value="">Selecciona un tipo</option>
                                        <c:forEach var="tipo" items="${tipos}">
                                            <option value="${tipo.id_tipo}" 
                                                    <c:if test="${tipo.id_tipo == mascota.id_tipo}">selected</c:if>>
                                                ${tipo.nombre}
                                            </option>
                                        </c:forEach>
                                    </select>
                                </div>
                                
                                <div class="mb-3">
                                    <label for="foto" class="form-label">URL de la Foto:</label>
                                    <input type="url" class="form-control" id="foto" name="foto" 
                                           value="${mascota.foto}" placeholder="https://ejemplo.com/imagen.jpg">
                                </div>
                                
                                <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                                    <a href="mascotasController" class="btn btn-secondary me-md-2">
                                        <i class="fas fa-arrow-left"></i> Cancelar
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
    </body>
</html>