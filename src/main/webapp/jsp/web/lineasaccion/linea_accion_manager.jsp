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
                                                    <select id="cate_id" name="cate_id" class="form-control combo-paginar " idBtnBuscar='btnBuscarObra' style="border: 1px solid #8bc34a; margin-top: 40px">
                                                        <option value="-1">TODOS</option>
                                                        <option value="Finalizado">Finalizado</option>
                                                        <option value="En Ejecucion">En Ejecución</option>
                                                    </select>
                                                </div>
                                                <div class="col-md-2 col-sm-3 col-xs-12">
                                                    <select id="comboAnioObra" name="comboAnioObra" class="form-control combo-paginar" idBtnBuscar='btnBuscarObra' style="border: 1px solid #8bc34a; margin-top: 40px">
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
                                                <input type="hidden" id="sizePageObra" name="sizePageObra" value="10">
                                                <input type="hidden" id="comboTipoListaObra" name="comboTipoListaObra" value="-1">
                                            </form>
                                        </div>
                                        <div class="row" id="loader_contenido" style="display: none">
                                            <div class="col-md-1 col-md-offset-5 col-xs-2 col-xs-offset-5 mt-30">
                                                <div class="loader-peam_small"></div>
                                            </div>
                                        </div>

                                    </div>
                                </header>
                                <div class="entry-content">
                                    <!--div class="row equal-height-row">
                                        <div class="col-md-7">
                                            <div class="valign-wrapper equal-height-column">
                                                <div class="hero-intro valign-cell">
                                                    <h2 class="text-peam-negrita text-peam-verde mb-20">
                                                        COMPONENTE DE INTERVENCIÓN AMBIENTAL DEL PIP: MEJORAMIENTO DEL CAMINO VECINAL EMP. PE-5N (INDAÑE) - SECTOR SHANGO (MOYOBAMBA), DISTRITO DE MOYOBAMBA, PROVINCIA DE MOYOBAMBA - SAN MARTÍN.
                                                    </h2>
                                                    <h5 class="text-peam">
                                                        <strong>MONTO INVERSIÓN: </strong>S/ 52585
                                                    </h5>
                                                    <div class="progress-section">
                                                        <span class="progress-title"><strong>Avance Físico</strong></span>
                                                        <div class="progress">
                                                            <div class="progress-bar brand-bg six-sec-ease-in-out" style="background-color: #6a9a32!important" role="progressbar" aria-valuenow="90" aria-valuemin="0" aria-valuemax="100">
                                                                <span>90%</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="progress-section">
                                                        <span class="progress-title"><strong>Avance Financiero</strong></span>
                                                        <div class="progress">
                                                            <div class="progress-bar brand-bg six-sec-ease-in-out" style="background-color: #6a9a32!important" role="progressbar" aria-valuenow="90" aria-valuemin="0" aria-valuemax="100">
                                                                <span>90%</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-5 hero-thumb equal-height-column">
                                            <img src="<%out.print(getServletContext().getContextPath());%>/peam_resources/logos_complementos/lineas_accion/<%out.print(request.getAttribute("foto_banner"));%>" class="img-responsive" alt="Image">
                                            <h5 class="text-center mt-10">Camino vecinal Indañe - sector Shango</h5>
                                            <div class='text-center'>
                                                <a style="margin-top: 5px;height: 30px; padding-top: 2px; padding-bottom: 2px;" class='waves-effect waves-light btn' target="_blank">Ver Detalle</a>
                                                <a style="margin-top: 5px;height: 30px; padding-top: 2px; padding-bottom: 2px;" class='waves-effect waves-light btn' target="_blank">Galería</a>
                                                <a style="margin-top: 5px;height: 30px; padding-top: 2px; padding-bottom: 2px;" class='waves-effect waves-light btn' target="_blank">Link infobras</a>
                                            </div>
                                            <div class='text-center'>
                                                <a style="margin-top: 5px;height: 30px; padding-top: 2px; padding-bottom: 2px;" class='waves-effect waves-light btn grey-blue' target="_blank">En Ejecución</a>
                                            </div>
                                        </div>
                                    </div-->

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