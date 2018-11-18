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

        <!-- blog section start -->
        <section class="blog-section section-padding" style="padding-top: 50px">
            <div class="container">
                <div class="text-center mb-30" style="margin-top: 20px;">
                    <h2 class="text-peam-verde-subrayado" style="font-size: 30px">Adquisiciones y Contrataciones</h2>
                </div>
                <div class="row">
                    <div class="col-xs-12">
                        <div class="panel-group feature-accordion brand-accordion icon angle-icon" id="tab">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#tab" href="#tab-documentos" aria-expanded="true" class="">
                                            Documentos
                                        </a>
                                    </h3>
                                </div>
                                <div id="tab-documentos" class="panel-collapse collapse in" aria-expanded="true" style="">
                                    <div class="panel-body">
                                        <div class="row">
                                            <form id="FrmDocumentos">
                                                <div class="col-md-4 col-sm-3 col-xs-12">
                                                    <select id="cate_id" name="cate_id" class="form-control combo-paginar " idBtnBuscar='btnBuscarDocumento' style="border: 1px solid #00793D; margin-top: 40px">
                                                        <option value="1100">PAC y Modificatorias</option>
                                                        <option value="100">Monto de Liquidación Final de Obra</option>
                                                        <option value="200">Monto Adicionales de las Obras</option>
                                                        <option value="300">Informes de Supervición de Contratos</option>
                                                    </select>
                                                </div>
                                                <div class="col-md-2 col-sm-3 col-xs-12">
                                                    <select id="comboAnioDocumento" name="comboAnioDocumento" class="form-control combo-paginar" idBtnBuscar='btnBuscarDocumento' style="border: 1px solid #00793D; margin-top: 40px">
                                                    </select>
                                                </div>
                                                <div class="col-md-4 col-sm-3 col-xs-12">
                                                    <div class="input-field">
                                                        <input type="text" name="txtTituloDocumento" id="txtTituloDocumento">
                                                        <label for="name" class=""><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Buscar Documento</font></font></label>
                                                    </div>
                                                </div>
                                                <div class="col-md-2 col-sm-3 col-xs-12">
                                                    <button type="submit" id="btnBuscarDocumento" class="waves-effect waves-light btn" style="height: 30px; padding-top: 2px; padding-bottom: 2px; margin-top: 45px;">Buscar</button>
                                                </div>
                                                <input type="hidden" id="nameForm" value="FrmDocumentos">
                                                <input type="hidden" id="actionDocumentos" name="action" value="paginarDocumentos">
                                                <input type="hidden" id="numberPageDocumentos" name="numberPageDocumentos" value="1">
                                                <input type="hidden" id="sizePageDocumentos" name="sizePageDocumentos" value="10">
                                                <input type="hidden" id="comboTipoListaDocumentos" name="comboTipoListaDocumentos" value="-1">
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
                                                                <th style="width: 10%;" class="text-center align-middle">Fecha</th>
                                                                <th style="width: 25%" class="align-middle">Título Documento</th>
                                                                <th style="width: 65%" class="align-middle">Resumen</th>
                                                                <th style="width: 10%" class="text-center align-middle">PDF</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody id="tbodyDocumentos">
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
                                                <ul id="paginationDocumentos" class="pagination pagination-sm" style="margin-top: 0px; margin-top: 0px">

                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title">
                                        <a class="collapsed" data-toggle="collapse" data-parent="#tab" href="#tab-ordenes-de-compra" aria-expanded="false">
                                            Ordenes de Compras de Bienes
                                        </a>
                                    </h3>
                                </div>
                                <div id="tab-ordenes-de-compra" class="panel-collapse collapse" aria-expanded="false">
                                    <div class="panel-body">
                                        Estamos Trabajando...
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title">
                                        <a class="collapsed" data-toggle="collapse" data-parent="#tab" href="#tab-ordenes-de-servicio" aria-expanded="false">
                                            Ordenes de Servicios
                                        </a>
                                    </h3>
                                </div>
                                <div id="tab-ordenes-de-servicio" class="panel-collapse collapse" aria-expanded="false">
                                    <div class="panel-body">
                                        Estamos Trabajando...
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title">
                                        <a class="collapsed" data-toggle="collapse" data-parent="#tab" href="#tab-gastos-en-publicidad" aria-expanded="false">
                                            Gastos en Publicidad
                                        </a>
                                    </h3>
                                </div>
                                <div id="tab-gastos-en-publicidad" class="panel-collapse collapse" aria-expanded="false">
                                    <div class="panel-body">
                                        Estamos Trabajando...
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title">
                                        <a class="collapsed" data-toggle="collapse" data-parent="#tab" href="#tab-gastos-en-telefonia" aria-expanded="false">
                                            Gastos en Telefonía
                                        </a>
                                    </h3>
                                </div>
                                <div id="tab-gastos-en-telefonia" class="panel-collapse collapse" aria-expanded="false">
                                    <div class="panel-body">
                                        Estamos Trabajando...
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title">
                                        <a class="collapsed" data-toggle="collapse" data-parent="#tab" href="#tab-uso-de-vehiculos" aria-expanded="false">
                                            Uso de Vehículos
                                        </a>
                                    </h3>
                                </div>
                                <div id="tab-uso-de-vehiculos" class="panel-collapse collapse" aria-expanded="false">
                                    <div class="panel-body">
                                        Estamos Trabajando...
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title">
                                        <a class="collapsed" data-toggle="collapse" data-parent="#tab" href="#tab-principales-de-proveedores" aria-expanded="false">
                                            Principales Proveedores
                                        </a>
                                    </h3>
                                </div>
                                <div id="tab-principales-de-proveedores" class="panel-collapse collapse" aria-expanded="false">
                                    <div class="panel-body">
                                        Estamos Trabajando...
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title">
                                        <a class="collapsed" data-toggle="collapse" data-parent="#tab" href="#tab-viaticos-y-pasajes" aria-expanded="false">
                                            Viáticos y Pasajes
                                        </a>
                                    </h3>
                                </div>
                                <div id="tab-viaticos-y-pasajes" class="panel-collapse collapse" aria-expanded="false">
                                    <div class="panel-body">
                                        Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch.
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title">
                                        <a class="collapsed" data-toggle="collapse" data-parent="#tab" href="#tab-penalidades-aplicadas" aria-expanded="false">
                                            Penalidades Aplicadas
                                        </a>
                                    </h3>
                                </div>
                                <div id="tab-penalidades-aplicadas" class="panel-collapse collapse" aria-expanded="false">
                                    <div class="panel-body">
                                        <div class="row">
                                            <form id="FrmPenalidad">
                                                <div class="col-md-2 col-sm-3 col-xs-12">
                                                    <select id="comboAnioPenalidad" name="comboAnioPenalidad" class="form-control combo-paginar" idBtnBuscar='btnBuscarPenalidad' style="border: 1px solid #00793D; margin-top: 40px">
                                                    </select>
                                                </div>
                                                <div class="col-md-8 col-sm-9 col-xs-12">
                                                    <div class="input-field">
                                                        <input type="text" name="txtPenalidad" id="txtPenalidad">
                                                        <label for="name" class=""><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Buscar Contratista</font></font></label>
                                                    </div>
                                                </div>
                                                <div class="col-md-2 col-sm-3 col-xs-12">
                                                    <button type="submit" id="btnBuscarPenalidad" class="waves-effect waves-light btn" style="height: 30px; padding-top: 2px; padding-bottom: 2px; margin-top: 45px;">Buscar</button>
                                                </div>
                                                <input type="hidden" id="nameFormPenalidad" value="FrmPenalidad">
                                                <input type="hidden" id="actionPenalidad" name="action" value="paginarPenalidad">
                                                <input type="hidden" id="numberPagePenalidad" name="numberPagePenalidad" value="1">
                                                <input type="hidden" id="sizePagePenalidad" name="sizePagePenalidad" value="10">
                                            </form>
                                        </div>
                                        <div class="row" id="loader_contenido_penalidad">
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
                                                                <th style="width: 10%;" class="text-center align-middle">CONTRATO S/</th>
                                                                <th style="width: 35%" class="align-middle">CONTRATISTA</th>
                                                                <th style="width: 10%" class="text-center align-middle">RUC</th>
                                                                <th style="width: 10%" class="text-center align-middle">TIPO</th>
                                                                <th style="width: 35%" class="align-middle">OBJETO DE PROCESO</th>
                                                                <th style="width: 15%" class="text-center align-middle">MONTO PENALIDAD S/</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody id="tbodyPenalidad">
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
                                                <ul id="paginationPenalidad" class="pagination pagination-sm" style="margin-top: 0px; margin-top: 0px">

                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
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
        <!-- RS5.0 Core JS Files -->
        <script src="<%out.print(getServletContext().getContextPath());%>/assets/plugins/sweetalert/sweetalert.min.js"></script>
        <script src="<%out.print(getServletContext().getContextPath());%>/assets/revolution/js/jquery.themepunch.tools.min.js"></script>
        <script src="<%out.print(getServletContext().getContextPath());%>/assets/revolution/js/jquery.themepunch.revolution.min.js"></script>
        <script src="<%out.print(getServletContext().getContextPath());%>/js/jquery.Pagination.min.js"></script>
        <script type="text/javascript" src="<%out.print(getServletContext().getContextPath());%>/assets/plugins/toast-master/js/jquery.toast.js"></script>
        <script type="text/javascript" src="<%out.print(getServletContext().getContextPath());%>/js_app/utilities/lib-utilities.js"></script>
        <script type="text/javascript" src="<%out.print(getServletContext().getContextPath());%>/js_app/utilities/lib-validaciones.js"></script>
        <script type="text/javascript" src="<%out.print(getServletContext().getContextPath());%>/js/conf_web.js"></script>
        <script type="text/javascript" src="<%out.print(getServletContext().getContextPath());%>/js_app/web/gestiontransparente.js"></script>
        <script type="text/javascript" src="<%out.print(getServletContext().getContextPath());%>/js_app/web/penalidad.js"></script>

    </body>
</html>