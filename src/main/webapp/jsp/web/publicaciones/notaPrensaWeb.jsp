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
        <!-- magnific-popup -->
        <link href="<%out.print(getServletContext().getContextPath());%>/assets/magnific-popup/magnific-popup.css" rel="stylesheet">
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

        <link href="<%out.print(getServletContext().getContextPath());%>/assets/plugins/sweetalert/sweetalert.css"rel="stylesheet">


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
        <section class="section-padding grid-news">
            <div class="container">
                <div class="row" style="margin-bottom: 60px; display: none" id="contenedorNoticiaPrincial">
                    <div class='col-lg-8 col-xs-12'>
                        <article class='post-wrapper'>
                            <div class='thumb-wrapper waves-effect waves-block waves-light'>
                                <a><img id="idImgNoticiaPrincipal" src='' class='img-responsive' alt='imgNoticia'></a>
                            </div>
                            <div class='blog-content'>
                                <header class='entry-header-wrapper'>
                                    <div class='entry-header'>
                                        <h2 class='entry-title text-peam-negrita'><a id="idTituloNoticiaPrincipal" style="font-size: 23px;">Ideas That Moved Us in 2015</a></h2>
                                        <div class='entry-meta'>
                                            <ul class='list-inline'>
                                                <li>
                                                    <a id="idFuenteNoticiaPrincipal">PROYECTO ESPECIAL ALTO MAYO</a>
                                                </li>
                                                <li>
                                                    <i class='fa fa-clock-o'></i> <a id="idFechaPublicacionNoticiaPrincipal">Jan 15, 2016</a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </header>
                                <div class='entry-content text-peam' id="idContenidoNoticiaPrincipal" style="font-size: 17px;text-align: justify">
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
                <div class="text-center mb-30" style="margin-top: 40px;">
                    <h1 class="text-peam-verde h1-title" id="idTituloMasNoticias"><strong>Más Noticias</strong></h1>
                    <input type="hidden" id="idNota" value="<%out.print((request.getParameter("idNota") == null ? "-1" : request.getParameter("idNota")));%>">
                </div>
                <div class="row">
                    <div class="col-md-9" id="contenedorArticulos">
                        <!--div class="row" >

                        </div-->                        
                    </div>
                    <div class="col-md-3">
                        <div class="tt-sidebar-wrapper" role="complementary">
                            <div class="widget widget_search mb-20">
                                <div class="border-tab transparent-nav">
                                    <ul class="nav nav-tabs nav-justified" role="tablist">
                                        <li role="presentation" class="active"><a href="#tab-busquedas" class="waves-effect waves-dark"  role="tab" data-toggle="tab">BUSQUEDAS</a></li>
                                        <li role="presentation"><a href="#tab-filtros" class="waves-effect waves-dark" role="tab" data-toggle="tab">FILTROS</a></li>
                                    </ul>
                                    <div class="panel-body" style="padding-top: 15px; padding-bottom: 0px">
                                        <div class="tab-content">
                                            <div role="tabpanel" class="tab-pane fade in active" id="tab-busquedas">
                                                <form id="FrmNotaPrensa" role="search" class="search-form">
                                                    <input type="hidden" id="nameFormNotaPrensa" value="FrmNotaPrensa">
                                                    <input type="hidden" id="actionNotaPrensa" name="action" value="paginarNotaPrensa">
                                                    <input type="hidden" id="comboAnio" name="comboAnio" value="-1">
                                                    <input type="hidden" id="estadoNotaPrensa" name="estadoNotaPrensa" value="true">
                                                    <input type="hidden" id="numberPageNotaPrensa" name="numberPageNotaPrensa" value="1">
                                                    <input type="hidden" id="sizePageNotaPrensa" name="sizePageNotaPrensa" value="13">
                                                    <input type="text" class="form-control" value="" name="txtTituloNotaPrensa" id="txtTituloNotaPrensa" placeholder="Ingrese palabra...">
                                                    <button type="submit"><i class="fa fa-search"></i></button>

                                                </form>
                                            </div>
                                            <div role="tabpanel" class="tab-pane fade" id="tab-filtros">
                                                <div class="form-group col-xs-12">
                                                    <label for="sizePageNotaPrensa_" style="font-size: 14px;">N° Noticias a mostrar</label>
                                                    <select id="sizePageNotaPrensa_" idformulario="FrmNotaPrensa" idinput="sizePageNotaPrensa" class="form-control combo-paginar-formulario" style="border: 1px solid #8bc34a">
                                                        <option value="13">12</option>
                                                        <option value="16">15</option>
                                                        <option value="19">18</option>
                                                        <option value="22">21</option>
                                                        <option value="25">24</option>
                                                    </select>
                                                </div>
                                                <div class="form-group col-xs-12">
                                                    <label for="comboAnioNoticia_" style="font-size: 14px;">Año</label>
                                                    <select id="comboAnioNoticia_" idformulario="FrmNotaPrensa" idinput="comboAnio" class="form-control combo-paginar-formulario" style="border: 1px solid #8bc34a">
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row" id="loader_contenido">
                                            <div class="col-md-1 col-md-offset-5 col-xs-2 col-xs-offset-5 mt-30">
                                                <div class="loader-peam_small"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="widget widget_search mb-20">
                                <div class="fb-page" 
                                     data-href="https://web.facebook.com/Proyecto-Especial-Alto-Mayo-188571127885448/?ref=br_rs"
                                     data-width="380" 
                                     data-hide-cover="false"
                                     data-show-facepile="false"></div>
                            </div>

                            <%@ include file = "../../../menu_web_vertical.jsp" %> 
                        </div>
                    </div>
                </div>
                <!--ul class="pagination post-pagination text-center mt-50">
                    <li><a href="#" class="waves-effect waves-light"><i class="fa fa-angle-left"></i></a></li>
                    <li><span class="current waves-effect waves-light"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">1</font></font></span></li>
                    <li><a href="#" class="waves-effect waves-light"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">2</font></font></a></li>
                    <li><a href="#" class="waves-effect waves-light"><i class="fa fa-angle-right"></i></a></li>
                </ul-->
                <hr>
            </div>
        </section>
        <div class="modal fade" id="modalCargandoPublicacionesNP" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-hidden="true" style="padding-top: 18%; overflow-y: visible;">
            <div class="modal-dialog modal-sm">
                <div class="modal-content">
                    <div class="modal-body">
                        <div class="progress" style="margin-bottom: 0px;">
                            <div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 100%">
                                Cargando...
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@ include file = "../../../footer.jsp" %>  
        <!--div id="fb-root"></div>
        <script>(function (d, s, id) {
                var js, fjs = d.getElementsByTagName(s)[0];
                if (d.getElementById(id))
                    return;
                js = d.createElement(s);
                js.id = id;
                js.src = 'https://connect.facebook.net/es_LA/sdk.js#xfbml=1&version=v3.2';
                fjs.parentNode.insertBefore(js, fjs);
            }(document, 'script', 'facebook-jssdk'));</script-->

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
        <script src="<%out.print(getServletContext().getContextPath());%>/assets/magnific-popup/jquery.magnific-popup.min.js"></script>
        <script src="<%out.print(getServletContext().getContextPath());%>/assets/js/scripts.js"></script>

        <!-- RS5.0 Core JS Files -->
        <script src="<%out.print(getServletContext().getContextPath());%>/assets/plugins/sweetalert/sweetalert.min.js"></script>

        <script src="<%out.print(getServletContext().getContextPath());%>/assets/revolution/js/jquery.themepunch.tools.min.js"></script>
        <script src="<%out.print(getServletContext().getContextPath());%>/assets/revolution/js/jquery.themepunch.revolution.min.js"></script>
        <script type="text/javascript" src="<%out.print(getServletContext().getContextPath());%>/assets/plugins/toast-master/js/jquery.toast.js"></script>
        <script type="text/javascript" src="<%out.print(getServletContext().getContextPath());%>/js_app/utilities/lib-utilities.js"></script>
        <script type="text/javascript" src="<%out.print(getServletContext().getContextPath());%>/js_app/utilities/lib-validaciones.js"></script>
        <script type="text/javascript" src="<%out.print(getServletContext().getContextPath());%>/js/conf_web.js"></script>
        <script type="text/javascript" src="<%out.print(getServletContext().getContextPath());%>/js_app/web/publicaciones.js"></script>

    </body>
</html>