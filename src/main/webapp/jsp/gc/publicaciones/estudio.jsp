<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="es">
    <head>
        <%@ include file="../../../att_head_gc.jsp"%>
        <!-- Bootstrap Core CSS -->
        <link href="<%out.print(getServletContext().getContextPath());%>/assets/plugins/bootstrap/css/bootstrap.min.css"rel="stylesheet">
        <link href="<%out.print(getServletContext().getContextPath());%>/assets/plugins/bootstrap-datepicker/bootstrap-datepicker.min.css"rel="stylesheet">
        <link href="<%out.print(getServletContext().getContextPath());%>/assets/plugins/sweetalert/sweetalert.css"rel="stylesheet">
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
                                    <strong class="text-info">ESTUDIOS</strong>
                                </div>
                                <div class="card-body pt-1">
                                    <input type="hidden" id="nameForm" value="FrmEstudio">
                                    <input type="hidden" id="actionEstudio" name="action" value="paginarEstudio">
                                    <input type="hidden" id="numberPageEstudio" name="numberPageEstudio" value="1">
                                    <form id="FrmEstudio">
                                        <div class="row mt-3">
                                            <div class="form-group col-lg-7 col-md-8 col-12 mb-3">
                                                <input type="text" name="txtEstudio" id="txtEstudio" class="form-control form-control-sm" placeholder="TÍTULO">
                                            </div>
                                            <div class="input-group col-lg-5 col-md-4 col-12 mb-3">
                                                <select id="comboAnio" name="comboAnio" class="form-control form-control-sm combo-paginar mr-3" idBtnBuscar='btnBuscarEstudio'>

                                                </select>
                                                <button type="submit" id="btnBuscarEstudio" class="btn waves-effect waves-light btn-info btn-sm mr-3" data-toggle="tooltip" title="Buscar Estudio" style="height: 31px"><i class="fas fa-search" aria-hidden="true"></i> BUSCAR</button>
                                                <button type="button" id="btnAbrirNuevoEstudio" class="btn waves-effect waves-light btn-info btn-sm" data-toggle="tooltip" title="Registrar Estudio" style="height: 31px"><i class="fa fa-plus-square" aria-hidden="true"></i></button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row" id="containerRegistrosEstudio">

                    </div>
                    <div class="row">
                        <div class="col-12">
                            <div class="card "
                                 style="height: 50px; margin-bottom: 0px">
                                <div class="card-body"
                                     style="padding-top: 10px; padding-bottom: 10px">
                                    <div class="row">
                                        <div class="col-md-2 col-sm-3 col-4">
                                            <select id="sizePageEstudio" name="sizePageEstudio" class="form-control form-control-sm combo-paginar" idBtnBuscar='btnBuscarEstudio'>
                                                <option value="12">12</option>
                                                <option value="15">15</option>
                                                <option value="18">18</option>
                                                <option value="21">21</option>
                                            </select>
                                        </div>
                                        <div class="col-md-10 col-sm-9 col-8">
                                            <nav aria-label="Page navigation example">
                                                <ul id="paginationEstudio"
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
                <div class="modal fade" id="ventanaManEstudio" data-backdrop="static" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-lg modal-dialog-scroll" role="document">
                        <div class="modal-content">
                            <form id="FrmEstudioModal">
                                <div class="modal-header">
                                    <h6 class="modal-title" id="txtTituloModalManEstudio"></h6>
                                    <button type="button" class="close" data-dismiss="modal"
                                            aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body modal-body-scroll">
                                    <div class="row">
                                        <div class="form-group col-12 mb-3">
                                            <label for="txtFechaER">FECHA PUBLICACIÓN</label>
                                            <input type="text" class="form-control form-control-sm" id="txtFechaER" name="txtFechaER" placeholder="DD/MM/AAAA"> 
                                        </div>
                                        <div class="form-group col-12 mb-3">
                                            <label for="txtTituloER">TÍTULO</label>
                                            <input class="form-control form-control-sm" id="txtTituloER" name="txtTituloER" type="text" placeholder="TÍTULO" maxlength="200">
                                        </div>
                                        <div class="form-group col-12 mb-3">
                                            <label for="txtFotoER">FOTO(Flickr)</label>
                                            <input class="form-control form-control-sm" id="txtFotoER" name="txtFotoER" type="text" placeholder="FOTO">
                                        </div>
                                        <div class="form-group col-6 mb-3">
                                            <label for="comboSeguimientoER">ESTADO DEL ESTUDIO</label>
                                            <select id="comboSeguimientoER" name="comboSeguimientoER" class="form-control form-control-sm">
                                                <option value="-1">Seleccione...</option>
                                                <option value="En Formulación">En Formulación</option>
                                                <option value="En Evaluación">En Evaluación</option>
                                                <option value="PIP Viable">PIP Viable</option>
                                                <option value="Registro en Fase de Inversión">Registro en Fase de Inversión</option>
                                                <option value="Cerrado">Cerrado</option>
                                            </select>
                                        </div>
                                        <div class="form-group col-6 mb-3">
                                            <label for="txtSnipER">SNIP DEL ESTUDIO</label>
                                            <input class="form-control form-control-sm" id="txtSnipER" name="txtSnipER" type="text" placeholder="SNIP">
                                        </div>
                                        <div class="form-group col-12 mb-3">
                                            <label for="txtObjetivoER">OBJETIVO DEL ESTUDIO</label>
                                            <textarea class="form-control form-control-sm" id="txtObjetivoER" name="txtObjetivoER" rows="10" placeholder="OBJETIVO"></textarea>
                                        </div>
                                        <div class="form-group col-12 mb-3">
                                            <label for="txtCantBeneficiariosER">CANTIDAD DE BENEFICIARIOS</label>
                                            <input class="form-control form-control-sm" id="txtCantBeneficiariosER" name="txtCantBeneficiariosER" type="text" placeholder="CANTIDAD DE BENEFICIARIOS">
                                        </div>
                                        <div class="form-group col-12 mb-3">
                                            <label for="txtCaracBeneficiariosER">CARACTERISTICAS DE BENEFICIARIOS</label>
                                            <textarea class="form-control form-control-sm" id="txtCaracBeneficiariosER" name="txtCaracBeneficiariosER" rows="10" placeholder="CARACTERISTICAS"></textarea>
                                        </div>
                                        <div class="form-group col-6 mb-3">
                                            <label for="txtLugarER">LUGAR DEL ESTUDIO</label>
                                            <input class="form-control form-control-sm" id="txtLugarER" name="txtLugarER" type="text" placeholder="LUGAR">
                                        </div>
                                        <div class="form-group col-6 mb-3">
                                            <label for="txtMapaER">MAPA DEL ESTUDIO (GOOGLE MAPS)</label>
                                            <input class="form-control form-control-sm" id="txtMapaER" name="txtMapaER" type="text" placeholder="MAPA">
                                        </div>
                                        <input id="txtIdER" name="txtIdER" type="hidden" value="">
                                        <input id="txtEstadoEstudioER" name="txtEstadoEstudioER" type="hidden" value="0">
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
                <div class="modal fade" id="ventanaVistaPreviaEstudio" data-backdrop="static" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
                                                    <h3 class="text-peam-negrita" style="margin-bottom: 30px" id="tituloEstudioVP">First title goes here</h3>
                                                    <p class="text-peam" style="margin-bottom: 100px" id="resumenEstudioVP">this is the subcontent you can use this</p>
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
            <div class="modal fade" id="modalCargandoEstudio" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-hidden="true" style="padding-top: 18%; overflow-y: visible;">
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

    <script src="<%out.print(getServletContext().getContextPath());%>/js/jquery.Pagination.min.js"></script>
    <script src="<%out.print(getServletContext().getContextPath());%>/js_app/utilities/lib-utilities.js"></script>
    <script src="<%out.print(getServletContext().getContextPath());%>/js_app/utilities/lib-validaciones.js"></script>
    <script src="<%out.print(getServletContext().getContextPath());%>/js_app/gc/estudio.js"></script>

</body>

</html>
