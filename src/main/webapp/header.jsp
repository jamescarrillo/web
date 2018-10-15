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
                <!--logo start-->
                <a href="<%out.print(getServletContext().getContextPath());%>/index" class="logo-brand" style="margin-left: 0px;margin-right: 0px">
                    <!--img class="retina" src="assets/img/logo.png" alt=""/-->
                    <img class="retina" src="<%out.print(getServletContext().getContextPath());%>/peam_resources/logos_principales/logo_peam_combinado.png" alt=""/>
                </a>
                <!--logo end-->
                <!--mega menu start-->
                <ul class="menuzord-menu pull-right" id="menu-list">
                    <li><a href="<%out.print(getServletContext().getContextPath());%>/index">Inicio</a></li>
                    <li><a href="javascript:void(0)">Peam</a>
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
                    <li><a href="javascript:void(0)">Gestión</a>
                        <div class="megamenu">
                            <div class="megamenu-row">
                                <div class="col12">
                                    <h2>Gestión Transparente</h2>
                                    <ul class="list-unstyled clearfix">
                                        <li><a href="#">Documentos Normativos y de Gestión</a></li>
                                        <li><a href="#">Presupuestos y Finanzas</a></li>
                                        <li><a href="#">Proyectos de inversión</a></li>
                                        <li><a href="#">Recursos Humanos</a></li>
                                        <li><a href="#">Adquisiciones y Contrataciones</a></li>
                                        <li><a href="#">Agenda Institucional</a></li>
                                        <li><a href="#">Información Adicional</a></li>
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
                                        <li><a href="#">Noticia / Nota de Prensa</a></li>
                                        <li><a href="#">Noticias Multimedia</a></li>
                                        <li><a href="#">Memorias Anuales</a></li>
                                        <li><a href="#">Comunicados</a></li>
                                        <li><a href="#">Otras Publicaciones</a></li>
                                    </ul>
                                </div>    
                            </div>
                        </div>
                    </li>
                    <li><a href="javascript:void(0)">Servicios</a>
                        <div class="megamenu">
                            <div class="megamenu-row">
                                <div class="col12">
                                    <h2>Apps</h2>
                                    <ul class="list-unstyled">
                                        <li><a href="<%out.print(getServletContext().getContextPath());%>/login" target="_blank">Gestor de Contenidos</a></li>
                                        <li><a href="https://correo.peam.gob.pe/" target="_blank">Correo</a></li>
                                        <li><a target="_blank">Intranet</a></li>
                                        <li><a target="_blank">Servicios</a></li>
                                        <li><a target="_blank">Glosario</a></li>
                                        <li><a target="_blank">Mapa de Sitio</a></li>
                                    </ul>
                                </div>    
                            </div>
                        </div>
                    </li>
                </ul>
                <!--mega menu end-->
            </div>
        </div>
    </div>
</header>