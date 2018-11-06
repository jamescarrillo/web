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
        <section class="padding-bottom-100">
            <div class="container">
                <div class="text-center mb-30" style="margin-top: 60px;">
                    <h2><strong>DIRECTORIO DE CONTACTOS</strong></h2>
                    <p>PROYECTO ESPECIAL ALTO MAYO</p>
                </div>

                <div class="row">
                    <div class="col-xs-12">
                        <div class="posts-content single-post">
                            <article class="post-wrapper">
                                <header class="entry-header-wrapper clearfix">                                    
                                    <div class="entry-header">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="border-bottom-tab">
                                                    <!-- Nav tabs -->
                                                    <ul class="nav nav-tabs" role="tablist">
                                                        <li role="presentation" class="active"><a href="#tab-dircontactos" class="waves-effect waves-dark"  role="tab" data-toggle="tab">Directorio de Contactos</a></li>
                                                        <li role="presentation"><a href="#tab-telinterno" class="waves-effect waves-dark" role="tab" data-toggle="tab">Directorio de Teléfono Interno</a></li>
                                                    </ul>
                                                    <!-- Tab panes -->
                                                    <div class="panel-body">
                                                        <div class="tab-content">
                                                            <div role="tabpanel" class="tab-pane fade in active" id="tab-dircontactos">
                                                                <div class="row">
                                                                    <form id="FrmFuncionario">
                                                                        <div class="col-md-10 col-sm-9 col-xs-12">
                                                                            <div class="input-field" style="margin-top: 0px">
                                                                                <input type="text" name="txtFuncionario" id="txtFuncionario">
                                                                                <label for="name" class=""><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Buscar Contacto</font></font></label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-md-2 col-sm-3 col-xs-12">
                                                                            <button type="submit" id="btnBuscarFuncionario" class="waves-effect waves-light btn" style="height: 40px; padding-top: 5px; padding-bottom: 5px;">Buscar</button>
                                                                        </div>
                                                                        <input type="hidden" id="nameFormFuncionario" value="FrmFuncionario">
                                                                        <input type="hidden" id="actionFuncionario" name="action" value="paginarFuncionario">
                                                                        <input type="hidden" id="numberPageFuncionario" name="numberPageFuncionario" value="1">
                                                                        <input type="hidden" id="sizePageFuncionario" name="sizePageFuncionario" value="10">
                                                                    </form>
                                                                </div>
                                                                <div class="row" id="loader_contenido_Funcionario">
                                                                    <div class="col-md-1 col-md-offset-6 col-xs-2 col-xs-offset-6 mt-30">
                                                                        <div class="loader-peam_small"></div>
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="col-xs-12">
                                                                        <div class="table-responsive table-hover" style="margin-top: 20px">
                                                                            <table class="table">
                                                                                <thead class="bg-success">
                                                                                    <tr>
                                                                                        <th style="width: 30%;" class="align-middle">CARGOS</th>
                                                                                        <th style="width: 30%;" class="align-middle">NOMBRES Y APELLIDOS</th>
                                                                                        <th style="width: 20%;" class="align-middle">TELEFONO</th>
                                                                                        <th style="width: 20%;" class="align-middle">CORREO ELECTRONICO</th>
                                                                                    </tr>
                                                                                </thead>
                                                                                <tbody id="tbodyFuncionario">
                                                                                </tbody>
                                                                            </table>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="col-md-9 col-xs-12 text-right">
                                                                        <ul id="paginationFuncionario" class="pagination pagination-sm" style="margin-top: 0px; margin-top: 0px">

                                                                        </ul>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div role="tabpanel" class="tab-pane fade" id="tab-telinterno">
                                                                <div class="row">
                                                                    <form id="FrmDirectorio">
                                                                        <div class="col-md-10 col-sm-9 col-xs-12">
                                                                            <div class="input-field" style="margin-top: 0px">
                                                                                <input type="text" name="txtDirectorioTelefonico" id="txtDirectorioTelefonico">
                                                                                <label for="name" class=""><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Buscar Directorio Teléfonico</font></font></label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-md-2 col-sm-3 col-xs-12">
                                                                            <button type="submit" id="btnBuscarDirectorio" class="waves-effect waves-light btn" style="height: 40px; padding-top: 5px; padding-bottom: 5px;">Buscar</button>
                                                                        </div>
                                                                        <input type="hidden" id="nameFormDirectorio" value="FrmDirectorio">
                                                                        <input type="hidden" id="actionDirectorio" name="action" value="paginarDirectorio">
                                                                        <input type="hidden" id="numberPageDirectorio" name="numberPageDirectorio" value="1">
                                                                        <input type="hidden" id="sizePageDirectorio" name="sizePageDirectorio" value="10">
                                                                    </form>
                                                                </div>
                                                                <div class="row" id="loader_contenido_Directorio">
                                                                    <div class="col-md-1 col-md-offset-6 col-xs-2 col-xs-offset-6 mt-30">
                                                                        <div class="loader-peam_small"></div>
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="col-xs-12">
                                                                        <div class="table-responsive table-hover" style="margin-top: 20px">
                                                                            <table class="table">
                                                                                <thead class="bg-success">
                                                                                    <tr>
                                                                                        <th style="width: 45%;" class="align-middle">OFICINA</th>
                                                                                        <th style="width: 45%;" class="align-middle">SECCION</th>
                                                                                        <th style="width: 10%;" class="align-middle">ANEXO</th>
                                                                                    </tr>
                                                                                </thead>
                                                                                <tbody id="tbodyDirectorio">
                                                                                </tbody>
                                                                            </table>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="col-md-9 col-xs-12 text-right">
                                                                        <ul id="paginationDirectorio" class="pagination pagination-sm" style="margin-top: 0px; margin-top: 0px">

                                                                        </ul>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div><!-- /.border-bottom-tab -->
                                        </div><!-- /.col-md-12 -->
                                    </div>
                                </header>
                            </article>
                        </div>
                    </div>
                </div>
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
        <script src="<%out.print(getServletContext().getContextPath());%>/assets/owl.carousel/owl.carousel.min.js"></script>
        <script src="<%out.print(getServletContext().getContextPath());%>/assets/flexSlider/jquery.flexslider-min.js"></script>
        <script src="<%out.print(getServletContext().getContextPath());%>/assets/magnific-popup/jquery.magnific-popup.min.js"></script>
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
        <script type="text/javascript" src="<%out.print(getServletContext().getContextPath());%>/js_app/web/directorios.js"></script>

    </body>
</html>