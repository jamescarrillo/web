<!DOCTYPE html>
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
        <!-- owl.carousel -->
        <link href="<%out.print(getServletContext().getContextPath());%>/assets/owl.carousel/assets/owl.carousel.css" rel="stylesheet">
        <link href="<%out.print(getServletContext().getContextPath());%>/assets/owl.carousel/assets/owl.theme.default.min.css" rel="stylesheet">
        <!-- flexslider -->
        <link href="<%out.print(getServletContext().getContextPath());%>/assets/flexSlider/flexslider.css" rel="stylesheet">
        <!-- materialize -->
        <link href="<%out.print(getServletContext().getContextPath());%>/assets/materialize/css/materialize.min.css" rel="stylesheet">
        <!-- Bootstrap -->
        <link href="<%out.print(getServletContext().getContextPath());%>/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet">
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
        <section class="padding-bottom-100">
            <div class="container">
                <div class="row" style="margin-top: 60px;">
                    <div class="col-xs-12" id="articuloPrincipal">
                        <article class="post-wrapper">
                            <div class="thumb-wrapper">
                                <img src="assets/img/blog/blog-3.jpg" class="img-responsive" alt="">

                                <div class="entry-header">
                                    <span class="posted-in">
                                        <a href="#"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Tecnología</font></font></a>
                                    </span>

                                    <h2 class="entry-title"><a href="#"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">el titulo super duper stantaer va aqui</font></font></a></h2>

                                </div><!-- .entry-header -->

                                <div class="author-thumb waves-effect waves-light">
                                    <a href="#"><img src="assets/img/blog/author.jpg" alt=""></a>                
                                </div>

                                <span class="post-comments-number">
                                    <i class="fa fa-comments"></i><a href="#"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">25</font></font></a>
                                </span>

                            </div><!-- .post-thumb -->
                            <div class="entry-content">
                                <p><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</font></font></p>
                            </div><!-- .entry-content -->
                        </article><!-- /.post-wrapper -->
                    </div>
                </div>
                <hr>
                <div class="text-center mb-30" style="margin-top: 40px;">
                    <h2><strong>MÁS NOTICIAS</strong></h2>
                    <input type="hidden" id="idNotaPrensa" value="<%out.print(request.getParameter("idNotaPrensa"));%>">
                </div>
                <div class="row">
                    <div class="col-md-9">
                        <div class="row" id="contenedorArticulos">
                            <div class="col-md-6">
                                <article class="post-wrapper">
                                    <div class="thumb-wrapper">
                                        <img src="assets/img/blog/blog-3.jpg" class="img-responsive" alt="">
                                        <div class="entry-header">
                                            <span class="posted-in">
                                                <a href="#"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Tecnología</font></font></a>
                                            </span>

                                            <h2 class="entry-title"><a href="#"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">el titulo super duper stantaer va aqui</font></font></a></h2>

                                        </div><!-- .entry-header -->

                                        <div class="author-thumb waves-effect waves-light">
                                            <a href="#"><img src="assets/img/blog/author.jpg" alt=""></a>                
                                        </div>

                                        <span class="post-comments-number">
                                            <i class="fa fa-comments"></i><a href="#"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">25</font></font></a>
                                        </span>

                                    </div><!-- .post-thumb -->


                                    <div class="entry-content">
                                        <p><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</font></font></p>
                                    </div><!-- .entry-content -->

                                </article><!-- /.post-wrapper -->
                            </div><!-- /.col-md-6 -->
                            <div class="col-md-6">
                                <article class="post-wrapper">
                                    <div class="thumb-wrapper">
                                        <img src="assets/img/blog/blog-4.jpg" class="img-responsive" alt="">
                                        <div class="entry-header">
                                            <span class="posted-in">
                                                <a href="#"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Material</font></font></a>
                                            </span>

                                            <h2 class="entry-title"><a href="#"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">el titulo super duper stantaer va aqui</font></font></a></h2>

                                        </div><!-- .entry-header -->

                                        <div class="author-thumb waves-effect waves-light">
                                            <a href="#"><img src="assets/img/blog/author.jpg" alt=""></a>                
                                        </div>

                                        <span class="post-comments-number">
                                            <i class="fa fa-comments"></i><a href="#"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">25</font></font></a>
                                        </span>

                                    </div><!-- .post-thumb -->


                                    <div class="entry-content">
                                        <p><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</font></font></p>
                                    </div><!-- .entry-content -->

                                </article><!-- /.post-wrapper -->
                            </div><!-- /.col-md-6 -->
                            <div class="col-md-6">
                                <article class="post-wrapper">

                                    <div class="thumb-wrapper">
                                        <img src="assets/img/blog/blog-5.jpg" class="img-responsive" alt="">

                                        <div class="entry-header">
                                            <span class="posted-in">
                                                <a href="#"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Tecnología</font></font></a>
                                            </span>

                                            <h2 class="entry-title"><a href="#"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">el titulo super duper stantaer va aqui</font></font></a></h2>

                                        </div><!-- .entry-header -->

                                        <div class="author-thumb waves-effect waves-light">
                                            <a href="#"><img src="assets/img/blog/author.jpg" alt=""></a>                
                                        </div>

                                        <span class="post-comments-number">
                                            <i class="fa fa-comments"></i><a href="#"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">25</font></font></a>
                                        </span>

                                    </div><!-- .post-thumb -->


                                    <div class="entry-content">
                                        <p><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</font></font></p>
                                    </div><!-- .entry-content -->

                                </article><!-- /.post-wrapper -->
                            </div><!-- /.col-md-6 -->
                            <div class="col-md-6">
                                <article class="post-wrapper">

                                    <div class="thumb-wrapper">
                                        <img src="assets/img/blog/blog-4.jpg" class="img-responsive" alt="">

                                        <div class="entry-header">
                                            <span class="posted-in">
                                                <a href="#"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Material</font></font></a>
                                            </span>

                                            <h2 class="entry-title"><a href="#"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">el titulo super duper stantaer va aqui</font></font></a></h2>

                                        </div><!-- .entry-header -->

                                        <div class="author-thumb waves-effect waves-light">
                                            <a href="#"><img src="assets/img/blog/author.jpg" alt=""></a>                
                                        </div>

                                        <span class="post-comments-number">
                                            <i class="fa fa-comments"></i><a href="#"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">25</font></font></a>
                                        </span>

                                    </div><!-- .post-thumb -->


                                    <div class="entry-content">
                                        <p><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</font></font></p>
                                    </div><!-- .entry-content -->

                                </article><!-- /.post-wrapper -->
                            </div><!-- /.col-md-6 -->
                        </div>                        
                    </div>
                    <div class="col-md-3">
                        <div class="tt-sidebar-wrapper" role="complementary">
                            <div class="widget widget_search mb-20">
                                <form id="FrmNotaPrensa" role="search" class="search-form">
                                    <input type="hidden" id="nameFormNotaPrensa" value="FrmNotaPrensa">
                                    <input type="hidden" id="actionNotaPrensa" name="action" value="paginarNotaPrensa">
                                    <input type="hidden" id="comboAnio" name="comboAnio" value="">
                                    <input type="hidden" id="numberPageNotaPrensa" name="numberPageNotaPrensa" value="1">
                                    <input type="hidden" id="sizePageNotaPrensa" name="sizePageNotaPrensa" value="6">
                                    <input type="text" class="form-control" value="" name="txtTituloNotaPrensa" id="txtTituloNotaPrensa" placeholder="Buscar...">
                                    <button type="submit"><i class="fa fa-search"></i></button>
                                </form>
                            </div>
                            <%@ include file = "../../../menu_web_vertical.jsp" %> 
                        </div>
                    </div>
                </div>
                <ul class="pagination post-pagination text-center mt-50">
                    <li><a href="#" class="waves-effect waves-light"><i class="fa fa-angle-left"></i></a></li>
                    <li><span class="current waves-effect waves-light"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">1</font></font></span></li>
                    <li><a href="#" class="waves-effect waves-light"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">2</font></font></a></li>
                    <li><a href="#" class="waves-effect waves-light"><i class="fa fa-angle-right"></i></a></li>
                </ul>
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
        <script src="<%out.print(getServletContext().getContextPath());%>/assets/owl.carousel/owl.carousel.min.js"></script>
        <script src="<%out.print(getServletContext().getContextPath());%>/assets/flexSlider/jquery.flexslider-min.js"></script>
        <script src="<%out.print(getServletContext().getContextPath());%>/assets/magnific-popup/jquery.magnific-popup.min.js"></script>
        <script src="<%out.print(getServletContext().getContextPath());%>/assets/js/scripts.js"></script>

        <!-- RS5.0 Core JS Files -->
                <script src="<%out.print(getServletContext().getContextPath());%>/assets/plugins/sweetalert/sweetalert.min.js"></script>

        <script src="<%out.print(getServletContext().getContextPath());%>/assets/revolution/js/jquery.themepunch.tools.min.js"></script>
        <script src="<%out.print(getServletContext().getContextPath());%>/assets/revolution/js/jquery.themepunch.revolution.min.js"></script>
        <script type="text/javascript" src="<%out.print(getServletContext().getContextPath());%>/js/conf_web.js"></script>
        <script type="text/javascript" src="<%out.print(getServletContext().getContextPath());%>/js_app/utilities/lib-utilities.js"></script>
        <script type="text/javascript" src="<%out.print(getServletContext().getContextPath());%>/js_app/utilities/lib-validaciones.js"></script>
        <script type="text/javascript" src="<%out.print(getServletContext().getContextPath());%>/js_app/web/publicaciones.js"></script>

    </body>
</html>