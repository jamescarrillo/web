<header id="header" class="tt-nav nav-border-bottom">
    <div class="header-sticky light-header">
        <div class="container">
            <div class="search-wrapper">
                <div class="search-trigger pull-right">
                    <div class="search-btn"></div>
                    <i class="material-icons">search</i>
                </div>
                <i class="search-close material-icons">close</i>
                <div class="search-form-wrapper">
                    <form action="#" class="white-form">
                        <div class="input-field">
                            <input type="text" name="search" id="search">
                            <label for="search" class="">Busca aquí...</label>
                        </div>
                        <button class="btn search-button waves-effect waves-light" type="submit" style="background-color:  #a20505"><i class="material-icons">search</i></button>
                    </form>
                </div>
            </div>
            <div id="materialize-menu" class="menuzord">
                <a href="<%out.print(getServletContext().getContextPath());%>/index" id="logoIndexPrincipal" class="logo-brand" style="margin-left: 0px;margin-right: 15px">
                    <img class="retina" src="<%out.print(getServletContext().getContextPath());%>/peam_resources/logos_principales/logo_peam_combinado.png" alt=""/>
                </a>
                <ul class="menuzord-menu pull-center" id="menu-list">
                    <li><a href="<%out.print(getServletContext().getContextPath());%>/index">Inicio</a></li>
                    <li><a href="javascript:void(0)">La institución</a>
                        <div class="megamenu">
                            <div class="megamenu-row">
                                <div class="col12">
                                    <h2>La institución</h2>
                                    <ul class="list-unstyled clearfix">
                                        <li><a href="<%out.print(getServletContext().getContextPath());%>/institucion/quienessomos">Quienes Somos</a></li>
                                        <li><a href="<%out.print(getServletContext().getContextPath());%>/institucion/visionmision">Visión / Misión</a></li>
                                        <li><a href="<%out.print(getServletContext().getContextPath());%>/institucion/objetivofunciones">Objetivo / Funciones</a></li>
                                        <li><a href="<%out.print(getServletContext().getContextPath());%>/institucion/etica">Código de Ética</a></li>
                                        <li><a href="<%out.print(getServletContext().getContextPath());%>/institucion/ubicacion">Ubicación</a></li>
                                        <li><a href="<%out.print(getServletContext().getContextPath());%>/institucion/estructuraorganica">Estructura Orgánica</a></li>
                                        <li><a href="<%out.print(getServletContext().getContextPath());%>/institucion/directorios">Directorio de Contactos</a></li>
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
                                        <li><a href="<%out.print(getServletContext().getContextPath());%>/gestiontransparente/presupuesto-y-finanzas">Presupuestos y Finanzas</a></li>
                                        <li><a href="<%out.print(getServletContext().getContextPath());%>/gestiontransparente/proyecto-de-inversion">Proyectos de inversión</a></li>
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
                                        <li><a href="#">Convocatorias de Personal</a></li>
                                        <li><a href="#">Bienes, Servicios, Obras y Conseciones</a></li>
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
                                        <li><a href="<%out.print(getServletContext().getContextPath());%>/publicaciones/noticias/notas-de-prensa">Noticias / Nota de Prensa</a></li>
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
                                    <h2>Apps</h2>
                                    <ul class="list-unstyled clearfix">
                                        <li><a href="<%out.print(getServletContext().getContextPath());%>/login">Gestor de Contenidos</a></li>
                                        <li><a href="https://correo.peam.gob.pe/" target="_blank">Correo</a></li>
                                        <li><a target="_blank">Intranet</a></li>
                                        <li><a href="<%out.print(getServletContext().getContextPath());%>/glosario">Glosario</a></li>
                                        <li><a href="<%out.print(getServletContext().getContextPath());%>/mapa-sitio">Mapa de Sitio</a></li>
                                    </ul>
                                </div>  
                                <div class="col6">
                                    <h2>Consultas</h2>
                                    <ul class="list-unstyled clearfix">
                                        <li><a href="<%out.print(getServletContext().getContextPath());%>/servicios">Servicios</a></li>
                                        <li><a href="<%out.print(getServletContext().getContextPath());%>/consultas/acceso-informacion">Acceso a la Información</a></li>
                                        <li><a href="<%out.print(getServletContext().getContextPath());%>/consultas/libro-de-reclamaciones">Libro de Reclamaciones</a></li>
                                        <li><a href="<%out.print(getServletContext().getContextPath());%>/consultas/consultas-y-sugerencias">Consultas y Sugerencias</a></li>
                                        <li><a href="<%out.print(getServletContext().getContextPath());%>/consultas/portal-de-transparencia">Portal de Transparencia</a></li>
                                    </ul>
                                </div> 
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</header>