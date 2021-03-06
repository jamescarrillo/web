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
                    <a href="<%out.print(getServletContext().getContextPath());%>/cerrarsession" class="dropdown-item"><i class="fa fa-power-off"></i> Cerrar Sesi�n</a> 
                </div>
            </div>
        </div>
        <!-- End User profile text-->
        <!-- Sidebar navigation-->
        <nav class="sidebar-nav">
            <ul id="sidebarnav">
                <li class="nav-small-cap">APP</li>
                <li> <a class="has-arrow waves-effect waves-dark" href="javascript:void(0)" aria-expanded="false" title="Agenda institucional"><i class="mdi mdi-book-open"></i><span class="hide-menu">Agenda <br>Institucional</span></a>
                    <ul aria-expanded="false" class="collapse">
                        <li><a href="<%out.print(getServletContext().getContextPath());%>/agendainstitucional/agendagerencial" title="Agenda Gerencial">Agenda Gerencial</a></li>
                        <li><a href="<%out.print(getServletContext().getContextPath());%>/agendainstitucional/directordesarrollo" title="Director de desarrollo Agropecuario">Director Desarrollo <br>Agropecuario</a></li>
                        <li><a href="<%out.print(getServletContext().getContextPath());%>/agendainstitucional/directorinfraestructura" title="Director de Infraestructura">Director de <br>Infraestructura</a></li>
                        <li><a href="<%out.print(getServletContext().getContextPath());%>/agendainstitucional/directormanejoambiental" title="Director de Manejo Ambiental">Director Manejo <br>Ambiental</a></li>
                    </ul>
                </li>
                <li> <a class="has-arrow waves-effect waves-dark" href="javascript:void(0)" aria-expanded="false"><i class="mdi mdi-folder-multiple-outline"></i><span class="hide-menu">Convocatorias</span></a>
                    <ul aria-expanded="false" class="collapse">
                        <li><a href="<%out.print(getServletContext().getContextPath());%>/convocatorias/adicionalesobras" title="Adicionales de Obras">Adicionales de Obras</a></li>
                        <li><a href="<%out.print(getServletContext().getContextPath());%>/convocatorias/comitesencargados" title="Comites Encargados">Comites Encargados</a></li>
                        <li><a href="<%out.print(getServletContext().getContextPath());%>/convocatorias/bsc" title="Convocatorias de Bienes/Servicios/Conseciones">Convocatorias B/S/C</a></li>
                        <li><a href="<%out.print(getServletContext().getContextPath());%>/convocatorias/personal" title="Convocatorias de Personal">Convocatorias Personal</a></li>
                        <li><a href="<%out.print(getServletContext().getContextPath());%>/convocatorias/liquidacionobras" title="Liquidaci�n Final de Obras">Liquidaci�n Final Obras</a></li>
                        <li><a href="<%out.print(getServletContext().getContextPath());%>/convocatorias/penalidades" title="Penalidades">Penalidades</a></li>
                        <li><a href="<%out.print(getServletContext().getContextPath());%>/convocatorias/procesosexonerados" title="Procesos Exonerados">Procesos Exonerados</a></li>
                        <li><a href="<%out.print(getServletContext().getContextPath());%>/convocatorias/supervisioncontratos" title="Subpervisi�n de Contratos">Supervisi�n Contratos</a></li>
                    </ul>
                </li>
                <li> <a class="has-arrow waves-effect waves-dark" href="javascript:void(0)" aria-expanded="false" title="Gesti�n Transparente"><i class="mdi mdi-bullseye"></i><span class="hide-menu">Gesti�n <br>Transparente</span></a>
                    <ul aria-expanded="false" class="collapse">
                        <li><a href="<%out.print(getServletContext().getContextPath());%>/gestiontransparente/actasconciliacion" title="Actas de Conciliaci�n">Actas de Conciliaci�n</a></li>
                        <li><a href="<%out.print(getServletContext().getContextPath());%>/gestiontransparente/actassession" title="Actas de Sesi�n de Consejo Directivo">Actas Sesi�n de C.D</a></li>
                        <li><a href="<%out.print(getServletContext().getContextPath());%>/gestiontransparente/adquisiciones" title="Adquisiciones y Contrataciones">Adquisiciones y <br>Contrataciones</a></li>
                        <li><a href="<%out.print(getServletContext().getContextPath());%>/gestiontransparente/declaracionjurada" title="Declaraciones Juradas">Declaraciones Juradas</a></li>
                        <li><a href="<%out.print(getServletContext().getContextPath());%>/gestiontransparente/evaluacionactualizacion" title="Evaluaci�n de Actualizaci�n">Evaluaci�n Actualizaci�n</a></li>
                        <li><a href="<%out.print(getServletContext().getContextPath());%>/gestiontransparente/gestiondocumentos" title="Gesti�n de Documentos">Gesti�n Documentos</a></li>
                        <li><a href="<%out.print(getServletContext().getContextPath());%>/gestiontransparente/indicadoresdesempenio" title="Indicadores de Desempe�o">Indicadores Desempe�o</a></li>
                        <li><a href="<%out.print(getServletContext().getContextPath());%>/gestiontransparente/itp" title="ITP Evaluaci�n de Software">ITP Evaluaci�n de <br>Software</a></li>
                        <li><a href="<%out.print(getServletContext().getContextPath());%>/gestiontransparente/laudos" title="Laudos">Laudos</a></li>
                        <li><a href="<%out.print(getServletContext().getContextPath());%>/gestiontransparente/modificatoriaspac" title="Modificatorias del PAC">Modificatorias PAC</a></li>
                        <li><a href="<%out.print(getServletContext().getContextPath());%>/gestiontransparente/personal" title="Personal">Personal</a></li>
                        <li><a href="<%out.print(getServletContext().getContextPath());%>/gestiontransparente/directivos" title="Plan Gerencial y Directivos">Plan Gerencial y <br>Directivos</a></li>
                        <li><a href="<%out.print(getServletContext().getContextPath());%>/gestiontransparente/proyectosinversion" title="Proyecto de Inversi�n">Proyecto de Inversi�n</a></li>
                        <li><a href="<%out.print(getServletContext().getContextPath());%>/gestiontransparente/recomendacionesauditorias" title="Recomendaciones de Auditor�as">Recomendaciones de <br>Auditor�as</a></li>
                        <li><a href="<%out.print(getServletContext().getContextPath());%>/gestiontransparente/viaticos" title="Vi�ticos">Vi�ticos</a></li>
                    </ul>
                </li>

                <li> <a class="has-arrow waves-effect waves-dark" href="javascript:void(0)" aria-expanded="false" title="Publicaciones"><i class="mdi mdi-chart-bubble"></i><span class="hide-menu">Publicaciones</span></a>
                    <ul aria-expanded="false" class="collapse">
                        <li><a href="<%out.print(getServletContext().getContextPath());%>/publicaciones/anuncios" title="Anuncios">Anuncios</a></li>
                        <!--li><a href="<%out.print(getServletContext().getContextPath());%>/publicaciones/destacados" title="Destacados">Destacados</a></li-->
                        <li><a href="<%out.print(getServletContext().getContextPath());%>/publicaciones/estudios" title="Estudios">Estudios</a></li>
                        <li><a href="<%out.print(getServletContext().getContextPath());%>/publicaciones/eventos" title="Eventos">Eventos</a></li>
                        <li><a href="<%out.print(getServletContext().getContextPath());%>/publicaciones/memorias">Memorias Anuales</a></li>
                        <li><a href="<%out.print(getServletContext().getContextPath());%>/publicaciones/notasprensa" title="Notas de Prensa">Notas de Prensa</a></li>
                        <li><a href="<%out.print(getServletContext().getContextPath());%>/publicaciones/multimedia" title="Noticias Multimedia">Noticias Multimedia</a></li>
                        <li><a href="<%out.print(getServletContext().getContextPath());%>/publicaciones/obrasyproyectos" title="Obras y Proyectos">Obras y Proyectos</a></li>
                        <li><a href="<%out.print(getServletContext().getContextPath());%>/publicaciones/otraspublicaciones" title="Otras Publicaciones">Otras Publicaciones</a></li>
                    </ul>
                </li>
                <li class="nav-devider"></li>
                <li class="nav-small-cap">ADICIONALES</li>
                <li> <a class="has-arrow waves-effect waves-dark" href="javascript:void(0)" aria-expanded="false"><i class="mdi mdi-book-multiple" title="Informaci�n Financiera y Presupuestal"></i><span class="hide-menu">Informaci�n <br>Financiera Presupuestal</span></a>
                    <ul aria-expanded="false" class="collapse">
                        <li><a href="<%out.print(getServletContext().getContextPath());%>/finanzas/patrimonio" title="Estados de Cambio en el patrimonio Neto">Estados de Cambio en<br>el Patrimonio Neto</a></li>
                        <li><a href="<%out.print(getServletContext().getContextPath());%>/finanzas/flujoefectivo" title="Estados de Flujo de Efectivos">Estados de Flujo <br>de Efectivo</a></li>
                        <li><a href="<%out.print(getServletContext().getContextPath());%>/finanzas/gestion" title="Estados de Gesti�n">Estados de Gesti�n</a></li>
                        <li><a href="<%out.print(getServletContext().getContextPath());%>/finanzas/pendiente" title="Infraestructura Presupuestal y Financiera">I.P. Financiera</a></li>
                        <li><a href="<%out.print(getServletContext().getContextPath());%>/finanzas/saldos" title="Saldos de Balance">Saldos de Balance</a></li>
                    </ul>
                </li>
                <li> <a class="has-arrow waves-effect waves-dark" href="javascript:void(0)" aria-expanded="false"><i class="mdi mdi-bookmark-outline" title="Otros"></i><span class="hide-menu">Otros</span></a>
                    <ul aria-expanded="false" class="collapse">
                        <li><a href="<%out.print(getServletContext().getContextPath());%>/directoriostelefonicos" title="Directorio Telef�nico">Directorio Telef�nico</a></li>
                        <li><a href="<%out.print(getServletContext().getContextPath());%>/glosarios" title="Glosario de Terminos">Glosario Terminos</a></li>
                    </ul>
                </li>
                <li> <a class="has-arrow waves-effect waves-dark" href="javascript:void(0)" aria-expanded="false"><i class="mdi mdi-tab" title="Participaci�n Ciudadana"></i><span class="hide-menu">Participaci�n <br>Ciudadana</span></a>
                    <ul aria-expanded="false" class="collapse">
                        <li><a href="<%out.print(getServletContext().getContextPath());%>/participacionciudadana/comentariossugerencias" title="Comentarios y Sugerencias">Comentarios/Sugerencia</a></li>
                        <li><a href="<%out.print(getServletContext().getContextPath());%>/participacionciudadana/libroreclamaciones" title="Libro de Reclamaciones">Libro Reclamaciones</a></li>
                        <li><a href="<%out.print(getServletContext().getContextPath());%>/participacionciudadana/solicitudes" title="Solicitud 27806">Solicitud 27806</a></li>
                    </ul>
                </li>
                <li> <a class="has-arrow waves-effect waves-dark" href="javascript:void(0)" aria-expanded="false"><i class="ti-settings" title="Personalizaci�n"></i><span class="hide-menu">Personalizaci�n</span></a>
                    <ul aria-expanded="false" class="collapse">
                        <li><a href="<%out.print(getServletContext().getContextPath());%>/personalizacion/correo" title="Configuraci�n Correo">Conf. Correo</a></li>
                        <li><a href="<%out.print(getServletContext().getContextPath());%>/personalizacion/web" title="Configuraci�n Web">Conf. Web</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <!-- End Sidebar navigation -->
    </div>
    <!-- End Sidebar scroll-->
    <!-- Bottom points-->
    <div class="sidebar-footer">
        <!-- item--><a href="<%out.print(getServletContext().getContextPath());%>/personalizacion/web" class="link" data-toggle="tooltip" title="Settings"><i class="ti-settings"></i></a>
        <!-- item--><a href="<%out.print(getServletContext().getContextPath());%>/personalizacion/correo" class="link" data-toggle="tooltip" title="Email"><i class="mdi mdi-gmail"></i></a>
        <!-- item--><a href="<%out.print(getServletContext().getContextPath());%>/cerrarsession" class="link" data-toggle="tooltip" title="Cerrar Sesi�n"><i class="mdi mdi-power"></i></a>
    </div>
    <!-- End Bottom points-->
</aside>