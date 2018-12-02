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
                    <h2 class="text-peam-verde-subrayado" style="font-size: 30px">Presupuestos y Finanzas</h2>
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
                                                    <li role="presentation" class="active"><a style="padding-top: 5px; padding-bottom: 5px" href="#tab-presupuesto-insitucional" role="tab" class="waves-effect waves-dark" data-toggle="tab">Presupuesto Institucional</a></li>
                                                    <li role="presentation"><a style="padding-top: 5px; padding-bottom: 5px" href="#tab-informacion-financiera" role="tab" class="waves-effect waves-dark" data-toggle="tab">Información Financiera</a></li>
                                                    <li role="presentation"><a style="padding-top: 5px; padding-bottom: 5px" href="#tab-informacion-presupuestal" role="tab" class="waves-effect waves-dark" data-toggle="tab">Información Presupuestal</a></li>
                                                </ul>
                                                <div class="panel-body" style="padding-bottom: 0px;padding-top: 0px">
                                                    <div class="tab-content">
                                                        <div role="tabpanel" class="tab-pane fade in active" id="tab-presupuesto-insitucional">
                                                            <div class="row">
                                                                <form id="FrmPresupuestoInstitucional">
                                                                    <div class="col-md-4 col-sm-9 col-xs-12 mt-30">
                                                                        <select id="comboTipoPresupuestoInstitucional" name="comboTipoPresupuestoInstitucional" class="form-control combo-paginar" idBtnBuscar='btnBuscarPresupuestoInstitucional' style="border: 1px solid #00793D;">
                                                                            <option value="1">Presupuesto Institucional de Apertura (PIA)</option>
                                                                            <option value="2">Presupuesto Institucional Modificado (PIM)</option>
                                                                        </select>
                                                                    </div>
                                                                    <div class="col-md-2 col-sm-3 col-xs-12 mt-30">
                                                                        <select id="comboAnioPresupuestoInstitucional" name="comboAnioPresupuestoInstitucional" class="form-control combo-paginar" idBtnBuscar='btnBuscarPresupuestoInstitucional' style="border: 1px solid #00793D;">
                                                                        </select>
                                                                    </div>
                                                                    <div class="col-md-4 col-sm-9 col-xs-12 mt-30">
                                                                        <div class="input-field" style="margin-top: 0px">
                                                                            <input type="text" name="txtPresupuestoInstitucional" id="txtPresupuestoInstitucional">
                                                                            <label for="name" class=""><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Buscar Presupuesto</font></font></label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-md-2 col-sm-3 col-xs-12 mt-30">
                                                                        <button type="submit" id="btnBuscarPresupuestoInstitucional" class="waves-effect waves-light btn" style="height: 30px; padding-top: 2px; padding-bottom: 2px;">Buscar</button>
                                                                    </div>
                                                                    <input type="hidden" id="namePresupuestoInstitucional" value="FrmPresupuestoInstitucional">
                                                                    <input type="hidden" id="actionPresupuestoInstitucional" name="action" value="paginarPresupuesto">
                                                                    <input type="hidden" id="numberPagePresupuestoInstitucional" name="numberPagePresupuestoInstitucional" value="1">
                                                                    <input type="hidden" id="sizePagePresupuestoInstitucional" name="sizePagePresupuestoInstitucional" value="10">
                                                                </form>
                                                            </div>
                                                            <div class="row" id="loader_contenido_PresupuestoInstitucional">
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
                                                                                    <th style="width: 10%" class="text-medium-table text-center">Fecha</th>
                                                                                    <th style="width: 35%" class="text-medium-table">Descripción</th>
                                                                                    <th style="width: 35%" class="text-medium-table">Documento de Aprobación</th>
                                                                                    <th style="width: 10%;" class="align-middle text-center">PDF</th>
                                                                                </tr>
                                                                            </thead>
                                                                            <tbody id="tbodyPresupuestoInstitucional">
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
                                                                    <ul id="paginationPresupuestoInstitucional" class="pagination pagination-sm" style="margin-top: 0px; margin-top: 0px">

                                                                    </ul>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div role="tabpanel" class="tab-pane fade" id="tab-informacion-financiera">
                                                            <div class="row">
                                                                <form id="FrmInfoFinanciera">
                                                                    <div class="col-md-4 col-sm-9 col-xs-12 mt-30">
                                                                        <select id="comboCategoriaInfoFinanciera" name="comboCategoriaInfoFinanciera" class="form-control combo-paginar" idBtnBuscar='btnBuscarInfoFinanciera' style="border: 1px solid #00793D;">
                                                                            <option value="2">Estados de Situación Financiera</option>
                                                                            <option value="8">Estados de Gestión</option>
                                                                            <option value="6">Estados de Cambio en el Patrimonio Neto</option>
                                                                            <option value="7">Estados de Flujo de Efectivo</option>
                                                                            <option value="5">Saldos de Balance</option>
                                                                        </select>
                                                                    </div>
                                                                    <div class="col-md-2 col-sm-3 col-xs-12 mt-30">
                                                                        <select id="comboAnioInfoFinanciera" name="comboAnioInfoFinanciera" class="form-control combo-paginar" idBtnBuscar='btnBuscarInfoFinanciera' style="border: 1px solid #00793D;">
                                                                        </select>
                                                                    </div>
                                                                    <div class="col-md-4 col-sm-9 col-xs-12 mt-30">
                                                                        <div class="input-field" style="margin-top: 0px">
                                                                            <input type="text" name="txtInfoFinanciera" id="txtInfoFinanciera">
                                                                            <label for="name" class=""><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Información Financiera</font></font></label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-md-2 col-sm-3 col-xs-12 mt-30">
                                                                        <button type="submit" id="btnBuscarInfoFinanciera" class="waves-effect waves-light btn" style="height: 30px; padding-top: 2px; padding-bottom: 2px;">Buscar</button>
                                                                    </div>
                                                                    <input type="hidden" id="nameInfoFinanciera" value="FrmInfoFinanciera">
                                                                    <input type="hidden" id="actionInfoFinanciera" name="action" value="paginarFinanza">
                                                                    <input type="hidden" id="numberPageInfoFinanciera" name="numberPageInfoFinanciera" value="1">
                                                                    <input type="hidden" id="sizePageInfoFinanciera" name="sizePageInfoFinanciera" value="10">
                                                                </form>
                                                            </div>
                                                            <div class="row" id="loader_contenido_InfoFinanciera">
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
                                                                                    <th style="width: 10%" class="text-medium-table text-center">Fecha</th>
                                                                                    <th style="width: 45%" class="text-medium-table">Descripción</th>
                                                                                    <th style="width: 10%;" class="align-middle text-center">PDF</th>
                                                                                </tr>
                                                                            </thead>
                                                                            <tbody id="tbodyInfoFinanciera">                                                                                
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
                                                                    <ul id="paginationInfoFinanciera" class="pagination pagination-sm" style="margin-top: 0px; margin-top: 0px">

                                                                    </ul>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div role="tabpanel" class="tab-pane fade" id="tab-informacion-presupuestal">
                                                            <div class="row">
                                                                <form id="FrmInfoPresupuestal">
                                                                    <div class="col-md-4 col-sm-9 col-xs-12 mt-30">
                                                                        <select id="comboCategoriaInfoPresupuestal" name="comboCategoriaInfoPresupuestal" class="form-control combo-paginar" idBtnBuscar='btnBuscarInfoPresupuestal' style="border: 1px solid #00793D;">
                                                                            <option value="1">Ejecución Presupuestal</option>
                                                                            <option value="3">Evaluación de Ingresos</option>
                                                                            <option value="4">Resumen de Gastos por Especificación</option>
                                                                        </select>
                                                                    </div>
                                                                    <div class="col-md-2 col-sm-3 col-xs-12 mt-30">
                                                                        <select id="comboAnioInfoPresupuestal" name="comboAnioInfoPresupuestal" class="form-control combo-paginar" idBtnBuscar='btnBuscarInfoPresupuestal' style="border: 1px solid #00793D;">
                                                                        </select>
                                                                    </div>
                                                                    <div class="col-md-4 col-sm-9 col-xs-12 mt-30">
                                                                        <div class="input-field" style="margin-top: 0px">
                                                                            <input type="text" name="txtInfoPresupuestal" id="txtInfoPresupuestal">
                                                                            <label for="name" class=""><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Información Presupuestal</font></font></label>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-md-2 col-sm-3 col-xs-12 mt-30">
                                                                        <button type="submit" id="btnBuscarInfoPresupuestal" class="waves-effect waves-light btn" style="height: 30px; padding-top: 2px; padding-bottom: 2px;">Buscar</button>
                                                                    </div>
                                                                    <input type="hidden" id="nameInfoPresupuestal" value="FrmInfoPresupuestal">
                                                                    <input type="hidden" id="actionInfoPresupuestal" name="action" value="paginarFinanza2">
                                                                    <input type="hidden" id="numberPageInfoPresupuestal" name="numberPageInfoPresupuestal" value="1">
                                                                    <input type="hidden" id="sizePageInfoPresupuestal" name="sizePageInfoPresupuestal" value="10">
                                                                </form>
                                                            </div>
                                                            <div class="row" id="loader_contenido_InfoPresupuestal">
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
                                                                                    <th style="width: 10%" class="text-medium-table text-center">Fecha</th>
                                                                                    <th style="width: 45%" class="text-medium-table">Descrpción</th>
                                                                                    <th style="width: 10%;" class="align-middle text-center">PDF</th>
                                                                                </tr>
                                                                            </thead>
                                                                            <tbody id="tbodyInfoPresupuestal">                                                                                
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
                                                                    <ul id="paginationInfoPresupuestal" class="pagination pagination-sm" style="margin-top: 0px; margin-top: 0px">

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
        <script type="text/javascript" src="<%out.print(getServletContext().getContextPath());%>/js_app/web/gestiontransparente_finanzas.js"></script>

    </body>
</html>
