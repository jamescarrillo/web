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
                    <h2 class="text-peam-verde-subrayado" style="font-size: 30px">Convocatorias de Bienes, Servicios y Conseciones</h2>
                </div>
                <div class="row">
                    <div class="col-xs-12">
                        <div class="posts-content single-post">
                            <article class="post-wrapper">
                                <div class="entry-content">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="border-bottom-tab">
                                                <div class="panel-body" style="padding-bottom: 0px;">
                                                    <div class="tab-content">
                                                        <div role="tabpanel" class="tab-pane fade in active" id="tab-1">
                                                            <div class="row">
                                                                <form id="FrmConvocatoria">
                                                                    <div class="col-md-2 col-sm-3 col-xs-12">
                                                                        <select id="comboAnio" name="comboAnio" class="form-control combo-paginar" idBtnBuscar='btnBuscarConvocatoria' style="border: 1px solid #00793D;">
                                                                        </select>
                                                                    </div>
                                                                    <div class="col-md-2 col-sm-3 col-xs-12">
                                                                        <select id="comboTipoListaConvocatoria" name="comboTipoListaConvocatoria" class="form-control combo-paginar" idBtnBuscar='btnBuscarConvocatoria' style="border: 1px solid #00793D;">
                                                                            <option value="-1">Todos</option>
                                                                            <option value="true">Vigentes</option>
                                                                            <option value="false">Finalizados</option>
                                                                        </select>
                                                                    </div>
                                                                    <div class="col-md-6 col-sm-9 col-xs-12">
                                                                        <div class="input-field" style="margin-top: 0px">
                                                                            <input type="text" name="txtConvocatoria" id="txtConvocatoria">
                                                                            <label for="name" class=""><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Buscar Convocatoria</font></font></label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-md-2 col-sm-3 col-xs-12">
                                                                        <button type="submit" id="btnBuscarConvocatoria" class="waves-effect waves-light btn" style="height: 30px; padding-top: 2px; padding-bottom: 2px;">Buscar</button>
                                                                    </div>
                                                                    <input type="hidden" id="nameFormConvocatoria" value="FrmConvocatoria">
                                                                    <input type="hidden" id="actionConvocatoria" name="action" value="paginarConvocatoria">
                                                                    <input type="hidden" id="numberPageConvocatoria" name="numberPageConvocatoria" value="1">
                                                                    <input type="hidden" id="sizePageConvocatoria" name="sizePageConvocatoria" value="10">
                                                                </form>
                                                            </div>
                                                            <div class="row" id="loader_contenido_Convocatoria">
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
                                                                                    <th style="width: 10%;" class="align-middle text-center">Fecha</th>
                                                                                    <th style="width: 60%;" class="align-middle">Síntesis</th>
                                                                                    <th style="width: 10%;" class="align-middle text-center">Tipo</th>
                                                                                    <th style="width: 15%;" class="align-middle text-center">Proceso</th>
                                                                                    <th style="width: 10%;" class="align-middle text-center">Acción</th>
                                                                                </tr>
                                                                            </thead>
                                                                            <tbody id="tbodyConvocatoriaBien">
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
                                                                    <ul id="paginationConvocatoria" class="pagination pagination-sm" style="margin-top: 0px; margin-top: 0px">

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
                    <div id="ModalDatos" class="modal-peam">
                        <!-- Modal content -->
                        <div class="modal-content-peam modal-dialog-scroll">
                            <div class="modal-header-peam" style="background-color: #ffffff; border-bottom: #00793D solid; border-width: 2px">
                                <span class="close" id="btnCerrarModalDatos">&times;</span>
                                <h2 class="text-peam-verde" style="margin-top: 15px;" id="DatosModal">
                                    Datos Principales
                                </h2>
                            </div>
                            <div class="modal-body-peam modal-body-scroll">
                                <div class="row mt-10">
                                    <div class="container-fluid">
                                        <div class="row" id="TitularCalendario" style="display: none">
                                            <div class="col-xs-12 text-center" style="margin-top: 5px;">
                                                <p class="text-peam-verde text-peam-negrita" id="ConvocatoriaTitulo" style="font-size: 20px;"></p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-xs-12">
                                                <div class="table-responsive table-hover" style="margin-top: 20px">
                                                    <table class="table">
                                                        <thead class="bg-success">
                                                            <tr>
                                                                <th style="width: 40%;" class="align-middle">TITULO</th>
                                                                <th style="width: 20%;" class="align-middle text-center">VALOR REFERENCIAL</th>
                                                                <th style="width: 20%;" class="align-middle text-center">COSTO PARTICIPACION</th>
                                                                <th style="width: 20%;" class="align-middle text-center">LUGAR DE REGISTRO</th>
                                                                <th style="width: 10%;" class="align-middle text-center">ACCION</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody id="tbodyDocumentCal">
                                                            <tr>
                                                                <td class="text-center" colspan="4">Escoga una Convocatoria</td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                        <form id="FrmCalendario">
                                            <input type="hidden" id="nameFormCalendario" value="FrmCalendario">
                                            <input type="hidden" id="actionCalendario" name="action" value="paginarCalendario">
                                            <input type="hidden" id="numberPageCalendario" name="numberPageCalendario" value="1">
                                            <input type="hidden" id="sizePageCalendario" name="sizePageCalendario" value="15">
                                        </form>
                                        <div class="row">
                                            <div class="text-center" style="margin-top: 5px;">
                                                <h2 class="text-peam-negrita" style="font-size: 20px;">CRONOGRAMA DE ACTIVIDADES</h2>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-xs-12">
                                                <div class="table-responsive table-hover" style="margin-top: 20px">
                                                    <table class="table">
                                                        <thead class="bg-success">
                                                            <tr>
                                                                <th style="width: 65%;" class="align-middle">ACTIVIDAD</th>
                                                                <th style="width: 20%;" class="align-middle text-center">FECHA INICIO</th>
                                                                <th style="width: 20%;" class="align-middle text-center">FECHA FINAL</th>

                                                            </tr>
                                                        </thead>
                                                        <tbody id="tbodyCalendario">
                                                            <tr>
                                                                <td class="text-center" colspan="4">Escoga una convocatoria</td>
                                                            </tr>
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
                                                <ul id="paginationCalendario" class="pagination pagination-sm" style="margin-top: 0px; margin-top: 0px">

                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer-peam" style="background-color: #ffffff; border-top: #00793D solid; border-width: 2px">
                                <h6 style="margin-top: 10px;" class="text-peam-negrita">PROYECTO ESPECIAL ALTO MAYO</h6>
                            </div>
                        </div>
                    </div>

                    <div id="ModalDocumentosBien" class="modal-peam">
                        <!-- Modal content -->
                        <div class="modal-content-peam modal-dialog-scroll" style="width: 70%;border: #00793D solid;border-width: 3px">
                            <div class="modal-header-peam" style="background-color: #ffffff; border-bottom: #00793D solid; border-width: 2px">
                                <span class="close" id="btnCerrarModalDocumentosBien">&times;</span>
                                <h2 class="text-peam-verde" style="margin-top: 15px;" id="DocumentosBienModal">
                                    Documentos
                                </h2>
                            </div>
                            <div class="modal-body-peam modal-body-scroll">
                                <div class="row mt-10">
                                    <div class="container-fluid">
                                        <div class="row" id="TitularCalendario2" style="display: none">
                                            <div class="col-xs-12 text-center" style="margin-top: 5px;">
                                                <p class="text-peam-verde text-peam-negrita" id="ConvocatoriaTitulo2" style="font-size: 20px"></p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-xs-12">
                                                <div class="table-responsive table-hover" style="margin-top: 20px">
                                                    <table class="table">
                                                        <thead class="bg-success">
                                                            <tr>
                                                                <th style="width: 80%;" class="align-middle">DOCUMENTOS</th>
                                                                <th style="width: 20%;" class="align-middle">DESCARGAR</th>
                                                            </tr>

                                                        </thead>
                                                        <tbody id="tbodyArchivos">
                                                            <tr>
                                                                <td class="text-center" colspan="2">Sin Documentos Publicados</td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer-peam" style="background-color: #ffffff; border-top: #00793D solid; border-width: 2px">
                                <h6 style="margin-top: 10px;" class="text-peam-negrita">PROYECTO ESPECIAL ALTO MAYO</h6>
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
        <script type="text/javascript" src="<%out.print(getServletContext().getContextPath());%>/js_app/web/convocatoriasbien.js"></script>

    </body>
</html>
