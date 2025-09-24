<%-- 
    Document   : index
    Created on : 23 sep. 2025, 21:54:03
    Author     : Xavier
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <title>Sistema de Mascotas - Inicio</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
        <style>
            .hero-section {
                background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                color: white;
                padding: 100px 0;
                text-align: center;
            }
            
            .hero-section h1 {
                font-size: 3.5rem;
                font-weight: bold;
                margin-bottom: 1rem;
            }
            
            .hero-section p {
                font-size: 1.2rem;
                margin-bottom: 2rem;
                opacity: 0.9;
            }
            
            .feature-card {
                transition: transform 0.3s ease, box-shadow 0.3s ease;
                border: none;
                height: 100%;
            }
            
            .feature-card:hover {
                transform: translateY(-10px);
                box-shadow: 0 15px 35px rgba(0,0,0,0.1);
            }
            
            .feature-icon {
                font-size: 3rem;
                margin-bottom: 1rem;
                color: #667eea;
            }
            
            .stats-section {
                background-color: #f8f9fa;
                padding: 80px 0;
            }
            
            .stat-item {
                text-align: center;
                padding: 2rem;
            }
            
            .stat-number {
                font-size: 3rem;
                font-weight: bold;
                color: #667eea;
                display: block;
            }
            
            .stat-label {
                color: #6c757d;
                font-size: 1.1rem;
                margin-top: 0.5rem;
            }
            
            .cta-section {
                background: linear-gradient(135deg, #764ba2 0%, #667eea 100%);
                color: white;
                padding: 80px 0;
                text-align: center;
            }
            
            .btn-custom {
                padding: 12px 30px;
                font-size: 1.1rem;
                border-radius: 50px;
                transition: all 0.3s ease;
            }
            
            .btn-custom:hover {
                transform: translateY(-2px);
                box-shadow: 0 8px 25px rgba(0,0,0,0.2);
            }
            
            .navbar-brand {
                font-weight: bold;
                font-size: 1.3rem;
            }
        </style>
    </head>
    <body>
        <%@ include file="header.jsp" %>
        <style>
            /* Agregar estilo para que el navbar sea fixed-top */
            .navbar {
                position: fixed !important;
                top: 0;
                left: 0;
                right: 0;
                z-index: 1030;
            }
        </style>

        <!-- Hero Section -->
        <section class="hero-section">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 mx-auto">
                        <i class="fas fa-heart fa-3x mb-4" style="color: #ff6b6b;"></i>
                        <h1>Bienvenido al Sistema de Mascotas</h1>
                        <p>Gestiona de manera fácil y eficiente toda la información de tus mascotas. 
                           Registra, edita y organiza por tipos de forma intuitiva.</p>
                        <div class="d-flex justify-content-center gap-3 flex-wrap">
                            <a href="mascotasController" class="btn btn-light btn-custom">
                                <i class="fas fa-eye me-2"></i>Ver Mascotas
                            </a>
                            <a href="adoptantesController" class="btn btn-outline-light btn-custom">
                                <i class="fas fa-users me-2"></i>Ver Adoptantes
                            </a>
                            <a href="mascotasController?accion=agregar" class="btn btn-outline-light btn-custom">
                                <i class="fas fa-plus me-2"></i>Agregar Mascota
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Features Section -->
        <section class="py-5">
            <div class="container">
                <div class="row text-center mb-5">
                    <div class="col">
                        <h2 class="fw-bold mb-3">Funcionalidades Principales</h2>
                        <p class="text-muted">Todo lo que necesitas para gestionar tus mascotas</p>
                    </div>
                </div>
                <div class="row g-4">
                    <div class="col-md-3">
                        <div class="card feature-card">
                            <div class="card-body text-center p-4">
                                <i class="fas fa-list feature-icon"></i>
                                <h5 class="card-title">Gestión de Mascotas</h5>
                                <p class="card-text">Visualiza, agrega, edita y elimina mascotas de forma sencilla con una interfaz intuitiva.</p>
                                <a href="mascotasController" class="btn btn-primary">
                                    <i class="fas fa-arrow-right me-1"></i>Ver Mascotas
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card feature-card">
                            <div class="card-body text-center p-4">
                                <i class="fas fa-users feature-icon"></i>
                                <h5 class="card-title">Gestión de Adoptantes</h5>
                                <p class="card-text">Administra la información de las personas interesadas en adoptar mascotas.</p>
                                <a href="adoptantesController" class="btn btn-primary">
                                    <i class="fas fa-arrow-right me-1"></i>Ver Adoptantes
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card feature-card">
                            <div class="card-body text-center p-4">
                                <i class="fas fa-tags feature-icon"></i>
                                <h5 class="card-title">Tipos de Mascotas</h5>
                                <p class="card-text">Organiza tus mascotas por tipos (Perro, Gato, Ave, etc.) para una mejor clasificación.</p>
                                <a href="tipomascotacontroller?accion=listar" class="btn btn-primary">
                                    <i class="fas fa-arrow-right me-1"></i>Ver Tipos
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card feature-card">
                            <div class="card-body text-center p-4">
                                <i class="fas fa-plus-circle feature-icon"></i>
                                <h5 class="card-title">Registro Rápido</h5>
                                <p class="card-text">Agrega nuevas mascotas y tipos de manera rápida con formularios optimizados.</p>
                                <a href="mascotasController?accion=agregar" class="btn btn-primary">
                                    <i class="fas fa-arrow-right me-1"></i>Agregar Mascota
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Stats Section -->
        <section class="stats-section">
            <div class="container">
                <div class="row">
                    <div class="col-md-4">
                        <div class="stat-item">
                            <span class="stat-number">
                                <i class="fas fa-paw"></i>
                            </span>
                            <div class="stat-label">Gestión Completa</div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="stat-item">
                            <span class="stat-number">
                                <i class="fas fa-mobile-alt"></i>
                            </span>
                            <div class="stat-label">Diseño Responsivo</div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="stat-item">
                            <span class="stat-number">
                                <i class="fas fa-shield-alt"></i>
                            </span>
                            <div class="stat-label">Seguro y Confiable</div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- CTA Section -->
        <section class="cta-section">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 mx-auto text-center">
                        <h2 class="fw-bold mb-3">¿Listo para comenzar?</h2>
                        <p class="mb-4">Empiece a gestionar sus mascotas de manera profesional</p>
                        <div class="d-flex justify-content-center gap-3 flex-wrap">
                            <a href="mascotasController" class="btn btn-light btn-custom">
                                <i class="fas fa-list me-2"></i>Ver todas las mascotas
                            </a>
                            <a href="adoptantesController" class="btn btn-outline-light btn-custom">
                                <i class="fas fa-users me-2"></i>Ver adoptantes
                            </a>
                            <a href="tipomascotacontroller?accion=listar" class="btn btn-outline-light btn-custom">
                                <i class="fas fa-tags me-2"></i>Gestionar tipos
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Footer -->
        <footer class="bg-dark text-light py-4">
            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        <h5><i class="fas fa-paw me-2"></i>Sistema de Mascotas</h5>
                        <p class="text-muted">Gestión profesional de mascotas</p>
                    </div>
                    <div class="col-md-6 text-md-end">
                        <p class="text-muted mb-0">© 2025 Sistema de Mascotas. Desarrollado con ❤️</p>
                    </div>
                </div>
            </div>
        </footer>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
