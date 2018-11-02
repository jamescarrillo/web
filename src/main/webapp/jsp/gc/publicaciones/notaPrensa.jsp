<%-- 
    Document   : penalidad
    Created on : 21/10/2018, 04:14:18 PM
    Author     : James Carrillo
--%>

<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="es">
    <head>
        <%@ include file="../../../att_head_gc.jsp"%>
        <!-- Bootstrap Core CSS -->
        <link href="<%out.print(getServletContext().getContextPath());%>/assets/plugins/bootstrap/css/bootstrap.min.css"rel="stylesheet">
        <link href="<%out.print(getServletContext().getContextPath());%>/assets/plugins/bootstrap-datepicker/bootstrap-datepicker.min.css"rel="stylesheet">
        <link href="<%out.print(getServletContext().getContextPath());%>/assets/plugins/sweetalert/sweetalert.css"rel="stylesheet">
        <link href="<%out.print(getServletContext().getContextPath());%>/assets/sum/summernote-bs4.css" rel="stylesheet">
        <!-- Custom CSS -->
        <link href="<%out.print(getServletContext().getContextPath());%>/css/style.css" rel="stylesheet">
        <link href="<%out.print(getServletContext().getContextPath());%>/css/views/estilos.css" rel="stylesheet">
        <!-- You can change the theme colors from here -->
        <link href="<%out.print(getServletContext().getContextPath());%>/css/colors/blue.css" id="theme" rel="stylesheet">

        <!--link href="<%out.print(getServletContext().getContextPath());%>/assets/plugins/bootstrap-material-datetimepicker/css/bootstrap-material-datetimepicker.css" rel="stylesheet"-->
        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
                <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
                <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
            <![endif]-->
    </head>
    <body class="fix-header fix-sidebar card-no-border">
        <div class="preloader">
            <svg class="circular" viewBox="25 25 50 50">
            <circle class="path" cx="50" cy="50" r="20" fill="none"
                    stroke-width="2" stroke-miterlimit="10" /> </svg>
        </div>
        <div id="main-wrapper">
            <header class="topbar">
                <%@ include file="../../../navbar_gc.jsp"%>
            </header>
            <%@ include file="../../../menu_gc.jsp"%>
            <div class="page-wrapper">
                <!-- ============================================================== -->
                <!-- Container fluid  -->
                <!-- ============================================================== -->
                <div class="container-fluid">
                    <%@ include file="../../../row_username.jsp"%>
                    <!-- Start Page Content -->
                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-header bg-light">
                                    <strong class="text-info">NOTAS DE PRENSA</strong>
                                </div>
                                <div class="card-body pt-1">
                                    <input type="hidden" id="nameForm" value="FrmNotaPrensa">
                                    <input type="hidden" id="actionNotaPrensa" name="action" value="paginarNotaPrensa">
                                    <input type="hidden" id="actionManNotaPrensa" name="action" value="">
                                    <input type="hidden" id="numberPageNotaPrensa" name="numberPageNotaPrensa" value="1">
                                    <form id="FrmNotaPrensa">
                                        <div class="row mt-3">
                                            <div class="form-group col-lg-5 col-md-8 col-12 mb-3">
                                                <input type="text" name="txtTituloNotaPrensa" id="txtTituloNotaPrensa" class="form-control form-control-sm" placeholder="TÍTULO">
                                            </div>
                                            <div class="form-group col-lg-3 col-md-8 col-12 mb-3">
                                                <select id="estadoNotaPrensa" name="estadoNotaPrensa" class="form-control form-control-sm combo-paginar mr-3" idBtnBuscar='btnBuscarNotaPrensa'>
                                                    <option value="-1">TODOS</option>
                                                    <option value="true">ACTIVOS</option>
                                                    <option value="false">INACTIVOS</option>
                                                </select>
                                            </div>
                                            <div class="input-group col-lg-4 col-md-4 col-12 mb-3">
                                                <select id="comboAnio" name="comboAnio" class="form-control form-control-sm combo-paginar mr-3" idBtnBuscar='btnBuscarNotaPrensa'>

                                                </select>
                                                <button type="submit" id="btnBuscarNotaPrensa" class="btn waves-effect waves-light btn-info btn-sm mr-3" data-toggle="tooltip" title="Buscar NotaPrensa" style="height: 31px"><i class="fas fa-search" aria-hidden="true"></i> BUSCAR</button>
                                                <button type="button" id="btnAbrirNuevoNotaPrensa" class="btn waves-effect waves-light btn-info btn-sm" data-toggle="tooltip" title="Registrar NotaPrensa" style="height: 31px"><i class="fa fa-plus-square" aria-hidden="true"></i></button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row" id="containerRegistrosNotasPrensa">
                        <!--div class="col-lg-4 col-md-6">
                            <div class="card blog-widget">
                                <div class="card-body">
                                    <div class="blog-image"><img src="../assets/images/big/img1.jpg" alt="img" class="img-responsive"></div>
                                    <h3>Business development new rules for 2017</h3>
                                    <label class="label label-rounded label-success">Technology</label>
                                    <p class="m-t-20 m-b-20">
                                        Lorem ipsum dolor sit amet, this is a consectetur adipisicing elit, sed do eiusmod tempor incididunt ut
                                    </p>
                                    <div class="d-flex">
                                        <div class="read"><a href="javascript:void(0)" class="link font-medium">Vista Previa</a></div>
                                        <div class="ml-auto">
                                            <a href="javascript:void(0)" class="link mr-2" data-toggle="tooltip" title="" data-original-title="Ocultar"><i class="far fa-hand-point-up"></i></a>
                                            <a href="javascript:void(0)" class="link mr-2" data-toggle="tooltip" title="" data-original-title="Editar"><i class="fas fa-edit"></i></a>
                                            <a href="javascript:void(0)" class="link" data-toggle="tooltip" title="" data-original-title="Eliminar"><i class="fas fa-trash-alt"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div-->
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <div class="card "
                                 style="height: 50px; margin-bottom: 0px">
                                <div class="card-body"
                                     style="padding-top: 10px; padding-bottom: 10px">
                                    <div class="row">
                                        <div class="col-md-2 col-sm-3 col-4">
                                            <select id="sizePageNotaPrensa" name="sizePageNotaPrensa" class="form-control form-control-sm combo-paginar" idBtnBuscar='btnBuscarNotaPrensa'>
                                                <option value="12">12</option>
                                                <option value="15">15</option>
                                                <option value="18">18</option>
                                                <option value="21">21</option>
                                            </select>
                                        </div>
                                        <div class="col-md-10 col-sm-9 col-8">
                                            <nav aria-label="Page navigation example">
                                                <ul id="paginationNotaPrensa"
                                                    class="pagination pagination-sm justify-content-end">

                                                </ul>

                                            </nav>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%@ include file="../../../temas_gc.jsp"%>
                </div>
                <div class="modal fade" id="ventanaManNotaPrensa" data-backdrop="static" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-lg" role="document">
                        <div class="modal-content">
                            <form id="FrmNotaPrensaModal">
                                <div class="modal-header">
                                    <h6 class="modal-title" id="txtTituloModalManNotaPrensa"></h6>
                                    <button type="button" class="close" data-dismiss="modal"
                                            aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <div class="row">
                                        <div class="form-group col-12 mb-3">
                                            <label for="datePickerFechaER">FECHA PUBLICACIÓN</label>
                                            <input type="text" class="form-control form-control-sm" id="datePickerFechaER" name="datePickerFechaER" placeholder="DD/MM/AAAA"> 
                                        </div>
                                        <div class="form-group col-12 mb-3">
                                            <label for="txtTituloNotaPrensaER">TÍTULO</label>
                                            <input class="form-control form-control-sm" id="txtTituloNotaPrensaER" name="txtTituloNotaPrensaER" type="text" placeholder="TÍTULO" maxlength="200">
                                        </div>
                                        <div class="col-12 mb-3">
                                            <label for="editorWebContenido">CONTENIDO</label>
                                            <div id="editorWebContenido"></div>
                                        </div>
                                        <div class="form-group col-12 mb-3">
                                            <label for="txtFuenteNotaPrensaER">FUENTE</label>
                                            <input class="form-control form-control-sm" id="txtFuenteNotaPrensaER" name="txtFuenteNotaPrensaER" type="text" placeholder="FUENTE">
                                        </div>
                                        <div class="form-group col-12 mb-3">
                                            <label for="txtFotoNotaPrensaER">FOTO(Flickr)</label>
                                            <input class="form-control form-control-sm" id="txtFotoNotaPrensaER" name="txtFotoNotaPrensaER" type="text" placeholder="FOTO">
                                        </div>
                                        <input id="txtContenidoNotaPrensaER" name="txtContenidoNotaPrensaER" type="hidden" value="">
                                        <input id="txtIdNotaPrensaER" name="txtIdNotaPrensaER" type="hidden" value="">
                                        <input id="txtAnhoNotaPrensaER" name="txtAnhoNotaPrensaER" type="hidden" value="">
                                        <input id="txtEstadoNotaPrensaER" name="txtEstadoNotaPrensaER" type="hidden" value="">
                                        <input id="txtFechaCreacionER" name="txtFechaCreacionER" type="hidden" value="">
                                        <input id="txtFechaActualizacionER" name="txtFechaActualizacionER" type="hidden" value="">
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-outline-secondary btn-sm" data-dismiss="modal">CANCELAR</button>
                                    <button type="submit" class="btn btn-outline-info btn-sm">
                                        <i class="fa fa-floppy-o"></i> GUARDAR
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="modal fade" id="ventanaVistaPreviaNotaPrensa" data-backdrop="static" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-lg" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h6 class="modal-title">VISTA PREVIA</h6>
                                <button type="button" class="close" data-dismiss="modal"
                                        aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <div class="row">

                                    <div id="carouselExampleIndicators3" class="carousel slide" data-ride="carousel">
                                        <ol class="carousel-indicators">
                                            <li data-target="#carouselExampleIndicators3" data-slide-to="0" class="active"></li>
                                        </ol>
                                        <div class="carousel-inner" role="listbox">
                                            <div class="carousel-item active">
                                                <img class="img-responsive" src="<%out.print(getServletContext().getContextPath());%>/assets/img/banner/banner-2.jpg" alt="First slide">
                                                <div class="carousel-caption d-none d-md-block">
                                                    <h3 class="text-peam-negrita" style="margin-bottom: 30px" id="tituloNotaPrensaVP">First title goes here</h3>
                                                    <p class="text-peam" style="margin-bottom: 100px" id="resumenNotaPrensaVP">this is the subcontent you can use this</p>
                                                </div>
                                            </div>
                                        </div>
                                        <a class="carousel-control-prev" href="#carouselExampleIndicators3" role="button" data-slide="prev">
                                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                            <span class="sr-only">Previous</span>
                                        </a>
                                        <a class="carousel-control-next" href="#carouselExampleIndicators3" role="button" data-slide="next">
                                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                            <span class="sr-only">Next</span>
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-outline-secondary btn-sm" data-dismiss="modal">CERRAR</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal fade" id="modalCargandoNotaPrensa" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-hidden="true" style="padding-top: 18%; overflow-y: visible;">
                <div class="modal-dialog modal-sm">
                    <div class="modal-content">
                        <div class="modal-body">
                            <div class="progress" style="margin-bottom: 0px;">
                                <div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 100%">
                                    Cargando...
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <footer class="footer"> © 2018 Peam </footer>
        </div>
        <script
        src="<%out.print(getServletContext().getContextPath());%>/assets/plugins/jquery/jquery.min.js"></script>
        <!-- Bootstrap tether Core JavaScript -->
        <script src="<%out.print(getServletContext().getContextPath());%>/assets/plugins/popper/popper.min.js"></script>
        <script src="<%out.print(getServletContext().getContextPath());%>/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
        <script src="<%out.print(getServletContext().getContextPath());%>/assets/plugins/sweetalert/sweetalert.min.js"></script>
        <!-- slimscrollbar scrollbar JavaScript -->
        <script src="<%out.print(getServletContext().getContextPath());%>/js/jquery.slimscroll.js"></script>
        <!--Wave Effects -->
        <script src="<%out.print(getServletContext().getContextPath());%>/js/waves.js"></script>
        <!--Menu sidebar -->
        <script src="<%out.print(getServletContext().getContextPath());%>/js/sidebarmenu.js"></script>
        <!--stickey kit -->
        <script src="<%out.print(getServletContext().getContextPath());%>/assets/plugins/sticky-kit-master/dist/sticky-kit.min.js"></script>
        <script src="<%out.print(getServletContext().getContextPath());%>/assets/plugins/sparkline/jquery.sparkline.min.js"></script>
        <!--Custom JavaScript -->
        <script src="<%out.print(getServletContext().getContextPath());%>/js/custom.min.js"></script>

        <script src="<%out.print(getServletContext().getContextPath());%>/assets/plugins/moment/moment.js"></script>
        <script src="<%out.print(getServletContext().getContextPath());%>/assets/plugins/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>

        <!-- ============================================================== -->
        <!-- This page plugins -->
        <!-- ============================================================== -->
        <script src="<%out.print(getServletContext().getContextPath());%>/assets/plugins/styleswitcher/jQuery.style.switcher.js"></script>
        <script src="<%out.print(getServletContext().getContextPath());%>/assets/sum/summernote-bs4.js"></script>
        <script src="<%out.print(getServletContext().getContextPath());%>/assets/sum/lang/summernote-es-ES.js"></script>

        <script src="<%out.print(getServletContext().getContextPath());%>/js/jquery.Pagination.min.js"></script>
        <script src="<%out.print(getServletContext().getContextPath());%>/js_app/utilities/lib-utilities.js"></script>
        <script src="<%out.print(getServletContext().getContextPath());%>/js_app/utilities/lib-validaciones.js"></script>
        <script src="<%out.print(getServletContext().getContextPath());%>/js_app/gc/notaPrensa.js"></script>

    </body>

</html>
