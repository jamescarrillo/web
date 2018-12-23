<header id="header" class="tt-nav nav-border-bottom">
    <div class="header-sticky light-header">
        <div class="container">
            <div class="search-wrapper">
                <div class="search-trigger pull-right">
                    <div class="search-btn"></div>
                    <i style="display: block" class="material-icons">search</i>
                </div>
                <i class="search-close material-icons">close</i>
                <div class="search-form-wrapper">
                    <form id="FrmBusquedaPage" class="white-form">
                        <div class="input-field">
                            <input type="text" name="txtBusquedaPage" id="txtBusquedaPage">
                            <label for="search" class="">Busca aquí...</label>
                        </div>
                        <button class="btn search-button waves-effect waves-light" type="submit" style="background-color: #8b8c8d"><i class="material-icons">search</i></button>
                        <input type="hidden" name="action" id="actionBusquedaPage">

                    </form>
                    <div id="ventanaModalBusqueda" class="modal-peam" style="z-index: 2000">
                        <!-- Modal content -->
                        <div class="modal-content-peam  modal-dialog-scroll contentMyModal" style="width: 80%">
                            <div class="modal-header-peam" style="background-color: #ffffff; border-bottom: #00793D solid; border-width: 2px">
                                <span class="close" id="btnCerrarModalBusqueda">&times;</span>
                                <h5 class="text-peam-verde text-peam-negrita" style="margin-top: 15px;">
                                    CONTENIDO DE BUSQUEDA
                                </h5>
                            </div>
                            <div class="modal-body-peam modal-body-scroll">
                                <div class="row" id="loader_contenido_busqueda">
                                    <div class="col-md-1 col-md-offset-5 col-xs-2 col-xs-offset-5 mt-30">
                                        <div class="loader-peam_small"></div>
                                    </div>
                                </div>
                                <div class="row" style="margin-top: 20px;" id="containerBusqueda">

                                </div>
                            </div>
                            <div class="modal-footer-peam" style="background-color: #ffffff; border-top: #00793D solid; border-width: 2px">
                                <h6 style="margin-top: 10px;" class="text-peam-negrita">PROYECTO ESPECIAL ALTO MAYO</h6>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="materialize-menu" class="menuzord">
                <a href="<%out.print(getServletContext().getContextPath());%>/index" id="logoIndexPrincipal" class="logo-brand" style="margin-left: 0px;margin-right: 30px; margin-top: 10px">
                    <img class="retina" src="<%out.print(getServletContext().getContextPath());%>/peam_resources/logos_principales/logo_peam_combinado.png" alt=""/>
                </a>
                <ul class="menuzord-menu pull-center" id="menu-list">
                    <li><a href="<%out.print(getServletContext().getContextPath());%>/index">Inicio</a></li>
                    <li><a href="javascript:void(0)">La Institución</a>
                        <div class="megamenu">
                            <div class="megamenu-row">
                                <div class="col12">
                                    <h2>La Institución</h2>
                                    <ul class="list-unstyled clearfix">
                                        <li><a href="<%out.print(getServletContext().getContextPath());%>/institucion/quienes-somos">Quienes Somos</a></li>
                                        <li><a href="<%out.print(getServletContext().getContextPath());%>/institucion/vision-y-mision">Visión / Misión</a></li>
                                        <li><a href="<%out.print(getServletContext().getContextPath());%>/institucion/objetivos-y-funciones">Objetivos / Funciones</a></li>
                                        <li><a href="<%out.print(getServletContext().getContextPath());%>/institucion/codigo-de-etica">Código de Ética</a></li>
                                        <li><a href="<%out.print(getServletContext().getContextPath());%>/institucion/ubicacion">Ubicación</a></li>
                                        <li><a href="<%out.print(getServletContext().getContextPath());%>/institucion/estructura-organica">Estructura Orgánica</a></li>
                                        <li><a href="<%out.print(getServletContext().getContextPath());%>/institucion/directorios-de-contactos">Directorio de Contactos</a></li>
                                    </ul>
                                </div>    
                            </div>
                        </div>
                    </li>
                    <li><a href="javascript:void(0)">Gestión Transparente</a>
                        <div class="megamenu">
                            <div class="megamenu-row">
                                <div class="col12">
                                    <h2>Gestión Transparente</h2>
                                    <ul class="list-unstyled clearfix">
                                        <li><a href="<%out.print(getServletContext().getContextPath());%>/gestiontransparente/documentos-normativos-y-de-gestion">Documentos Normativos y de Gestión</a></li>
                                        <li><a href="<%out.print(getServletContext().getContextPath());%>/gestiontransparente/presupuestos-y-finanzas">Presupuestos y Finanzas</a></li>
                                        <li><a href="<%out.print(getServletContext().getContextPath());%>/gestiontransparente/proyectos-de-inversion">Proyectos de Inversión</a></li>
                                        <li><a href="<%out.print(getServletContext().getContextPath());%>/gestiontransparente/recursos-humanos">Recursos Humanos</a></li>
                                        <li><a href="<%out.print(getServletContext().getContextPath());%>/gestiontransparente/adquisiciones-y-contrataciones">Adquisiciones y Contrataciones</a></li>
                                        <li><a href="<%out.print(getServletContext().getContextPath());%>/gestiontransparente/agenda-institucional">Agenda Institucional</a></li>
                                        <li><a href="<%out.print(getServletContext().getContextPath());%>/gestiontransparente/informacion-adicional">Información Adicional</a></li>
                                    </ul>
                                </div>    
                            </div>
                        </div>
                    </li>
                    <li><a href="javascript:void(0)">Convocatorias</a>
                        <div class="megamenu">
                            <div class="megamenu-row">
                                <div class="col12">
                                    <h2>Convocatorias</h2>
                                    <ul class="list-unstyled clearfix">
                                        <li><a href="<%out.print(getServletContext().getContextPath());%>/convocatorias/convocatoria-de-personal">Convocatorias de Personal</a></li>
                                        <li><a href="<%out.print(getServletContext().getContextPath());%>/convocatorias/convocatoria-de-bienes-y-servicios">Convocatorias de Bienes, Servicios, Obras y Concesiones</a></li>
                                    </ul>
                                </div>    
                            </div>
                        </div>
                    </li>
                    <li><a href="javascript:void(0)">Publicaciones</a>
                        <div class="megamenu">
                            <div class="megamenu-row">
                                <div class="col12">
                                    <h2>Publicaciones</h2>
                                    <ul class="list-unstyled clearfix">
                                        <li><a href="<%out.print(getServletContext().getContextPath());%>/publicaciones/noticias/notas-de-prensa">Noticias / Notas de Prensa</a></li>
                                        <li><a href="<%out.print(getServletContext().getContextPath());%>/publicaciones/noticias/multimedia">Noticias Multimedia</a></li>
                                        <li><a href="<%out.print(getServletContext().getContextPath());%>/publicaciones/memorias-anuales">Memorias Anuales</a></li>
                                        <li><a href="<%out.print(getServletContext().getContextPath());%>/publicaciones/comunicados">Comunicados</a></li>
                                        <li><a href="<%out.print(getServletContext().getContextPath());%>/publicaciones/otras-publicaciones">Otras Publicaciones</a></li>
                                    </ul>
                                </div>    
                            </div>
                        </div>
                    </li>
                    <li><a href="javascript:void(0)">Servicios</a>
                        <div class="megamenu">
                            <div class="megamenu-row">
                                <div class="col6">
                                    <h2>Servicios</h2>
                                    <ul class="list-unstyled clearfix">
                                        <li><a href="<%out.print(getServletContext().getContextPath());%>/login" target="_blank">Gestor de Contenidos</a></li>
                                        <li><a href="http://doc.peam.gob.pe/sisgedo/app/main.php" target="_blank">Sistema de Trámite Documentario (SisGedo)</a></li>
                                        <li><a href="http://siga.peam.gob.pe:8080/SIGAWEB/" target="_blank">Siga Web</a></li>
                                        <li><a href="http://lib.peam.gob.pe:8081/ArcDig/" target="_blank">ArcDig</a></li>
                                        <li><a href="http://lib.peam.gob.pe/Visitas/controlVisitas/index.php?r=consultas/visitaConsulta" target="_blank">Registro de Visitas en Línea</a></li>
                                        <li><a href="https://correo.peam.gob.pe/" target="_blank">Correo Institucional</a></li>
                                    </ul>
                                </div>  
                                <div class="col6">
                                    <h2>Consultas</h2>
                                    <ul class="list-unstyled clearfix">
                                        <li><a href="<%out.print(getServletContext().getContextPath());%>/glosario" target="_blank">Glosario</a></li>
                                        <li><a href="<%out.print(getServletContext().getContextPath());%>/mapa-de-sitio" target="_blank">Mapa de Sitio</a></li>
                                        <li><a href="<%out.print(getServletContext().getContextPath());%>/consultas/acceso-informacion">Acceso a la Información</a></li>
                                        <li><a href="<%out.print(getServletContext().getContextPath());%>/consultas/libro-de-reclamaciones">Libro de Reclamaciones</a></li>
                                        <li><a href="<%out.print(getServletContext().getContextPath());%>/consultas/consultas-y-sugerencias">Consultas y Sugerencias</a></li>
                                        <li><a href="<%out.print(getServletContext().getContextPath());%>/consultas/portal-de-transparencia">Portal de Transparencia</a></li>
                                    </ul>
                                </div> 
                            </div>
                        </div>
                    </li>
                    <!--li><a class="search-trigger" style="margin-top: 15px"><i class="fa fa-search"></i></a></li-->
                </ul>
            </div>
        </div>
    </div>
</header>