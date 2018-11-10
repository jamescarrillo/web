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
                    <h2 class="text-peam-verde h1-title" style="font-size: 30px">Nuestras Líneas de Acción</h2>
                </div>
                <div class="row" style="margin-bottom: 60px;">
                    <div class='col-lg-8 col-xs-12'>
                        <article class='post-wrapper'>
                            <div class='thumb-wrapper waves-effect waves-block waves-light'>
                                <a><img src='<%out.print(getServletContext().getContextPath());%>/peam_resources/logos_complementos/lineas_accion/infraestructura.jpg' class='img-responsive' alt='imgNoticia'></a>
                            </div>
                            <div class='blog-content'>
                                <header class='entry-header-wrapper'>
                                    <div class='entry-header'>
                                        <h2 class='entry-title text-peam-negrita'><a id="idTituloNoticiaPrincipal" style="font-size: 23px;">Dirección de Infraestructura</a></h2>
                                        <div class='entry-meta'>
                                            <ul class='list-inline'>
                                                <li>
                                                    <a>PROYECTO ESPECIAL ALTO MAYO</a>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-2 col-lg-offset-5">
                                                <a><img class="img-responsive" src="<%out.print(getServletContext().getContextPath());%>/peam_resources/logos_complementos/lineas_accion/directores/director_infraestructura.jpg" alt=""></a>                
                                            </div>
                                            <div class="col-xs-12 text-center mt-10 mb-10">
                                                <i class='fa fa-user'></i> <a>Ing. John William Sanchez Rodriguez - DIRECTOR DE INFRAESTRUCTURA</a>
                                            </div>
                                        </div>
                                        <h2 class='text-peam-negrita'><a>Funciones</a></h2>
                                    </div>
                                </header>
                                <div class='entry-content text-peam' id="idContenidoNoticiaPrincipal" style="font-size: 18px;text-align: justify">
                                    <ul>
                                        <li><i class="fa fa-check-square-o"></i> Programar, controlar y supervisar la ejecución de obras que ejecute el Proyecto Especial.</li>
                                        <li><i class="fa fa-check-square-o"></i> Controlar y archivar los expedientes técnicos y planoteca especializada correspondientes a las obras dentro del ámbito del Proyecto Especial.</li>
                                        <li><i class="fa fa-check-square-o"></i> Efectuar el seguimiento a los contratos de ejecución y supervisión de obras, así como los contratos de bienes y servicios relacionados con la ejecución de obras por ejecución presupuestaria directa.</li>
                                        <li><i class="fa fa-check-square-o"></i> Supervisar las labores de mantenimiento y operación de las obras y equipos designados a su Dirección.</li>
                                        <li><i class="fa fa-check-square-o"></i> Dirigir y supervisar los cálculos de valorizaciones de obras y servicios que el Proyecto Especial ejecute.</li>
                                        <li><i class="fa fa-check-square-o"></i> Proponer a la Gerencia General la designación de los Comités para efectos de convocatorias y para la recepción y liquidaciones de obras.</li>
                                        <li><i class="fa fa-check-square-o"></i> Formular informes periódicos de avances de las obras y servicios.</li>
                                        <li><i class="fa fa-check-square-o"></i> Formular el Plan de Actividades y evaluar su cumplimiento.</li>
                                    </ul>
                                </div>
                                <footer class="entry-footer">
                                    <ul class="list-inline pull-left">
                                        <li><a href="#" title="Descargar en PDF"><i class="fa fa-file-pdf-o"></i></a></li>
                                        <li><a href="#" title="Descargar en WORD"><i class="fa fa-file-text"></i></a></li>
                                        <li><a href="#" title="Descargar en PPT"><i class="fa fa-file-powerpoint-o"></i></a></li>
                                    </ul>
                                </footer>
                            </div>
                        </article>
                    </div>
                    <div class="col-md-4">
                        <div class="tt-sidebar-wrapper" role="complementary">
                            <div class="widget widget_search mb-20">
                                <div class="fb-page" data-href="https://web.facebook.com/Proyecto-Especial-Alto-Mayo-188571127885448/?ref=br_rs" data-tabs="timeline" data-small-header="false" data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="true"><blockquote cite="https://web.facebook.com/Proyecto-Especial-Alto-Mayo-188571127885448/?ref=br_rs" class="fb-xfbml-parse-ignore"><a href="https://web.facebook.com/Proyecto-Especial-Alto-Mayo-188571127885448/?ref=br_rs">Proyecto Especial Alto Mayo</a></blockquote></div>
                            </div>
                        </div>
                    </div>
                </div>
                <hr>
            </div><!-- /.container -->
        </section>
        <%@ include file = "../../../footer.jsp" %>  
        <div id="fb-root"></div>
        <script>(function (d, s, id) {
                var js, fjs = d.getElementsByTagName(s)[0];
                if (d.getElementById(id))
                    return;
                js = d.createElement(s);
                js.id = id;
                js.src = 'https://connect.facebook.net/es_LA/sdk.js#xfbml=1&version=v3.2';
                fjs.parentNode.insertBefore(js, fjs);
            }(document, 'script', 'facebook-jssdk'));</script>
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