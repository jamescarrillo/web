<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="es">
    <head>
        <%@ include file = "../../../att_head.jsp" %> 
        <link href='https://fonts.googleapis.com/css?family=Raleway:400,300,500,700,900' rel='stylesheet' type='text/css'>
        <!-- Material Icons CSS -->
        <link href="<%out.print(getServletContext().getContextPath());%>/assets/fonts/iconfont/material-icons.css" rel="stylesheet">
        <!-- FontAwesome CSS -->
        <link href="<%out.print(getServletContext().getContextPath());%>/assets/fonts/font-awesome/css/font-awesome.min.css" rel="stylesheet">
        <!-- flexslider -->
        <link href="<%out.print(getServletContext().getContextPath());%>/assets/flexSlider/flexslider.css" rel="stylesheet">
        <!-- materialize -->
        <link href="<%out.print(getServletContext().getContextPath());%>/assets/materialize/css/materialize.min.css" rel="stylesheet">
        <!-- Bootstrap -->
        <link href="<%out.print(getServletContext().getContextPath());%>/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="<%out.print(getServletContext().getContextPath());%>/assets/plugins/toast-master/css/jquery.toast.css" rel="stylesheet">
        <!-- shortcodes -->
        <link href="<%out.print(getServletContext().getContextPath());%>/assets/css/shortcodes/shortcodes.css" rel="stylesheet">
        <!-- Style CSS -->
        <link href="<%out.print(getServletContext().getContextPath());%>/css/style_web.css" rel="stylesheet">
        <link href="<%out.print(getServletContext().getContextPath());%>/css/views/estilos.css" rel="stylesheet">
        <link href="<%out.print(getServletContext().getContextPath());%>/assets/css/skins/corporate.css" rel="stylesheet">

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <body id="top" class="has-header-search">
        <%@ include file = "../../../top_bar.jsp" %> 
        <div class="header-sticky light-header">
            <%@ include file = "../../../container_logos.jsp" %> 
        </div>
        <%@ include file = "../../../header.jsp" %> 
        <section class="padding-bottom-100">
            <div class="container">
                <div class="text-center mb-30" style="margin-top: 60px;">
                    <h2 class="text-peam-verde-subrayado" style="font-size: 30px">Mapa de Sitio</h2>
                </div>

                <div class="row">
                    <div class="col-sm-6 col-sm-offset-3 col-xs-12 col-xs-offset-0">
                        <div class="panel-group feature-accordion brand-accordion icon plus-icon" id="accordion-two">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#accordion-two" href="#collapse-la-institucion" aria-expanded="false" class="collapsed">
                                            La Institución
                                        </a>
                                    </h3>
                                </div>
                                <div id="collapse-la-institucion" class="panel-collapse collapse" aria-expanded="false" style="height: 0px;">
                                    <div class="panel-body" style="margin: 20px">
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
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title">
                                        <a class="collapsed" data-toggle="collapse" data-parent="#accordion-two" href="#collapse-gestion-transparente" aria-expanded="false">
                                            Gestión Transparente
                                        </a>
                                    </h3>
                                </div>
                                <div id="collapse-gestion-transparente" class="panel-collapse collapse" aria-expanded="false" style="height: 0px;">
                                    <div class="panel-body" style="margin: 20px">
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
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title">
                                        <a class="collapsed" data-toggle="collapse" data-parent="#accordion-two" href="#collapse-convocatorias" aria-expanded="false">
                                            Convocatorias
                                        </a>
                                    </h3>
                                </div>
                                <div id="collapse-convocatorias" class="panel-collapse collapse" aria-expanded="false">
                                    <div class="panel-body" style="margin: 20px">
                                        <ul class="list-unstyled clearfix">
                                            <li><a href="<%out.print(getServletContext().getContextPath());%>/convocatorias/convocatoria-de-personal">Convocatorias de Personal</a></li>
                                            <li><a href="<%out.print(getServletContext().getContextPath());%>/convocatorias/convocatoria-de-bienes-y-servicios">Convocatorias de Bienes, Servicios, Obras y Concesiones</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title">
                                        <a class="collapsed" data-toggle="collapse" data-parent="#accordion-two" href="#collapse-publicaciones" aria-expanded="false">
                                            Publicaciones
                                        </a>
                                    </h3>
                                </div>
                                <div id="collapse-publicaciones" class="panel-collapse collapse" aria-expanded="false">
                                    <div class="panel-body" style="margin: 20px">
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
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title">
                                        <a class="collapsed" data-toggle="collapse" data-parent="#accordion-two" href="#collapse-servicios" aria-expanded="false">
                                            Servicios
                                        </a>
                                    </h3>
                                </div>
                                <div id="collapse-servicios" class="panel-collapse collapse" aria-expanded="false">
                                    <div class="panel-body" style="margin: 20px">
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h3 class="panel-title">
                                                    <a class="collapsed" data-toggle="collapse" data-parent="#accordion-3" href="#collapse-servicios-" aria-expanded="false">
                                                        Servicios
                                                    </a>
                                                </h3>
                                            </div>
                                            <div id="collapse-servicios-" class="panel-collapse collapse" aria-expanded="false">
                                                <div class="panel-body" style="margin: 20px">
                                                    <ul class="list-unstyled clearfix">
                                                        <li><a href="<%out.print(getServletContext().getContextPath());%>/login" target="_blank">Gestor de Contenidos</a></li>
                                                        <li><a href="http://doc.peam.gob.pe/sisgedo/app/main.php" target="_blank">Sistema de Trámite Documentario (SisGedo)</a></li>
                                                        <li><a href="http://siga.peam.gob.pe:8080/SIGAWEB/" target="_blank">Siga Web</a></li>
                                                        <li><a href="http://lib.peam.gob.pe:8081/ArcDig/" target="_blank">ArcDig</a></li>
                                                        <li><a href="http://lib.peam.gob.pe/Visitas/controlVisitas/index.php?r=consultas/visitaConsulta" target="_blank">Registro de Visitas en Línea</a></li>
                                                        <li><a href="https://correo.peam.gob.pe/" target="_blank">Correo Institucional</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h3 class="panel-title">
                                                    <a class="collapsed" data-toggle="collapse" data-parent="#accordion-3" href="#collapse-consultas" aria-expanded="false">
                                                        Consultas
                                                    </a>
                                                </h3>
                                            </div>
                                            <div id="collapse-consultas" class="panel-collapse collapse" aria-expanded="false">
                                                <div class="panel-body" style="margin: 20px">
                                                    <ul class="list-unstyled clearfix">
                                                        <li><a href="<%out.print(getServletContext().getContextPath());%>/glosario" target="_blank">Glosario</a></li>
                                                        <li><a href="<%out.print(getServletContext().getContextPath());%>/mapa-sitio" target="_blank">Mapa de Sitio</a></li>
                                                        <li><a href="<%out.print(getServletContext().getContextPath());%>/consultas/acceso-informacion">Acceso a la Información</a></li>
                                                        <li><a href="<%out.print(getServletContext().getContextPath());%>/consultas/libro-de-reclamaciones">Libro de Reclamaciones</a></li>
                                                        <li><a href="<%out.print(getServletContext().getContextPath());%>/consultas/consultas-y-sugerencias">Consultas y Sugerencias</a></li>
                                                        <li><a href="<%out.print(getServletContext().getContextPath());%>/consultas/portal-de-transparencia">Portal de Transparencia</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>                  
                    </div>
                </div>
                <hr>
            </div>
        </section>
        <%@ include file = "../../../footer.jsp" %>  
        <!-- jQuery -->
        <script src="<%out.print(getServletContext().getContextPath());%>/assets/js/jquery-2.1.3.min.js"></script>
        <script src="<%out.print(getServletContext().getContextPath());%>/assets/bootstrap/js/bootstrap.min.js"></script>
        <script src="<%out.print(getServletContext().getContextPath());%>/assets/materialize/js/materialize.min.js"></script>
        <script src="<%out.print(getServletContext().getContextPath());%>/assets/js/menuzord.js"></script>
        <script src="<%out.print(getServletContext().getContextPath());%>/assets/js/bootstrap-collapsecollapse.min.js"></script>
        <script src="<%out.print(getServletContext().getContextPath());%>/assets/js/jquery.easing.min.js"></script>
        <script src="<%out.print(getServletContext().getContextPath());%>/assets/js/jquery.sticky.min.js"></script>
        <script src="<%out.print(getServletContext().getContextPath());%>/assets/js/smoothscroll.min.js"></script>
        <script src="<%out.print(getServletContext().getContextPath());%>/assets/js/imagesloaded.js"></script>
        <script src="<%out.print(getServletContext().getContextPath());%>/assets/js/jquery.stellar.min.js"></script>
        <script src="<%out.print(getServletContext().getContextPath());%>/assets/js/jquery.inview.min.js"></script>
        <script src="<%out.print(getServletContext().getContextPath());%>/assets/js/jquery.shuffle.min.js"></script>
        <script src="<%out.print(getServletContext().getContextPath());%>/assets/flexSlider/jquery.flexslider-min.js"></script>
        <script src="<%out.print(getServletContext().getContextPath());%>/assets/js/scripts.js"></script>
        <script type="text/javascript" src="<%out.print(getServletContext().getContextPath());%>/assets/plugins/toast-master/js/jquery.toast.js"></script>
        <script type="text/javascript" src="<%out.print(getServletContext().getContextPath());%>/js_app/utilities/lib-utilities.js"></script>
        <script type="text/javascript" src="<%out.print(getServletContext().getContextPath());%>/js_app/utilities/lib-validaciones.js"></script>
        <script type="text/javascript" src="<%out.print(getServletContext().getContextPath());%>/js/conf_web.js"></script>

    </body>
</html>