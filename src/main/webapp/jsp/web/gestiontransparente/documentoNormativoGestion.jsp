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
                    <h2 class="text-peam-verde-subrayado" style="font-size: 30px">Documentos Normativos y de Gestión</h2>
                </div>
                <div class="row">
                    <div class="col-xs-12">
                        <input type="hidden" id="cate_id" name="cate_id" value="100">
                        <input type="hidden" id="tido_id" name="tido_id" value="10">
                        <input type="hidden" id="nombreComboAnio" value="comboAnioDocumento">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="border-tab transparent-nav">
                                    <ul class="nav nav-tabs nav-tabs-gt nav-justified" role="tablist">
                                        <li role="presentation" class="active"><a style="padding-top: 5px; padding-bottom: 5px" href="#tab-resoluciones-gerenciales" role="tab" class="waves-effect waves-dark item-documento" cate_id="100" tido_id="10" formulario="FrmDocumentos" combo_anio="comboAnioDocumento" data-toggle="tab">Resoluciones Gerenciales</a></li>
                                        <li role="presentation"><a style="padding-top: 5px; padding-bottom: 5px" href="#tab-actas-de-sesion" role="tab" class="waves-effect waves-dark item-documento" cate_id="2800" tido_id="" formulario="FrmDocumentos_AS" combo_anio="comboAnioDocumento_AS" data-toggle="tab">Actas de Sesión del Consejo Directivo</a></li>
                                        <li role="presentation"><a style="padding-top: 5px; padding-bottom: 5px" href="#tab-documentos-de-gestion" role="tab" class="waves-effect waves-dark item-documento" cate_id="100" tido_id="11" formulario="FrmDocumentos_DG" combo_anio="comboAnioDocumento_DG" data-toggle="tab">Documentos de Gestión</a></li>
                                        <li role="presentation"><a style="padding-top: 5px; padding-bottom: 5px" href="#tab-normas-y-directivas" role="tab" class="waves-effect waves-dark item-documento" cate_id="100" tido_id="12" formulario="FrmDocumentos_ND" combo_anio="comboAnioDocumento_ND" data-toggle="tab">Normas y <br> Directivas</a></li>
                                        <li role="presentation"><a style="padding-top: 5px; padding-bottom: 5px" href="#tab-indicadores-de-desempenio" role="tab" class="waves-effect waves-dark item-documento" cate_id="900" tido_id="" formulario="FrmDocumentos_ID" combo_anio="comboAnioDocumento_ID" data-toggle="tab">Indicadores de Desempeño</a></li>
                                    </ul>
                                    <div class="panel-body" style="padding-top: 0px">
                                        <div class="tab-content">
                                            <div role="tabpanel" class="tab-pane fade in active" id="tab-resoluciones-gerenciales">
                                                <div class="row-not">
                                                    <form id="FrmDocumentos">
                                                        <div class="col-md-2 col-sm-3 col-xs-12">
                                                            <select id="comboAnioDocumento" name="comboAnioDocumento" class="form-control combo-paginar" idBtnBuscar='btnBuscarDocumento' style="border: 1px solid #00793D; margin-top: 40px">
                                                            </select>
                                                        </div>
                                                        <div class="col-md-8 col-sm-3 col-xs-12">
                                                            <div class="input-field">
                                                                <input type="text" name="txtTituloDocumento" id="txtTituloDocumento">
                                                                <label for="name" class=""><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Buscar Documento . . .</font></font></label>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-2 col-sm-3 col-xs-12">
                                                            <button type="submit" id="btnBuscarDocumento" class="waves-effect waves-light btn" style="height: 30px; padding-top: 2px; padding-bottom: 2px; margin-top: 45px;">Buscar</button>
                                                        </div>
                                                        <input type="hidden" id="nameForm" value="FrmDocumentos">
                                                        <input type="hidden" id="actionDocumentos" name="action" value="paginarDocumentos">
                                                        <input type="hidden" id="numberPageDocumentos" name="numberPageDocumentos" value="1">
                                                        <input type="hidden" id="sizePageDocumentos" name="sizePageDocumentos" value="10">
                                                    </form>
                                                </div>
                                                <div class="row" id="loader_contenido" style="display: none">
                                                    <div class="col-md-1 col-md-offset-5 col-xs-2 col-xs-offset-5 mt-30">
                                                        <div class="loader-peam_small"></div>
                                                    </div>
                                                </div>
                                                <div class="row-not">
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
                                                <div class="row-not">
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
                                            <div role="tabpanel" class="tab-pane fade" id="tab-actas-de-sesion">
                                                <div class="row-not">
                                                    <form id="FrmDocumentos_AS">
                                                        <div class="col-md-2 col-sm-3 col-xs-12">
                                                            <select id="comboAnioDocumento_AS" name="comboAnioDocumento_AS" class="form-control combo-paginar" idBtnBuscar='btnBuscarDocumento_AS' style="border: 1px solid #00793D; margin-top: 40px">
                                                            </select>
                                                        </div>
                                                        <div class="col-md-8 col-sm-3 col-xs-12">
                                                            <div class="input-field">
                                                                <input type="text" name="txtTituloDocumento_AS" id="txtTituloDocumento_AS">
                                                                <label for="name" class=""><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Buscar Documento . . .</font></font></label>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-2 col-sm-3 col-xs-12">
                                                            <button type="submit" id="btnBuscarDocumento_AS" class="waves-effect waves-light btn" style="height: 30px; padding-top: 2px; padding-bottom: 2px; margin-top: 45px;">Buscar</button>
                                                        </div>
                                                        <input type="hidden" id="nameForm_AS" value="FrmDocumentos_AS">
                                                        <input type="hidden" id="actionDocumentos_AS" name="action" value="paginarDocumentos">
                                                        <input type="hidden" id="numberPageDocumentos_AS" name="numberPageDocumentos_AS" value="1">
                                                        <input type="hidden" id="sizePageDocumentos_AS" name="sizePageDocumentos_AS" value="10">
                                                    </form>
                                                </div>
                                                <div class="row" id="loader_contenido_AS" style="display: none">
                                                    <div class="col-md-1 col-md-offset-5 col-xs-2 col-xs-offset-5 mt-30">
                                                        <div class="loader-peam_small"></div>
                                                    </div>
                                                </div>
                                                <div class="row-not">
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
                                                                <tbody id="tbodyDocumentos_AS">
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row-not">
                                                    <div class="col-md-3 col-xs-12">
                                                        <ul class="list-inline pull-left">
                                                            <li><a class="view-reporte" format="pdf" title='Descargar en PDF' style='padding-right: 10px'><i class='fa fa-file-pdf-o'></i></a></li>
                                                            <li><a class="view-reporte" format="docx" title="Descargar en WORD" style="padding-right: 10px"><i class="fa fa-file-text"></i></a></li>
                                                            <li><a class="view-reporte" format="pptx" title="Descargar en PPT" style="padding-right: 10px"><i class="fa fa-file-powerpoint-o"></i></a></li>
                                                            <li><a class="view-reporte" format="xlsx" title="Descargar en EXCEL" style="padding-right: 10px"><i class="fa fa-file-excel-o"></i></a></li>
                                                        </ul>
                                                    </div>
                                                    <div class="col-md-9 col-xs-12 text-right">
                                                        <ul id="paginationDocumentos_AS" class="pagination pagination-sm" style="margin-top: 0px; margin-top: 0px">

                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                            <div role="tabpanel" class="tab-pane fade" id="tab-documentos-de-gestion">
                                                <div class="row-not">
                                                    <form id="FrmDocumentos_DG">
                                                        <div class="col-md-2 col-sm-3 col-xs-12">
                                                            <select id="comboAnioDocumento_DG" name="comboAnioDocumento_DG" class="form-control combo-paginar" idBtnBuscar='btnBuscarDocumento_DG' style="border: 1px solid #00793D; margin-top: 40px">
                                                            </select>
                                                        </div>
                                                        <div class="col-md-2 col-sm-3 col-xs-12">
                                                            <select id="cboCategoria_Doc" name="cboCategoria_Doc" class="form-control combo-paginar" idBtnBuscar='btnBuscarDocumento_DG' style="border: 1px solid #00793D; margin-top: 40px">
                                                            </select>
                                                        </div>
                                                        <div class="col-md-6 col-sm-3 col-xs-12">
                                                            <div class="input-field">
                                                                <input type="text" name="txtTituloDocumento_DG" id="txtTituloDocumento_DG">
                                                                <label for="name" class=""><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Buscar Documento . . .</font></font></label>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-2 col-sm-3 col-xs-12">
                                                            <button type="submit" id="btnBuscarDocumento_DG" class="waves-effect waves-light btn" style="height: 30px; padding-top: 2px; padding-bottom: 2px; margin-top: 45px;">Buscar</button>
                                                        </div>
                                                        <input type="hidden" id="nameForm_DG" value="FrmDocumentos_DG">
                                                        <input type="hidden" id="actionDocumentos_DG" name="action" value="paginarDocumentos">
                                                        <input type="hidden" id="numberPageDocumentos_DG" name="numberPageDocumentos_DG" value="1">
                                                        <input type="hidden" id="sizePageDocumentos_DG" name="sizePageDocumentos_DG" value="10">
                                                    </form>
                                                </div>
                                                <div class="row" id="loader_contenido_DG" style="display: none">
                                                    <div class="col-md-1 col-md-offset-5 col-xs-2 col-xs-offset-5 mt-30">
                                                        <div class="loader-peam_small"></div>
                                                    </div>
                                                </div>
                                                <div class="row-not">
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
                                                                <tbody id="tbodyDocumentos_DG">
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row-not">
                                                    <div class="col-md-3 col-xs-12">
                                                        <ul class="list-inline pull-left">
                                                            <li><a class="view-reporte" format="pdf" title='Descargar en PDF' style='padding-right: 10px'><i class='fa fa-file-pdf-o'></i></a></li>
                                                            <li><a class="view-reporte" format="docx" title="Descargar en WORD" style="padding-right: 10px"><i class="fa fa-file-text"></i></a></li>
                                                            <li><a class="view-reporte" format="pptx" title="Descargar en PPT" style="padding-right: 10px"><i class="fa fa-file-powerpoint-o"></i></a></li>
                                                            <li><a class="view-reporte" format="xlsx" title="Descargar en EXCEL" style="padding-right: 10px"><i class="fa fa-file-excel-o"></i></a></li>
                                                        </ul>
                                                    </div>
                                                    <div class="col-md-9 col-xs-12 text-right">
                                                        <ul id="paginationDocumentos_DG" class="pagination pagination-sm" style="margin-top: 0px; margin-top: 0px">

                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                            <div role="tabpanel" class="tab-pane fade" id="tab-normas-y-directivas">
                                                <div class="row-not">
                                                    <form id="FrmDocumentos_ND">
                                                        <div style="display: none">
                                                            <select id="comboAnioDocumento_ND" name="comboAnioDocumento_ND" class="form-control combo-paginar" idBtnBuscar='btnBuscarDocumento_ND' style="border: 1px solid #00793D; margin-top: 40px">
                                                            </select>
                                                        </div>
                                                        <div class="col-md-10 col-sm-8 col-xs-12">
                                                            <div class="input-field">
                                                                <input type="text" name="txtTituloDocumento_ND" id="txtTituloDocumento_ND">
                                                                <label for="name" class=""><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Buscar Documento . . .</font></font></label>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-2 col-sm-4 col-xs-12">
                                                            <button type="submit" id="btnBuscarDocumento_ND" class="waves-effect waves-light btn" style="height: 30px; padding-top: 2px; padding-bottom: 2px; margin-top: 45px;">Buscar</button>
                                                        </div>
                                                        <input type="hidden" id="nameForm_ND" value="FrmDocumentos_ND">
                                                        <input type="hidden" id="actionDocumentos_ND" name="action" value="paginarDocumentos">
                                                        <input type="hidden" id="numberPageDocumentos_ND" name="numberPageDocumentos_ND" value="1">
                                                        <input type="hidden" id="sizePageDocumentos_ND" name="sizePageDocumentos_ND" value="10">
                                                    </form>
                                                </div>
                                                <div class="row" id="loader_contenido_ND" style="display: none">
                                                    <div class="col-md-1 col-md-offset-5 col-xs-2 col-xs-offset-5 mt-30">
                                                        <div class="loader-peam_small"></div>
                                                    </div>
                                                </div>
                                                <div class="row-not">
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
                                                                <tbody id="tbodyDocumentos_ND">
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row-not">
                                                    <div class="col-md-3 col-xs-12">
                                                        <ul class="list-inline pull-left">
                                                            <li><a class="view-reporte" format="pdf" title='Descargar en PDF' style='padding-right: 10px'><i class='fa fa-file-pdf-o'></i></a></li>
                                                            <li><a class="view-reporte" format="docx" title="Descargar en WORD" style="padding-right: 10px"><i class="fa fa-file-text"></i></a></li>
                                                            <li><a class="view-reporte" format="pptx" title="Descargar en PPT" style="padding-right: 10px"><i class="fa fa-file-powerpoint-o"></i></a></li>
                                                            <li><a class="view-reporte" format="xlsx" title="Descargar en EXCEL" style="padding-right: 10px"><i class="fa fa-file-excel-o"></i></a></li>
                                                        </ul>
                                                    </div>
                                                    <div class="col-md-9 col-xs-12 text-right">
                                                        <ul id="paginationDocumentos_ND" class="pagination pagination-sm" style="margin-top: 0px; margin-top: 0px">

                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                            <div role="tabpanel" class="tab-pane fade" id="tab-indicadores-de-desempenio">
                                                <div class="row">
                                                    <form id="FrmDocumentos_ID">
                                                        <div class="col-md-2 col-sm-3 col-xs-12">
                                                            <select id="comboAnioDocumento_ID" name="comboAnioDocumento_ID" class="form-control combo-paginar" idBtnBuscar='btnBuscarDocumento_ID' style="border: 1px solid #00793D; margin-top: 40px">
                                                            </select>
                                                        </div>
                                                        <div class="col-md-8 col-sm-3 col-xs-12">
                                                            <div class="input-field">
                                                                <input type="text" name="txtTituloDocumento_ID" id="txtTituloDocumento_ID">
                                                                <label for="name" class=""><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Buscar Documento . . .</font></font></label>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-2 col-sm-3 col-xs-12">
                                                            <button type="submit" id="btnBuscarDocumento_ID" class="waves-effect waves-light btn" style="height: 30px; padding-top: 2px; padding-bottom: 2px; margin-top: 45px;">Buscar</button>
                                                        </div>
                                                        <input type="hidden" id="nameForm_ID" value="FrmDocumentos_ID">
                                                        <input type="hidden" id="actionDocumentos_ID" name="action" value="paginarDocumentos">
                                                        <input type="hidden" id="numberPageDocumentos_ID" name="numberPageDocumentos_ID" value="1">
                                                        <input type="hidden" id="sizePageDocumentos_ID" name="sizePageDocumentos_ID" value="10">
                                                    </form>
                                                </div>
                                                <div class="row" id="loader_contenido_ID" style="display: none">
                                                    <div class="col-md-1 col-md-offset-5 col-xs-2 col-xs-offset-5 mt-30">
                                                        <div class="loader-peam_small"></div>
                                                    </div>
                                                </div>
                                                <div class="row-not">
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
                                                                <tbody id="tbodyDocumentos_ID">
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row-not">
                                                    <div class="col-md-3 col-xs-12">
                                                        <ul class="list-inline pull-left">
                                                            <li><a class="view-reporte" format="pdf" title='Descargar en PDF' style='padding-right: 10px'><i class='fa fa-file-pdf-o'></i></a></li>
                                                            <li><a class="view-reporte" format="docx" title="Descargar en WORD" style="padding-right: 10px"><i class="fa fa-file-text"></i></a></li>
                                                            <li><a class="view-reporte" format="pptx" title="Descargar en PPT" style="padding-right: 10px"><i class="fa fa-file-powerpoint-o"></i></a></li>
                                                            <li><a class="view-reporte" format="xlsx" title="Descargar en EXCEL" style="padding-right: 10px"><i class="fa fa-file-excel-o"></i></a></li>
                                                        </ul>
                                                    </div>
                                                    <div class="col-md-9 col-xs-12 text-right">
                                                        <ul id="paginationDocumentos_ID" class="pagination pagination-sm" style="margin-top: 0px; margin-top: 0px">

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
        <script type="text/javascript" src="<%out.print(getServletContext().getContextPath());%>/js_app/web/gestiontransparente.js"></script>

    </body>
</html>