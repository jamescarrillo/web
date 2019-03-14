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
                    <h2 class="text-peam-verde-subrayado" style="font-size: 30px">Agenda Institucional</h2>
                </div>
                <div class="row">
                    <div class="col-xs-12">
                        <div class="panel-group feature-accordion brand-accordion icon angle-icon" id="tab">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title">
                                        <a class="agenda-ad collapsed" data-toggle="collapse" data-parent="#tab" href="#tab-GerenciaGeneral" tipo="1" complemento="GG" aria-expanded="false">
                                            Gerencia General
                                        </a>
                                    </h3>
                                </div>
                                <div id="tab-GerenciaGeneral" class="panel-collapse collapse" aria-expanded="false" style="">
                                    <div class="panel-body">
                                        <div class="row">
                                            <form id="FrmAgendaGG">
                                                <div class="col-md-7 col-sm-6 col-xs-12">
                                                    <div class="input-field">
                                                        <input type="text" name="txtActividadGG" id="txtActividadGG">
                                                        <label for="name" class=""><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Buscar Agenda . . .</font></font></label>
                                                    </div>
                                                </div>
                                                <div class="col-md-3 col-sm-6 col-xs-12">
                                                    <div class="input-field">
                                                        <input type="text" name="txtCalendarioGG" id="txtCalendarioGG">
                                                        <label for="name" class=""><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">DD/MM/AAAA</font></font></label>
                                                    </div>
                                                </div>
                                                <div class="col-md-2 col-sm-6 col-xs-12">
                                                    <button type="submit" id="btnBuscarAgendaGG" class="waves-effect waves-light btn" style="height: 30px; padding-top: 2px; padding-bottom: 2px; margin-top: 45px;">Buscar</button>
                                                </div>
                                                <input type="hidden" id="nameFormGG" value="FrmAgendaGG">
                                                <input type="hidden" id="actionAgendaGG" name="action" value="paginarAgenda">
                                                <input type="hidden" id="numberPageAgendaGG" name="numberPageAgendaGG" value="1">
                                                <input type="hidden" id="sizePageAgendaGG" name="sizePageAgendaGG" value="10">
                                            </form>
                                        </div>
                                        <div class="row" id="loader_contenidoGG" style="display: none">
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
                                                                <th style="width: 10%;" class="text-center align-middle">HORA</th>
                                                                <th style="width: 10%;" class="text-center align-middle">FECHA</th>
                                                                <th style="width: 25%" class="align-middle">ACTIVIDAD</th>
                                                                <th style="width: 20%" class="align-middle">CIUDAD</th>
                                                                <th style="width: 40%" class="align-middle">DIRECCIÓN</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody id="tbodyAgendaGG">
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                        <hr>
                                        <br>
                                        <div class="row">

                                            <div class="col-xs-12 text-right">
                                                <ul id="paginationAgendaGG" class="pagination pagination-sm" style="margin-top: 0px; margin-top: 0px">

                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title">
                                        <a class="agenda-ad collapsed" data-toggle="collapse" data-parent="#tab" href="#tab-DireccionInfraestructura" tipo="2" complemento="DI" aria-expanded="false">
                                            Dirección de Infraestructura
                                        </a>
                                    </h3>
                                </div>
                                <div id="tab-DireccionInfraestructura" class="panel-collapse collapse" aria-expanded="false" style="">
                                    <div class="panel-body">
                                        <div class="row">
                                            <form id="FrmAgendaDI">
                                                <div class="col-md-7 col-sm-6 col-xs-12">
                                                    <div class="input-field">
                                                        <input type="text" name="txtActividadDI" id="txtActividadDI">
                                                        <label for="name" class=""><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Buscar Agenda . . .</font></font></label>
                                                    </div>
                                                </div>
                                                <div class="col-md-3 col-sm-6 col-xs-12">
                                                    <div class="input-field">
                                                        <input type="text" name="txtCalendarioDI" id="txtCalendarioDI">
                                                        <label for="name" class=""><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">DD/MM/AAAA</font></font></label>
                                                    </div>
                                                </div>
                                                <div class="col-md-2 col-sm-6 col-xs-12">
                                                    <button type="submit" id="btnBuscarAgendaDI" class="waves-effect waves-light btn" style="height: 30px; padding-top: 2px; padding-bottom: 2px; margin-top: 45px;">Buscar</button>
                                                </div>
                                                <input type="hidden" id="nameFormDI" value="FrmAgendaDI">
                                                <input type="hidden" id="actionAgendaDI" name="action" value="paginarAgenda">
                                                <input type="hidden" id="numberPageAgendaDI" name="numberPageAgendaDI" value="1">
                                                <input type="hidden" id="sizePageAgendaDI" name="sizePageAgendaDI" value="10">
                                            </form>
                                        </div>
                                        <div class="row" id="loader_contenidoDI" style="display: none">
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
                                                                <th style="width: 10%;" class="text-center align-middle">HORA</th>
                                                                <th style="width: 10%;" class="text-center align-middle">FECHA</th>
                                                                <th style="width: 25%" class="align-middle">ACTIVIDAD</th>
                                                                <th style="width: 20%" class="align-middle">CIUDAD</th>
                                                                <th style="width: 40%" class="align-middle">DIRECCIÓN</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody id="tbodyAgendaDI">
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                        <hr>
                                        <br>
                                        <div class="row">

                                            <div class="col-xs-12 text-right">
                                                <ul id="paginationAgendaDI" class="pagination pagination-sm" style="margin-top: 0px; margin-top: 0px">

                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title">
                                        <a class="agenda-ad collapsed" data-toggle="collapse" data-parent="#tab" href="#tab-DireccionDesarrolloAgropecuario" tipo="3" complemento="DDA" aria-expanded="false">
                                            Dirección de Desarrollo Agropecuario
                                        </a>
                                    </h3>
                                </div>
                                <div id="tab-DireccionDesarrolloAgropecuario" class="panel-collapse collapse" aria-expanded="false" style="">
                                    <div class="panel-body">
                                        <div class="row">
                                            <form id="FrmAgendaDDA">
                                                <div class="col-md-7 col-sm-6 col-xs-12">
                                                    <div class="input-field">
                                                        <input type="text" name="txtActividadDDA" id="txtActividadDDA">
                                                        <label for="name" class=""><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Buscar Agenda . . .</font></font></label>
                                                    </div>
                                                </div>
                                                <div class="col-md-3 col-sm-6 col-xs-12">
                                                    <div class="input-field">
                                                        <input type="text" name="txtCalendarioDDA" id="txtCalendarioDDA">
                                                        <label for="name" class=""><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">DD/MM/AAAA</font></font></label>
                                                    </div>
                                                </div>
                                                <div class="col-md-2 col-sm-6 col-xs-12">
                                                    <button type="submit" id="btnBuscarAgendaDDA" class="waves-effect waves-light btn" style="height: 30px; padding-top: 2px; padding-bottom: 2px; margin-top: 45px;">Buscar</button>
                                                </div>
                                                <input type="hidden" id="nameFormDDA" value="FrmAgendaDDA">
                                                <input type="hidden" id="actionAgendaDDA" name="action" value="paginarAgenda">
                                                <input type="hidden" id="numberPageAgendaDDA" name="numberPageAgendaDDA" value="1">
                                                <input type="hidden" id="sizePageAgendaDDA" name="sizePageAgendaDDA" value="10">
                                            </form>
                                        </div>
                                        <div class="row" id="loader_contenidoDDA" style="display: none">
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
                                                                <th style="width: 10%;" class="text-center align-middle">HORA</th>
                                                                <th style="width: 10%;" class="text-center align-middle">FECHA</th>
                                                                <th style="width: 25%" class="align-middle">ACTIVIDAD</th>
                                                                <th style="width: 20%" class="align-middle">CIUDAD</th>
                                                                <th style="width: 40%" class="align-middle">DIRECCIÓN</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody id="tbodyAgendaDDA">
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                        <hr>
                                        <br>
                                        <div class="row">

                                            <div class="col-xs-12 text-right">
                                                <ul id="paginationAgendaDDA" class="pagination pagination-sm" style="margin-top: 0px; margin-top: 0px">

                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>                       
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title">
                                        <a class="agenda-ad collapsed" data-toggle="collapse" data-parent="#tab" href="#tab-DireccionManejoAmbiental" tipo="4" complemento="DMA" aria-expanded="false">
                                            Dirección de Manejo Ambiental
                                        </a>
                                    </h3>
                                </div>
                                <div id="tab-DireccionManejoAmbiental" class="panel-collapse collapse" aria-expanded="false" style="">
                                    <div class="panel-body">
                                        <div class="row">
                                            <form id="FrmAgendaDMA">
                                                <div class="col-md-7 col-sm-6 col-xs-12">
                                                    <div class="input-field">
                                                        <input type="text" name="txtActividadDMA" id="txtActividadDMA">
                                                        <label for="name" class=""><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Buscar Agenda . . .</font></font></label>
                                                    </div>
                                                </div>
                                                <div class="col-md-3 col-sm-6 col-xs-12">
                                                    <div class="input-field">
                                                        <input type="text" name="txtCalendarioDMA" id="txtCalendarioDMA">
                                                        <label for="name" class=""><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">DD/MM/AAAA</font></font></label>
                                                    </div>
                                                </div>
                                                <div class="col-md-2 col-sm-6 col-xs-12">
                                                    <button type="submit" id="btnBuscarAgendaDMA" class="waves-effect waves-light btn" style="height: 30px; padding-top: 2px; padding-bottom: 2px; margin-top: 45px;">Buscar</button>
                                                </div>
                                                <input type="hidden" id="nameFormDMA" value="FrmAgendaDMA">
                                                <input type="hidden" id="actionAgendaDMA" name="action" value="paginarAgenda">
                                                <input type="hidden" id="numberPageAgendaDMA" name="numberPageAgendaDMA" value="1">
                                                <input type="hidden" id="sizePageAgendaDMA" name="sizePageAgendaDMA" value="10">
                                            </form>
                                        </div>
                                        <div class="row" id="loader_contenidoDMA" style="display: none">
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
                                                                <th style="width: 10%;" class="text-center align-middle">HORA</th>
                                                                <th style="width: 10%;" class="text-center align-middle">FECHA</th>
                                                                <th style="width: 25%" class="align-middle">ACTIVIDAD</th>
                                                                <th style="width: 20%" class="align-middle">CIUDAD</th>
                                                                <th style="width: 40%" class="align-middle">DIRECCIÓN</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody id="tbodyAgendaDMA">
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                        <hr>
                                        <br>
                                        <div class="row">

                                            <div class="col-xs-12 text-right">
                                                <ul id="paginationAgendaDMA" class="pagination pagination-sm" style="margin-top: 0px; margin-top: 0px">

                                                </ul>
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
        <script type="text/javascript" src="<%out.print(getServletContext().getContextPath());%>/js_app/web/agendainstitucionalweb.js"></script>

    </body>
</html>