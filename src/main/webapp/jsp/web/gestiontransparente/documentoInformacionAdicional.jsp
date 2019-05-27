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
                    <h2 class="text-peam-verde-subrayado" style="font-size: 30px">Información Adicional</h2>
                </div>
                <div class="row">
                    <div class="col-xs-12">
                        <div class="panel-group feature-accordion brand-accordion icon angle-icon" id="tab">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title">
                                        <a class="item-documentos collapsed" data-toggle="collapse" data-parent="#tab" href="#tab-recomendaciones" cate_id="700" complemento="Recomendaciones" aria-expanded="false">
                                            Recomendaciones de los Informes de Auditoría Orientadas al Mejoramiento de la Gestión
                                        </a>
                                    </h3>
                                </div>
                                <div id="tab-recomendaciones" class="panel-collapse collapse" aria-expanded="false" style="">
                                    <div class="panel-body">
                                        <form id="FrmDocumentosRecomendaciones">
                                            <div class="row">
                                                <div class="col-sm-2 col-xs-12">
                                                    <select id="comboAnioDocumentoRecomendaciones" name="comboAnioDocumento" class="form-control combo-paginar" idBtnBuscar='btnBuscarDocumentoRecomendaciones' style="border: 1px solid #00793D; margin-top: 20px">
                                                    </select>
                                                </div>
                                                <div class="col-sm-8 col-xs-12">
                                                    <div class="input-field" style="margin-top: 25px">
                                                        <input type="text" name="txtTituloDocumento" id="txtTituloDocumentoRecomendaciones">
                                                        <label for="name" class=""><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Buscar Documento</font></font></label>
                                                    </div>
                                                </div>
                                                <div class="col-sm-2 col-xs-12">
                                                    <button type="submit" id="btnBuscarDocumentoRecomendaciones" class="waves-effect waves-light btn" style="height: 30px; padding-top: 2px; padding-bottom: 2px; margin-top: 25px;">Buscar</button>
                                                </div>
                                                <input type="hidden" id="nameFormRecomendaciones" value="FrmDocumentosRecomendaciones">
                                                <input type="hidden" id="actionDocumentosRecomendaciones" name="action" value="paginarDocumentos">
                                                <input type="hidden" id="numberPageDocumentosRecomendaciones" name="numberPageDocumentos" value="1">
                                                <input type="hidden" id="sizePageDocumentosRecomendaciones" name="sizePageDocumentos" value="10">
                                                <input type="hidden" id="comboTipoListaDocumentosRecomendaciones" name="comboTipoListaDocumentos" value="-1">
                                            </div>
                                        </form>
                                        <!--TABLA-->
                                        <div class="row" id="loader_contenido_recomendaciones">
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
                                                        <tbody id="tbodyDocumentosRecomendaciones">
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-xs-12 text-right">
                                                <ul id="paginationDocumentosRecomandaciones" class="pagination pagination-sm" style="margin-top: 0px; margin-top: 0px">

                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title">
                                        <a class="item-documentos collapsed" data-toggle="collapse" data-parent="#tab" href="#tab-evaluacion" cate_id="800" complemento="Evaluacion" aria-expanded="false">
                                            Evaluación de Cumplimiento de Actualización del Portal
                                        </a>
                                    </h3>
                                </div>
                                <div id="tab-evaluacion" class="panel-collapse collapse" aria-expanded="false" style="">
                                    <div class="panel-body">
                                        <form id="FrmDocumentosEvaluacion">
                                            <div class="row">
                                                <div class="col-sm-2 col-xs-12">
                                                    <select id="comboAnioDocumentoEvaluacion" name="comboAnioDocumento" class="form-control combo-paginar" idBtnBuscar='btnBuscarDocumentoEvaluacion' style="border: 1px solid #00793D; margin-top: 20px">
                                                    </select>
                                                </div>
                                                <div class="col-sm-8 col-xs-12">
                                                    <div class="input-field" style="margin-top: 25px">
                                                        <input type="text" name="txtTituloDocumento" id="txtTituloDocumentoEvaluacion">
                                                        <label for="name" class=""><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Buscar Documento</font></font></label>
                                                    </div>
                                                </div>
                                                <div class="col-sm-2 col-xs-12">
                                                    <button type="submit" id="btnBuscarDocumentoEvaluacion" class="waves-effect waves-light btn" style="height: 30px; padding-top: 2px; padding-bottom: 2px; margin-top: 25px;">Buscar</button>
                                                </div>
                                                <input type="hidden" id="nameFormEvaluacion" value="FrmDocumentosRecomendaciones">
                                                <input type="hidden" id="actionDocumentosEvaluacion" name="action" value="paginarDocumentos">
                                                <input type="hidden" id="numberPageDocumentosEvaluacion" name="numberPageDocumentos" value="1">
                                                <input type="hidden" id="sizePageDocumentosEvaluacion" name="sizePageDocumentos" value="10">
                                            </div>
                                        </form>
                                        <!--TABLA-->
                                        <div class="row" id="loader_contenido_evaluacion">
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
                                                        <tbody id="tbodyDocumentosEvaluacion">
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-xs-12 text-right">
                                                <ul id="paginationDocumentosEvaluacion" class="pagination pagination-sm" style="margin-top: 0px; margin-top: 0px">

                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title">
                                        <a class="item-documentos collapsed" data-toggle="collapse" data-parent="#tab" href="#tab-laudos" cate_id="500" complemento="Laudos" aria-expanded="false">
                                            Laudos
                                        </a>
                                    </h3>
                                </div>
                                <div id="tab-laudos" class="panel-collapse collapse" aria-expanded="false" style="">
                                    <div class="panel-body">
                                        <form id="FrmDocumentosLaudos">
                                            <div class="row">
                                                <div class="col-sm-2 col-xs-12">
                                                    <select id="comboAnioDocumentoLaudos" name="comboAnioDocumento" class="form-control combo-paginar" idBtnBuscar='btnBuscarDocumentoLaudos' style="border: 1px solid #00793D; margin-top: 20px">
                                                    </select>
                                                </div>
                                                <div class="col-sm-8 col-xs-12">
                                                    <div class="input-field" style="margin-top: 25px">
                                                        <input type="text" name="txtTituloDocumento" id="txtTituloDocumentoLaudos">
                                                        <label for="name" class=""><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Buscar Documento</font></font></label>
                                                    </div>
                                                </div>
                                                <div class="col-sm-2 col-xs-12">
                                                    <button type="submit" id="btnBuscarDocumentoLaudos" class="waves-effect waves-light btn" style="height: 30px; padding-top: 2px; padding-bottom: 2px; margin-top: 25px;">Buscar</button>
                                                </div>
                                                <input type="hidden" id="nameFormLaudos" value="FrmDocumentosLaudos">
                                                <input type="hidden" id="actionDocumentosLaudos" name="action" value="paginarDocumentos">
                                                <input type="hidden" id="numberPageDocumentosLaudos" name="numberPageDocumentos" value="1">
                                                <input type="hidden" id="sizePageDocumentosLaudos" name="sizePageDocumentos" value="10">
                                            </div>
                                        </form>
                                        <!--TABLA-->
                                        <div class="row" id="loader_contenido_laudos">
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
                                                        <tbody id="tbodyDocumentosLaudos">
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-xs-12 text-right">
                                                <ul id="paginationDocumentosLaudos" class="pagination pagination-sm" style="margin-top: 0px; margin-top: 0px">

                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title">
                                        <a class="item-documentos collapsed" data-toggle="collapse" data-parent="#tab" href="#tab-actas" cate_id="600" complemento="Actas" aria-expanded="false">
                                            Actas de Conciliación
                                        </a>
                                    </h3>
                                </div>
                                <div id="tab-actas" class="panel-collapse collapse" aria-expanded="false" style="">
                                    <div class="panel-body">
                                        <form id="FrmDocumentosActas">
                                            <div class="row">
                                                <div class="col-sm-2 col-xs-12">
                                                    <select id="comboAnioDocumentoActas" name="comboAnioDocumento" class="form-control combo-paginar" idBtnBuscar='btnBuscarDocumentoActas' style="border: 1px solid #00793D; margin-top: 20px">
                                                    </select>
                                                </div>
                                                <div class="col-sm-8 col-xs-12">
                                                    <div class="input-field" style="margin-top: 25px">
                                                        <input type="text" name="txtTituloDocumento" id="txtTituloDocumentoActas">
                                                        <label for="name" class=""><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Buscar Documento</font></font></label>
                                                    </div>
                                                </div>
                                                <div class="col-sm-2 col-xs-12">
                                                    <button type="submit" id="btnBuscarDocumentoActas" class="waves-effect waves-light btn" style="height: 30px; padding-top: 2px; padding-bottom: 2px; margin-top: 25px;">Buscar</button>
                                                </div>
                                                <input type="hidden" id="nameFormLaudos" value="FrmDocumentosActas">
                                                <input type="hidden" id="actionDocumentosActas" name="action" value="paginarDocumentos">
                                                <input type="hidden" id="numberPageDocumentosActas" name="numberPageDocumentos" value="1">
                                                <input type="hidden" id="sizePageDocumentosActas" name="sizePageDocumentos" value="10">
                                            </div>
                                        </form>
                                        <!--TABLA-->
                                        <div class="row" id="loader_contenido_actas">
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
                                                        <tbody id="tbodyDocumentosActas">
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-xs-12 text-right">
                                                <ul id="paginationDocumentosActas" class="pagination pagination-sm" style="margin-top: 0px; margin-top: 0px">

                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title">
                                        <a class="item-documentos collapsed" data-toggle="collapse" data-parent="#tab" href="#tab-declaraciones" cate_id="1200" complemento="Declaraciones" aria-expanded="false">
                                            Declaraciones juradas de ingresos, bienes y rentas 
                                        </a>
                                    </h3>
                                </div>
                                <div id="tab-declaraciones" class="panel-collapse collapse" aria-expanded="false" style="">
                                    <div class="panel-body">
                                        <form id="FrmDocumentosDeclaraciones">
                                            <div class="row">
                                                <div class="col-sm-2 col-xs-12">
                                                    <select id="comboAnioDocumentoDeclaraciones" name="comboAnioDocumento" class="form-control combo-paginar" idBtnBuscar='btnBuscarDocumentoDeclaraciones' style="border: 1px solid #00793D; margin-top: 20px">
                                                    </select>
                                                </div>
                                                <div class="col-sm-8 col-xs-12">
                                                    <div class="input-field" style="margin-top: 25px">
                                                        <input type="text" name="txtTituloDocumento" id="txtTituloDocumentoDeclaraciones">
                                                        <label for="name" class=""><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Buscar Documento</font></font></label>
                                                    </div>
                                                </div>
                                                <div class="col-sm-2 col-xs-12">
                                                    <button type="submit" id="btnBuscarDocumentoDeclaraciones" class="waves-effect waves-light btn" style="height: 30px; padding-top: 2px; padding-bottom: 2px; margin-top: 25px;">Buscar</button>
                                                </div>
                                                <input type="hidden" id="nameFormDeclaraciones" value="FrmDocumentosDeclaraciones">
                                                <input type="hidden" id="actionDocumentosDeclaraciones" name="action" value="paginarDocumentos">
                                                <input type="hidden" id="numberPageDocumentosDeclaraciones" name="numberPageDocumentos" value="1">
                                                <input type="hidden" id="sizePageDocumentosDeclaraciones" name="sizePageDocumentos" value="10">
                                            </div>
                                        </form>
                                        <!--TABLA-->
                                        <div class="row" id="loader_contenido_declaraciones">
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
                                                                
                                                                <th style="width: 15%" class="align-middle">DNI</th>
                                                                <th style="width: 35%" class="align-middle">DECLARANTE</th>
                                                                <th style="width: 55%" class="align-middle ">CARGO</th>
                                                                <th style="width: 25%" class="align-middle">PRESENTACION</th>
                                                                <th style="width: 10%" class="text-center align-middle">PDF</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody id="tbodyDocumentosDeclaraciones">
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-xs-12 text-right">
                                                <ul id="paginationDocumentosDeclaraciones" class="pagination pagination-sm" style="margin-top: 0px; margin-top: 0px">

                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title">
                                        <a class="item-documentos collapsed" data-toggle="collapse" data-parent="#tab" href="#tab-informes" cate_id="1300" complemento="Informes" aria-expanded="false">
                                            Informes Técnicos Previstos de Evaluación de Software
                                        </a>
                                    </h3>
                                </div>
                                <div id="tab-informes" class="panel-collapse collapse" aria-expanded="false" style="">
                                    <div class="panel-body">
                                        <form id="FrmDocumentosInformes">
                                            <div class="row">
                                                <div class="col-sm-2 col-xs-12">
                                                    <select id="comboAnioDocumentoInformes" name="comboAnioDocumento" class="form-control combo-paginar" idBtnBuscar='btnBuscarDocumentoInformes' style="border: 1px solid #00793D; margin-top: 20px">
                                                    </select>
                                                </div>
                                                <div class="col-sm-8 col-xs-12">
                                                    <div class="input-field" style="margin-top: 25px">
                                                        <input type="text" name="txtTituloDocumento" id="txtTituloDocumentoInformes">
                                                        <label for="name" class=""><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Buscar Documento</font></font></label>
                                                    </div>
                                                </div>
                                                <div class="col-sm-2 col-xs-12">
                                                    <button type="submit" id="btnBuscarDocumentoInformes" class="waves-effect waves-light btn" style="height: 30px; padding-top: 2px; padding-bottom: 2px; margin-top: 25px;">Buscar</button>
                                                </div>
                                                <input type="hidden" id="nameFormInformes" value="FrmDocumentosActas">
                                                <input type="hidden" id="actionDocumentosInformes" name="action" value="paginarDocumentos">
                                                <input type="hidden" id="numberPageDocumentosInformes" name="numberPageDocumentos" value="1">
                                                <input type="hidden" id="sizePageDocumentosInformes" name="sizePageDocumentos" value="10">
                                            </div>
                                        </form>
                                        <!--TABLA-->
                                        <div class="row" id="loader_contenido_informes">
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
                                                        <tbody id="tbodyDocumentosInformes">
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-xs-12 text-right">
                                                <ul id="paginationDocumentosInformes" class="pagination pagination-sm" style="margin-top: 0px; margin-top: 0px">

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
        <script type="text/javascript" src="<%out.print(getServletContext().getContextPath());%>/js_app/web/gestiontransparente_info_adicional.js"></script>

    </body>
</html>