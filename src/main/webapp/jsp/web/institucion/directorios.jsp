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
                <div class="text-center mb-30" style="margin-top: 60px;">
                    <h2 class="text-peam-verde h1-title" style="font-size: 30px">Directorio de Contactos</h2>
                </div>
                <div class="row">
                    <div class="col-xs-12">
                        <div class="posts-content single-post">
                            <article class="post-wrapper">
                                <div class="entry-content">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="border-bottom-tab">
                                                <ul class="nav nav-tabs" role="tablist">
                                                    <li role="presentation" class="active"><a href="#tab-directorio-contactos" class="waves-effect waves-dark"  role="tab" data-toggle="tab">Directorio de Contactos</a></li>
                                                    <li role="presentation"><a href="#tab-directorio-de-telefono-interno" class="waves-effect waves-dark" role="tab" data-toggle="tab">Directorio de Teléfono Interno</a></li>
                                                </ul>
                                                <div class="panel-body" style="padding-bottom: 0px;">
                                                    <div class="tab-content">
                                                        <div role="tabpanel" class="tab-pane fade in active" id="tab-directorio-contactos">
                                                            <div class="row">
                                                                <form id="FrmFuncionario">
                                                                    <div class="col-md-10 col-sm-9 col-xs-12">
                                                                        <div class="input-field" style="margin-top: 0px">
                                                                            <input type="text" name="txtFuncionario" id="txtFuncionario">
                                                                            <label for="name" class=""><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Buscar Contacto . . .</font></font></label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-md-2 col-sm-3 col-xs-12">
                                                                        <button type="submit" id="btnBuscarFuncionario" class="waves-effect waves-light btn" style="height: 30px; padding-top: 2px; padding-bottom: 2px;">Buscar</button>
                                                                    </div>
                                                                    <input type="hidden" id="nameFormFuncionario" value="FrmFuncionario">
                                                                    <input type="hidden" id="actionFuncionario" name="action" value="paginarFuncionario">
                                                                    <input type="hidden" id="numberPageFuncionario" name="numberPageFuncionario" value="1">
                                                                    <input type="hidden" id="sizePageFuncionario" name="sizePageFuncionario" value="10">
                                                                </form>
                                                            </div>
                                                            <div class="row" id="loader_contenido_Funcionario">
                                                                <div class="col-md-1 col-md-offset-5 col-xs-2 col-xs-offset-6 mt-30">
                                                                    <div class="loader-peam_small"></div>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-xs-12">
                                                                    <div class="table table-hover table-responsive" style="margin-top: 20px">
                                                                        <table class="table">
                                                                            <thead class="bg-success">
                                                                                <tr>
                                                                                    <th style="width: 30%;" class="align-middle">CARGO</th>
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
                                                            <hr>
                                                            <br>
                                                            <div class="row">
                                                                <div class="col-md-3 col-xs-12">
                                                                    <ul class="list-inline pull-left">
                                                                        <li><a href='' title='Descargar en PDF' style='padding-right: 10px'><i class='fa fa-file-pdf-o'></i></a></li>
                                                                        <li><a href='' title="Descargar en WORD" style="padding-right: 10px"><i class="fa fa-file-text"></i></a></li>
                                                                        <li><a href='' title="Descargar en PPT" style="padding-right: 10px"><i class="fa fa-file-powerpoint-o"></i></a></li>
                                                                    </ul>
                                                                </div>
                                                                <div class="col-md-9 col-xs-12 text-right">
                                                                    <ul id="paginationFuncionario" class="pagination pagination-sm" style="margin-top: 0px; margin-top: 0px">

                                                                    </ul>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div role="tabpanel" class="tab-pane fade" id="tab-directorio-de-telefono-interno">
                                                            <div class="row">
                                                                <form id="FrmDirectorio">
                                                                    <div class="col-md-10 col-sm-9 col-xs-12">
                                                                        <div class="input-field" style="margin-top: 0px">
                                                                            <input type="text" name="txtDirectorioTelefonico" id="txtDirectorioTelefonico">
                                                                            <label for="name" class=""><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Buscar Directorio Teléfonico . . .</font></font></label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-md-2 col-sm-3 col-xs-12">
                                                                        <button type="submit" id="btnBuscarDirectorio" class="waves-effect waves-light btn" style="height: 30px; padding-top: 2px; padding-bottom: 2px;">Buscar</button>
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
                                                                <div class="col-md-3 col-xs-12">
                                                                    <ul class="list-inline pull-left">
                                                                        <li><a href='' title='Descargar en PDF' style='padding-right: 10px'><i class='fa fa-file-pdf-o'></i></a></li>
                                                                        <li><a href='' title="Descargar en WORD" style="padding-right: 10px"><i class="fa fa-file-text"></i></a></li>
                                                                        <li><a href='' title="Descargar en PPT" style="padding-right: 10px"><i class="fa fa-file-powerpoint-o"></i></a></li>
                                                                    </ul>
                                                                </div>
                                                                <div class="col-md-9 col-xs-12 text-right">
                                                                    <ul id="paginationDirectorio" class="pagination pagination-sm" style="margin-top: 0px; margin-top: 0px">

                                                                    </ul>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </article>
                        </div>
                    </div>
                </div>
            </div>
            <hr>
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
        <script src="<%out.print(getServletContext().getContextPath());%>/assets/flexSlider/jquery.flexslider-min.js"></script>
        <script src="<%out.print(getServletContext().getContextPath());%>/assets/js/scripts.js"></script>
        <script src="<%out.print(getServletContext().getContextPath());%>/assets/plugins/sweetalert/sweetalert.min.js"></script>
        <script src="<%out.print(getServletContext().getContextPath());%>/js/jquery.Pagination.min.js"></script>
        <script type="text/javascript" src="<%out.print(getServletContext().getContextPath());%>/assets/plugins/toast-master/js/jquery.toast.js"></script>
        <script type="text/javascript" src="<%out.print(getServletContext().getContextPath());%>/js_app/utilities/lib-utilities.js"></script>
        <script type="text/javascript" src="<%out.print(getServletContext().getContextPath());%>/js_app/utilities/lib-validaciones.js"></script>
        <script type="text/javascript" src="<%out.print(getServletContext().getContextPath());%>/js/conf_web.js"></script>
        <script type="text/javascript" src="<%out.print(getServletContext().getContextPath());%>/js_app/web/directorios.js"></script>

    </body>
</html>