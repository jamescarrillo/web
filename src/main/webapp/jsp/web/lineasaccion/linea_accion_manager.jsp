<%@page import="java.util.List"%>
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
        <section class="padding-bottom-100" style="padding-top: 50px">
            <div class="container">
                <div class="text-center mb-30" style="margin-top: 20px;">
                    <h2 class="text-peam-verde-subrayado" style="font-size: 30px">Nuestras Líneas de Acción</h2>
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
                                            <div class="col-xs-12 text-peam-verde-index text-center mt-10 mb-10">
                                                <a><i class='fa fa-user'></i> <%out.print(request.getAttribute("director_cargo"));%></a>
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
                    <div class="col-xs-12">
                        <div class="posts-content single-post">
                            <article class="post-wrapper">
                                <header class="entry-header-wrapper clearfix">                                    
                                    <div class="entry-header">
                                        <div class="row">
                                            <form id="FrmObra">
                                                <div class="col-md-2 col-sm-3 col-xs-12">
                                                    <select id="cboSeguimiento" name="cboSeguimiento" class="form-control combo-paginar " idBtnBuscar='btnBuscarObra' style="border: 1px solid #00793D; margin-top: 40px">
                                                        <option value="-1">TODOS</option>
                                                        <option value="Finalizado">Finalizado</option>
                                                        <option value="En Ejecucion">En Ejecución</option>
                                                    </select>
                                                </div>
                                                <div class="col-md-2 col-sm-3 col-xs-12">
                                                    <select id="comboAnioObra" name="comboAnioObra" class="form-control combo-paginar" idBtnBuscar='btnBuscarObra' style="border: 1px solid #00793D; margin-top: 40px">
                                                    </select>
                                                </div>
                                                <div class="col-md-6 col-sm-3 col-xs-12">
                                                    <div class="input-field">
                                                        <input type="text" name="txtDescripcion" id="txtDescripcion">
                                                        <label for="name" class=""><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Buscar Obra</font></font></label>
                                                    </div>
                                                </div>
                                                <div class="col-md-2 col-sm-3 col-xs-12">
                                                    <button type="submit" id="btnBuscarObra" class="waves-effect waves-light btn" style="height: 30px; padding-top: 2px; padding-bottom: 2px; margin-top: 45px;">Buscar</button>
                                                </div>
                                                <input type="hidden" id="nameForm" value="FrmObra">
                                                <input type="hidden" id="actionObra" name="action" value="paginarObra">
                                                <input type="hidden" id="numberPageObra" name="numberPageObra" value="1">
                                                <input type="hidden" id="sizePageObra" name="sizePageObra" value="5">
                                            </form>
                                        </div>
                                        <div class="row" id="loader_contenido">
                                            <div class="col-md-1 col-md-offset-5 col-xs-2 col-xs-offset-5 mt-30">
                                                <div class="loader-peam_small"></div>
                                            </div>
                                        </div>

                                    </div>
                                </header>
                                <div class="entry-content" id="containerObras">

                                </div>
                                <footer class="entry-footer">
                                    <div class="row">
                                        <div class="col-md-3 col-xs-12">
                                            <ul class="list-inline pull-left">
                                                <li><a href='' title='Descargar en PDF' style='padding-right: 10px'><i class='fa fa-file-pdf-o'></i></a></li>
                                                <li><a href='' title="Descargar en WORD" style="padding-right: 10px"><i class="fa fa-file-text"></i></a></li>
                                                <li><a href='' title="Descargar en PPT" style="padding-right: 10px"><i class="fa fa-file-powerpoint-o"></i></a></li>
                                            </ul>
                                        </div>
                                        <div class="col-md-9 col-xs-12 text-right">
                                            <ul id="paginationObra" class="pagination pagination-sm" style="margin-top: 0px; margin-top: 0px">

                                            </ul>
                                        </div>

                                    </div>
                                </footer>
                            </article>
                        </div>
                    </div>
                </div>
                <hr>
            </div><!-- /.container -->
        </section>
        <div id="myModal" class="modal-peam">
            <!-- Modal content -->
            <div class="modal-content-peam  modal-dialog-scroll">
                <div class="modal-header-peam" style="background-color: #ffffff; border-bottom: #00793D solid; border-width: 2px">
                    <span class="close" id="btnCerrarModal">&times;</span>
                    <h2 style="margin-top: 15px;" id="descripcionModal">
                        OBRA
                    </h2>
                </div>
                <div class="modal-body-peam modal-body-scroll">
                    <div class="row mt-10">
                        <div class="col-md-3 col-sm-6 col-xs-12">
                            <h5 class='text-peam text-peam-negrita'><i class='fa fa-money'></i> Monto de la Inversión</h5>
                        </div>
                        <div class="col-md-3 col-sm-6 col-xs-12">
                            <h5 class='text-peam text-righ' id="montoInversionModal">$ 999999</h5>
                        </div>
                        <div class="col-md-3 col-sm-6 col-xs-12">
                            <h5 class="text-peam text-peam-negrita">Estado de la Obra</h5>
                        </div>
                        <div class="col-md-3 col-sm-6 col-xs-12">
                            <label id="estadoObraModal" style="font-size: 14px; background-color:#00793D;border-radius: 80px; padding-left: 10px; padding-right: 10px; color: #ffffff">
                                En Ejecución
                            </label>
                        </div>
                        <div class="col-md-3 col-sm-6 col-xs-12">
                            <h5 class="text-peam text-peam-negrita">
                                <i class='fa fa-calendar'></i> Fecha Inicio
                            </h5>
                        </div>
                        <div class="col-md-3 col-sm-6 col-xs-12">
                            <h5 class="text-peam" id="fechaInicioModal">
                                21/09/2018
                            </h5>
                        </div>
                        <div class="col-md-3 col-sm-6 col-xs-12">
                            <h5 class="text-peam text-peam-negrita">
                                <i class='fa fa-calendar'></i> Fecha Finalización
                            </h5>
                        </div>
                        <div class="col-md-3 col-sm-6 col-xs-12">
                            <h5 class="text-peam" id="fechaFinalizacionModal">
                                21/09/2018
                            </h5>
                        </div>
                        <div class="col-md-6 col-xs-12">
                            <div class='progress-section'>
                                <span class='progress-title'><strong>Avance Físico</strong></span>
                                <div class='progress'>
                                    <div class='progress-bar brand-bg six-sec-ease-in-out' style='background-color: #6a9a32!important' role='progressbar' aria-valuenow='90' aria-valuemin='0' aria-valuemax='100'>
                                        <span id="avanceFisicoModal">0%</span>
                                    </div>
                                </div>
                            </div>                            
                        </div>
                        <div class="col-md-5 col-xs-12">
                            <div class="progress-section">
                                <span class="progress-title"><strong>Avance Financiero</strong></span>
                                <div class="progress">
                                    <div class="progress-bar brand-bg six-sec-ease-in-out" style="background-color: #6a9a32!important" role="progressbar" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100">
                                        <span id="avanceFinancieroModal">0%</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-6 col-xs-12">
                            <h5 class='text-peam text-peam-negrita'><i class='fa fa-clock-o'></i> Tiempo de Ejecución</h5>
                        </div>
                        <div class="col-md-3 col-sm-6 col-xs-12">
                            <h5 class='text-peam text-righ' id="tiempoEjecucionModal">21 Días</h5>
                        </div>  
                        <div class="col-md-3 col-sm-6 col-xs-12">
                            <h5 class='text-peam text-peam-negrita'>Modalidad de Ejecución</h5>
                        </div>
                        <div class="col-md-3 col-sm-6 col-xs-12">
                            <h5 class='text-peam text-righ' id="modalidadEjecucionModal">Administración</h5>
                        </div>  
                        <div class="col-md-3 col-sm-6 col-xs-12">
                            <h5 class='text-peam text-peam-negrita'>SNIP</h5>
                        </div>
                        <div class="col-md-3 col-sm-6 col-xs-12">
                            <h5 class='text-peam text-righ' id="snipModal">123456</h5>
                        </div>
                        <div class="col-md-3 col-sm-6 col-xs-12">
                            <h5 class="text-peam text-peam-negrita">Fecha Actualización</h5>
                        </div>
                        <div class="col-md-3 col-sm-6 col-xs-12">
                            <label id="fechaActualizacionModal" style="font-size: 14px; background-color:#f38504;border-radius: 80px; padding-left: 10px; padding-right: 10px; color: #ffffff">
                                Septiembre-2018
                            </label>
                        </div>
                        <div class="form-group col-md-6 col-xs-12" style="margin-bottom: 0px;">
                            <h5 class='text-peam text-peam-negrita' style="margin-bottom: 10px;">Ubicación</h5>
                            <h5 class='text-peam text-righ' style="margin-bottom: 10px;" id="ubicacionModal">Distrito de Moyobamba - sector Shango</h5>
                        </div>
                        <div class="form-group col-md-6 col-xs-12" style="margin-bottom: 0px;">
                            <h5 class='text-peam text-peam-negrita' style="margin-bottom: 10px;">Contratista</h5>
                            <h5 class='text-peam text-righ' style="margin-bottom: 10px;" id="contratistaModal">-</h5>
                        </div>
                        <div class="form-group col-md-6 col-xs-12" style="margin-bottom: 0px;">
                            <h5 class='text-peam text-peam-negrita' style="margin-bottom: 10px;">Supervisor</h5>
                            <h5 class='text-peam text-righ' style="margin-bottom: 10px;" id="supervisorModal">-</h5>
                        </div>
                        <div class="form-group col-md-6 col-xs-12" style="margin-bottom: 0px;">
                            <h5 class='text-peam text-peam-negrita' style="margin-bottom: 10px;">Residente</h5>
                            <h5 class='text-peam text-righ' style="margin-bottom: 10px;" id="residenteModal">-</h5>
                        </div>
                        <div class="col-md-3 col-xs-12">
                            <h5 class='text-peam text-peam-negrita' id="lblobservacion">Observacion</h5>
                        </div>
                        <div class="col-md-9 col-xs-12">
                            <h5 class='text-peam text-righ' id="observacionModal">-</h5>
                        </div>
                        <br>
                        <div class="col-md-4 col-md-offset-4 col-sm-6 col-sm-offset-3 col-xs-10 col-xs-offset-1">
                            <img id="fotoModal" style="border: 3px solid;color: #00793D" src="https://farm2.staticflickr.com/1819/30084242478_40dcb73f95.jpg" class="img-responsive" alt="Image">
                            <h5 class="text-center mt-10" id="leyendaModal" style="margin-bottom: 0px">Camino vecinal Indañe - sector Shango</h5>
                            <!--div class="text-center">
                                <a style="margin-top: 5px;height: 30px; padding-top: 2px; padding-bottom: 2px;margin-right: 3px" class="waves-effect waves-light btn" target="_blank" href="https://www.flickr.com/photos/83313636@N07/albums/72157688002137405">Galería</a>
                            </div-->
                        </div>
                    </div>
                </div>
                <div class="modal-footer-peam" style="background-color: #ffffff; border-top: #00793D solid; border-width: 2px">
                    <h6 style="margin-top: 10px;" class="text-peam-negrita">PROYECTO ESPECIAL ALTO MAYO</h6>
                </div>
            </div>
        </div>
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
        <script src="<%out.print(getServletContext().getContextPath());%>/assets/plugins/sweetalert/sweetalert.min.js"></script>
        <script type="text/javascript" src="<%out.print(getServletContext().getContextPath());%>/assets/plugins/toast-master/js/jquery.toast.js"></script>
        <script type="text/javascript" src="<%out.print(getServletContext().getContextPath());%>/js_app/utilities/lib-utilities.js"></script>
        <script type="text/javascript" src="<%out.print(getServletContext().getContextPath());%>/js_app/utilities/lib-validaciones.js"></script>
        <script type="text/javascript" src="<%out.print(getServletContext().getContextPath());%>/js/conf_web.js"></script>
        <script type="text/javascript" src="<%out.print(getServletContext().getContextPath());%>/js_app/web/lineaaccion.js"></script>
    </body>
</html>