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
                                    <strong class="text-info">Organización de Sus Actividades</strong>
                                </div>
                                <div class="card-body pt-1">
                                    <input type="hidden" id="nameForm" value="FrmAgenda">
                                    <input type="hidden" id="actionAgenda" name="action" value="paginarAgenda">
                                    <input type="hidden" id="numberPageAgenda" name="numberPageAgenda" value="1">
                                    <form id="FrmAgenda">
                                        <div class="row mt-3">
                                            <div class="form-group col-lg-4 col-md-6 col-12 mb-3">
                                                <input type="text" name="txtActividad" id="txtActividad" class="form-control form-control-sm" placeholder="ACTIVIDAD">
                                            </div>
                                            <div class="input-group col-lg-2 col-md-4 col-12 mb-3">
                                                <select id="comboTipoListaAgenda" name="comboTipoListaAgenda" class="form-control form-control-sm combo-paginar mr-3" idBtnBuscar='btnBuscarAgenda'>
                                                    <option value="-1">TODAS</option>
                                                    <option value="true">ACTIVAS</option>
                                                    <option value="false">INACTIVAS</option>
                                                </select>
                                            </div>
                                            <div class="input-group col-lg-2 col-md-4 col-12 mb-3">
                                                <input type="text" class="form-control form-control-sm" id="txtCalendario" name="txtCalendario" placeholder="FECHA"> 
                                            </div>
                                            <div class="input-group col-lg-4 col-md-4 col-12 mb-3">
                                                <select id="comboFecha" name="comboFecha" class="form-control form-control-sm combo-paginar mr-3" idBtnBuscar='btnBuscarAgenda'>
                                                    <option value="todo">TODOS</option>
                                                    <option value="dia">DIA</option>
                                                    <option value="mes">MES</option>
                                                    <option value="anho">AÑO</option>
                                                </select>
                                                <input id="tFecha" name="tFecha" type="hidden">
                                                <button type="submit" id="btnBuscarAgenda" class="btn waves-effect waves-light btn-info btn-sm mr-3" data-toggle="tooltip" title="Buscar Actividad" style="height: 31px"><i class="fas fa-search" aria-hidden="true"></i> BUSCAR</button>
                                                <button type="button" id="btnAbrirNuevoAgenda" class="btn waves-effect waves-light btn-info btn-sm" data-toggle="tooltip" title="Registrar Actividad" style="height: 31px"><i class="fa fa-plus-square" aria-hidden="true"></i></button>
                                            </div>
                                            <input id="txtEstadoER" name="txtEstadoER" type="hidden" value="0">
                                        </div>
                                    </form>
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="table-responsive" id="tablaAgenda">
                                                <table
                                                    class="table color-bordered-table muted-bordered-table table-hover">
                                                    <thead>
                                                        <tr>
                                                            <th>HORA</th>
                                                            <th>FECHA</th>
                                                            <th>ACTIVIDAD</th>
                                                            <th>CUIDAD</th>
                                                            <th>DIRECCIÓN</th>
                                                            <th colspan="3">ACCIONES</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody id="tbodyAgenda">
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
                                                            <select id="sizePageAgenda" name="sizePageAgenda" class="form-control form-control-sm combo-paginar" idBtnBuscar='btnBuscarAgenda'>
                                                                <option value="10">10</option>
                                                                <option value="15">15</option>
                                                                <option value="20">20</option>
                                                            </select>
                                                        </div>
                                                        <div class="col-md-10 col-sm-9 col-8">
                                                            <nav aria-label="Page navigation example">
                                                                <ul id="paginationAgenda"
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
                <div class="modal fade" id="ventanaManAgenda" data-backdrop="static" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-lg" role="document">
                        <div class="modal-content">
                            <form id="FrmAgendaModal">
                                <div class="modal-header">
                                    <h6 class="modal-title" id="txtTituloModalManAgenda"></h6>
                                    <button type="button" class="close" data-dismiss="modal"
                                            aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <div class="row">
                                        <div class="form-group col-12 mb-3">
                                            <label for="txtActividadER">ACTIVIDAD</label>
                                            <textarea class="form-control" id="txtActividadER" name="txtActividadER" placeholder="ACTIVIDAD" rows="3"></textarea>
                                        </div>
                                        <div class="form-group col-md-6 col-12 mb-3">
                                            <label for="datePickerFechaER">FECHA</label>
                                            <input type="text" class="form-control form-control-sm" id="datePickerFechaER" name="datePickerFechaER" placeholder="DD/MM/AAAA"> 
                                        </div>
                                        <div class="form-group col-md-6 col-12 mb-3">
                                            <label for="txtCiudadER">CIUDAD</label>
                                            <input type="text" class="form-control form-control-sm" id="txtCiudadER" name="txtCiudadER" placeholder="CIUDAD"> 
                                        </div>
                                        <div class="form-group col-md-6 col-12 mb-3">
                                            <label for="txtHoraInicioER">HORA INICIO</label>
                                            <input type="text" class="form-control form-control-sm" id="txtHoraInicioER" name="txtHoraInicioER" placeholder="Ejm: 09:30AM"> 
                                        </div>
                                        <div class="form-group col-md-6 col-12 mb-3">
                                            <label for="txtHoraFinER">HORA FIN</label>
                                            <input type="text" class="form-control form-control-sm" id="txtHoraFinER" name="txtHoraFinER" placeholder="Ejm: 11:30PM"> 
                                        </div>
                                        <div class="form-group col-12 mb-3">
                                            <label for="txtLugarER">LUGAR</label>
                                            <textarea class="form-control" id="txtLugarER" name="txtLugarER" placeholder="DIRECCION" rows="3"></textarea>
                                        </div>
                                        <input id="txtIdER" name="txtIdER" type="hidden" value="">
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
                <div class="modal fade" id="modalCargandoAgenda" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-hidden="true" style="padding-top: 18%; overflow-y: visible;">
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
        <script src="<%out.print(getServletContext().getContextPath());%>/js_app/gc/agendainstitucional.js"></script>

    </body>

</html>