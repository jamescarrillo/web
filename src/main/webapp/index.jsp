<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="es">
    <head>
        <%@ include file = "att_head.jsp" %> 
        <link href='https://fonts.googleapis.com/css?family=Raleway:400,300,500,700,900' rel='stylesheet' type='text/css'>
        <!-- Material Icons CSS -->
        <link href="<%out.print(getServletContext().getContextPath());%>/assets/fonts/iconfont/material-icons.css" rel="stylesheet">
        <!-- FontAwesome CSS -->
        <link href="<%out.print(getServletContext().getContextPath());%>/assets/fonts/font-awesome/css/font-awesome.min.css" rel="stylesheet">
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
        <!-- RS5.0 Main Stylesheet -->
        <link rel="stylesheet" type="text/css" href="<%out.print(getServletContext().getContextPath());%>/assets/revolution/css/settings.css">
        <!-- RS5.0 Layers and Navigation Styles -->
        <link rel="stylesheet" type="text/css" href="<%out.print(getServletContext().getContextPath());%>/assets/revolution/css/layers.css">
        <link rel="stylesheet" type="text/css" href="<%out.print(getServletContext().getContextPath());%>/assets/revolution/css/navigation.css">
        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <body id="top" class="has-header-search">
        <%@ include file = "top_bar.jsp" %> 
        <div class="row" style="margin-top: 0px; margin-bottom: 0px;">
            <%@ include file = "container_logos.jsp" %> 
        </div>
        <%@ include file = "header.jsp" %> 
        <section class="rev_slider_wrapper">
            <div class="rev_slider materialize-slider">
                <ul>
                    <li data-transition="fade" data-slotamount="default"  data-easein="Power4.easeInOut" data-easeout="Power4.easeInOut" data-masterspeed="2000"  data-thumb="assets/img/banner/banner-1.jpg"  data-rotate="0"  data-fstransition="fade" data-fsmasterspeed="1500" data-fsslotamount="7" data-saveperformance="off"  data-title="materialize Material" data-description="">
                        <img src="assets/img/banner/banner-1.jpg"  alt=""  data-bgposition="center center" data-bgfit="cover" data-bgrepeat="no-repeat" data-bgparallax="10" class="rev-slidebg" data-no-retina>
                        <div class="tp-caption rev-heading text-extrabold dark-text tp-resizeme"
                             data-x="center"
                             data-y="center" data-voffset="-50" 
                             data-fontsize="['60','60','60','45']"
                             data-lineheight="['60','60','60','50']"
                             data-width="none"
                             data-height="none"
                             data-whitespace="nowrap"
                             data-transform_idle="o:1;"
                             data-transform_in="y:[100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;opacity:0;s:600;e:Power4.easeInOut;" 
                             data-transform_out="y:[100%];s:1000;e:Power2.easeInOut;s:1000;e:Power2.easeInOut;" 
                             data-mask_in="x:0px;y:[100%];s:inherit;e:inherit;" 
                             data-mask_out="x:inherit;y:inherit;s:inherit;e:inherit;" 
                             data-start="800" 
                             data-splitin="none" 
                             data-splitout="none" 
                             data-responsive_offset="on"
                             style="z-index: 5; white-space: nowrap;">Título de noticia #1
                        </div>
                        <!-- LAYER NR. 2 -->
                        <div class="tp-caption tp-resizeme rev-subheading  dark-text text-center"
                             data-x="center"
                             data-y="center" data-voffset="30"
                             data-whitespace="nowrap"
                             data-transform_idle="o:1;"

                             data-transform_in="y:[100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;opacity:0;s:600;e:Power4.easeInOut;" 
                             data-transform_out="y:[100%];s:1000;e:Power2.easeInOut;s:1000;e:Power2.easeInOut;" 
                             data-mask_in="x:0px;y:[100%];s:inherit;e:inherit;" 
                             data-mask_out="x:inherit;y:inherit;s:inherit;e:inherit;" 
                             data-start="1000" 
                             data-splitin="none" 
                             data-splitout="none" 
                             data-responsive_offset="on"
                             style="z-index: 6; white-space: nowrap;">Materialize is an interactive agency. Which develops websites <br> and premium mobile applications.
                        </div>
                        <!-- LAYER NR. 3 -->
                        <div class="tp-caption tp-resizeme rev-btn"
                             data-x="['center','center','center','center']" data-hoffset="['0','0','0','0']" 
                             data-y="['middle','middle','middle','middle']" data-voffset="['130','130','130','130']" 
                             data-width="none"
                             data-height="none"
                             data-whitespace="nowrap"
                             data-transform_idle="o:1;"
                             data-style_hover="cursor:default;"
                             data-transform_in="y:[100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;opacity:0;s:600;e:Power4.easeInOut;" 
                             data-transform_out="y:[100%];s:1000;e:Power2.easeInOut;s:1000;e:Power2.easeInOut;" 
                             data-mask_in="x:0px;y:[100%];s:inherit;e:inherit;" 
                             data-mask_out="x:inherit;y:inherit;s:inherit;e:inherit;" 
                             data-start="1200" 
                             data-splitin="none" 
                             data-splitout="none" 
                             data-responsive_offset="on"
                             style="z-index: 7; white-space: nowrap;">
                            <a href="#" class="btn btn-lg  waves-effect waves-light">Leer más</a>
                        </div>
                    </li>
                    <!-- slide 1 end -->
                    <!-- slide 2 start --> 
                    <li data-transition="fade" data-slotamount="default"  data-easein="Power4.easeInOut" data-easeout="Power4.easeInOut" data-masterspeed="2000"  data-thumb="assets/img/banner/banner-2.jpg"  data-rotate="0"  data-fstransition="fade" data-fsmasterspeed="1500" data-fsslotamount="7" data-saveperformance="off"  data-title="Unique Design" data-description="">
                        <!-- MAIN IMAGE -->
                        <img src="assets/img/banner/banner-2.jpg"  alt=""  data-bgposition="center center" data-bgfit="cover" data-bgrepeat="no-repeat" data-bgparallax="10" class="rev-slidebg" data-no-retina>
                        <!-- LAYER NR. 1 -->
                        <div class="tp-caption rev-heading text-extrabold dark-text tp-resizeme"
                             data-x="center"
                             data-y="center" data-voffset="-50" 
                             data-fontsize="['60','60','60','45']"
                             data-lineheight="['60','60','60','50']"
                             data-width="none"
                             data-height="none"
                             data-whitespace="nowrap"
                             data-transform_idle="o:1;"
                             data-transform_in="y:[100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;opacity:0;s:600;e:Power4.easeInOut;" 
                             data-transform_out="y:[100%];s:1000;e:Power2.easeInOut;s:1000;e:Power2.easeInOut;" 
                             data-mask_in="x:0px;y:[100%];s:inherit;e:inherit;" 
                             data-mask_out="x:inherit;y:inherit;s:inherit;e:inherit;" 
                             data-start="800" 
                             data-splitin="none" 
                             data-splitout="none" 
                             data-responsive_offset="on"
                             style="z-index: 5; white-space: nowrap;">Título de la segunda noticia
                        </div>
                        <!-- LAYER NR. 2 -->
                        <div class="tp-caption tp-resizeme rev-subheading dark-text text-center"
                             data-x="center"
                             data-y="center" data-voffset="30"
                             data-whitespace="nowrap"
                             data-transform_idle="o:1;"

                             data-transform_in="y:[100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;opacity:0;s:600;e:Power4.easeInOut;" 
                             data-transform_out="y:[100%];s:1000;e:Power2.easeInOut;s:1000;e:Power2.easeInOut;" 
                             data-mask_in="x:0px;y:[100%];s:inherit;e:inherit;" 
                             data-mask_out="x:inherit;y:inherit;s:inherit;e:inherit;" 
                             data-start="1000" 
                             data-splitin="none" 
                             data-splitout="none" 
                             data-responsive_offset="on"
                             style="z-index: 6; white-space: nowrap;">Materialize is an interactive agency. Which develops websites <br> and premium mobile applications.
                        </div>
                        <!-- LAYER NR. 3 -->
                        <div class="tp-caption tp-resizeme rev-btn"
                             data-x="['center','center','center','center']" data-hoffset="['0','0','0','0']" 
                             data-y="['middle','middle','middle','middle']" data-voffset="['130','130','130','130']" 
                             data-width="none"
                             data-height="none"
                             data-whitespace="nowrap"
                             data-transform_idle="o:1;"
                             data-style_hover="cursor:default;"
                             data-transform_in="y:[100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;opacity:0;s:600;e:Power4.easeInOut;" 
                             data-transform_out="y:[100%];s:1000;e:Power2.easeInOut;s:1000;e:Power2.easeInOut;" 
                             data-mask_in="x:0px;y:[100%];s:inherit;e:inherit;" 
                             data-mask_out="x:inherit;y:inherit;s:inherit;e:inherit;" 
                             data-start="1200" 
                             data-splitin="none" 
                             data-splitout="none" 
                             data-responsive_offset="on"
                             style="z-index: 7; white-space: nowrap;">
                            <a href="#" class="btn btn-lg  waves-effect waves-light">Leer más</a>
                        </div>
                    </li>
                    <!-- slide 2 end -->
                </ul>             
            </div><!-- end revolution slider -->
        </section><!-- end of slider wrapper -->
        <section class="section-padding">
            <div class="container">
                <div class="text-center">
                    <h1><strong>Líneas de Acción</strong></h1>
                </div>
                <div class="row">
                    <div class="clients-grid">
                        <div class="row">
                            <div class="col-md-3 col-sm-6">
                                <div class="text-center">
                                    <a href="#">
                                        <i class="fa fa-home fa-5x" aria-hidden="true"></i>
                                        <h5>DIRECCIÓN DE <br>INFRAESTRUCTURA</h5>
                                    </a>
                                </div><!-- /.border-box -->
                            </div><!-- /.col-md-3 -->
                            <div class="col-md-3 col-sm-6">
                                <div class="text-center">
                                    <a href="#">
                                        <i class="fa fa-pagelines fa-5x" aria-hidden="true"></i>
                                        <h5>DIRECCIÓN DE <br>MANEJO AMBIENTAL</h5>
                                    </a>
                                </div><!-- /.border-box -->
                            </div><!-- /.col-md-3 -->
                            <div class="col-md-3 col-sm-6">
                                <div class="text-center">
                                    <a href="#">
                                        <i class="fa fa-truck fa-5x" aria-hidden="true"></i>
                                        <h5>DIRECCIÓN DE DESARROLLO AGROPECUARIO</h5>
                                    </a>

                                </div><!-- /.border-box -->
                            </div><!-- /.col-md-3 -->
                            <div class="col-md-3 col-sm-6">
                                <div class="text-center">
                                    <a href="#">
                                        <i class="fa fa-graduation-cap fa-5x" aria-hidden="true"></i>
                                        <h5>ESTUDIOS</h5>
                                    </a>
                                </div><!-- /.border-box -->
                            </div><!-- /.col-md-3 -->
                        </div><!-- /.row -->
                    </div>
                </div><!-- /.col-md-12 -->
            </div><!-- /.row -->
        </section>
        <section class="section-padding" style="
                 padding-top: 0px;
                 padding-bottom: 50px;">
            <div class="container">
                <div class="text-center mb-80">
                    <h2 class="section-title text-uppercase"><strong>Noticias</strong></h2>
                    <p class="section-sub">Quisque non erat mi. Etiam congue et augue sed tempus. Aenean sed ipsum luctus, scelerisque ipsum nec, iaculis justo. Sed at vestibulum purus, sit amet viverra diam. Nulla ac nisi rhoncus,</p>
                </div>
                <div class="clients-grid gutter">
                </div><!-- /.clients-grid -->
            </div><!-- /.container -->
        </section>
        <section class="section-padding" style="
                 padding-top: 0px;
                 padding-bottom: 50px;">
            <div class="container">
                <div class="text-center mb-80">
                    <h2 class="section-title"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Agenda</font></font></h2>
                </div>
                <div class="row">
                    <div class="col-md-3 col-sm-6">
                        <div class="team-wrapper text-center">
                            <div class="team-img">
                                <a href="#"><img src="assets/img/team/team-1.jpg" class="img-responsive" alt="Imagen"></a>
                            </div><!-- /.team-img -->

                            <div class="team-title">
                                <h3><a href="#"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">John Smith</font></font></a></h3>
                                <span><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Gerenta General</font></font></span>
                            </div><!-- /.team-title -->

                            <ul class="team-social-links list-inline">
                                <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                <li><a href="#"><i class="fa fa-dribbble"></i></a></li>
                                <li><a href="#"><i class="fa fa-envelope-o"></i></a></li>
                            </ul>

                        </div><!-- /.team-wrapper -->
                    </div><!-- /.col-md-3 -->

                </div><!-- /.row -->

            </div><!-- /.container -->
        </section>
        <section class="section-padding" style="
                 padding-top: 0px;
                 padding-bottom: 50px;">
            <div class="container">
                <div class="text-center">
                    <h2 class="section-title"><strong>Favoritos</strong></h2>
                </div>
            </div>
            <div class="container-fluid">
                <div class="row no-gutter">
                    <div class="col-lg-1 col-md-2 col-sm-4">
                        <div class="featured-item border-box hover brand-hover" style="
                             padding-top: 20px;
                             padding-bottom: 20px; 
                             ">
                            <div class="icon mb-10">
                                <i class="material-icons brand-icon">description</i>
                            </div>
                            <div class="desc">
                                <a href="#"><h3>TUPA</h3></a>                              
                            </div>
                        </div><!-- /.featured-item -->
                    </div><!-- /.col-md-3 -->

                    <div class="col-lg-2 col-md-3 col-sm-4">
                        <div class="featured-item border-box hover brand-hover" style="
                             padding-top: 20px;
                             padding-bottom: 20px;
                             ">
                            <div class="icon mb-10">
                                <i class="material-icons brand-icon">gavel</i>
                            </div>
                            <div class="desc">
                                <a href="#"><h3>CÓDIGO DE ÉTICA</h3></a>
                            </div>
                        </div><!-- /.featured-item -->
                    </div><!-- /.col-md-3 -->

                    <div class="col-lg-1 col-md-2 col-sm-4">
                        <div class="featured-item border-box hover brand-hover" style="
                             padding-top: 20px;
                             padding-bottom: 20px;
                             ">
                            <div class="icon mb-10">
                                <i class="material-icons brand-icon">folder_open</i>
                            </div>
                            <div class="desc">
                                <a href="#"><h3>SISGEDO</h3></a>
                            </div>
                        </div><!-- /.featured-item -->
                    </div><!-- /.col-md-3 -->

                    <div class="col-lg-2 col-md-3 col-sm-4">
                        <div class="featured-item border-box hover brand-hover" style="
                             padding-top: 20px;
                             padding-bottom: 20px;
                             ">
                            <div class="icon mb-10">
                                <i class="material-icons brand-icon">local_library</i>
                            </div>
                            <div class="desc">
                                <a href="#"><h4 style="margin-bottom: 0px">LIBRO DE RECLAMACIONES</h4></a>
                            </div>
                        </div><!-- /.featured-item -->
                    </div><!-- /.col-md-3 -->
                    <div class="col-lg-3 col-md-4 col-sm-4">
                        <div class="featured-item border-box hover brand-hover" style="
                             padding-top: 20px;
                             padding-bottom: 20px;
                             ">
                            <div class="icon mb-10">
                                <i class="material-icons brand-icon">open_in_new</i>
                            </div>
                            <div class="desc">
                                <a href="#"><h4 style="margin-bottom: 0px">SOLICITUD DE ACCESO A INFORMACIÓN</h4></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-1 col-md-4 col-sm-4">
                        <div class="featured-item border-box hover brand-hover" style="
                             padding-top: 20px;
                             padding-bottom: 20px;
                             ">
                            <div class="icon mb-10">
                                <i class="material-icons brand-icon">insert_drive_file</i>
                            </div>
                            <div class="desc">
                                <a href="#"><h3>RESOLUCIONES</h3></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-4 col-sm-4">
                        <div class="featured-item border-box hover brand-hover" style="
                             padding-top: 20px;
                             padding-bottom: 20px;
                             ">
                            <div class="icon mb-10">
                                <i class="material-icons brand-icon">insert_drive_file</i>
                            </div>
                            <div class="desc">
                                <a href="#"><h3>CONTROL INTERNO</h3></a>
                            </div>
                        </div>
                    </div>
                </div><!-- /.row -->
            </div>
        </section>
        <section class="section-padding" style="
                 padding-top: 0px;
                 padding-bottom: 20px;">
            <div class="container">
                <div class="text-center">
                    <h3 class="section-title"><strong>Convocatorias</strong></h3>
                </div>
                <div class="row">
                    <div class="col-md-6 mb-50">
                        <div class="featured-item feature-icon icon-hover icon-hover-blue icon-outline">
                            <div class="icon" style="border: none">
                                <a>
                                    <i class="material-icons colored brand-icon">supervisor_account</i>
                                </a>
                            </div>
                            <div class="desc">
                                <h2 class="mt-20">Selección de Personal</h2>
                            </div>
                        </div><!-- /.featured-item -->
                    </div><!-- /.col-md-4 -->

                    <div class="col-md-6 mb-50">
                        <div class="featured-item feature-icon icon-hover icon-hover-blue icon-outline">
                            <div class="icon">
                                <i class="material-icons colored brand-icon">widgets</i>
                            </div>
                            <div class="desc">
                                <h2 class="mt-10">Bienes, Servicios, Obras y Conseciones</h2>
                            </div>
                        </div><!-- /.featured-item -->
                    </div><!-- /.col-md-4 -->
                </div>
            </div><!-- /.container -->
        </section>
        <section class="section-padding" style="
                 padding-top: 0px;
                 padding-bottom: 50px;">
            <div class="container">
                <div class="text-center">
                    <h2 class="section-title"><strong>Galería</strong></h2>
                </div>
                <div class="row">
                    <div class="col-md-8 col-md-offset-2">

                        <div class="gallery-thumb">
                            <ul class="slides">
                                <li data-thumb="assets/img/gallery/author-1.jpg">
                                    <img src="assets/img/gallery/author-1.jpg" alt="image">
                                </li>
                                <li data-thumb="assets/img/gallery/author-2.jpg">
                                    <img src="assets/img/gallery/author-2.jpg" alt="image">
                                </li>
                                <li data-thumb="assets/img/gallery/author-3.jpg">
                                    <img src="assets/img/gallery/author-3.jpg" alt="image">
                                </li>
                                <li data-thumb="assets/img/gallery/author-4.jpg">
                                    <img src="assets/img/gallery/author-4.jpg" alt="image">
                                </li>
                            </ul>
                        </div><!-- /.gallery-thumb -->
                    </div>
                </div><!-- /.row -->

            </div><!-- /.container -->
        </section>
        <!--div class="row">
            <div class="col-sm-3 col-md-2">
              <div class="thumbnail">
                <img src="https://farm1.staticflickr.com/853/28971176087_70e01e9ffb.jpg" alt="">
                <div class="text-center">
                        <button type="button" class="waves-effect waves-circle waves-light btn-floating btn-small grey lighten" tooltip="Mensajio">Ver</button>
                        <button type="button" class="waves-effect waves-circle waves-light btn-floating btn-small blue">Flikr</button>
                </div>
              </div>
            </div>
          </div-->
        <!--section class="row" style="
        padding-top: 0px;
        padding-bottom: 50px;">
        <div class="row">
            <div class="col-sm-6 col-xs-12">
                    
            </div>
        </div>
        </section-->
        <section class="section-padding" style="
                 padding-top: 0px;
                 padding-bottom: 50px;">
            <div class="container">
                <div class="text-center">
                    <h2 class="section-title"><strong>Multimedia</strong></h2>
                </div>
                <div class="row">
                    <div class="col-md-6 col-xs-12">
                        <div class="featured-item flat-border-box" style="padding: 25px">
                            <div class="embed-responsive embed-responsive-16by9">
                                <iframe class="embed-responsive-item" src="https://www.youtube.com/embed/zpOULjyy-n8?rel=0" allowfullscreen></iframe>
                            </div>
                        </div><!-- /.featured-item -->
                    </div><!-- /.col-md-4 -->
                    <div class="col-md-6 col-xs-12">
                        <div class="featured-item flat-border-box" style="padding: 25px">
                            <div class="embed-responsive embed-responsive-16by9">
                                <iframe class="embed-responsive-item" src="https://www.youtube.com/embed/zpOULjyy-n8?rel=0" allowfullscreen></iframe>
                            </div>
                        </div><!-- /.featured-item -->
                    </div><!-- /.col-md-4 -->

                    <div class="col-md-12 mt-10 text-center">
                        <a class="waves-effect waves-light btn">Ver todos</a>
                    </div>
                </div><!-- /.row -->

            </div><!-- /.container -->
        </section>
        <section class="section-padding" style="
                 padding-top: 0px;
                 padding-bottom: 50px;">

            <div class="container">
                <div class="text-center">
                    <h2 class="section-title"><strong>Gestión Transparente</strong></h2>
                </div>
            </div>
            <div class="container-fluid">
                <div class="row no-gutter">
                    <div class="col-md-2 col-md-offset-1 col-sm-6 col-sm-offset-0">
                        <div class="featured-item border-box hover brand-hover" style="
                             padding-top: 20px;
                             padding-bottom: 0px">
                            <div class="icon mb-5">
                                <i class="material-icons brand-icon">folder_open</i>
                            </div>
                            <div class="desc">
                                <a href="#"><h3>DOCUMENTOS DE GESTIÓN</h3></a>                              
                            </div>
                        </div><!-- /.featured-item -->
                    </div><!-- /.col-md-3 -->

                    <div class="col-md-2 col-sm-6">
                        <div class="featured-item border-box hover brand-hover" style="
                             padding-top: 20px;
                             padding-bottom: 0px">
                            <div class="icon mb-5">
                                <i class="material-icons brand-icon">trending_up</i>
                            </div>
                            <div class="desc">
                                <a href="#"><h3>PRESUPUESTOS Y FINANZAS</h3></a>
                            </div>
                        </div><!-- /.featured-item -->
                    </div><!-- /.col-md-3 -->

                    <div class="col-md-2 col-sm-4">
                        <div class="featured-item border-box hover brand-hover" style="
                             padding-top: 20px;
                             padding-bottom: 0px">
                            <div class="icon mb-5">
                                <i class="material-icons brand-icon">supervisor_account</i>
                            </div>
                            <div class="desc">
                                <a href="#"><h3>RECURSOS HUMANOS</h3></a>
                            </div>
                        </div><!-- /.featured-item -->
                    </div><!-- /.col-md-3 -->

                    <div class="col-md-2 col-sm-4">
                        <div class="featured-item border-box hover brand-hover" style="
                             padding-top: 20px;
                             padding-bottom: 20px">
                            <div class="icon mb-5">
                                <i class="material-icons brand-icon">local_library</i>
                            </div>
                            <div class="desc">
                                <a href="#"><h4 style="margin-bottom: 0px">ADQUISICIONES Y CONTRATACIONES</h4></a>
                            </div>
                        </div><!-- /.featured-item -->
                    </div><!-- /.col-md-3 -->
                    <div class="col-md-2 col-sm-4">
                        <div class="featured-item border-box hover brand-hover" style="
                             padding-top: 20px;
                             padding-bottom: 20px">
                            <div class="icon mb-5">
                                <i class="material-icons brand-icon">cached</i>
                            </div>
                            <div class="desc">
                                <a href="#"><h4 style="margin-bottom: 0px">MODIFICACIONES DEL PAC</h4></a>
                            </div>
                        </div><!-- /.featured-item -->
                    </div><!-- /.row -->
                </div>
        </section>
        <!--section class="section-padding" tyle="
        padding-top: 0px;
        padding-bottom: 50px;">
                <div class="container">
                  <div class="featured-carousel brand-dot">
                      <div class="featured-item border-box radius-4 hover brand-hover" style="padding-top: 20px;
                      padding-bottom: 20px; padding-left: 10px; padding-right: 10px;">
                          <div class="icon">
                              <i class="material-icons brand-icon">&#xE32A;</i>
                          </div>
                      </div>
    
                      <div class="featured-item border-box radius-4 hover brand-hover" style="padding-top: 20px;
                      padding-bottom: 20px; padding-left: 10px; padding-right: 10px;">
                          <div class="icon">
                              <i class="material-icons brand-icon">&#xE851;</i>
                          </div>
                      </div>
    
                      <div class="featured-item border-box radius-4 hover brand-hover" style="padding-top: 20px;
                      padding-bottom: 20px; padding-left: 10px; padding-right: 10px;">
                          <div class="icon">
                              <i class="material-icons brand-icon">&#xE8AF;</i>
                          </div>
                      </div>
    
                      <div class="featured-item border-box radius-4 hover brand-hover" style="padding-top: 20px;
                      padding-bottom: 20px; padding-left: 10px; padding-right: 10px;">
                          <div class="icon">
                              <i class="material-icons brand-icon">&#xE91D;</i>
                          </div>
                      </div>
    
                      <div class="featured-item border-box radius-4 hover brand-hover" style="padding-top: 20px;
                      padding-bottom: 20px; padding-left: 10px; padding-right: 10px;">
                          <div class="icon">
                              <i class="material-icons brand-icon">&#xE8CB;</i>
                          </div>
                      </div>
    
                      <div class="featured-item border-box radius-4 hover brand-hover" style="padding-top: 20px;
                      padding-bottom: 20px; padding-left: 10px; padding-right: 10px;">
                          <div class="icon">
                              <i class="material-icons brand-icon">&#xE8DC;</i>
                          </div>
                      </div>
    
                      <div class="featured-item border-box radius-4 hover brand-hover" style="padding-top: 20px;
                      padding-bottom: 20px; padding-left: 10px; padding-right: 10px;">
                          <div class="icon">
                              <i class="material-icons brand-icon">&#xE02C;</i>
                          </div>
                      </div>
                  </div>
    
                </div>
            </section-->
        <%@ include file = "footer.jsp" %>  
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
        <script src="<%out.print(getServletContext().getContextPath());%>/assets/js/scripts.js"></script>

        <!-- RS5.0 Core JS Files -->
        <script src="<%out.print(getServletContext().getContextPath());%>/assets/revolution/js/jquery.themepunch.tools.min.js"></script>
        <script src="<%out.print(getServletContext().getContextPath());%>/assets/revolution/js/jquery.themepunch.revolution.min.js"></script>
        <!-- SLIDER REVOLUTION 5.0 EXTENSIONS  (Load Extensions only on Local File Systems! The following part can be removed on Server for On Demand Loading) -->
        <script type="text/javascript" src="<%out.print(getServletContext().getContextPath());%>/assets/revolution/js/extensions/revolution.extension.video.min.js"></script>
        <script type="text/javascript" src="<%out.print(getServletContext().getContextPath());%>/assets/revolution/js/extensions/revolution.extension.slideanims.min.js"></script>
        <script type="text/javascript" src="<%out.print(getServletContext().getContextPath());%>/assets/revolution/js/extensions/revolution.extension.actions.min.js"></script>
        <script type="text/javascript" src="<%out.print(getServletContext().getContextPath());%>/assets/revolution/js/extensions/revolution.extension.layeranimation.min.js"></script>
        <script type="text/javascript" src="<%out.print(getServletContext().getContextPath());%>/assets/revolution/js/extensions/revolution.extension.kenburn.min.js"></script>
        <script type="text/javascript" src="<%out.print(getServletContext().getContextPath());%>/assets/revolution/js/extensions/revolution.extension.navigation.min.js"></script>
        <script type="text/javascript" src="<%out.print(getServletContext().getContextPath());%>/assets/revolution/js/extensions/revolution.extension.migration.min.js"></script>
        <script type="text/javascript" src="<%out.print(getServletContext().getContextPath());%>/assets/revolution/js/extensions/revolution.extension.parallax.min.js"></script>
        <script type="text/javascript">
            jQuery(document).ready(function () {

                jQuery(".materialize-slider").revolution({
                    sliderType: "standard",
                    sliderLayout: "fullwidth",
                    delay: 9000,
                    navigation: {
                        keyboardNavigation: "on",
                        keyboard_direction: "horizontal",
                        mouseScrollNavigation: "off",
                        onHoverStop: "off",
                        touch: {
                            touchenabled: "on",
                            swipe_threshold: 75,
                            swipe_min_touches: 1,
                            swipe_direction: "horizontal",
                            drag_block_vertical: false
                        },
                        arrows: {
                            style: "gyges",
                            enable: true,
                            hide_onmobile: false,
                            hide_onleave: true,
                            tmp: '',
                            left: {
                                h_align: "left",
                                v_align: "center",
                                h_offset: 10,
                                v_offset: 0
                            },
                            right: {
                                h_align: "right",
                                v_align: "center",
                                h_offset: 10,
                                v_offset: 0
                            }
                        }
                    },
                    responsiveLevels: [1240, 1024, 778, 480],
                    gridwidth: [1240, 1024, 778, 480],
                    gridheight: [500, 500, 500, 500],
                    disableProgressBar: "on",
                    parallax: {
                        type: "mouse",
                        origo: "slidercenter",
                        speed: 2000,
                        levels: [2, 3, 4, 5, 6, 7, 12, 16, 10, 50]
                    }
                });
            });
        </script>
        <script type="text/javascript" src="<%out.print(getServletContext().getContextPath());%>/js/conf_web.js"></script>
    </body>
</html>