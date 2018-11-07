<!DOCTYPE html>
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
        <section class="padding-bottom-100" style="padding-top: 50px">
            <div class="container">
                <div class="text-center mb-30" style="margin-top: 20px;">
                    <h2 class="text-peam-verde h1-title" style="font-size: 30px">Objetivos y Funciones</h2>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="border-tab transparent-nav">
                            <!-- Nav tabs -->
                            <ul class="nav nav-tabs nav-justified" role="tablist">
                                <li role="presentation" class="active"><a href="#tab-objetivos" class="waves-effect waves-dark"  role="tab" data-toggle="tab">Objetivos Estratégicos</a></li>
                                <li role="presentation"><a href="#tab-funciones" class="waves-effect waves-dark" role="tab" data-toggle="tab">Funciones</a></li>
                            </ul>
                            <!-- Tab panes -->
                            <div class="panel-body">
                                <div class="tab-content">
                                    <div role="tabpanel" class="tab-pane fade in active" id="tab-objetivos">
                                        <div class="container text-peam" style="font-size: 16px;text-align: justify">
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <i class="material-icons">check_circle_outline</i>
                                                    Fortalecer la especializaci&oacute;n de las personas por desempe&ntilde;o.
                                                </div>
                                                <div class="col-md-6">
                                                    <i class="material-icons">check_circle_outline</i>
                                                    Implementar metodolog&iacute;as con evidencia comprobada sectoriales.
                                                </div>
                                                <div class="col-md-6">
                                                    <i class="material-icons">check_circle_outline</i>
                                                    Desarrollar mecanismos simplificados de acceso a la informaci&oacute;n y &eacute;tica p&uacute;blica.
                                                </div>
                                                <div class="col-md-6">
                                                    <i class="material-icons">check_circle_outline</i>
                                                    Producir bienes y servicios especializados estandarizados de acuerdo a las expectativas de la ciudadan&iacute;a.
                                                </div>
                                                <div class="col-md-6">
                                                    <i class="material-icons">check_circle_outline</i>
                                                    Implementar la gesti&oacute;n por procesos mediante el fortalecimiento organizacional.
                                                </div>
                                                <div class="col-md-6">
                                                    <i class="material-icons">check_circle_outline</i>
                                                    Desarrollar intervenciones operativas mediante la inversi&oacute;n p&uacute;blica y privada.
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div role="tabpanel" class="tab-pane fade" id="tab-funciones">
                                        <div class="container text-peam" style="font-size: 16px;text-align: justify">
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <i class="material-icons">check_circle_outline</i>
                                                    Formular el Plan Estratégico de Desarrollo del PEAM, en armonía con los Planes Estratégicos Regional y Nacional, y los objetivos del Proyecto, y de acuerdo a lo establecido en los Convenios de Cooperación Técnica Internacional que le corresponda ejecutar.
                                                </div>
                                                <div class="col-md-6">
                                                    <i class="material-icons">check_circle_outline</i>
                                                    Formular los Poyectos Anuales de Presupuesto de la Institución y gestiona su aprobación en los diferentes niveles: GRSM, Dirección Nacional del Presuspuesto Público-MEF y Comisión de Presupuesto del Congreso de la República.
                                                </div>
                                                <div class="col-md-6">
                                                    <i class="material-icons">check_circle_outline</i>
                                                    Programa, dirige, ejecuta, controla y supervisa las diferentes obras y actividades para el cumplimiento de las metas físicas y financieras en función de los recursos económicos asignados.
                                                </div>
                                                <div class="col-md-6">
                                                    <i class="material-icons">check_circle_outline</i>
                                                    Contratación de empresas y personas naturales o jurídicas para la ejecución de estudios y obras de los Proyectos a su cargo, de acuerdo con las exigencias de la Ley y Reglamento de Adquisiciones y Contrataciones del Estado.
                                                </div>
                                                <div class="col-md-6">
                                                    <i class="material-icons">check_circle_outline</i>
                                                    Evalúa la gestión y el nivel de ejecución de las diferentes obras o proyectos productivos, en función de la programación anual, teniendo en cuenta el diseño total del Proyecto sujeto a evaluación.
                                                </div>
                                                <div class="col-md-6">
                                                    <i class="material-icons">check_circle_outline</i>
                                                    Realizar el seguimiento y evaluación de los efectos e impactos de la ejecución del PEAM, sobre el incremento de la producción y productividad agropecuaria en el area de influencia y aréas adyacentes, sobre el nivel de vida de la población y sobre la economía en conjunto, estableciendo compraciones con las metas obtenidas en períodos anteriores.
                                                </div>

                                                <div class="col-md-6">
                                                    <i class="material-icons">check_circle_outline</i>
                                                    Coordina con el GRSM, los aspectos técnicos, jurídicos, normativos, laborales, económicos y financieros relacionados con la ejecución del PEAM.
                                                </div>
                                                <div class="col-md-6">
                                                    <i class="material-icons">check_circle_outline</i>
                                                    Investiga y realiza acciones de difusión en aspectos relevantes para el desarrollo de los proyectos a su cargo, tales tales como la conservación, mejoramiento y uso adecuado de los recursos agua, suelo y bosques, manejo integral de cuencas, ecosistemas y aprovechamiento adecuado de los recursos naturales.
                                                </div>
                                                <div class="col-md-6">
                                                    <i class="material-icons">check_circle_outline</i>
                                                    Promueve la participación de los beneficios de las obras o proyectos ejecutados, ademas de propiciar la inversión privado en proyectos agropecuarios y agroindustriales, principalmente de aquellos orientados a la exportación.
                                                </div>
                                                <div class="col-md-6">
                                                    <i class="material-icons">check_circle_outline</i>
                                                    Ejecuta los estudios de factibilidad que sean necesarios en apoyo al desarrollo de proyectos específicos de inversión.
                                                </div>
                                                <div class="col-md-6">
                                                    <i class="material-icons">check_circle_outline</i>
                                                    Otras que le asigne el GRSM.
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div><!-- /.border-bottom-tab -->
                    </div><!-- /.col-md-12 -->
                </div><!-- /.row -->

                <hr>

            </div><!-- /.container -->
        </section>
        <%@ include file = "../../../footer.jsp" %>  
        <!-- jQuery -->
        <script src="<%out.print(getServletContext().getContextPath());%>/assets/js/jquery-2.1.3.min.js"></script>
        <script src="<%out.print(getServletContext().getContextPath());%>/assets/bootstrap/js/bootstrap.min.js"></script>
        <script src="<%out.print(getServletContext().getContextPath());%>/assets/materialize/js/materialize.min.js"></script>
        <script src="<%out.print(getServletContext().getContextPath());%>/assets/js/menuzord.js"></script>
        <script src="<%out.print(getServletContext().getContextPath());%>/assets/js/bootstrap-tabcollapse.min.js"></script>
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