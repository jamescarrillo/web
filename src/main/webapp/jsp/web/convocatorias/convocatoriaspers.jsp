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
        <!-- magnific-popup -->
        <link href="<%out.print(getServletContext().getContextPath());%>/assets/magnific-popup/magnific-popup.css" rel="stylesheet">
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
                    <h2 class="text-peam-verde h1-title" style="font-size: 30px">CONVOCATORIAS DE PERSONAL</h2>
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
                                                        <li role="presentation" class="active"><a id="idtabConvocatorias" href="#tab-1" role="tab" class="waves-effect waves-dark" data-toggle="tab">PRINCIPAL</a></li>
                                                        <li role="presentation"><a id="idtabCalendario" href="#tab-2" role="tab" class="waves-effect waves-dark" data-toggle="tab">CRONOGRAMA DE ACTIVIDADES</a></li>
                                                        <li role="presentation"><a href="#tab-3" role="tab" class="waves-effect waves-dark" data-toggle="tab">PLAZAS</a></li>
                                                    </ul>

                                                    <!-- Tab panes -->
                                                    <div class="panel-body">
                                                        <div class="tab-content">
                                                            <div role="tabpanel" class="tab-pane fade in active" id="tab-1">
                                                                <div class="row">
                                                                    <form id="FrmConvocatoria">
                                                                        <div class="col-md-2 col-sm-3 col-xs-12">
                                                                            <select id="comboAnioConvocatoria" name="comboAnioConvocatoria" class="form-control combo-paginar" idBtnBuscar='btnBuscarConvocatoria' style="border: 1px solid #8bc34a;">
                                                                            </select>
                                                                        </div>
                                                                        <div class="col-md-2 col-sm-3 col-xs-12">
                                                                            <select id="comboTipoEstado" name="comboTipoEstado" class="form-control combo-paginar" idBtnBuscar='btnBuscarConvocatoria' style="border: 1px solid #8bc34a;">
                                                                                <option value="-1">TODOS</option>
                                                                                <option value="true">VIGENTES</option>
                                                                                <option value="false">FINALIZADOS</option>
                                                                            </select>
                                                                        </div>
                                                                        <div class="col-md-6 col-sm-9 col-xs-12">
                                                                            <div class="input-field" style="margin-top: 0px">
                                                                                <input type="text" name="txtTituloConvocatoria" id="txtTituloConvocatoria">
                                                                                <label for="name" class=""><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Buscar Convocatoria de Personal</font></font></label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-md-2 col-sm-3 col-xs-12">
                                                                            <button type="submit" id="btnBuscarConvocatoria" class="waves-effect waves-light btn" style="height: 40px; padding-top: 5px; padding-bottom: 5px;">Buscar</button>
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
                                                                                        <th style="width: 25%;" class="align-middle">CONVOCATOTIA</th>
                                                                                        <th style="width: 50%;" class="align-middle">DESCRIPCION</th>
                                                                                        <th style="width: 10%;" class="align-middle">FECHA</th>
                                                                                        <th style="width: 15%;" class="align-middle">ESTADO</th>
                                                                                        <th style="width: 10%;" class="align-middle">CRONOGRAMA</th>
                                                                                    </tr>
                                                                                </thead>
                                                                                <tbody id="tbodyConvocatoria">
                                                                                </tbody>
                                                                            </table>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="col-md-9 col-xs-12 text-right">
                                                                        <ul id="paginationConvocatoria" class="pagination pagination-sm" style="margin-top: 0px; margin-top: 0px">

                                                                        </ul>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div role="tabpanel" class="tab-pane fade" id="tab-2">


                                                                <div class="vertical-tab">
                                                                    <div class="row">
                                                                        <div class="col-sm-1 round-tab">
                                                                            <!-- Nav tabs -->
                                                                            <ul class="nav nav-tabs" role="tablist">
                                                                                <li role="presentation" class="active"><a id="idTabactividades" href="#tab-5" class="waves-effect waves-light" role="tab" data-toggle="tab"><i class="fa fa-calendar"></i></a></li>
                                                                                <li role="presentation"><a id="idTabDocumentos" href="#tab-6" class="waves-effect waves-light" role="tab" data-toggle="tab"><i class="fa fa-file"></i></a></li>
                                                                            </ul>                      
                                                                        </div><!-- /.col-md-3 -->

                                                                        <div class="col-sm-11">
                                                                            <!-- Tab panes -->
                                                                            <div class="panel-body">
                                                                                <div class="tab-content">
                                                                                    <div role="tabpanel" class="tab-pane fade in active" id="tab-5">
                                                                                        <form id="FrmCalendario">
                                                                                            <input type="hidden" id="nameFormCalendario" value="FrmCalendario">
                                                                                            <input type="hidden" id="actionCalendario" name="action" value="paginarCalendario">
                                                                                            <input type="hidden" id="numberCalendario" name="numberPageCalendario" value="1">
                                                                                            <input type="hidden" id="sizePageCalendario" name="sizePageCalendario" value="15">
                                                                                        </form>
                                                                                        
                                                                                        <div class="row" id="TitularCalendario" style="display: none">
                                                                                            <div class="text-center mb-30" style="margin-top: 5px;">
                                                                                                <h2 class="text-peam-verde" id="ConvocatoriaTitulo" style="font-size: 20px"></h2>
                                                                                            </div>
                                                                                        </div>

                                                                                        <div class="row">
                                                                                            <div class="col-xs-12">
                                                                                                <div class="table-responsive table-hover" style="margin-top: 20px">
                                                                                                    <table class="table">
                                                                                                        <thead class="bg-success">
                                                                                                            <tr>
                                                                                                                <th style="width: 45%;" class="align-middle">ACTIVIDAD</th>
                                                                                                                <th style="width: 20%;" class="align-middle">FECHA INICIO</th>
                                                                                                                <th style="width: 20%;" class="align-middle">FECHA FINAL</th>
                                                                                                                <th style="width: 20%;" class="align-middle">DETALLE</th>
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

                                                                                        <div class="row">
                                                                                            <div class="col-md-9 col-xs-12 text-right">
                                                                                                <ul id="paginationCalendario" class="pagination pagination-sm" style="margin-top: 0px; margin-top: 0px">

                                                                                                </ul>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div role="tabpanel" class="tab-pane fade" id="tab-6">
                                                                                        
                                                                                        <form id="FrmDocumentoCal">
                                                                                            <input type="hidden" id="nameFormDocumentoCal" value="FrmDocumentoCal">
                                                                                            <input type="hidden" id="actionDocumentoCal" name="action" value="paginarDocumentoCal">
                                                                                            <input type="hidden" id="numberDocumentoCal" name="numberPageDocumentoCal" value="1">
                                                                                            <input type="hidden" id="sizePageDocumentoCal" name="sizePageDocumentoCal" value="10">
                                                                                        </form>
                                                                                        <div class="row" id="TitularActividad" style="display: none">
                                                                                            <div class="text-center mb-30" style="margin-top: 5px;">
                                                                                                <h2 class="text-peam-verde" id="ActividadTitulo" style="font-size: 20px"></h2>
                                                                                            </div>
                                                                                        </div>

                                                                                        <div class="row">
                                                                                            <div class="col-xs-12">
                                                                                                <div class="table-responsive table-hover" style="margin-top: 20px">
                                                                                                    <table class="table">
                                                                                                        <thead class="bg-success">
                                                                                                            <tr>
                                                                                                                <th style="width: 80%;" class="align-middle">DOCUMENTO</th>
                                                                                                                <th style="width: 20%;" class="align-middle">ACCION</th>
                                                                                                            </tr>
                                                                                                        </thead>
                                                                                                        <tbody id="tbodyDocumentCal">
                                                                                                            <tr>
                                                                                                                <td class="text-center" colspan="2">Escoga una Actividad</td>
                                                                                                            </tr>
                                                                                                        </tbody>
                                                                                                    </table>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>

                                                                                        <div class="row">
                                                                                            <div class="col-md-9 col-xs-12 text-right">
                                                                                                <ul id="paginationDocumentCal" class="pagination pagination-sm" style="margin-top: 0px; margin-top: 0px">

                                                                                                </ul>
                                                                                            </div>
                                                                                        </div>

                                                                                    </div>

                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div><!-- /.row -->
                                                                </div><!-- /.vertical-tab -->





                                                            </div>
                                                            <div role="tabpanel" class="tab-pane fade" id="tab-3">
                                                                <div class="row" id="TitularPlaza" style="display: none">
                                                                    <div class="text-center mb-30" style="margin-top: 5px;">
                                                                        <h2 class="text-peam-verde" id="PlazaTitulo" style="font-size: 20px"></h2>
                                                                    </div>
                                                                </div>
                                                                <form id="FrmPuestoConv">
                                                                    <input type="hidden" id="nameFormPuestoConv" value="FrmPuestoConv">
                                                                    <input type="hidden" id="actionPuestoConv" name="action" value="paginarPuestoConv">
                                                                    <input type="hidden" id="numberPuestoConv" name="numberPagePuestoConv" value="1">
                                                                    <input type="hidden" id="sizePagePuestoConv" name="sizePagePuestoConv" value="10">
                                                                </form>
                                                                <div class="row">
                                                                    <div class="col-xs-12">
                                                                        <div class="table-responsive table-hover" style="margin-top: 20px">
                                                                            <table class="table">
                                                                                <thead class="bg-success">
                                                                                    <tr>
                                                                                        <th style="width: 50%;" class="align-middle">CARGO</th>
                                                                                        <th style="width: 15%;" class="align-middle">INGRESO MENSUAL</th>
                                                                                        <th style="width: 15%;" class="align-middle">MODALIDAD</th>
                                                                                        <th style="width: 15%;" class="align-middle">VACANTES</th>
                                                                                    </tr>

                                                                                </thead>
                                                                                <tbody id="tbodyPlaza">
                                                                                    <tr>
                                                                                        <td class="text-center" colspan="4">Sin Plazas Publicadas</td>
                                                                                    </tr>
                                                                                </tbody>
                                                                            </table>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="col-md-9 col-xs-12 text-right">
                                                                        <ul id="paginationPlaza" class="pagination pagination-sm" style="margin-top: 0px; margin-top: 0px">

                                                                        </ul>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                            </div><!-- /.border-bottom-tab -->

                                        </div><!-- /.col-md-12 -->
                                    </div><!-- /.row -->
                                </header>

                                <footer class="entry-footer">
                                    <div class="row">
                                        <div class="col-md-9 col-xs-12 text-right">
                                            <ul id="paginationConvocatoria" class="pagination pagination-sm" style="margin-top: 0px; margin-top: 0px">

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
        <script src="<%out.print(getServletContext().getContextPath());%>/assets/magnific-popup/jquery.magnific-popup.min.js"></script>
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
        <script type="text/javascript" src="<%out.print(getServletContext().getContextPath());%>/js_app/web/convocatoriaspers.js"></script>

    </body>
</html>
