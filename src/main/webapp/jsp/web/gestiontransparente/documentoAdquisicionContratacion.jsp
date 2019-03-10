<%-- 
    Document   : documentoAdquisicionContratacion.jsp
    Created on : 23/11/2018, 09:32:34 PM
    Author     : JamesCarrillo
--%>
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
                <input type="hidden" id="cate_id" value="1100">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="panel-group feature-accordion brand-accordion icon angle-icon" id="tab">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title">
                                        <a class="item-documento-ad collapsed" data-toggle="collapse" data-parent="#tab" href="#tab-documentos" cate_id="1100" complemento="" aria-expanded="false">
                                            PAC y Modificatorias
                                        </a>
                                    </h3>
                                </div>
                                <div id="tab-documentos" class="panel-collapse collapse" aria-expanded="false" style="">
                                    <div class="panel-body">
                                        <div class="row">
                                            <form id="FrmDocumentos">
                                                <div class="col-md-2 col-sm-3 col-xs-12">
                                                    <select id="comboAnioDocumento" name="comboAnioDocumento" class="form-control combo-paginar" idBtnBuscar='btnBuscarDocumento' style="border: 1px solid #00793D; margin-top: 40px">
                                                    </select>
                                                </div>
                                                <div class="col-md-8 col-sm-6 col-xs-12">
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
                                        <div class="row" id="loader_contenido" style="display: none">
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
                                                                <th style="width: 10%;" class="text-center align-middle">FECHA</th>
                                                                <th style="width: 25%" class="align-middle">TÍTULO DOCUMENTO</th>
                                                                <th style="width: 65%" class="align-middle">RESUMEN</th>
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
                                                    <li><a class="view-reporte" format="pdf" title='Descargar en PDF' style='padding-right: 10px'><i class='fa fa-file-pdf-o'></i></a></li>
                                                    <li><a class="view-reporte" format="docx" title="Descargar en WORD" style="padding-right: 10px"><i class="fa fa-file-text"></i></a></li>
                                                    <li><a class="view-reporte" format="pptx" title="Descargar en PPT" style="padding-right: 10px"><i class="fa fa-file-powerpoint-o"></i></a></li>
                                                    <li><a class="view-reporte" format="xlsx" title="Descargar en EXCEL" style="padding-right: 10px"><i class="fa fa-file-excel-o"></i></a></li>
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
                                        <a class="AnioOrdenTipo collapsed" tipo="1" data-toggle="collapse" data-parent="#tab" href="#tab-ordenes-de-compra" aria-expanded="false">
                                            Ordenes de Compras de Bienes
                                        </a>
                                    </h3>
                                </div>
                                <div id="tab-ordenes-de-compra" class="panel-collapse collapse" aria-expanded="false">
                                    <div class="panel-body">
                                        <div class="row">
                                            <form id="FrmOrdenCompra">                                               
                                                <div class="col-md-2 col-sm-3 col-xs-12">
                                                    <select id="comboAnioOrdenCompra" name="comboAnioOrdenCompra" tipo="1" class="form-control combo-paginarOrden" idBtnBuscar='btnBuscarOrdenCompra' style="border: 1px solid #00793D; margin-top: 40px">
                                                    </select>
                                                </div>
                                                <div class="col-md-2 col-sm-3 col-xs-12">
                                                    <select id="comboMesesOrdenCompra" name="comboMesesOrdenCompra" class="form-control combo-paginar" idBtnBuscar='btnBuscarOrdenCompra' style="border: 1px solid #00793D; margin-top: 40px">
                                                    </select>
                                                </div>
                                                <div class="col-md-6 col-sm-9 col-xs-12">
                                                    <div class="input-field">
                                                        <input type="text" name="txtProveedorOrdenCompra" id="txtProveedorOrdenCompra">
                                                        <label for="name" class=""><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Buscar Orden Compra</font></font></label>
                                                    </div>
                                                </div>
                                                <div class="col-md-2 col-xs-12">
                                                    <button type="submit" id="btnBuscarOrdenCompra" class="waves-effect waves-light btn" style="height: 30px; padding-top: 2px; padding-bottom: 2px; margin-top: 45px;">Buscar</button>
                                                </div>
                                                <input type="hidden" id="nameFormOrdenCompra" value="FrmOrdenCompra">
                                                <input type="hidden" id="actionOrdenCompra" name="action" value="paginarOrdenCompra">
                                                <input type="hidden" id="numberPageOrdenCompra" name="numberPageOrdenCompra" value="1">
                                                <input type="hidden" id="sizePageOrdenCompra" name="sizePageOrdenCompra" value="10">                                                
                                            </form>
                                        </div>
                                        <div class="row" id="loader_contenido_orden_compra" style="display: none">
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
                                                                <th style="width: 10%" class="text-medium-table text-center">N° ORDEN</th>
                                                                <th style="width: 10%" class="text-medium-table text-center">N° SIAF</th>
                                                                <th style="width: 10%" class="text-medium-table text-center">FECHA DE EMISIÓN</th>
                                                                <th style="width: 35%" class="text-medium-table">FUENTE FINANCIAMIENTO</th>
                                                                <th style="width: 35%" class="text-medium-table">PROVEEDOR</th>
                                                                <th style="width: 10%" class="text-medium-table text-center">MONTO</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody id="tbodyOrdenCompra">
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
                                                    <li><a class="view-reporte-oc" format="pdf" title='Descargar en PDF' style='padding-right: 10px'><i class='fa fa-file-pdf-o'></i></a></li>
                                                    <li><a class="view-reporte-oc" format="docx" title="Descargar en WORD" style="padding-right: 10px"><i class="fa fa-file-text"></i></a></li>
                                                    <li><a class="view-reporte-oc" format="pptx" title="Descargar en PPT" style="padding-right: 10px"><i class="fa fa-file-powerpoint-o"></i></a></li>
                                                    <li><a class="view-reporte-oc" format="xlsx" title="Descargar en EXCEL" style="padding-right: 10px"><i class="fa fa-file-excel-o"></i></a></li>
                                                </ul>
                                            </div>
                                            <div class="col-md-9 col-xs-12 text-right">
                                                <ul id="paginationOrdenCompra" class="pagination pagination-sm" style="margin-top: 0px; margin-top: 0px">

                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title">
                                        <a class="AnioOrdenTipo collapsed" data-toggle="collapse" tipo="2" data-parent="#tab" href="#tab-ordenes-de-servicio" aria-expanded="false">
                                            Ordenes de Servicios
                                        </a>
                                    </h3>
                                </div>
                                <div id="tab-ordenes-de-servicio" class="panel-collapse collapse" aria-expanded="false">
                                    <div class="panel-body">
                                        <div class="row">
                                            <form id="FrmOrdenServicio">                                               
                                                <div class="col-md-2 col-sm-3 col-xs-12">
                                                    <select id="comboAnioOrdenServicio" name="comboAnioOrdenServicio" tipo="2" class="form-control combo-paginarOrden" idBtnBuscar='btnBuscarOrdenServicio' style="border: 1px solid #00793D; margin-top: 40px">
                                                    </select>
                                                </div>
                                                <div class="col-md-2 col-sm-3 col-xs-12">
                                                    <select id="comboMesesOrdenServicio" name="comboMesesOrdenServicio" class="form-control combo-paginar" idBtnBuscar='btnBuscarOrdenServicio' style="border: 1px solid #00793D; margin-top: 40px">
                                                    </select>
                                                </div>
                                                <div class="col-md-6 col-sm-9 col-xs-12">
                                                    <div class="input-field">
                                                        <input type="text" name="txtProveedorOrdenServicio" id="txtProveedorOrdenServicio">
                                                        <label for="name" class=""><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Buscar Orden Servicio</font></font></label>
                                                    </div>
                                                </div>
                                                <div class="col-md-2 col-xs-12">
                                                    <button type="submit" id="btnBuscarOrdenServicio" class="waves-effect waves-light btn" style="height: 30px; padding-top: 2px; padding-bottom: 2px; margin-top: 45px;">Buscar</button>
                                                </div>
                                                <input type="hidden" id="nameFormOrdenServicio" value="FrmOrdenServicio">
                                                <input type="hidden" id="actionOrdenServicio" name="action" value="paginarOrdenServicio">
                                                <input type="hidden" id="numberPageOrdenServicio" name="numberPageOrdenServicio" value="1">
                                                <input type="hidden" id="sizePageOrdenServicio" name="sizePageOrdenServicio" value="10">                                                
                                            </form>
                                        </div>
                                        <div class="row" id="loader_contenido_orden_servicio" style="display: none">
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
                                                                <th style="width: 10%" class="text-medium-table text-center">N° ORDEN</th>
                                                                <th style="width: 10%" class="text-medium-table text-center">N° SIAF</th>
                                                                <th style="width: 10%" class="text-medium-table text-center">FECHA DE EMISIÓN</th>
                                                                <th style="width: 35%" class="text-medium-table">FUENTE FINANCIAMIENTO</th>
                                                                <th style="width: 35%" class="text-medium-table">PROVEEDOR</th>
                                                                <th style="width: 10%" class="text-medium-table text-center">MONTO</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody id="tbodyOrdenServicio">
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
                                                    <li><a class="view-reporte-os" format="pdf" title='Descargar en PDF' style='padding-right: 10px'><i class='fa fa-file-pdf-o'></i></a></li>
                                                    <li><a class="view-reporte-os" format="docx" title="Descargar en WORD" style="padding-right: 10px"><i class="fa fa-file-text"></i></a></li>
                                                    <li><a class="view-reporte-os" format="pptx" title="Descargar en PPT" style="padding-right: 10px"><i class="fa fa-file-powerpoint-o"></i></a></li>
                                                    <li><a class="view-reporte-os" format="xlsx" title="Descargar en EXCEL" style="padding-right: 10px"><i class="fa fa-file-excel-o"></i></a></li>
                                                </ul>
                                            </div>
                                            <div class="col-md-9 col-xs-12 text-right">
                                                <ul id="paginationOrdenServicio" class="pagination pagination-sm" style="margin-top: 0px; margin-top: 0px">

                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title">
                                        <a class="AnioOrdenTipo collapsed" tipo="3" data-toggle="collapse" data-parent="#tab" href="#tab-gastos-en-publicidad" aria-expanded="false">
                                            Gastos en Publicidad
                                        </a>
                                    </h3>
                                </div>
                                <div id="tab-gastos-en-publicidad" class="panel-collapse collapse" aria-expanded="false">
                                    <div class="panel-body">
                                        <div class="row">
                                            <form id="FrmPublicidad">                                               
                                                <div class="col-md-2 col-sm-3 col-xs-12">
                                                    <select id="comboAnioPublicidad" name="comboAnioPublicidad" class="form-control combo-paginar" idBtnBuscar='btnBuscarPublicidad' style="border: 1px solid #00793D; margin-top: 40px">
                                                    </select>
                                                </div>
                                                <div class="col-md-8 col-sm-9 col-xs-12">
                                                    <div class="input-field">
                                                        <input type="text" name="txtProveedorPublicidad" id="txtProveedorPublicidad">
                                                        <label for="name" class=""><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Buscar Publicidad</font></font></label>
                                                    </div>
                                                </div>
                                                <div class="col-md-2 col-xs-12">
                                                    <button type="submit" id="btnBuscarPublicidad" class="waves-effect waves-light btn" style="height: 30px; padding-top: 2px; padding-bottom: 2px; margin-top: 45px;">Buscar</button>
                                                </div>
                                                <input type="hidden" id="nameFormPublicidad" value="FrmPublicidad">
                                                <input type="hidden" id="actionPublicidad" name="action" value="paginarPublicidad">
                                                <input type="hidden" id="numberPagePublicidad" name="numberPagePublicidad" value="1">
                                                <input type="hidden" id="sizePagePublicidad" name="sizePagePublicidad" value="10">                                                
                                            </form>
                                        </div>
                                        <div class="row" id="loader_contenido_publicidad" style="display: none">
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
                                                                <th style="width: 20%" class="text-medium-table text-center">N° CONTRATO</th>
                                                                <th style="width: 25%" class="text-medium-table">OBJETO DE CONTRATO</th>
                                                                <th style="width: 10%" class="text-medium-table text-center">RUC</th>
                                                                <th style="width: 20%" class="text-medium-table">PROVEEDOR</th>
                                                                <th style="width: 10%" class="text-medium-table">PENALIDAD S/</th>
                                                                <th style="width: 12%" class="text-medium-table text-center">COSTO FINAL S/</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody id="tbodyPublicidad">
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
                                                    <li><a class="view-reporte-pu" format="pdf" title='Descargar en PDF' style='padding-right: 10px'><i class='fa fa-file-pdf-o'></i></a></li>
                                                    <li><a class="view-reporte-pu" format="docx" title="Descargar en WORD" style="padding-right: 10px"><i class="fa fa-file-text"></i></a></li>
                                                    <li><a class="view-reporte-pu" format="pptx" title="Descargar en PPT" style="padding-right: 10px"><i class="fa fa-file-powerpoint-o"></i></a></li>
                                                    <li><a class="view-reporte-pu" format="xlsx" title="Descargar en EXCEL" style="padding-right: 10px"><i class="fa fa-file-excel-o"></i></a></li>
                                                </ul>
                                            </div>
                                            <div class="col-md-9 col-xs-12 text-right">
                                                <ul id="paginationPublicidad" class="pagination pagination-sm" style="margin-top: 0px; margin-top: 0px">

                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title">
                                        <a class="AnioOrdenTipo collapsed" tipo="5" data-toggle="collapse" data-parent="#tab" href="#tab-gastos-en-telefonia" aria-expanded="false">
                                            Gastos en Telefonía
                                        </a>
                                    </h3>
                                </div>
                                <div id="tab-gastos-en-telefonia" class="panel-collapse collapse" aria-expanded="false">
                                    <div class="panel-body">
                                        <div class="row">
                                            <form id="FrmTelefonia">                                               
                                                <div class="col-md-2 col-sm-3 col-xs-12">
                                                    <select id="comboAnioTelefonia" name="comboAnioTelefonia" tipo="3" class="form-control combo-paginarOrden" idBtnBuscar='btnBuscarTelefonia' style="border: 1px solid #00793D; margin-top: 40px">
                                                    </select>
                                                </div>
                                                <div class="col-md-2 col-sm-3 col-xs-12">
                                                    <select id="comboMesesTelefonia" name="comboMesesTelefonia" class="form-control combo-paginar" idBtnBuscar='btnBuscarTelefonia' style="border: 1px solid #00793D; margin-top: 40px">
                                                    </select>
                                                </div>
                                                <div class="col-md-6 col-sm-9 col-xs-12">
                                                    <div class="input-field">
                                                        <input type="text" name="txtAreaTelefonia" id="txtAreaTelefonia">
                                                        <label for="name" class=""><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Buscar Área/Oficina</font></font></label>
                                                    </div>
                                                </div>
                                                <div class="col-md-2 col-xs-12">
                                                    <button type="submit" id="btnBuscarTelefonia" class="waves-effect waves-light btn" style="height: 30px; padding-top: 2px; padding-bottom: 2px; margin-top: 45px;">Buscar</button>
                                                </div>
                                                <input type="hidden" id="nameFormTelefonia" value="FrmTelefonia">
                                                <input type="hidden" id="actionTelefonia" name="action" value="paginarTelefonia">
                                                <input type="hidden" id="numberPageTelefonia" name="numberPageTelefonia" value="1">
                                                <input type="hidden" id="sizePageTelefonia" name="sizePageTelefonia" value="10">                                                
                                            </form>
                                        </div>
                                        <div class="row" id="loader_contenido_telefonia" style="display: none">
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
                                                                <th style="width: 10%" class="text-medium-table text-center">TIPO</th>
                                                                <th style="width: 10%" class="text-medium-table text-center">NÚMERO</th>
                                                                <th style="width: 25%" class="text-medium-table">ÁREA/OFICINA</th>
                                                                <th style="width: 25%" class="text-medium-table">ASIGNADO A</th>
                                                                <th style="width: 20%" class="text-medium-table">CARGO</th>
                                                                <th style="width: 15%" class="text-medium-table text-center">IMPORTE S/</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody id="tbodyTelefonia">
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
                                                    <li><a class="view-reporte-tel" format="pdf" title='Descargar en PDF' style='padding-right: 10px'><i class='fa fa-file-pdf-o'></i></a></li>
                                                    <li><a class="view-reporte-tel" format="docx" title="Descargar en WORD" style="padding-right: 10px"><i class="fa fa-file-text"></i></a></li>
                                                    <li><a class="view-reporte-tel" format="pptx" title="Descargar en PPT" style="padding-right: 10px"><i class="fa fa-file-powerpoint-o"></i></a></li>
                                                    <li><a class="view-reporte-tel" format="xlsx" title="Descargar en EXCEL" style="padding-right: 10px"><i class="fa fa-file-excel-o"></i></a></li>
                                                </ul>
                                            </div>
                                            <div class="col-md-9 col-xs-12 text-right">
                                                <ul id="paginationTelefonia" class="pagination pagination-sm" style="margin-top: 0px; margin-top: 0px">

                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title">
                                        <a class="AnioOrdenTipo collapsed" tipo="6" data-toggle="collapse" data-parent="#tab" href="#tab-uso-de-vehiculos" aria-expanded="false">
                                            Uso de Vehículos
                                        </a>
                                    </h3>
                                </div>
                                <div id="tab-uso-de-vehiculos" class="panel-collapse collapse" aria-expanded="false">
                                    <div class="panel-body">
                                        <div class="row">
                                            <form id="FrmVehiculo">                                               
                                                <div class="col-md-2 col-sm-3 col-xs-12">
                                                    <select id="comboAnioVehiculo" name="comboAnioVehiculo" tipo="4" class="form-control combo-paginarOrden" idBtnBuscar='btnBuscarVehiculo' style="border: 1px solid #00793D; margin-top: 40px">
                                                    </select>
                                                </div>
                                                <div class="col-md-2 col-sm-3 col-xs-12">
                                                    <select id="comboMesesVehiculo" name="comboMesesVehiculo" class="form-control combo-paginar" idBtnBuscar='btnBuscarVehiculo' style="border: 1px solid #00793D; margin-top: 40px">
                                                    </select>
                                                </div>
                                                <div class="col-md-6 col-sm-9 col-xs-12">
                                                    <div class="input-field">
                                                        <input type="text" name="txtAreaVehiculo" id="txtAreaVehiculo">
                                                        <label for="name" class=""><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Buscar Chofer</font></font></label>
                                                    </div>
                                                </div>
                                                <div class="col-md-2 col-xs-12">
                                                    <button type="submit" id="btnBuscarVehiculo" class="waves-effect waves-light btn" style="height: 30px; padding-top: 2px; padding-bottom: 2px; margin-top: 45px;">Buscar</button>
                                                </div>
                                                <input type="hidden" id="nameFormVehiculo" value="FrmVehiculo">
                                                <input type="hidden" id="actionVehiculo" name="action" value="paginarVehiculo">
                                                <input type="hidden" id="numberPageVehiculo" name="numberPageVehiculo" value="1">
                                                <input type="hidden" id="sizePageVehiculo" name="sizePageVehiculo" value="10">                                                
                                            </form>
                                        </div>
                                        <div class="row" id="loader_contenido_vehiculo" style="display: none">
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
                                                                <th style="width: 10%" class="text-medium-table text-center">VEHÍCULO</th>
                                                                <th style="width: 20%" class="text-medium-table">ASIGNADO A</th>
                                                                <th style="width: 20%" class="text-medium-table">CHOFER</th>
                                                                <th style="width: 10%" class="text-medium-table text-center">RECORRIDO KM</th>
                                                                <th style="width: 10%" class="text-medium-table text-center">VENCIMIENTO DE SOAT</th>
                                                                <th style="width: 10%" class="text-medium-table text-center">TIPO DE COMBUSTIBLE</th>
                                                                <th style="width: 10%" class="text-medium-table text-center">COMBUSTIBLE S/</th>
                                                                <th style="width: 10%" class="text-medium-table text-center">PLACA</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody id="tbodyVehiculo">
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
                                                    <li><a class="view-reporte-vehiculo" format="pdf" title='Descargar en PDF' style='padding-right: 10px'><i class='fa fa-file-pdf-o'></i></a></li>
                                                    <li><a class="view-reporte-vehiculo" format="docx" title="Descargar en WORD" style="padding-right: 10px"><i class="fa fa-file-text"></i></a></li>
                                                    <li><a class="view-reporte-vehiculo" format="pptx" title="Descargar en PPT" style="padding-right: 10px"><i class="fa fa-file-powerpoint-o"></i></a></li>
                                                    <li><a class="view-reporte-vehiculo" format="xlsx" title="Descargar en EXCEL" style="padding-right: 10px"><i class="fa fa-file-excel-o"></i></a></li>
                                                </ul>
                                            </div>
                                            <div class="col-md-9 col-xs-12 text-right">
                                                <ul id="paginationVehiculo" class="pagination pagination-sm" style="margin-top: 0px; margin-top: 0px">

                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title">
                                        <a class="AnioOrdenTipo collapsed" tipo="7" data-toggle="collapse" data-parent="#tab" href="#tab-principales-de-proveedores" aria-expanded="false">
                                            Principales Proveedores
                                        </a>
                                    </h3>
                                </div>
                                <div id="tab-principales-de-proveedores" class="panel-collapse collapse" aria-expanded="false">
                                    <div class="panel-body">
                                        <div class="row">
                                            <form id="FrmProveedor">                                               
                                                <div class="col-md-2 col-sm-3 col-xs-12">
                                                    <select id="comboAnioProveedor" destino="comboMesesProveedor" name="comboAnioProveedor" class="form-control combo-paginarRRHH" idBtnBuscar='btnBuscarProveedor' style="border: 1px solid #00793D; margin-top: 40px">
                                                    </select>
                                                </div>
                                                <div class="col-md-2 col-sm-3 col-xs-12">
                                                    <select id="comboMesesProveedor" name="comboMesesProveedor" class="form-control combo-paginar" idBtnBuscar='btnBuscarProveedor' style="border: 1px solid #00793D; margin-top: 40px">
                                                    </select>
                                                </div>
                                                <div class="col-md-6 col-sm-9 col-xs-12">
                                                    <div class="input-field">
                                                        <input type="text" name="txtProveedor" id="txtProveedor">
                                                        <label for="name" class=""><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Buscar Proveedor</font></font></label>
                                                    </div>
                                                </div>
                                                <div class="col-md-2 col-xs-12">
                                                    <button type="submit" id="btnBuscarProveedor" class="waves-effect waves-light btn" style="height: 30px; padding-top: 2px; padding-bottom: 2px; margin-top: 45px;">Buscar</button>
                                                </div>
                                                <input type="hidden" id="nameFormProveedor" value="FrmProveedor">
                                                <input type="hidden" id="actionProveedor" name="action" value="paginarProveedor">
                                                <input type="hidden" id="numberPageProveedor" name="numberPageProveedor" value="1">
                                                <input type="hidden" id="sizePageProveedor" name="sizePageProveedor" value="10">                                                
                                            </form>
                                        </div>
                                        <div class="row" id="loader_contenido_proveedor" style="display: none">
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
                                                                <th style="width: 10%" class="text-medium-table text-center">RUC</th>
                                                                <th style="width: 80%" class="text-medium-table">PROVEEDOR</th>
                                                                <th style="width: 10%" class="text-medium-table text-center">IMPORTE</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody id="tbodyProveedor">
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
                                                    <li><a class="view-reporte-proveedor" format="pdf" title='Descargar en PDF' style='padding-right: 10px'><i class='fa fa-file-pdf-o'></i></a></li>
                                                    <li><a class="view-reporte-proveedor" format="docx" title="Descargar en WORD" style="padding-right: 10px"><i class="fa fa-file-text"></i></a></li>
                                                    <li><a class="view-reporte-proveedor" format="pptx" title="Descargar en PPT" style="padding-right: 10px"><i class="fa fa-file-powerpoint-o"></i></a></li>
                                                    <li><a class="view-reporte-proveedor" format="xlsx" title="Descargar en EXCEL" style="padding-right: 10px"><i class="fa fa-file-excel-o"></i></a></li>
                                                </ul>
                                            </div>
                                            <div class="col-md-9 col-xs-12 text-right">
                                                <ul id="paginationProveedor" class="pagination pagination-sm" style="margin-top: 0px; margin-top: 0px">

                                                </ul>
                                            </div>
                                        </div>
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
                                        <div class="row">
                                            <form id="FrmViatico">                                               
                                                <div class="col-md-2 col-sm-3 col-xs-12">
                                                    <select id="comboAnioViatico" name="comboAnioViatico" class="form-control combo-paginar" idBtnBuscar='btnBuscarViatico' style="border: 1px solid #00793D; margin-top: 40px">
                                                    </select>
                                                </div>
                                                <div class="col-md-8 col-sm-9 col-xs-12">
                                                    <div class="input-field">
                                                        <input type="text" name="txtTituloViatico" id="txtTituloViatico">
                                                        <label for="name" class=""><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Buscar Ruta o Usuario</font></font></label>
                                                    </div>
                                                </div>
                                                <div class="col-md-2 col-xs-12">
                                                    <button type="submit" id="btnBuscarViatico" class="waves-effect waves-light btn" style="height: 30px; padding-top: 2px; padding-bottom: 2px; margin-top: 45px;">Buscar</button>
                                                </div>
                                                <input type="hidden" id="nameFormViatico" value="FrmViatico">
                                                <input type="hidden" id="actionViatico" name="action" value="paginarViatico">
                                                <input type="hidden" id="numberPageViatico" name="numberPageViatico" value="1">
                                                <input type="hidden" id="sizePageViatico" name="sizePageViatico" value="10">                                                
                                            </form>
                                        </div>
                                        <div class="row" id="loader_contenido_viatico" style="display: none">
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
                                                                <th style="width: 20%" class="text-medium-table">OFICINA/ÁREA</th>
                                                                <th style="width: 20%" class="text-medium-table">USUARIO</th>
                                                                <th style="width: 10%" class="text-medium-table text-center">SALIDA</th>
                                                                <th style="width: 10%" class="text-medium-table text-center">RETORNO</th>
                                                                <th style="width: 20%" class="text-medium-table">RUTA</th>
                                                                <th style="width: 10%" class="text-medium-table text-center">PASAJE</th>
                                                                <th style="width: 10%" class="text-medium-table text-center">VIÁTICO</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody id="tbodyViatico">
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
                                                    <li><a class="view-reporte-viatico" format="pdf" title='Descargar en PDF' style='padding-right: 10px'><i class='fa fa-file-pdf-o'></i></a></li>
                                                    <li><a class="view-reporte-viatico" format="docx" title="Descargar en WORD" style="padding-right: 10px"><i class="fa fa-file-text"></i></a></li>
                                                    <li><a class="view-reporte-viatico" format="pptx" title="Descargar en PPT" style="padding-right: 10px"><i class="fa fa-file-powerpoint-o"></i></a></li>
                                                    <li><a class="view-reporte-viatico" format="xlsx" title="Descargar en EXCEL" style="padding-right: 10px"><i class="fa fa-file-excel-o"></i></a></li>
                                                </ul>
                                            </div>
                                            <div class="col-md-9 col-xs-12 text-right">
                                                <ul id="paginationViatico" class="pagination pagination-sm" style="margin-top: 0px; margin-top: 0px">

                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title">
                                        <a class="AnioOrdenTipo collapsed" tipo="4" data-toggle="collapse" data-parent="#tab" href="#tab-penalidades-aplicadas" aria-expanded="false">
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
                                        <div class="row" id="loader_contenido_penalidad" style="display: none">
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
                                                                <th style="width: 10%;" class="text-medium-table text-center align-middle">CONTRATO S/</th>
                                                                <th style="width: 35%" class="text-medium-table align-middle">CONTRATISTA</th>
                                                                <th style="width: 10%" class="text-medium-table text-center align-middle">RUC</th>
                                                                <th style="width: 10%" class="text-medium-table text-center align-middle">TIPO</th>
                                                                <th style="width: 35%" class="text-medium-table align-middle">OBJETO DE PROCESO</th>
                                                                <th style="width: 15%" class="text-medium-table text-center align-middle">MONTO PENALIDAD S/</th>
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
                                            <!--div class="col-md-3 col-xs-12">
                                                <ul class="list-inline pull-left">
                                                    <li><a href='' title='Descargar en PDF' style='padding-right: 10px'><i class='fa fa-file-pdf-o'></i></a></li>
                                                    <li><a href='' title="Descargar en WORD" style="padding-right: 10px"><i class="fa fa-file-text"></i></a></li>
                                                    <li><a href='' title="Descargar en PPT" style="padding-right: 10px"><i class="fa fa-file-powerpoint-o"></i></a></li>
                                                </ul>
                                            </div-->
                                            <div class="col-xs-12 text-right">
                                                <ul id="paginationPenalidad" class="pagination pagination-sm" style="margin-top: 0px; margin-top: 0px">

                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title">
                                        <a class="collapsed item-documento-ad" data-toggle="collapse" data-parent="#tab" href="#tab-monto-liquidacion-final-de-obra" cate_id="100" complemento="_MFO" aria-expanded="false">
                                            Monto de Liquidación Final de Obra
                                        </a>
                                    </h3>
                                </div>
                                <div id="tab-monto-liquidacion-final-de-obra" class="panel-collapse collapse" aria-expanded="false" style="">
                                    <div class="panel-body">
                                        <div class="row">
                                            <form id="FrmDocumentos_MFO">
                                                <div class="col-md-2 col-sm-3 col-xs-12">
                                                    <select id="comboAnioDocumento_MFO" name="comboAnioDocumento_MFO" class="form-control combo-paginar" idBtnBuscar='btnBuscarDocumento_MFO' style="border: 1px solid #00793D; margin-top: 40px">
                                                    </select>
                                                </div>
                                                <div class="col-md-8 col-sm-6 col-xs-12">
                                                    <div class="input-field">
                                                        <input type="text" name="txtTituloDocumento_MFO" id="txtTituloDocumento_MFO">
                                                        <label for="name" class=""><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Buscar Documento</font></font></label>
                                                    </div>
                                                </div>
                                                <div class="col-md-2 col-sm-3 col-xs-12">
                                                    <button type="submit" id="btnBuscarDocumento_MFO" class="waves-effect waves-light btn" style="height: 30px; padding-top: 2px; padding-bottom: 2px; margin-top: 45px;">Buscar</button>
                                                </div>
                                                <input type="hidden" id="nameForm_MFO" value="FrmDocumentos_MFO">
                                                <input type="hidden" id="actionDocumentos_MFO" name="action" value="paginarDocumentos">
                                                <input type="hidden" id="numberPageDocumentos_MFO" name="numberPageDocumentos_MFO" value="1">
                                                <input type="hidden" id="sizePageDocumentos_MFO" name="sizePageDocumentos_MFO" value="10">
                                                <input type="hidden" id="comboTipoListaDocumentos_MFO" name="comboTipoListaDocumentos_MFO" value="-1">
                                            </form>
                                        </div>
                                        <div class="row" id="loader_contenido_MFO" style="display: none">
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
                                                                <th style="width: 10%;" class="text-center align-middle">FECHA</th>
                                                                <th style="width: 25%" class="align-middle">TÍTULO DOCUMENTO</th>
                                                                <th style="width: 65%" class="align-middle">RESUMEN</th>
                                                                <th style="width: 10%" class="text-center align-middle">PDF</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody id="tbodyDocumentos_MFO">
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
                                                    <li><a class="view-reporte" format="pdf" title='Descargar en PDF' style='padding-right: 10px'><i class='fa fa-file-pdf-o'></i></a></li>
                                                    <li><a class="view-reporte" format="docx" title="Descargar en WORD" style="padding-right: 10px"><i class="fa fa-file-text"></i></a></li>
                                                    <li><a class="view-reporte" format="pptx" title="Descargar en PPT" style="padding-right: 10px"><i class="fa fa-file-powerpoint-o"></i></a></li>
                                                    <li><a class="view-reporte" format="xlsx" title="Descargar en EXCEL" style="padding-right: 10px"><i class="fa fa-file-excel-o"></i></a></li>
                                                </ul>
                                            </div>
                                            <div class="col-md-9 col-xs-12 text-right">
                                                <ul id="paginationDocumentos_MFO" class="pagination pagination-sm" style="margin-top: 0px; margin-top: 0px">

                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title">
                                        <a class="collapsed item-documento-ad" data-toggle="collapse" data-parent="#tab" href="#tab-monto-adicionales-de-obra" cate_id="200" complemento="_MAO" aria-expanded="false">
                                            Monto Adicionales de las Obras
                                        </a>
                                    </h3>
                                </div>
                                <div id="tab-monto-adicionales-de-obra" class="panel-collapse collapse" aria-expanded="false" style="">
                                    <div class="panel-body">
                                        <div class="row">
                                            <form id="FrmDocumentos_MAO">
                                                <div class="col-md-2 col-sm-3 col-xs-12">
                                                    <select id="comboAnioDocumento_MAO" name="comboAnioDocumento_MAO" class="form-control combo-paginar" idBtnBuscar='btnBuscarDocumento_MAO' style="border: 1px solid #00793D; margin-top: 40px">
                                                    </select>
                                                </div>
                                                <div class="col-md-8 col-sm-6 col-xs-12">
                                                    <div class="input-field">
                                                        <input type="text" name="txtTituloDocumento_MAO" id="txtTituloDocumento_MAO">
                                                        <label for="name" class=""><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Buscar Documento</font></font></label>
                                                    </div>
                                                </div>
                                                <div class="col-md-2 col-sm-3 col-xs-12">
                                                    <button type="submit" id="btnBuscarDocumento_MAO" class="waves-effect waves-light btn" style="height: 30px; padding-top: 2px; padding-bottom: 2px; margin-top: 45px;">Buscar</button>
                                                </div>
                                                <input type="hidden" id="nameForm_MAO" value="FrmDocumentos_MAO">
                                                <input type="hidden" id="actionDocumentos_MAO" name="action" value="paginarDocumentos">
                                                <input type="hidden" id="numberPageDocumentos_MAO" name="numberPageDocumentos_MAO" value="1">
                                                <input type="hidden" id="sizePageDocumentos_MAO" name="sizePageDocumentos_MAO" value="10">
                                                <input type="hidden" id="comboTipoListaDocumentos_MAO" name="comboTipoListaDocumentos_MAO" value="-1">
                                            </form>
                                        </div>
                                        <div class="row" id="loader_contenido_MAO" style="display: none">
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
                                                                <th style="width: 10%;" class="text-center align-middle">FECHA</th>
                                                                <th style="width: 25%" class="align-middle">TÍTULO DOCUMENTO</th>
                                                                <th style="width: 65%" class="align-middle">RESUMEN</th>
                                                                <th style="width: 10%" class="text-center align-middle">PDF</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody id="tbodyDocumentos_MAO">
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
                                                    <li><a class="view-reporte" format="pdf" title='Descargar en PDF' style='padding-right: 10px'><i class='fa fa-file-pdf-o'></i></a></li>
                                                    <li><a class="view-reporte" format="docx" title="Descargar en WORD" style="padding-right: 10px"><i class="fa fa-file-text"></i></a></li>
                                                    <li><a class="view-reporte" format="pptx" title="Descargar en PPT" style="padding-right: 10px"><i class="fa fa-file-powerpoint-o"></i></a></li>
                                                    <li><a class="view-reporte" format="xlsx" title="Descargar en EXCEL" style="padding-right: 10px"><i class="fa fa-file-excel-o"></i></a></li>
                                                </ul>
                                            </div>
                                            <div class="col-md-9 col-xs-12 text-right">
                                                <ul id="paginationDocumentos_MAO" class="pagination pagination-sm" style="margin-top: 0px; margin-top: 0px">

                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title">
                                        <a class="collapsed item-documento-ad" data-toggle="collapse" data-parent="#tab" href="#tab-informes-supervision-contratos" cate_id="300" complemento="_IFC" aria-expanded="false">
                                            Informes de Supervición de Contratos
                                        </a>
                                    </h3>
                                </div>
                                <div id="tab-informes-supervision-contratos" class="panel-collapse collapse" aria-expanded="false" style="">
                                    <div class="panel-body">
                                        <div class="row">
                                            <form id="FrmDocumentos_IFC">
                                                <div class="col-md-2 col-sm-3 col-xs-12">
                                                    <select id="comboAnioDocumento_IFC" name="comboAnioDocumento_IFC" class="form-control combo-paginar" idBtnBuscar='btnBuscarDocumento_IFC' style="border: 1px solid #00793D; margin-top: 40px">
                                                    </select>
                                                </div>
                                                <div class="col-md-8 col-sm-6 col-xs-12">
                                                    <div class="input-field">
                                                        <input type="text" name="txtTituloDocumento_IFC" id="txtTituloDocumento_MAO">
                                                        <label for="name" class=""><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Buscar Documento</font></font></label>
                                                    </div>
                                                </div>
                                                <div class="col-md-2 col-sm-3 col-xs-12">
                                                    <button type="submit" id="btnBuscarDocumento_IFC" class="waves-effect waves-light btn" style="height: 30px; padding-top: 2px; padding-bottom: 2px; margin-top: 45px;">Buscar</button>
                                                </div>
                                                <input type="hidden" id="nameForm_IFC" value="FrmDocumentos_IFC">
                                                <input type="hidden" id="actionDocumentos_IFC" name="action" value="paginarDocumentos">
                                                <input type="hidden" id="numberPageDocumentos_IFC" name="numberPageDocumentos_IFC" value="1">
                                                <input type="hidden" id="sizePageDocumentos_IFC" name="sizePageDocumentos_IFC" value="10">
                                                <input type="hidden" id="comboTipoListaDocumentos_IFC" name="comboTipoListaDocumentos_IFC" value="-1">
                                            </form>
                                        </div>
                                        <div class="row" id="loader_contenido_IFC" style="display: none">
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
                                                                <th style="width: 25%" class="align-middle">TÍTULO DOCUMENTO</th>
                                                                <th style="width: 65%" class="align-middle">RESUMEN</th>
                                                                <th style="width: 10%" class="text-center align-middle">PDF</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody id="tbodyDocumentos_IFC">
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
                                                    <li><a class="view-reporte" format="pdf" title='Descargar en PDF' style='padding-right: 10px'><i class='fa fa-file-pdf-o'></i></a></li>
                                                    <li><a class="view-reporte" format="docx" title="Descargar en WORD" style="padding-right: 10px"><i class="fa fa-file-text"></i></a></li>
                                                    <li><a class="view-reporte" format="pptx" title="Descargar en PPT" style="padding-right: 10px"><i class="fa fa-file-powerpoint-o"></i></a></li>
                                                    <li><a class="view-reporte" format="xlsx" title="Descargar en EXCEL" style="padding-right: 10px"><i class="fa fa-file-excel-o"></i></a></li>
                                                </ul>
                                            </div>
                                            <div class="col-md-9 col-xs-12 text-right">
                                                <ul id="paginationDocumentos_IFC" class="pagination pagination-sm" style="margin-top: 0px; margin-top: 0px">

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
        <script type="text/javascript" src="<%out.print(getServletContext().getContextPath());%>/js_app/web/gestiontransparente_adquisiciones.js"></script>
        <script type="text/javascript" src="<%out.print(getServletContext().getContextPath());%>/js_app/web/gestiontransparente_adquisiciones2.js"></script>

    </body>
</html>