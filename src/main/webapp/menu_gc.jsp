<%@page import="gob.peam.web.model.Usuario"%>
<aside class="left-sidebar">
    <!-- Sidebar scroll-->
    <div class="scroll-sidebar">
        <!-- User profile -->
        <div class="user-profile" style="background: url(<%out.print(getServletContext().getContextPath());%>/assets/images/background/user-info.jpg) no-repeat;">
            <!-- User profile image -->
            <div class="profile-img"> <img src="<%out.print(getServletContext().getContextPath());%>/assets/images/users/profile.png" alt="user" /> </div>
            <!-- User profile text-->
            <div class="profile-text"> <a href="#" class="dropdown-toggle u-dropdown" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="true"><%out.print(((Usuario) request.getSession().getAttribute("user")).getPersona().getPers_nombre() + " " + ((Usuario) request.getSession().getAttribute("user")).getPersona().getPers_apellido_paterno());%></a>
                <div class="dropdown-menu animated flipInY"> 
                    <a href="<%out.print(getServletContext().getContextPath());%>/perfil" class="dropdown-item"><i class="ti-user"></i> Mi Perfil</a> 
                    <div class="dropdown-divider"></div> 
                    <a href="<%out.print(getServletContext().getContextPath());%>/cerrarsession" class="dropdown-item"><i class="fa fa-power-off"></i> Cerrar Sesión</a> 
                </div>
            </div>
        </div>
        <!-- End User profile text-->
        <!-- Sidebar navigation-->
        <nav class="sidebar-nav">
            <ul id="sidebarnav">
                <li class="nav-small-cap">APP</li>
                <li> <a class="has-arrow waves-effect waves-dark" href="javascript:void(0)" aria-expanded="false" title="Agenda institucional"><i class="mdi mdi-book-open"></i><span class="hide-menu">Agenda Inst.</span></a>
                    <ul aria-expanded="false" class="collapse">
                        <li><a href="<%out.print(getServletContext().getContextPath());%>/agendainstitucional/agendagerencial" title="Agenda Gerencial">Agenda Gerencial</a></li>
                        <li><a href="<%out.print(getServletContext().getContextPath());%>/agendainstitucional/directordesarrollo" title="Director de desarrollo Agropecuario">Dir. Desarrollo Agro</a></li>
                        <li><a href="<%out.print(getServletContext().getContextPath());%>/agendainstitucional/directorinfraestructura" title="Director de Infraestructura">Dir. de Infraestructura</a></li>
                        <li><a href="<%out.print(getServletContext().getContextPath());%>/agendainstitucional/directormanejoambiental" title="Director de Manejo Ambiental">Director M. Ambiental</a></li>
                    </ul>
                </li>
                <li> <a class="has-arrow waves-effect waves-dark" href="javascript:void(0)" aria-expanded="false"><i class="mdi mdi-folder-multiple-outline"></i><span class="hide-menu">Convocatorias</span></a>
                    <ul aria-expanded="false" class="collapse">
                        <li><a href="<%out.print(getServletContext().getContextPath());%>/convocatorias/adicionalesobras" title="Adicionales de Obras">Ad. de Obras</a></li>
                        <li><a href="<%out.print(getServletContext().getContextPath());%>/convocatorias/comitesencargados" title="Comites Encargados">Comites Encargados</a></li>
                        <li><a href="<%out.print(getServletContext().getContextPath());%>/convocatorias/bsc" title="Convocatorias Bienes/Servicios/Conseciones">Convocatorias B/S/C</a></li>
                        <li><a href="<%out.print(getServletContext().getContextPath());%>/convocatorias/personal" title="Convocatorias Personal">Convocatorias Personal</a></li>
                        <li><a href="<%out.print(getServletContext().getContextPath());%>/convocatorias/liquidacionobras" title="Liquidación Final de Obras">Liquidación Final Obras</a></li>
                        <li><a href="<%out.print(getServletContext().getContextPath());%>/convocatorias/penalidades" title="Penalidades">Penalidades</a></li>
                        <li><a href="<%out.print(getServletContext().getContextPath());%>/convocatorias/procesosexonerados" title="Procesos Exonerados">Procesos Exonerados</a></li>
                        <li><a href="<%out.print(getServletContext().getContextPath());%>/convocatorias/supervisioncontratos" title="Subpervisión de Contratos">Supervisión Contratos</a></li>
                    </ul>
                </li>
                <li> <a class="has-arrow waves-effect waves-dark" href="javascript:void(0)" aria-expanded="false" title="Gestión Transparente"><i class="mdi mdi-bullseye"></i><span class="hide-menu">Gest. Transparente</span></a>
                    <ul aria-expanded="false" class="collapse">
                        <li><a href="<%out.print(getServletContext().getContextPath());%>/gestiontransparente/actasconciliacion" title="Actas de Conciliación">Ac. Conciliación</a></li>
                        <li><a href="<%out.print(getServletContext().getContextPath());%>/gestiontransparente/actassession" title="Actas de Sesión de Consejo Directivo">Ac. Sesión de C.D</a></li>
                        <li><a href="<%out.print(getServletContext().getContextPath());%>/gestiontransparente/adquisiciones" title="Adquisiciones y Contrataciones">Ad. y Contrataciones</a></li>
                        <li><a href="<%out.print(getServletContext().getContextPath());%>/gestiontransparente/declaracionjurada" title="Declaraciones Juradas">Declaraciones Juradas</a></li>
                        <li><a href="<%out.print(getServletContext().getContextPath());%>/gestiontransparente/evaluacionactualizacion" title="Evaluación de Actualización">Evaluación Actualización</a></li>
                        <li><a href="<%out.print(getServletContext().getContextPath());%>/gestiontransparente/gestiondocumentos" title="Gestión de Documentos">Gest. Documentos</a></li>
                        <li><a href="<%out.print(getServletContext().getContextPath());%>/gestiontransparente/indicadoresdesempenio" title="Indicadores de Desempeño">Indicadores Desempeño</a></li>
                        <li><a href="<%out.print(getServletContext().getContextPath());%>/gestiontransparente/itp" title="ITP Evaluación de Software">ITP Ev. de Software</a></li>
                        <li><a href="<%out.print(getServletContext().getContextPath());%>/gestiontransparente/laudos" title="Laudos">Laudos</a></li>
                        <li><a href="<%out.print(getServletContext().getContextPath());%>/gestiontransparente/modificatoriaspac" title="Modificatorias del PAC">Modificatorias PAC</a></li>
                        <li><a href="<%out.print(getServletContext().getContextPath());%>/gestiontransparente/personal" title="Personal">Personal</a></li>
                        <li><a href="<%out.print(getServletContext().getContextPath());%>/gestiontransparente/directivos" title="Plan Gerencial y Directivos">PG y Directivos</a></li>
                        <li><a href="<%out.print(getServletContext().getContextPath());%>/gestiontransparente/proyectosinversion" title="Proyecto de Inversión">Proyecto de Inversión</a></li>
                        <li><a href="<%out.print(getServletContext().getContextPath());%>/gestiontransparente/recomendacionesauditorias" title="Recomendaciones de Auditorías">Rec. Auditorías</a></li>
                        <li><a href="<%out.print(getServletContext().getContextPath());%>/gestiontransparente/viaticos" title="Viáticos">Viáticos</a></li>
                    </ul>
                </li>

                <li> <a class="has-arrow waves-effect waves-dark" href="javascript:void(0)" aria-expanded="false" title="Publicaciones"><i class="mdi mdi-chart-bubble"></i><span class="hide-menu">Publicaciones</span></a>
                    <ul aria-expanded="false" class="collapse">
                        <li><a href="ui-cards.html" title="Anuncios">Anuncios</a></li>
                        <li><a href="ui-user-card.html" title="Destacados">Destacados</a></li>
                        <li><a href="ui-buttons.html" title="Estudios">Estudios</a></li>
                        <li><a href="ui-modals.html" title="Eventos">Eventos</a></li>
                        <li><a href="ui-tab.html" title="Memorias Anuales">M. Anuales</a></li>
                        <li><a href="ui-tooltip-popover.html" title="Notas de Prensa">Notas de Prensa</a></li>
                        <li><a href="ui-tooltip-stylish.html" title="Noticias Multimedia">Noticias Multimedia</a></li>
                        <li><a href="ui-sweetalert.html" title="Obras y Proyectos">Obras y Proyectos</a></li>
                        <li><a href="ui-notification.html" title="Otras Publicaciones">Otras Publicaciones</a></li>
                    </ul>
                </li>
                <li class="nav-devider"></li>
                <li class="nav-small-cap">ADICIONALES</li>
                <li> <a class="has-arrow waves-effect waves-dark" href="javascript:void(0)" aria-expanded="false"><i class="mdi mdi-book-multiple" title="Información Financiera y Presupuestal"></i><span class="hide-menu">Inf. Fin. Presupuestal</span></a>
                    <ul aria-expanded="false" class="collapse">
                        <li><a href="#" title="Estados de Cambio en el patrimonio Neto">E.C. Patrimonio Neto</a></li>
                        <li><a href="#" title="Estados de Flujo Efectivos">E. Flujo Efectivo</a></li>
                        <li><a href="#" title="Estado de Gestión">E. Gestión</a></li>
                        <li><a href="#" title="Infraestructura Presupuestal y Financiera">I.P. Financiera</a></li>
                        <li><a href="#" title="Saldos de Balance">Saldos Balance</a></li>
                    </ul>
                </li>
                <li> <a class="has-arrow waves-effect waves-dark" href="javascript:void(0)" aria-expanded="false"><i class="mdi mdi-bookmark-outline" title="Otros"></i><span class="hide-menu">Otros</span></a>
                    <ul aria-expanded="false" class="collapse">
                        <li><a href="<%out.print(getServletContext().getContextPath());%>/directoriostelefonicos" title="Directorio Telefónico">Dir. Telefónico</a></li>
                        <li><a href="<%out.print(getServletContext().getContextPath());%>/glosarios" title="Glosario de Terminos">G. Terminos</a></li>
                    </ul>
                </li>
                <li> <a class="has-arrow waves-effect waves-dark" href="javascript:void(0)" aria-expanded="false"><i class="mdi mdi-tab" title="Participación Ciudadana"></i><span class="hide-menu">Part. Ciudadana</span></a>
                    <ul aria-expanded="false" class="collapse">
                        <li><a href="#" title="Comentarios y Sugerencias">Comentarios/Sugerencia</a></li>
                        <li><a href="#" title="Libro de Reclamaciones">Lib. Reclamaciones</a></li>
                        <li><a href="#" title="Solicitud 27806">Solicitud 27806</a></li>
                    </ul>
                </li>
                <li> <a class="has-arrow waves-effect waves-dark" href="javascript:void(0)" aria-expanded="false"><i class="ti-settings" title="Personalización"></i><span class="hide-menu">Personalización</span></a>
                    <ul aria-expanded="false" class="collapse">
                        <li><a href="#" title="Configuración Correo">Conf. Correo</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <!-- End Sidebar navigation -->
    </div>
    <!-- End Sidebar scroll-->
    <!-- Bottom points-->
    <div class="sidebar-footer">
        <!-- item--><a href="javascript:void(0)" class="link" data-toggle="tooltip" title="Settings"><i class="ti-settings"></i></a>
        <!-- item--><a href="javascript:void(0)" class="link" data-toggle="tooltip" title="Email"><i class="mdi mdi-gmail"></i></a>
        <!-- item--><a href="<%out.print(getServletContext().getContextPath());%>/cerrarsession" class="link" data-toggle="tooltip" title="Cerrar Sesión"><i class="mdi mdi-power"></i></a>
    </div>
    <!-- End Bottom points-->
</aside>