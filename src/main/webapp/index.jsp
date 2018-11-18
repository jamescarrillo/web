<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="es">
    <head>
        <%@ include file="att_head.jsp"%>
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
        <link href="<%out.print(getServletContext().getContextPath());%>/assets/plugins/toast-master/css/jquery.toast.css" rel="stylesheet">
        <!-- Bootstrap -->
        <link href="<%out.print(getServletContext().getContextPath());%>/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <!-- shortcodes -->
        <link href="<%out.print(getServletContext().getContextPath());%>/assets/css/shortcodes/shortcodes.css" rel="stylesheet">
        <link href="<%out.print(getServletContext().getContextPath());%>/assets/magnific-popup/magnific-popup.css" rel="stylesheet">
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
        <%@ include file="top_bar.jsp"%>
        <div class="row" style="margin-top: 0px; margin-bottom: 0px;">
            <%@ include file="container_logos.jsp"%>
        </div>
        <%@ include file="header.jsp"%>
        <form id="FrmNotaPrensa" role="search" class="search-form">
            <input type="hidden" id="nameFormNotaPrensa" value="FrmNotaPrensa">
            <input type="hidden" id="actionNotaPrensa" name="action" value="paginarNotaPrensa">
            <input type="hidden" id="comboAnio" name="comboAnio" value="-1">
            <input type="hidden" id="estadoNotaPrensa" name="estadoNotaPrensa" value="true">
            <input type="hidden" id="numberPageNotaPrensa" name="numberPageNotaPrensa" value="1">
            <input type="hidden" id="sizePageNotaPrensa" name="sizePageNotaPrensa" value="10">
            <input type="hidden" class="form-control" value="" name="txtTituloNotaPrensa" id="txtTituloNotaPrensa" placeholder="Buscar...">
        </form>
        <div class="row" id="loader_contenido">
            <div class="col-md-2 col-md-offset-5 col-xs-4 col-xs-offset-4 mt-50">
                <div class="loader-peam"></div>
            </div>
        </div>
        <section class="rev_slider_wrapper noticias-peam">
            <div class="rev_slider materialize-slider">
                <ul>
                    <li data-transition="fade" data-slotamount="default"
                        data-easein="Power4.easeInOut" data-easeout="Power4.easeInOut"
                        data-masterspeed="2000" data-thumb="assets/img/banner/banner-2.jpg"
                        data-rotate="0" data-fstransition="fade" data-fsmasterspeed="1500"
                        data-fsslotamount="7" data-saveperformance="off"
                        data-title="materialize Material" data-description=""><img
                            src="assets/img/banner/banner-2.jpg" alt=""
                            data-bgposition="center center" data-bgfit="cover"
                            data-bgrepeat="no-repeat" data-bgparallax="10" class="rev-slidebg"
                            data-no-retina>
                        <div
                            class="tp-caption rev-heading text-extrabold dark-text tp-resizeme "
                            data-x="center" data-y="center" data-voffset="-50"
                            data-fontsize="['30','25','20','15']"
                            data-lineheight="['30','25','20','15']" data-width="none"
                            data-height="none" data-whitespace="nowrap"
                            data-transform_idle="o:1;"
                            data-transform_in="y:[100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;opacity:0;s:600;e:Power4.easeInOut;"
                            data-transform_out="y:[100%];s:1000;e:Power2.easeInOut;s:1000;e:Power2.easeInOut;"
                            data-mask_in="x:0px;y:[100%];s:inherit;e:inherit;"
                            data-mask_out="x:inherit;y:inherit;s:inherit;e:inherit;"
                            data-start="800" data-splitin="none" data-splitout="none"
                            data-responsive_offset="on"
                            style="z-index: 5; white-space: nowrap;">
                            <div class="text-center" id="tituloNotaPrensa1">

                            </div>
                        </div>
                        <div
                            class="tp-caption tp-resizeme rev-subheading  dark-text text-center"
                            data-x="center" data-y="center" data-voffset="30"
                            data-fontsize="['20','20','15','10']"
                            data-lineheight="['20','20','15','10']" data-width="none"
                            data-whitespace="nowrap" data-transform_idle="o:1;"
                            data-transform_in="y:[100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;opacity:0;s:600;e:Power4.easeInOut;"
                            data-transform_out="y:[100%];s:1000;e:Power2.easeInOut;s:1000;e:Power2.easeInOut;"
                            data-mask_in="x:0px;y:[100%];s:inherit;e:inherit;"
                            data-mask_out="x:inherit;y:inherit;s:inherit;e:inherit;"
                            data-start="1000" data-splitin="none" data-splitout="none"
                            data-responsive_offset="on"
                            style="z-index: 6; white-space: nowrap;">
                            <div id="resumenNotaPrensa1" class="text-left">
                            </div>
                        </div> 
                        <div class="tp-caption tp-resizeme rev-btn"
                             data-x="['center','center','center','center']"
                             data-hoffset="['0','0','0','0']"
                             data-y="['middle','middle','middle','middle']"
                             data-voffset="['130','130','130','130']" data-width="none"
                             data-height="none" data-whitespace="nowrap"
                             data-transform_idle="o:1;" data-style_hover="cursor:default;"
                             data-transform_in="y:[100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;opacity:0;s:600;e:Power4.easeInOut;"
                             data-transform_out="y:[100%];s:1000;e:Power2.easeInOut;s:1000;e:Power2.easeInOut;"
                             data-mask_in="x:0px;y:[100%];s:inherit;e:inherit;"
                             data-mask_out="x:inherit;y:inherit;s:inherit;e:inherit;"
                             data-start="1200" data-splitin="none" data-splitout="none"
                             data-responsive_offset="on"
                             style="z-index: 7; white-space: nowrap;">
                            <form class="form-ver-noticia" method="POST" action="publicaciones/noticias/notas-de-prensa">
                                <input type="hidden" name="idNota" id="idNota1" value="">
                                <input type="hidden" name="action" id="action1" value="readNotaPrensa">
                                <button type="submit" class="btn btn-lg  waves-effect waves-light" style="font-size: 18px;">Leer más</button>
                            </form>
                        </div>
                    </li>
                    <li data-transition="fade" data-slotamount="default"
                        data-easein="Power4.easeInOut" data-easeout="Power4.easeInOut"
                        data-masterspeed="2000" data-thumb="assets/img/banner/banner-2.jpg"
                        data-rotate="0" data-fstransition="fade" data-fsmasterspeed="1500"
                        data-fsslotamount="7" data-saveperformance="off"
                        data-title="materialize Material" data-description=""><img
                            src="assets/img/banner/banner-2.jpg" alt=""
                            data-bgposition="center center" data-bgfit="cover"
                            data-bgrepeat="no-repeat" data-bgparallax="10" class="rev-slidebg"
                            data-no-retina>
                        <div
                            class="tp-caption rev-heading text-extrabold dark-text tp-resizeme "
                            data-x="center" data-y="center" data-voffset="-50"
                            data-fontsize="['30','25','20','15']"
                            data-lineheight="['30','25','20','20']" data-width="none"
                            data-height="none" data-whitespace="nowrap"
                            data-transform_idle="o:1;"
                            data-transform_in="y:[100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;opacity:0;s:600;e:Power4.easeInOut;"
                            data-transform_out="y:[100%];s:1000;e:Power2.easeInOut;s:1000;e:Power2.easeInOut;"
                            data-mask_in="x:0px;y:[100%];s:inherit;e:inherit;"
                            data-mask_out="x:inherit;y:inherit;s:inherit;e:inherit;"
                            data-start="800" data-splitin="none" data-splitout="none"
                            data-responsive_offset="on"
                            style="z-index: 5; white-space: nowrap;">
                            <div class="text-center" id="tituloNotaPrensa2">
                            </div>
                        </div>
                        <div
                            class="tp-caption tp-resizeme rev-subheading  dark-text text-center"
                            data-x="center" data-y="center" data-voffset="30"
                            data-fontsize="['20','20','15','10']"
                            data-lineheight="['20','20','15','10']" data-width="none"
                            data-whitespace="nowrap" data-transform_idle="o:1;"
                            data-transform_in="y:[100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;opacity:0;s:600;e:Power4.easeInOut;"
                            data-transform_out="y:[100%];s:1000;e:Power2.easeInOut;s:1000;e:Power2.easeInOut;"
                            data-mask_in="x:0px;y:[100%];s:inherit;e:inherit;"
                            data-mask_out="x:inherit;y:inherit;s:inherit;e:inherit;"
                            data-start="1000" data-splitin="none" data-splitout="none"
                            data-responsive_offset="on"
                            style="z-index: 6; white-space: nowrap;">
                            <div class="text-left" id="resumenNotaPrensa2">
                            </div>
                        </div> 
                        <div class="tp-caption tp-resizeme rev-btn"
                             data-x="['center','center','center','center']"
                             data-hoffset="['0','0','0','0']"
                             data-y="['middle','middle','middle','middle']"
                             data-voffset="['130','130','130','130']" data-width="none"
                             data-height="none" data-whitespace="nowrap"
                             data-transform_idle="o:1;" data-style_hover="cursor:default;"
                             data-transform_in="y:[100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;opacity:0;s:600;e:Power4.easeInOut;"
                             data-transform_out="y:[100%];s:1000;e:Power2.easeInOut;s:1000;e:Power2.easeInOut;"
                             data-mask_in="x:0px;y:[100%];s:inherit;e:inherit;"
                             data-mask_out="x:inherit;y:inherit;s:inherit;e:inherit;"
                             data-start="1200" data-splitin="none" data-splitout="none"
                             data-responsive_offset="on"
                             style="z-index: 7; white-space: nowrap;">
                            <form class="form-ver-noticia" method="POST" action="publicaciones/noticias/notas-de-prensa">
                                <input type="hidden" name="idNota" id="idNota2" value="">
                                <input type="hidden" name="action" id="action2" value="readNotaPrensa">
                                <button type="submit" class="btn btn-lg  waves-effect waves-light" style="font-size: 18px;">Leer más</button>
                            </form>
                        </div>
                    </li>
                    <li data-transition="fade" data-slotamount="default"
                        data-easein="Power4.easeInOut" data-easeout="Power4.easeInOut"
                        data-masterspeed="2000" data-thumb="assets/img/banner/banner-2.jpg"
                        data-rotate="0" data-fstransition="fade" data-fsmasterspeed="1500"
                        data-fsslotamount="7" data-saveperformance="off"
                        data-title="materialize Material" data-description=""><img
                            src="assets/img/banner/banner-2.jpg" alt=""
                            data-bgposition="center center" data-bgfit="cover"
                            data-bgrepeat="no-repeat" data-bgparallax="10" class="rev-slidebg"
                            data-no-retina>
                        <div
                            class="tp-caption rev-heading text-extrabold dark-text tp-resizeme "
                            data-x="center" data-y="center" data-voffset="-50"
                            data-fontsize="['30','25','20','15']"
                            data-lineheight="['30','25','20','20']" data-width="none"
                            data-height="none" data-whitespace="nowrap"
                            data-transform_idle="o:1;"
                            data-transform_in="y:[100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;opacity:0;s:600;e:Power4.easeInOut;"
                            data-transform_out="y:[100%];s:1000;e:Power2.easeInOut;s:1000;e:Power2.easeInOut;"
                            data-mask_in="x:0px;y:[100%];s:inherit;e:inherit;"
                            data-mask_out="x:inherit;y:inherit;s:inherit;e:inherit;"
                            data-start="800" data-splitin="none" data-splitout="none"
                            data-responsive_offset="on"
                            style="z-index: 5; white-space: nowrap;">
                            <div class="text-center" id="tituloNotaPrensa3">
                            </div>
                        </div>
                        <div
                            class="tp-caption tp-resizeme rev-subheading  dark-text text-center"
                            data-x="center" data-y="center" data-voffset="30"
                            data-fontsize="['20','20','15','10']"
                            data-lineheight="['20','20','15','10']" data-width="none"
                            data-whitespace="nowrap" data-transform_idle="o:1;"
                            data-transform_in="y:[100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;opacity:0;s:600;e:Power4.easeInOut;"
                            data-transform_out="y:[100%];s:1000;e:Power2.easeInOut;s:1000;e:Power2.easeInOut;"
                            data-mask_in="x:0px;y:[100%];s:inherit;e:inherit;"
                            data-mask_out="x:inherit;y:inherit;s:inherit;e:inherit;"
                            data-start="1000" data-splitin="none" data-splitout="none"
                            data-responsive_offset="on"
                            style="z-index: 6; white-space: nowrap;">
                            <div class="text-left" id="resumenNotaPrensa3">
                            </div>
                        </div> 
                        <div class="tp-caption tp-resizeme rev-btn"
                             data-x="['center','center','center','center']"
                             data-hoffset="['0','0','0','0']"
                             data-y="['middle','middle','middle','middle']"
                             data-voffset="['130','130','130','130']" data-width="none"
                             data-height="none" data-whitespace="nowrap"
                             data-transform_idle="o:1;" data-style_hover="cursor:default;"
                             data-transform_in="y:[100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;opacity:0;s:600;e:Power4.easeInOut;"
                             data-transform_out="y:[100%];s:1000;e:Power2.easeInOut;s:1000;e:Power2.easeInOut;"
                             data-mask_in="x:0px;y:[100%];s:inherit;e:inherit;"
                             data-mask_out="x:inherit;y:inherit;s:inherit;e:inherit;"
                             data-start="1200" data-splitin="none" data-splitout="none"
                             data-responsive_offset="on"
                             style="z-index: 7; white-space: nowrap;">
                            <form class="form-ver-noticia" method="POST" action="publicaciones/noticias/notas-de-prensa">
                                <input type="hidden" name="idNota" id="idNota3" value="">
                                <input type="hidden" name="action" id="action3" value="readNotaPrensa">
                                <button type="submit" class="btn btn-lg  waves-effect waves-light" style="font-size: 18px;">Leer más</button>
                            </form>
                        </div>
                    </li>
                    <li data-transition="fade" data-slotamount="default"
                        data-easein="Power4.easeInOut" data-easeout="Power4.easeInOut"
                        data-masterspeed="2000" data-thumb="assets/img/banner/banner-2.jpg"
                        data-rotate="0" data-fstransition="fade" data-fsmasterspeed="1500"
                        data-fsslotamount="7" data-saveperformance="off"
                        data-title="materialize Material" data-description=""><img
                            src="assets/img/banner/banner-2.jpg" alt=""
                            data-bgposition="center center" data-bgfit="cover"
                            data-bgrepeat="no-repeat" data-bgparallax="10" class="rev-slidebg"
                            data-no-retina>
                        <div
                            class="tp-caption rev-heading text-extrabold dark-text tp-resizeme "
                            data-x="center" data-y="center" data-voffset="-50"
                            data-fontsize="['30','25','20','15']"
                            data-lineheight="['30','25','20','20']" data-width="none"
                            data-height="none" data-whitespace="nowrap"
                            data-transform_idle="o:1;"
                            data-transform_in="y:[100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;opacity:0;s:600;e:Power4.easeInOut;"
                            data-transform_out="y:[100%];s:1000;e:Power2.easeInOut;s:1000;e:Power2.easeInOut;"
                            data-mask_in="x:0px;y:[100%];s:inherit;e:inherit;"
                            data-mask_out="x:inherit;y:inherit;s:inherit;e:inherit;"
                            data-start="800" data-splitin="none" data-splitout="none"
                            data-responsive_offset="on"
                            style="z-index: 5; white-space: nowrap;">
                            <div class="text-center" id="tituloNotaPrensa4">
                            </div>
                        </div>
                        <div
                            class="tp-caption tp-resizeme rev-subheading  dark-text text-center"
                            data-x="center" data-y="center" data-voffset="30"
                            data-fontsize="['20','20','15','10']"
                            data-lineheight="['20','20','15','10']" data-width="none"
                            data-whitespace="nowrap" data-transform_idle="o:1;"
                            data-transform_in="y:[100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;opacity:0;s:600;e:Power4.easeInOut;"
                            data-transform_out="y:[100%];s:1000;e:Power2.easeInOut;s:1000;e:Power2.easeInOut;"
                            data-mask_in="x:0px;y:[100%];s:inherit;e:inherit;"
                            data-mask_out="x:inherit;y:inherit;s:inherit;e:inherit;"
                            data-start="1000" data-splitin="none" data-splitout="none"
                            data-responsive_offset="on"
                            style="z-index: 6; white-space: nowrap;">
                            <div class="text-left" id="resumenNotaPrensa4">
                            </div>
                        </div> 
                        <div class="tp-caption tp-resizeme rev-btn"
                             data-x="['center','center','center','center']"
                             data-hoffset="['0','0','0','0']"
                             data-y="['middle','middle','middle','middle']"
                             data-voffset="['130','130','130','130']" data-width="none"
                             data-height="none" data-whitespace="nowrap"
                             data-transform_idle="o:1;" data-style_hover="cursor:default;"
                             data-transform_in="y:[100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;opacity:0;s:600;e:Power4.easeInOut;"
                             data-transform_out="y:[100%];s:1000;e:Power2.easeInOut;s:1000;e:Power2.easeInOut;"
                             data-mask_in="x:0px;y:[100%];s:inherit;e:inherit;"
                             data-mask_out="x:inherit;y:inherit;s:inherit;e:inherit;"
                             data-start="1200" data-splitin="none" data-splitout="none"
                             data-responsive_offset="on"
                             style="z-index: 7; white-space: nowrap;">
                            <form class="form-ver-noticia" method="POST" action="publicaciones/noticias/notas-de-prensa">
                                <input type="hidden" name="idNota" id="idNota4" value="">
                                <input type="hidden" name="action" id="action4" value="readNotaPrensa">
                                <button type="submit" class="btn btn-lg  waves-effect waves-light" style="font-size: 18px;">Leer más</button>
                            </form>
                        </div>
                    </li>
                    <li data-transition="fade" data-slotamount="default"
                        data-easein="Power4.easeInOut" data-easeout="Power4.easeInOut"
                        data-masterspeed="2000" data-thumb="assets/img/banner/banner-2.jpg"
                        data-rotate="0" data-fstransition="fade" data-fsmasterspeed="1500"
                        data-fsslotamount="7" data-saveperformance="off"
                        data-title="materialize Material" data-description=""><img
                            src="assets/img/banner/banner-2.jpg" alt=""
                            data-bgposition="center center" data-bgfit="cover"
                            data-bgrepeat="no-repeat" data-bgparallax="10" class="rev-slidebg"
                            data-no-retina>
                        <div
                            class="tp-caption rev-heading text-extrabold dark-text tp-resizeme "
                            data-x="center" data-y="center" data-voffset="-50"
                            data-fontsize="['30','25','20','15']"
                            data-lineheight="['30','25','20','20']" data-width="none"
                            data-height="none" data-whitespace="nowrap"
                            data-transform_idle="o:1;"
                            data-transform_in="y:[100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;opacity:0;s:600;e:Power4.easeInOut;"
                            data-transform_out="y:[100%];s:1000;e:Power2.easeInOut;s:1000;e:Power2.easeInOut;"
                            data-mask_in="x:0px;y:[100%];s:inherit;e:inherit;"
                            data-mask_out="x:inherit;y:inherit;s:inherit;e:inherit;"
                            data-start="800" data-splitin="none" data-splitout="none"
                            data-responsive_offset="on"
                            style="z-index: 5; white-space: nowrap;">
                            <div class="text-center" id="tituloNotaPrensa5">
                            </div>
                        </div>
                        <div
                            class="tp-caption tp-resizeme rev-subheading  dark-text text-center"
                            data-x="center" data-y="center" data-voffset="30"
                            data-whitespace="nowrap" data-transform_idle="o:1;"
                            data-fontsize="['20','20','15','10']"
                            data-lineheight="['20','20','15','10']" data-width="none"
                            data-transform_in="y:[100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;opacity:0;s:600;e:Power4.easeInOut;"
                            data-transform_out="y:[100%];s:1000;e:Power2.easeInOut;s:1000;e:Power2.easeInOut;"
                            data-mask_in="x:0px;y:[100%];s:inherit;e:inherit;"
                            data-mask_out="x:inherit;y:inherit;s:inherit;e:inherit;"
                            data-start="1000" data-splitin="none" data-splitout="none"
                            data-responsive_offset="on"
                            style="z-index: 6; white-space: nowrap;">
                            <div class="text-left" id="resumenNotaPrensa5">
                            </div>
                        </div> 
                        <div class="tp-caption tp-resizeme rev-btn"
                             data-x="['center','center','center','center']"
                             data-hoffset="['0','0','0','0']"
                             data-y="['middle','middle','middle','middle']"
                             data-voffset="['130','130','130','130']" data-width="none"
                             data-height="none" data-whitespace="nowrap"
                             data-transform_idle="o:1;" data-style_hover="cursor:default;"
                             data-transform_in="y:[100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;opacity:0;s:600;e:Power4.easeInOut;"
                             data-transform_out="y:[100%];s:1000;e:Power2.easeInOut;s:1000;e:Power2.easeInOut;"
                             data-mask_in="x:0px;y:[100%];s:inherit;e:inherit;"
                             data-mask_out="x:inherit;y:inherit;s:inherit;e:inherit;"
                             data-start="1200" data-splitin="none" data-splitout="none"
                             data-responsive_offset="on"
                             style="z-index: 7; white-space: nowrap;">
                            <form class="form-ver-noticia" method="POST" action="publicaciones/noticias/notas-de-prensa">
                                <input type="hidden" name="idNota" id="idNota5" value="">
                                <input type="hidden" name="action" id="action5" value="readNotaPrensa">
                                <button type="submit" class="btn btn-lg  waves-effect waves-light" style="font-size: 18px;">Leer más</button>
                            </form>
                        </div>
                    </li>
                </ul>
            </div>
        </section>
        <section class="section-padding" style=" padding-top: 40px; padding-bottom: 40px;">
            <div class="container">
                <div class="text-center mb-20">
                    <h2 class="section-title text-peam-verde-subrayado">
                        <strong>Nuestras Líneas de Acción</strong>
                    </h2>
                </div>
                <div class="row">
                    <div class="clients-grid">
                        <div class="col-md-3 col-sm-6">
                            <div class="text-center">
                                <a href="<%out.print(getServletContext().getContextPath());%>/lineas-de-accion/direccion-de-infraestructura"> 
                                    <h5 class="text-peam-verde-index">
                                        <i class="fa fa-home fa-5x" aria-hidden="true"></i>
                                        <br>
                                        Dirección de <br>Infraestructura
                                    </h5>
                                </a>                                
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-6">
                            <div class="text-center">
                                <a href="<%out.print(getServletContext().getContextPath());%>/lineas-de-accion/direccion-de-manejo-ambiental">
                                    <h5 class="text-peam-verde-index">
                                        <i class="fa fa-pagelines fa-5x"></i>
                                        <br>
                                        Dirección de <br>Manejo Ambiental
                                    </h5>
                                </a>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-6">
                            <div class="text-center">
                                <a href="<%out.print(getServletContext().getContextPath());%>/lineas-de-accion/direccion-de-desarrollo-agropecuario"> 
                                    <h5 class="text-peam-verde-index">
                                        <i class="fa fa-truck fa-5x" aria-hidden="true"></i>
                                        <br>
                                        Dirección de Desarrollo <br>Agropecuario
                                    </h5>
                                </a>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-6">
                            <div class="text-center">
                                <a href="<%out.print(getServletContext().getContextPath());%>/lineas-de-accion/estudios">
                                    <h5 class="text-peam-verde-index">
                                        <i class="fa fa-graduation-cap fa-5x" aria-hidden="true"></i>
                                        <br>
                                        Estudios
                                    </h5>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>         
        </section>
        <section class="section-padding" style="padding-top: 0px; padding-bottom: 40px;">
            <div class="container">
                <div class="text-center mb-20">
                    <h1 class="section-title text-peam-verde-subrayado">
                        <strong>Noticias</strong>
                    </h1>
                </div>
                <div class="row">
                    <div class="col-md-5 col-md-offset-2 col-sm-8 col-sm-offset-0 col-xs-10 col-xs-offset-1 mt-15" id="idColumnaCarrusel">
                        <div id="myCarousel" class="carousel slide" data-ride="carousel">
                            <!--ol class="carousel-indicators">
                                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                                <li data-target="#myCarousel" data-slide-to="1"></li>
                                <li data-target="#myCarousel" data-slide-to="2"></li>
                                <li data-target="#myCarousel" data-slide-to="3"></li>
                                <li data-target="#myCarousel" data-slide-to="4"></li>
                                <li data-target="#myCarousel" data-slide-to="5"></li>
                                <li data-target="#myCarousel" data-slide-to="6"></li>
                                <li data-target="#myCarousel" data-slide-to="7"></li>
                                <li data-target="#myCarousel" data-slide-to="8"></li>
                                <li data-target="#myCarousel" data-slide-to="9"></li>
                            </ol-->
                            <div class="carousel-inner">
                                <div class="item active image-peam">
                                    <img class="img-responsive img-responsive-peam" id="imgCNotaPrensa0" src="" alt="Noticia" >
                                    <div class="carousel-caption">
                                        <h4 id="tituloCNotaPrensa0" class="text-peam-negrita-fondo"></h4>
                                    </div>
                                </div>
                                <div class="item image-peam">
                                    <img class="img-responsive img-responsive-peam" id="imgCNotaPrensa1" src="" alt="Noticia" >
                                    <div class="carousel-caption">
                                        <h4 id="tituloCNotaPrensa1" class="text-peam-negrita-fondo"></h4>
                                    </div>
                                </div>
                                <div class="item image-peam">
                                    <img class="img-responsive img-responsive-peam" id="imgCNotaPrensa2" src="" alt="Noticia" >
                                    <div class="carousel-caption">
                                        <h4 id="tituloCNotaPrensa2" class="text-peam-negrita-fondo"></h4>
                                    </div>
                                </div>
                                <div class="item image-peam">
                                    <img class="img-responsive img-responsive-peam" id="imgCNotaPrensa3" src="" alt="Noticia" >
                                    <div class="carousel-caption">
                                        <h4 id="tituloCNotaPrensa3" class="text-peam-negrita-fondo"></h4>
                                    </div>
                                </div>
                                <div class="item image-peam">
                                    <img class="img-responsive img-responsive-peam" id="imgCNotaPrensa4" src="" alt="Noticia" >
                                    <div class="carousel-caption">
                                        <h4 id="tituloCNotaPrensa4" class="text-peam-negrita-fondo"></h4>
                                    </div>
                                </div>
                                <div class="item image-peam">
                                    <img class="img-responsive img-responsive-peam" id="imgCNotaPrensa5" src="" alt="Noticia" >
                                    <div class="carousel-caption">
                                        <h4 id="tituloCNotaPrensa5" class="text-peam-negrita-fondo"></h4>
                                    </div>
                                </div>
                                <div class="item image-peam">
                                    <img class="img-responsive img-responsive-peam" id="imgCNotaPrensa6" src="" alt="Noticia" >
                                    <div class="carousel-caption">
                                        <h4 id="tituloCNotaPrensa6" class="text-peam-negrita-fondo"></h4>
                                    </div>
                                </div>
                                <div class="item image-peam">
                                    <img class="img-responsive img-responsive-peam" id="imgCNotaPrensa7" src="" alt="Noticia" >
                                    <div class="carousel-caption">
                                        <h4 id="tituloCNotaPrensa7" class="text-peam-negrita-fondo"> </h4>
                                    </div>
                                </div>
                                <div class="item image-peam">
                                    <img class="img-responsive img-responsive-peam" id="imgCNotaPrensa8" src="" alt="Noticia" >
                                    <div class="carousel-caption">
                                        <h4 id="tituloCNotaPrensa8" class="text-peam-negrita-fondo"></h4>
                                    </div>
                                </div>
                                <div class="item image-peam">
                                    <img class="img-responsive img-responsive-peam" id="imgCNotaPrensa9" src="" alt="Noticia" >
                                    <div class="carousel-caption">
                                        <h4 id="tituloCNotaPrensa9" class="text-peam-negrita-fondo"></h4>
                                    </div>
                                </div>
                            </div>
                            <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                                <span class="glyphicon glyphicon-chevron-left"></span>
                                <span class="sr-only">Previous</span>
                            </a>
                            <a class="right carousel-control" href="#myCarousel" data-slide="next">
                                <span class="glyphicon glyphicon-chevron-right"></span>
                                <span class="sr-only">Next</span>
                            </a>
                        </div>
                    </div>
                    <div class="col-md-3 col-md-offset-0 col-sm-4 col-sm-offset-0 col-xs-8 col-xs-offset-2 mt-15">
                        <div class="team-wrapper text-center">
                            <div class="team-img">
                                <a href="#"><img src="peam_resources_app/fotos_users/gerente2.jpg" class="img-responsive" alt="Imagen"></a>
                            </div>
                            <div class="team-title" style="padding-top: 15px;">
                                <h3 class="text-peam-negrita">
                                    <a href="#" style="text-transform: none"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Carmen Beatriz Ríos Vásquez</font></font></a>
                                </h3>
                                <span class="mb-10"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;" class="text-peam-negrita">Gerente General</font></font>
                                </span>
                                <h5 class="text-peam-negrita">
                                    <i class="fa fa-phone"></i> (042) - 562522
                                </h5>
                                <h5 class="mb-20 text-peam-verde-index">
                                    <i class="fa fa-envelope-o"></i> <a href="mailto:gerencia@peam.gob.pe">gerencia@peam.gob.pe</a>
                                </h5>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section class="section-padding" style="padding-top: 0px; padding-bottom: 40px;">
            <div class="container">
                <div class="text-center mb-20">
                    <h1 class="section-title text-peam-verde-subrayado">
                        <strong>Gestión Transparente</strong>
                    </h1>
                </div>
                <div class="row">
                    <div class="clients-grid">
                        <div class="col-lg-3 col-md-4 col-sm-6 mt-20">
                            <div class="text-center">
                                <a href="<%out.print(getServletContext().getContextPath());%>/gestiontransparente/documentos-normativos-y-de-gestion">
                                    <h5 class="text-peam-verde-index" style="margin-top: 5px">
                                        <i class="fa fa-files-o fa-4x" aria-hidden="true"></i>
                                        <br>
                                        Documentos Normativos <br>y de Gestión
                                    </h5>
                                </a>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-4 col-sm-6 mt-20">
                            <div class="text-center">
                                <a href="<%out.print(getServletContext().getContextPath());%>/gestiontransparente/presupuesto-y-finanzas">
                                    <h5 class="text-peam-verde-index" style="margin-top: 5px">
                                        <i class="fa fa-money fa-4x" aria-hidden="true"></i>
                                        <br>
                                        Presupuestos y <br>Finanzas
                                    </h5>
                                </a>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-4 col-sm-6 mt-20">
                            <div class="text-center">
                                <a href="<%out.print(getServletContext().getContextPath());%>/gestiontransparente/proyectos-de-inversion">
                                    <h5 class="text-peam-verde-index" style="margin-top: 5px">
                                        <i class="fa fa-archive fa-4x" aria-hidden="true"></i>
                                        <br>
                                        Proyectos de <br>Inversión
                                    </h5>
                                </a>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-4 col-sm-6 mb-20 mt-20">
                            <div class="text-center">
                                <a href="<%out.print(getServletContext().getContextPath());%>/gestiontransparente/recursos-humanos">
                                    <h5 class="text-peam-verde-index" style="margin-top: 5px">
                                        <i class="fa fa-users fa-4x" aria-hidden="true"></i>
                                        <br>
                                        Recursos Humanos
                                    </h5>
                                </a>
                            </div>
                        </div>
                        <div class="col-lg-2 col-lg-offset-3 col-md-4 col-md-offset-0 col-sm-6 col-sm-offset-0 mt-20">
                            <div class="text-center">
                                <a href="<%out.print(getServletContext().getContextPath());%>/gestiontransparente/adquisiciones-y-contrataciones">
                                    <h5 class="text-peam-verde-index" style="margin-top: 5px">
                                        <i class="fa fa-sticky-note fa-4x" aria-hidden="true"></i>
                                        <br>
                                        Adquisiciones y <br>Contrataciones
                                    </h5>
                                </a>
                            </div>
                        </div>
                        <div class="col-lg-2 col-md-4 col-sm-6 mb-20 mt-20">
                            <div class="text-center">
                                <a href="<%out.print(getServletContext().getContextPath());%>/gestiontransparente/agenda-institucional">
                                    <h5 class="text-peam-verde-index" style="margin-top: 5px">
                                        <i class="fa fa-book fa-4x" aria-hidden="true"></i>
                                        <br>
                                        Agenda Institucional
                                    </h5>
                                </a>
                            </div>
                        </div>
                        <div class="col-lg-2 col-md-4 col-sm-6 mt-20">
                            <div class="text-center">
                                <a href="<%out.print(getServletContext().getContextPath());%>/gestiontransparente/informacion-adicional">
                                    <h5 class="text-peam-verde-index" style="margin-top: 5px">
                                        <i class="fa fa-exclamation-circle fa-4x" aria-hidden="true"></i>
                                        <br>
                                        Información Adicional
                                    </h5>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section class="section-padding" style="padding-top: 0px; padding-bottom: 40px;">
            <div class="container">
                <div class="text-center mb-20">
                    <h1 class="section-title text-peam-verde-subrayado">
                        <strong>Favoritos</strong>
                    </h1>
                </div>
                <div class="row">
                    <div class="clients-grid">
                        <div class="col-lg-3 col-md-4 col-sm-6 mt-15">
                            <div class="text-center">
                                <a href="<%out.print(getServletContext().getContextPath());%>/gestiontransparente/documentos-normativos-y-de-gestion">
                                    <h5 class="text-peam-verde-index">
                                        <i class="fa fa-file-text fa-4x" aria-hidden="true"></i>
                                        <br>
                                        TUPA
                                    </h5>
                                </a>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-4 col-sm-6 mt-15">
                            <div class="text-center">
                                <a href="<%out.print(getServletContext().getContextPath());%>/institucion/codigo-de-etica">
                                    <h5 class="text-peam-verde-index">
                                        <i class="fa fa-gavel fa-4x" aria-hidden="true"></i>
                                        <br>
                                        Código de Ética
                                    </h5>
                                </a>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-4 col-sm-6 mt-15">
                            <div class="text-center">
                                <a href="http://doc.peam.gob.pe/sisgedo/app/main.php">
                                    <h5 class="text-peam-verde-index">
                                        <i class="fa fa-folder-open fa-4x" aria-hidden="true"></i>
                                        <br>
                                        Sistema de Trámite <br>Documentario (SISGEDO)
                                    </h5>
                                </a>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-4 col-sm-6 mt-15">
                            <div class="text-center">
                                <a href="<%out.print(getServletContext().getContextPath());%>/consultas/libro-de-reclamaciones">
                                    <h5 class="text-peam-verde-index">
                                        <i class="fa fa-pencil-square-o fa-4x" aria-hidden="true"></i>
                                        <br>
                                        Libro de <br>Reclamaciones
                                    </h5>
                                </a>
                            </div>
                        </div>
                        <div class="col-lg-2 col-lg-offset-3 col-md-4 col-md-offset-0 col-sm-6 col-sm-offset-0 mt-15">
                            <div class="text-center">
                                <a href="<%out.print(getServletContext().getContextPath());%>/consultas/acceso-informacion">
                                    <h5 class="text-peam-verde-index">
                                        <i class="fa fa-share-square-o fa-4x" aria-hidden="true"></i>
                                        <br>
                                        Solicitud de Acceso <br>a la Información
                                    </h5>
                                </a>
                            </div>
                        </div>
                        <div class="col-lg-2 col-md-4 col-sm-6 mt-15">
                            <div class="text-center">
                                <a href="<%out.print(getServletContext().getContextPath());%>/gestiontransparente/documentos-normativos-y-de-gestion">
                                    <h5 class="text-peam-verde-index" style="margin-top: 5px">
                                        <i class="fa fa-file-text fa-4x" aria-hidden="true"></i>
                                        <br>
                                        Resoluciones
                                    </h5>
                                </a>
                            </div>
                        </div>
                        <div class="col-lg-2 col-md-4 col-sm-6 mt-15">
                            <div class="text-center">
                                <a href="">
                                    <h5 class="text-peam-verde-index">
                                        <i class="fa fa-share-alt fa-4x" aria-hidden="true"></i>
                                        <br>
                                        Control Interno
                                    </h5>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section class="section-padding" style="padding-top: 0px; padding-bottom: 40px;">
            <div class="container">
                <div class="text-center mb-20">
                    <h1 class="section-title text-peam-verde-subrayado">
                        <strong>Convocatorias</strong>
                    </h1>
                </div>
                <div class="row">
                    <div class="clients-grid">
                        <div class="col-lg-2 col-lg-offset-4 col-md-4 col-md-offset-2 col-sm-6 col-xs-offset-0 mt-15">
                            <div class="text-center">
                                <a href="<%out.print(getServletContext().getContextPath());%>/convocatorias/convocatoria-de-personal">
                                    <h5 class="text-peam-verde-index">
                                        <i class="fa fa-users fa-4x" aria-hidden="true"></i>
                                        <br>
                                        Selección de <br>Personal
                                    </h5>
                                </a>
                            </div>
                        </div>
                        <div class="col-lg-2 col-md-4 col-sm-6 mt-15">
                            <div class="text-center">
                                <a href="<%out.print(getServletContext().getContextPath());%>/convocatorias/convocatoria-de-bienes-y-servicios">
                                    <h5 class="text-peam-verde-index">
                                        <i class="fa fa-cubes fa-4x" aria-hidden="true"></i>
                                        <br>
                                        Convocatoria de Bienes, Servicios, Obras <br>y Concesiones
                                    </h5>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section class="section-padding" style="padding-top: 0px; padding-bottom: 40px;">
            <div class="container">
                <div class="text-center mb-20">
                    <h1 class="section-title text-peam-verde-subrayado">
                        <strong>Galería y Multimedia</strong>
                    </h1>
                </div>
                <div class="row">
                    <div class="col-xs-12">
                        <div class="portfolio-container text-center">
                            <ul class="portfolio-filter brand-filter" style="display: none">
                                <li class="active waves-effect waves-light" data-group="all">All</li>
                            </ul>
                            <div class="portfolio col-4 mt-15 gutter" id="containerGaleriaFotosPeam">

                            </div>
                        </div>
                    </div>
                </div>
                <div class="row mt-10" id="containerMultimedia">
                </div>
            </div>
        </section>
        <section class="section-padding" style="padding-top: 0px; padding-bottom: 40px;">
            <div class="container">			
                <div class="row">
                    <div class="featured-carousel brand-dot">
                        <div class="featured-item" style="padding: 0px;">
                            <a href="http://www.bn.com.pe/" target="_blank">
                                <img src="<%out.print(getServletContext().getContextPath());%>/peam_resources/logos_complementos/2013/bn2013.png">
                            </a>						
                        </div>					
                        <div class="featured-item" style="padding: 0px;">
                            <a href="http://www.mef.gob.pe/index.php?option=com_content&view=article&id=1592&Itemid=101376&lang=es" target="_blank">
                                <img src="<%out.print(getServletContext().getContextPath());%>/peam_resources/logos_complementos/2013/foniprel2013.png">
                            </a>						
                        </div>
                        <div class="featured-item" style="padding: 0px;">
                            <a href="http://www.regionsanmartin.gob.pe/" target="_blank">
                                <img src="<%out.print(getServletContext().getContextPath());%>/peam_resources/logos_complementos/2013/grsm2013.png">
                            </a>						
                        </div>
                        <div class="featured-item" style="padding: 0px;">
                            <a href="https://apps.contraloria.gob.pe/infobras/" target="_blank">
                                <img src="<%out.print(getServletContext().getContextPath());%>/peam_resources/logos_complementos/2013/infoobras2013.png">
                            </a>						
                        </div>
                        <div class="featured-item" style="padding: 0px;">
                            <a href="http://www.sanciones.gob.pe/transparencia/" target="_blank">
                                <img src="<%out.print(getServletContext().getContextPath());%>/peam_resources/logos_complementos/2013/rnsddc2013.png">
                            </a>						
                        </div>
                        <div class="featured-item" style="padding: 0px;">
                            <a href="http://www2.seace.gob.pe/" target="_blank">
                                <img src="<%out.print(getServletContext().getContextPath());%>/peam_resources/logos_complementos/2013/seace2013.png">
                            </a>						
                        </div>
                        <div class="featured-item" style="padding: 0px;">
                            <a href="http://www.regionsanmartin.gob.pe/" target="_blank">
                                <img src="<%out.print(getServletContext().getContextPath());%>/peam_resources/logos_complementos/2013/snip2013.png">
                            </a>						
                        </div>
                        <div class="featured-item" style="padding: 0px;">
                            <a href="http://www.sunat.gob.pe/" target="_blank">
                                <img src="<%out.print(getServletContext().getContextPath());%>/peam_resources/logos_complementos/2013/sunat2013.png">
                            </a>						
                        </div>
                        <div class="featured-item" style="padding: 0px;">
                            <a href="http://www.mef.gob.pe/index.php?option=com_content&view=section&id=37&Itemid=100143&lang=es" target="_blank">
                                <img src="<%out.print(getServletContext().getContextPath());%>/peam_resources/logos_complementos/2013/tmef2013.png">
                            </a>						
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <%@ include file="footer.jsp"%>
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
        <script src="<%out.print(getServletContext().getContextPath());%>/assets/magnific-popup/jquery.magnific-popup.js"></script>

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
        <script type="text/javascript" src="<%out.print(getServletContext().getContextPath());%>/assets/plugins/toast-master/js/jquery.toast.js"></script>
        <script type="text/javascript" src="<%out.print(getServletContext().getContextPath());%>/js_app/utilities/lib-utilities.js"></script>
        <script type="text/javascript" src="<%out.print(getServletContext().getContextPath());%>/js_app/utilities/lib-validaciones.js"></script>
        <script type="text/javascript" src="<%out.print(getServletContext().getContextPath());%>/js/conf_web.js"></script>
        <script type="text/javascript" src="<%out.print(getServletContext().getContextPath());%>/js_app/web/index.js"></script>
    </body>
</html>