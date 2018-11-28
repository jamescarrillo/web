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
                    <h2 class="text-peam-verde-subrayado" style="font-size: 30px">Recursos Humanos</h2>
                </div>
                <div class="row">
                    <div class="col-xs-12">
                        <div class="panel-group feature-accordion brand-accordion icon angle-icon" id="tab">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#tab" href="#tab-plan-gerencial-y-directivos" aria-expanded="true" class="">
                                            Plan Gerencial y Directivos
                                        </a>
                                    </h3>
                                </div>
                                <div id="tab-plan-gerencial-y-directivos" class="panel-collapse collapse in" aria-expanded="true" style="">
                                    <div class="panel-body">
                                        <div class="row" id="containerFuncionarios">

                                        </div>
                                        <hr>
                                        <br>
                                        <div class="row">
                                            <div class="col-xs-12">
                                                <ul class="list-inline pull-left">
                                                    <li><a href='' title='Descargar en PDF' style='padding-right: 10px'><i class='fa fa-file-pdf-o'></i></a></li>
                                                    <li><a href='' title="Descargar en WORD" style="padding-right: 10px"><i class="fa fa-file-text"></i></a></li>
                                                    <li><a href='' title="Descargar en PPT" style="padding-right: 10px"><i class="fa fa-file-powerpoint-o"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title">
                                        <a class="collapsed" data-toggle="collapse" data-parent="#tab" href="#tab-consejo-directivo" aria-expanded="false">
                                            Consejo Directivo
                                        </a>
                                    </h3>
                                </div>
                                <div id="tab-consejo-directivo" class="panel-collapse collapse" aria-expanded="false">
                                    <div class="panel-body">
                                        <div class="row" id="containerDirectivos">

                                        </div>
                                        <hr>
                                        <br>
                                        <div class="row">
                                            <div class="col-xs-12">
                                                <ul class="list-inline pull-left">
                                                    <li><a href='' title='Descargar en PDF' style='padding-right: 10px'><i class='fa fa-file-pdf-o'></i></a></li>
                                                    <li><a href='' title="Descargar en WORD" style="padding-right: 10px"><i class="fa fa-file-text"></i></a></li>
                                                    <li><a href='' title="Descargar en PPT" style="padding-right: 10px"><i class="fa fa-file-powerpoint-o"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title">
                                        <a class="collapsed" data-toggle="collapse" data-parent="#tab" href="#tab-personal-por-categorias" aria-expanded="false">
                                            Remunaración por Categorías
                                        </a>
                                    </h3>
                                </div>
                                <div id="tab-personal-por-categorias" class="panel-collapse collapse" aria-expanded="false">
                                    <div class="panel-body">
                                        <div class="row">
                                            <form id="FrmPersonalCategoria">                                               
                                                <div class="col-md-2 col-sm-6 col-xs-12">
                                                    <select id="comboAnioPersonalCategoria" name="comboAnioPersonalCategoria" class="form-control combo-paginar" idBtnBuscar='btnBuscarPersonalCategoria' style="border: 1px solid #00793D; margin-top: 40px">
                                                    </select>
                                                </div>
                                                <div class="col-md-2 col-sm-6 col-xs-12">
                                                    <select id="comboTrimestrePersonalCategoria" name="comboTrimestrePersonalCategoria" class="form-control combo-paginar" idBtnBuscar='btnBuscarPersonalCategoria' style="border: 1px solid #00793D; margin-top: 40px">
                                                        <option value="-1">Trimestre</option>
                                                        <option value="1">Primero</option>
                                                        <option value="2">Segundo</option>
                                                    </select>
                                                </div>
                                                <div class="col-md-6 col-sm-9 col-xs-12">
                                                    <div class="input-field">
                                                        <input type="text" name="txtCategoriaPersonalCategoria" id="txtCategoriaPersonalCategoria">
                                                        <label for="name" class=""><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Buscar por Categoría</font></font></label>
                                                    </div>
                                                </div>
                                                <div class="col-md-2 col-sm-3 col-xs-12">
                                                    <button type="submit" id="btnBuscarPersonalCategoria" class="waves-effect waves-light btn" style="height: 30px; padding-top: 2px; padding-bottom: 2px; margin-top: 45px;">Buscar</button>
                                                </div>
                                                <input type="hidden" id="nameFormPersonalCategoria" value="FrmPersonalCategoria">
                                                <input type="hidden" id="actionPersonalCategoria" name="action" value="paginarPersonalCategoria">
                                                <input type="hidden" id="numberPagePersonalCategoria" name="numberPagePersonalCategoria" value="1">
                                                <input type="hidden" id="sizePagePersonalCategoria" name="sizePagePersonalCategoria" value="10">                                                
                                            </form>
                                        </div>
                                        <div class="row" id="loader_contenido_personal_categoria" style="display: none">
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
                                                                <th style="width: 10%" class="text-medium-table text-center">Código</th>
                                                                <th style="width: 35%" class="text-medium-table">Categoría</th>
                                                                <th style="width: 15%" class="text-medium-table text-center">Remuneración Mínima</th>
                                                                <th style="width: 15%" class="text-medium-table">Remuneración Máxima</th>
                                                                <th style="width: 10%" class="text-medium-table text-center">N° Trabajadores</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody id="tbodyPersonalCategoria">
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
                                                <ul id="paginationPersonalCategoria" class="pagination pagination-sm" style="margin-top: 0px; margin-top: 0px">

                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title">
                                        <a class="collapsed" data-toggle="collapse" data-parent="#tab" href="#tab-personal-y-remuneraciones" aria-expanded="false">
                                            Personal y Remuneraciones
                                        </a>
                                    </h3>
                                </div>
                                <div id="tab-personal-y-remuneraciones" class="panel-collapse collapse" aria-expanded="false">
                                    <div class="panel-body">
                                        <div class="row">
                                            <form id="FrmPersonal">     
                                                <div class="col-md-4 col-xs-12">
                                                    <select id="cboTipoPersonal" name="cboTipoPersonal" class="form-control combo-paginar" idBtnBuscar='btnBuscarPersonal' style="border: 1px solid #00793D; margin-top: 40px">
                                                        <option value="1">Régimen Laboral D.L. 728</option>
                                                        <option value="2">Contrato por Locación de Servicios</option>
                                                        <option value="3">Contrato Administrativo de Servicios</option>
                                                    </select>
                                                </div>
                                                <div class="col-md-2 col-sm-3 col-xs-12">
                                                    <select id="comboAnioPersonal" name="comboAnioPersonal" class="form-control combo-paginar" idBtnBuscar='btnBuscarPersonal' style="border: 1px solid #00793D; margin-top: 40px">
                                                    </select>
                                                </div>
                                                <div class="col-md-4 col-sm-9 col-xs-12">
                                                    <div class="input-field">
                                                        <input type="text" name="txtPersonal" id="txtPersonal">
                                                        <label for="name" class=""><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Buscar Personal</font></font></label>
                                                    </div>
                                                </div>
                                                <div class="col-md-2 col-xs-12">
                                                    <button type="submit" id="btnBuscarPersonal" class="waves-effect waves-light btn" style="height: 30px; padding-top: 2px; padding-bottom: 2px; margin-top: 45px;">Buscar</button>
                                                </div>
                                                <input type="hidden" id="nameFormPersonal" value="FrmPersonal">
                                                <input type="hidden" id="actionPersonal" name="action" value="paginarPersonal">
                                                <input type="hidden" id="numberPagePersonal" name="numberPagePersonal" value="1">
                                                <input type="hidden" id="sizePagePersonal" name="sizePagePersonal" value="10">                                                
                                            </form>
                                        </div>
                                        <div class="row" id="loader_contenido_personal" style="display: none">
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
                                                                <th style="width: 10%" class="text-medium-table text-center">DNI</th>
                                                                <th style="width: 25%" class="text-medium-table">Apellidos y Nombres</th>
                                                                <th style="width: 10%" class="text-medium-table text-center">Fecha Ingreso</th>
                                                                <th style="width: 20%" class="text-medium-table">Área</th>
                                                                <th style="width: 20%" class="text-medium-table">Cargo</th>
                                                                <th style="width: 10%" class="text-medium-table text-center">Régimen Pensionario</th>
                                                                <th style="width: 10%" class="text-medium-table text-center">Remuneración S/</th>
                                                                <th style="width: 10%" class="text-medium-table text-center">Gratif. Escol. S/</th>
                                                                <th style="width: 10%" class="text-medium-table text-center">Otros Ingresos. S/</th>
                                                                <th style="width: 10%" class="text-medium-table text-center">Ingreso Total. S/</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody id="tbodyPersonal">
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
                                                <ul id="paginationPersonal" class="pagination pagination-sm" style="margin-top: 0px; margin-top: 0px">

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
        <script type="text/javascript" src="<%out.print(getServletContext().getContextPath());%>/js_app/web/gestiontransparente_rrhh.js"></script>

    </body>
</html>