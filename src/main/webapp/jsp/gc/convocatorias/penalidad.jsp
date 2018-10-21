<%-- 
    Document   : penalidad
    Created on : 21/10/2018, 04:14:18 PM
    Author     : Juan Barrantes Perez
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
                                    <strong class="text-info">CONVOCATORIA PERSONAL</strong>
                                </div>
                                <div class="card-body pt-1">
                                    <input type="hidden" id="nameForm" value="FrmPenalidad">
                                    <input type="hidden" id="actionPenalidad" name="action" value="paginarPenalidad">
                                    <input type="hidden" id="numberPagePenalidad" name="numberPagePenalidad" value="1">
                                    <form id="FrmPenalidad">
                                        <div class="row mt-3">
                                            <div class="form-group col-lg-6 col-12 mb-3">
                                                <input type="text" name="txtPenalidad" id="txtPenalidad" class="form-control form-control-sm" placeholder="CONVOCATORIA">
                                            </div>
                                            <div class="form-group col-lg-2 col-md-6 col-12 mb-3">
                                                <select id="comboAnio" name="comboAnio" class="form-control form-control-sm combo-paginar mr-3" idBtnBuscar='btnBuscarPenalidad'>
                                                    
                                                </select>
                                            </div>
                                            <div class="input-group col-lg-4 col-md-6 col-12 mb-3">
                                                <select id="comboTipoListaPenalidad" name="comboTipoListaPenalidad" class="form-control form-control-sm combo-paginar mr-3" idBtnBuscar='btnBuscarPenalidad'>
                                                    <option value="-1">TODAS</option>
                                                    <option value="true">VIGENTES</option>
                                                    <option value="false">FINALIZADOS</option>
                                                </select>
                                                <button type="submit" id="btnBuscarPenalidad" class="btn waves-effect waves-light btn-info btn-sm mr-3" data-toggle="tooltip" title="Buscar Convocatoria Personal" style="height: 31px"><i class="fas fa-search" aria-hidden="true"></i> BUSCAR</button>
                                                <button type="button" id="btnAbrirNuevoPenalidad" class="btn waves-effect waves-light btn-info btn-sm" data-toggle="tooltip" title="Registrar Convocatoria Personal" style="height: 31px"><i class="fa fa-plus-square" aria-hidden="true"></i></button>
                                            </div>
                                        </div>
                                    </form>
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="table-responsive" id="tablaPenalidad">
                                                <table
                                                    class="table color-bordered-table muted-bordered-table table-hover">
                                                    <thead>
                                                        <tr>
                                                            <th style="width: 10%">FECHA</th>
                                                            <th style="width: 25%">CONVOCATORIA</th>
                                                            <th>DESCRIPCION</th>
                                                            <!--th>DOC</th-->
                                                            <!--th>ESTADO</th-->
                                                            <th colspan="5">ACCIONES</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody id="tbodyPenalidad">
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="card "
                                                 style="height: 50px; margin-bottom: 0px">
                                                <div class="card-body"
                                                     style="padding-top: 10px; padding-bottom: 10px">
                                                    <div class="row">
                                                        <div class="col-md-2 col-sm-3 col-4">
                                                            <select id="sizePagePenalidad" name="sizePagePenalidad" class="form-control form-control-sm combo-paginar" idBtnBuscar='btnBuscarPenalidad'>
                                                                <option value="10">10</option>
                                                                <option value="15">15</option>
                                                                <option value="20">20</option>
                                                            </select>
                                                        </div>
                                                        <div class="col-md-10 col-sm-9 col-8">
                                                            <nav aria-label="Page navigation example">
                                                                <ul id="paginationDocumentos"
                                                                    class="pagination pagination-sm justify-content-end">

                                                                </ul>

                                                            </nav>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%@ include file="../../../temas_gc.jsp"%>
                </div>
                <div class="modal fade" id="ventanaManPenalidad" data-backdrop="static" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <form id="FrmPenalidadModal">
                                <div class="modal-header">
                                    <h6 class="modal-title" id="txtTituloModalManPenalidad"></h6>
                                    <button type="button" class="close" data-dismiss="modal"
                                            aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <div class="row">
                                        <div class="form-group col-12 mb-3">
                                            <label for="txtConvocatoriaER">CONVOCATORIA</label>
                                            <input class="form-control form-control-sm" id="txtConvocatoriaER" name="txtConvocatoriaER" type="text" placeholder="CONVOCATORIA"> 
                                        </div>
                                        <div class="form-group col-12 mb-3">
                                            <label for="txtSintesisER">SINTESIS</label>
                                            <textarea class="form-control form-control-sm" id="txtSintesisER" name="txtSintesisER" rowa="6" placeholder="SINTESIS DE LA CONVOCATORIA"></textarea>
                                        </div>
                                        <input id="txtCoperIdER" name="txtCoperIdER" type="hidden" value="">
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-outline-secondary btn-sm" data-dismiss="modal">CANCELAR</button>
                                    <button type="submit" id="btnGuardar" class="btn btn-outline-info btn-sm">
                                        <i class="fa fa-floppy-o"></i> GUARDAR
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="modal fade" id="modalCargandoPenalidad" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-hidden="true" style="padding-top: 18%; overflow-y: visible;">
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
        <script src="<%out.print(getServletContext().getContextPath());%>/js_app/gc/penalidad.js"></script>

    </body>

</html>
