<%-- 
    Document   : header
    Created on : 23 sep. 2025, 21:36:51
    Author     : Xavier
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <div class="container">
        <a class="navbar-brand" href="index.html">
            <i class="fas fa-paw"></i> Sistema de Mascotas
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" 
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto">
                <li class="nav-item">
                    <a class="nav-link" href="index.html">
                        <i class="fas fa-home"></i> Inicio
                    </a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="mascotasDropdown" role="button" 
                       data-bs-toggle="dropdown" aria-expanded="false">
                        <i class="fas fa-dog"></i> Mascotas
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="mascotasDropdown">
                        <li><a class="dropdown-item" href="mascotasController">
                            <i class="fas fa-list"></i> Ver Mascotas
                        </a></li>
                        <li><a class="dropdown-item" href="mascotasController?accion=agregar">
                            <i class="fas fa-plus"></i> Agregar Mascota
                        </a></li>
                    </ul>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="adoptantesDropdown" role="button" 
                       data-bs-toggle="dropdown" aria-expanded="false">
                        <i class="fas fa-users"></i> Adoptantes
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="adoptantesDropdown">
                        <li><a class="dropdown-item" href="adoptantesController">
                            <i class="fas fa-list"></i> Ver Adoptantes
                        </a></li>
                        <li><a class="dropdown-item" href="adoptantesController?accion=agregar">
                            <i class="fas fa-user-plus"></i> Agregar Adoptante
                        </a></li>
                    </ul>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="tiposDropdown" role="button" 
                       data-bs-toggle="dropdown" aria-expanded="false">
                        <i class="fas fa-tags"></i> Tipos
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="tiposDropdown">
                        <li><a class="dropdown-item" href="tipomascotacontroller?accion=listar">
                            <i class="fas fa-list"></i> Ver Tipos
                        </a></li>
                        <li><a class="dropdown-item" href="tipomascotacontroller?accion=nuevo">
                            <i class="fas fa-plus"></i> Agregar Tipo
                        </a></li>
                    </ul>
                </li>
            </ul>
            <ul class="navbar-nav">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" 
                       data-bs-toggle="dropdown" aria-expanded="false">
                        <i class="fas fa-user"></i> Usuario
                    </a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="userDropdown">
                        <li><a class="dropdown-item" href="#">
                            <i class="fas fa-user-cog"></i> Perfil
                        </a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="#">
                            <i class="fas fa-sign-out-alt"></i> Cerrar Sesión
                        </a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>

<style>
.navbar-brand {
    font-weight: bold;
    font-size: 1.3rem;
}

.navbar-nav .nav-link {
    transition: all 0.3s ease;
    border-radius: 5px;
    margin: 0 2px;
}

.navbar-nav .nav-link:hover {
    background-color: rgba(255, 255, 255, 0.1);
    transform: translateY(-1px);
}

.dropdown-menu {
    border: none;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    border-radius: 8px;
}

.dropdown-item {
    transition: all 0.3s ease;
}

.dropdown-item:hover {
    background-color: #0d6efd;
    color: white;
    transform: translateX(5px);
}

.dropdown-item i {
    width: 20px;
    text-align: center;
    margin-right: 8px;
}

.navbar-toggler {
    border: none;
}

.navbar-toggler:focus {
    box-shadow: none;
}

@media (max-width: 991px) {
    .dropdown-menu {
        border: none;
        background-color: rgba(255, 255, 255, 0.05);
        margin-left: 1rem;
    }
    
    .dropdown-item {
        color: rgba(255, 255, 255, 0.8);
    }
    
    .dropdown-item:hover {
        background-color: rgba(255, 255, 255, 0.1);
        color: white;
        transform: none;
    }
}
</style>
