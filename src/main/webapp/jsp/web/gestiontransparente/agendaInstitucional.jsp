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
        <link href="<%out.print(getServletContext().getContextPath());%>/assets/plugins/toast-master/css/jquery.toast.css" rel="stylesheet">
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

        <!-- blog section start -->
        <section class="blog-section section-padding" style="padding-top: 50px">
            <div class="container">
                <div class="text-center mb-30" style="margin-top: 20px;">
                    <h2 class="text-peam-verde h1-title" style="font-size: 30px">Agenda Institucional</h2>
                </div>
                <div class="row">
                    <div class="col-xs-12">
                        <div class="posts-content single-post">
                            <article class="post-wrapper">
                                <div class="entry-content">
                                    <div class="row">
                                        <form id="FrmAgenda">
                                            <div class="col-md-3 col-sm-6 col-xs-12">
                                                <select id="cbotipo" name="cbotipo" class="form-control combo-paginar " idBtnBuscar='btnBuscarAgenda' style="border: 1px solid #8bc34a; margin-top: 40px">
                                                    <option value="1">Gerencia Gerencial</option>
                                                    <option value="2">Dirección de Infraestructura</option>
                                                    <option value="3">Dirección de Desarrollo Agropecuario</option>
                                                    <option value="4">Dirección de Manejo Ambiental</option>
                                                </select>
                                            </div>
                                            <div class="col-md-5 col-sm-6 col-xs-12">
                                                <div class="input-field">
                                                    <input type="text" name="txtActividad" id="txtActividad">
                                                    <label for="name" class=""><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Buscar Agenda . . .</font></font></label>
                                                </div>
                                            </div>
                                            <div class="col-md-2 col-sm-6 col-xs-12">
                                                <div class="input-field">
                                                    <input type="text" name="txtCalendario" id="txtCalendario">
                                                    <label for="name" class=""><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">DD/MM/AAAA</font></font></label>
                                                </div>
                                            </div>
                                            <div class="col-md-2 col-sm-6 col-xs-12">
                                                <button type="submit" id="btnBuscarAgenda" class="waves-effect waves-light btn" style="height: 30px; padding-top: 2px; padding-bottom: 2px; margin-top: 45px;">Buscar</button>
                                            </div>
                                            <input type="hidden" id="nameForm" value="FrmAgenda">
                                            <input type="hidden" id="actionAgenda" name="action" value="paginarAgenda">
                                            <input type="hidden" id="numberPageAgenda" name="numberPageAgenda" value="1">
                                            <input type="hidden" id="sizePageAgenda" name="sizePageAgenda" value="10">
                                        </form>
                                    </div>
                                    <div class="row" id="loader_contenido">
                                        <div class="col-md-1 col-md-offset-5 col-xs-2 col-xs-offset-5 mt-30">
                                            <div class="loader-peam_small"></div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-xs-12">
                                            <div class="table-responsive table-hover" style="margin-top: 20px">
                                                <table class="table">
                                                    <thead class="bg-success">
                                                        <tr>
                                                            <th style="width: 10%;" class="text-center align-middle">HORA</th>
                                                            <th style="width: 10%;" class="text-center align-middle">FECHA</th>
                                                            <th style="width: 25%" class="align-middle">ACTIVIDAD</th>
                                                            <th style="width: 20%" class="align-middle">CIUDAD</th>
                                                            <th style="width: 40%" class="align-middle">DIRECCIÓN</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody id="tbodyAgenda">
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
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
                                            <ul id="paginationAgenda" class="pagination pagination-sm" style="margin-top: 0px; margin-top: 0px">

                                            </ul>
                                        </div>
                                    </div>
                                </footer>
                            </article>
                        </div>
                    </div>

                    <div class="col-xs-12 text-center">
                        <div class="widget widget_search mb-20">
                            <div class="fb-page" 
                                 data-href="https://web.facebook.com/Proyecto-Especial-Alto-Mayo-188571127885448/?ref=br_rs"
                                 data-width="380" 
                                 data-hide-cover="false"
                                 data-show-facepile="false"></div>
                        </div>
                    </div>

                </div>
            </div>
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
            }(document, 'script', 'facebook-jssdk'));
        </script>
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
        <script src="<%out.print(getServletContext().getContextPath());%>/js/jquery.Pagination.min.js"></script>
        <script type="text/javascript" src="<%out.print(getServletContext().getContextPath());%>/assets/plugins/toast-master/js/jquery.toast.js"></script>
        <script type="text/javascript" src="<%out.print(getServletContext().getContextPath());%>/js_app/utilities/lib-utilities.js"></script>
        <script type="text/javascript" src="<%out.print(getServletContext().getContextPath());%>/js_app/utilities/lib-validaciones.js"></script>
        <script type="text/javascript" src="<%out.print(getServletContext().getContextPath());%>/js/conf_web.js"></script>
        <script type="text/javascript" src="<%out.print(getServletContext().getContextPath());%>/js_app/web/agendainstitucionalweb.js"></script>

    </body>
</html>