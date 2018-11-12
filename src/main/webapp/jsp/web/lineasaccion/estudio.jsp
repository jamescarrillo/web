<%@page import="java.util.List"%>
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
                                <a><img src='<%out.print(getServletContext().getContextPath());%>/peam_resources/logos_complementos/lineas_accion/<%out.print(request.getAttribute("foto_banner"));%>' class='img-responsive' alt='img-banner'></a>
                            </div>
                            <div class='blog-content'>
                                <header class='entry-header-wrapper'>
                                    <div class='entry-header'>
                                        <h2 class='entry-title text-peam-negrita'><a style="font-size: 21px;"><%out.print(request.getAttribute("title_linea_accion"));%></a></h2>
                                        <div class='entry-meta'>
                                            <ul class='list-inline'>
                                                <li>
                                                    <a>PROYECTO ESPECIAL ALTO MAYO</a>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-2 col-lg-offset-5 col-sm-4 col-sm-offset-4 col-xs-6 col-xs-offset-3">
                                                <a><img class="img-responsive" src="<%out.print(getServletContext().getContextPath());%>/peam_resources/logos_complementos/lineas_accion/directores/<%out.print(request.getAttribute("foto_director"));%>" alt="img-director"></a>                
                                            </div>
                                            <div class="col-xs-12 text-center mt-10 mb-10">
                                                <i class='fa fa-user'></i><a> <%out.print(request.getAttribute("director_cargo"));%></a>
                                            </div>
                                        </div>
                                        <h2 class='text-peam-negrita'><a>Funciones</a></h2>
                                    </div>
                                </header>
                                <div class='entry-content text-peam' id="idContenidoNoticiaPrincipal" style="font-size: 18px;text-align: justify">
                                    <ul>
                                        <%
                                            List<String> list = (List<String>) request.getAttribute("funciones");
                                            for (int i = 0; i < list.size(); i++) {
                                                out.print("<li><i class='fa fa-check-square-o'></i> " + list.get(i) + "</li>");
                                            }
                                        %>
                                    </ul>
                                </div>
                                <br>
                                <footer class="entry-footer">
                                    <div class='text-center'>
                                        <h3 class='text-peam-negrita'><a>Ultimos Estudios</a></h3>
                                    </div>
                                    <div class='text-center'>
                                        <a style="margin-top: 5px;height: 30px; padding-top: 2px; padding-bottom: 2px;" class='waves-effect waves-light btn' href='http://ofi5.mef.gob.pe/sosem2/' target="_blank">PROYECTOS POR CÓDIGO SNIP</a>
                                        <a style="margin-top: 5px;height: 30px; padding-top: 2px; padding-bottom: 2px;" class='waves-effect waves-light btn' href='http://ofi5.mef.gob.pe/wp/BusquedaAvanzada.aspx' target="_blank">PROYECTOS POR UNIDAD FORMULADA</a>
                                    </div>
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
                        <%@ include file = "../../../menu_web_vertical_lineas.jsp" %> 
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