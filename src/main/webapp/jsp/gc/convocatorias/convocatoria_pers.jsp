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
                                    <input type="hidden" id="nameForm" value="FrmConvocatoriaPers">
                                    <input type="hidden" id="actionConvocatoriaPers" name="action" value="paginarConvocatoriaPers">
                                    <input type="hidden" id="numberPageConvocatoriaPers" name="numberPageConvocatoriaPers" value="1">
                                    <form id="FrmConvocatoriaPers">
                                        <div class="row mt-3">
                                            <div class="form-group col-lg-6 col-12 mb-3">
                                                <input type="text" name="txtConvocatoriaPers" id="txtConvocatoriaPers" class="form-control form-control-sm" placeholder="CONVOCATORIA">
                                            </div>
                                            <div class="form-group col-lg-2 col-md-6 col-12 mb-3">
                                                <select id="comboAnio" name="comboAnio" class="form-control form-control-sm combo-paginar mr-3" idBtnBuscar='btnBuscarConvocatoriaPers'>

                                                </select>
                                            </div>
                                            <div class="input-group col-lg-4 col-md-6 col-12 mb-3">
                                                <select id="comboTipoListaConvocatoriaPers" name="comboTipoListaConvocatoriaPers" class="form-control form-control-sm combo-paginar mr-3" idBtnBuscar='btnBuscarConvocatoriaPers'>
                                                    <option value="-1">TODAS</option>
                                                    <option value="true">VIGENTES</option>
                                                    <option value="false">FINALIZADOS</option>
                                                </select>
                                                <button type="submit" id="btnBuscarConvocatoriaPers" class="btn waves-effect waves-light btn-info btn-sm mr-3" data-toggle="tooltip" title="Buscar Convocatoria Personal" style="height: 31px"><i class="fas fa-search" aria-hidden="true"></i> BUSCAR</button>
                                                <button type="button" id="btnAbrirNuevoConvocatoriaPers" class="btn waves-effect waves-light btn-info btn-sm" data-toggle="tooltip" title="Registrar Convocatoria Personal" style="height: 31px"><i class="fa fa-plus-square" aria-hidden="true"></i></button>
                                            </div>
                                        </div>
                                        <input id="txtEstadoER" name="txtEstadoER" type="hidden" value="0">
                                    </form>
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="table-responsive" id="tablaConvocatoriaPers">
                                                <table
                                                    class="table color-bordered-table muted-bordered-table table-hover">
                                                    <thead>
                                                        <tr>
                                                            <th style="width: 10%" class="text-medium-table">FECHA</th>
                                                            <th style="width: 25%" class="text-medium-table">CONVOCATORIA</th>
                                                            <th class="text-medium-table">DESCRIPCION</th>
                                                            <th colspan="5" class="text-medium-table">ACCIONES</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody id="tbodyConvocatoriaPers">
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
                                                            <select id="sizePageConvocatoriaPers" name="sizePageConvocatoriaPers" class="form-control form-control-sm combo-paginar" idBtnBuscar='btnBuscarConvocatoriaPers'>
                                                                <option value="10">10</option>
                                                                <option value="15">15</option>
                                                                <option value="20">20</option>
                                                            </select>
                                                        </div>
                                                        <div class="col-md-10 col-sm-9 col-8">
                                                            <nav aria-label="Page navigation example">
                                                                <ul id="paginationConvocatoriaPers"
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
                <!-- CONVOCATORIAS DE PERSONAL --> 
                <div class="modal fade" id="ventanaManConvocatoriaPers" data-backdrop="static" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <form id="FrmConvocatoriaPersModal">
                                <div class="modal-header">
                                    <h6 class="modal-title" id="txtTituloModalManConvocatoriaPers"></h6>
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
                                            <textarea class="form-control form-control-sm" id="txtSintesisER" name="txtSintesisER" rows="6" placeholder="SINTESIS DE LA CONVOCATORIA"></textarea>
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
                <div class="modal fade" id="modalCargandoConvocatoriaPers" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-hidden="true" style="padding-top: 18%; overflow-y: visible;">
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
                <!-- CALENDARIO DE CONVOCATORIAS -->
                <div class="modal fade" id="ventanaCalendarioConv" data-backdrop="static" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-lg" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h6 class="modal-title">CALENDARIO DE CONVOCATORIAS</h6>
                                <button type="button" class="close" data-dismiss="modal"
                                        aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body pt-1">
                                <input type="hidden" id="nameFormAC" value="FrmActividad">
                                <input type="hidden" id="actionActividad" name="action" value="paginarActividad">
                                <input type="hidden" id="nameFormCC" value="FrmCalendarioConv">
                                <input type="hidden" id="actionCalendarioConv" name="action" value="paginarCalendarioConv">
                                <input type="hidden" id="numberPageCalendarioConv" name="numberPageCalendarioConv" value="1">
                                <input type="hidden" id="txtConvoPersIdER" name="txtConvoPersIdER">
                                <form id="FrmCalendarioConv">
                                    <div class="row mt-3">
                                        <div class="input-group col-lg-12 col-md-8 col-12 mb-3 ">
                                            <input type="text" name="txtCalendarioConv" id="txtCalendarioConv" class="form-control form-control-sm mr-3" placeholder="ACTIVIDAD">
                                            <button type="submit" id="btnBuscarCalendarioConv" class="btn waves-effect waves-light btn-info btn-sm mr-3" data-toggle="tooltip" title="Buscar Actividad" style="height: 31px"><i class="fas fa-search" aria-hidden="true"></i> BUSCAR</button>
                                            <button type="button" id="btnAbrirNuevoCalendarioConv" class="btn waves-effect waves-light btn-info btn-sm" data-toggle="tooltip" title="Seleccionar Actividad" style="height: 31px"><i class="fa fa-plus-square" aria-hidden="true"></i></button>
                                        </div>
                                    </div>
                                </form>
                                <div class="row">
                                    <div class="col-12">
                                        <div class="table-responsive" id="tablaCalendarioConv">
                                            <table
                                                class="table color-bordered-table muted-bordered-table table-hover">
                                                <thead>
                                                    <tr>
                                                        <th style="width: 80%" class="text-small-table">ACTIVIDAD</th>
                                                        <th style="width: 7%" class="text-small-table text-center">FECHA INICIO</th>
                                                        <th style="width: 7%" class="text-small-table text-center">FECHA FIN</th>
                                                        <th colspan="3" style="width: 20%" class="text-small-table text-center">ACCIONES</th>
                                                    </tr>
                                                </thead>
                                                <tbody id="tbodyCalendarioConv">
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
                                                        <select id="sizePageCalendarioConv" name="sizePageCalendarioConv" class="form-control form-control-sm combo-paginar" idBtnBuscar='btnBuscarCalendarioConv'>
                                                            <option value="10">10</option>
                                                            <option value="15">15</option>
                                                            <option value="20">20</option>
                                                        </select>
                                                    </div>
                                                    <div class="col-md-10 col-sm-9 col-8">
                                                        <nav aria-label="Page navigation example">
                                                            <ul id="paginationCalendarioConv"
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
                            <div class="modal-footer">
                                <button type="button" class="btn btn-outline-secondary btn-sm" data-dismiss="modal">Cerrar</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal fade" id="ventanaManCalendarioConv" data-backdrop="static" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content border-primary" style="border-width: 3px">
                            <form id="FrmCalendarioConvModal">
                                <div class="modal-header">
                                    <h6 class="modal-title" id="txtTituloModalManCalendarioConv"></h6>
                                    <button type="button" class="close" data-dismiss="modal"
                                            aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <div class="row">
                                        <div class="form-group col-sm-6 col-12 mb-3">
                                            <label for="txtFechaInicioERCC">FECHA INICIAL</label>
                                            <input class="form-control form-control-sm" id="txtFechaInicioERCC" name="txtFechaInicioERCC" type="text" placeholder="Fecha Inicial"> 
                                        </div>
                                        <div class="form-group col-sm-6 col-12 mb-3">
                                            <label for="txtFechaFinERCC">FECHA FIN</label>
                                            <input class="form-control form-control-sm" id="txtFechaFinERCC" name="txtFechaFinERCC" type="text" placeholder="Fecha Final">
                                        </div>
                                        <div class="form-group col-12 mb-3">
                                            <label for="comboActividadCC">ACTIVIDAD</label>
                                            <select id="comboActividadCC" name="comboActividadCC" class="form-control form-control-sm">
                                            </select>
                                        </div>
                                        <div class="col-sm-4 col-12 mb-3">
                                            <button type="button" id="btnAbrirNuevoActividad" class="btn btn-outline-info btn-sm btn-block" data-toggle="tooltip" title="Registrar Actividad" style="height: 33px"><i class="fa fa-plus-square" aria-hidden="true"> Nueva Actividad</i></button>
                                        </div>
                                        <div class="col-sm-4 col-12 mb-3">
                                            <button type="button" id="btnEditarActividad" class="btn btn-outline-info btn-sm btn-block" data-toggle="tooltip" title="Editar Actividad" style="height: 33px"><i class="fas fa-edit" aria-hidden="true"> Editar Actividad</i></button>
                                        </div>
                                        <div class="col-sm-4 col-12 mb-3">
                                            <button type="button" id="btnEliminarActividad" class="btn btn-outline-danger btn-sm btn-block" data-toggle="tooltip" title="Eliminar Actividad" style="height: 33px"><i class="fas fa-trash-alt" aria-hidden="true"> Eliminar Actividad</i></button>
                                        </div>
                                        <input id="txtIdERCC" name="txtIdERCC" type="hidden" value="">
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
                <div class="modal fade" id="modalCargandoCalendarioConv" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-hidden="true" style="padding-top: 18%; overflow-y: visible;">
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
                <!-- ACTIVIDADES -->
                <div class="modal fade" id="ventanaManActividad" data-backdrop="static" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-sm" role="document">
                        <div class="modal-content border-warning" style="border-width: 3px">
                            <form id="FrmActividadModal">
                                <div class="modal-header">
                                    <h6 class="modal-title" id="txtTituloModalManActividad"></h6>
                                    <button type="button" class="close" data-dismiss="modal"
                                            aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <div class="row">
                                        <div class="form-group col-12 mb-3">
                                            <label for="txtActividadERAC">ACTIVIDAD</label>
                                            <textarea class="form-control form-control-sm" id="txtActividadERAC" name="txtActividadERAC" type="text" placeholder="Nombre de Actividad" rows="3"></textarea>
                                        </div>
                                        <input id="txtActiIdERAC" name="txtActiIdERAC" type="hidden" value="">
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
                <div class="modal fade" id="modalCargandoActividad" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-hidden="true" style="padding-top: 18%; overflow-y: visible;">
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
                <!-- PUESTO DE CONVOCATORIAS -->
                <div class="modal fade" id="ventanaPuestoConv" data-backdrop="static" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-lg" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h6 class="modal-title">PLAZAS</h6>
                                <button type="button" class="close" data-dismiss="modal"
                                        aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body pt-1">
                                <input type="hidden" id="nameFormPC" value="FrmPuestoConv">
                                <input type="hidden" id="actionPuestoConv" name="action" value="paginarPuestoConv">
                                <input type="hidden" id="txtCoperIdERPC" name="txtCoperIdERPC">
                                <input type="hidden" id="numberPagePuestoConv" name="numberPagePuestoConv" value="1">
                                <form id="FrmPuestoConv">
                                    <div class="row mt-3">
                                        <div class="input-group col-lg-12 col-md-8 col-12 mb-3 ">
                                            <input type="text" name="txtPuestoConv" id="txtPuestoConv" class="form-control form-control-sm mr-3" placeholder="CARGO">
                                            <button type="submit" id="btnBuscarPuestoConv" class="btn waves-effect waves-light btn-info btn-sm mr-3" data-toggle="tooltip" title="Buscar Cargo" style="height: 31px"><i class="fas fa-search" aria-hidden="true"></i> BUSCAR</button>
                                            <button type="button" id="btnAbrirNuevoPuestoConv" class="btn waves-effect waves-light btn-info btn-sm" data-toggle="tooltip" title="Nuevo Cargo" style="height: 31px"><i class="fa fa-plus-square" aria-hidden="true"></i></button>
                                        </div>
                                    </div>
                                </form>
                                <div class="row">
                                    <div class="col-12">
                                        <div class="table-responsive" id="tablaPuestoConv">
                                            <table
                                                class="table color-bordered-table muted-bordered-table table-hover">
                                                <thead>
                                                    <tr>
                                                        <th style="width: 40%" >CARGO</th>
                                                        <th style="width: 15%" >INGRESO_MENSUAL</th>
                                                        <th style="width: 20%" >MODALIDAD</th>
                                                        <th style="width: 10%" >VACANTES</th>
                                                        <th colspan="2" style="width: 10%" >ACCIONES</th>
                                                    </tr>
                                                </thead>
                                                <tbody id="tbodyPuestoConv">
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-outline-secondary btn-sm" data-dismiss="modal">Cerrar</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal fade" id="modalCargandoPuestoConv" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-hidden="true" style="padding-top: 18%; overflow-y: visible;">
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
                <div class="modal fade" id="ventanaManPuestoConv" data-backdrop="static" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content border-primary" style="border-width: 3px">
                            <form id="FrmPuestoConvModal">
                                <div class="modal-header">
                                    <h6 class="modal-title" id="txtTituloModalManPuestoConv"></h6>
                                    <button type="button" class="close" data-dismiss="modal"
                                            aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <div class="row">
                                        <div class="form-group col-12 mb-3">
                                            <label for="txtCargoERPC">CARGO</label>
                                            <input class="form-control form-control-sm" id="txtCargoERPC" name="txtCargoERPC" type="text" placeholder="Cargo"> 
                                        </div>
                                        <div class="form-group col-12 mb-3">
                                            <label for="txtIngreMensualERPC">INGRESO MENSUAL</label>
                                            <input class="form-control form-control-sm" id="txtIngreMensualERPC" name="txtIngreMensualERPC" type="text" placeholder="Ingreso Mensual">
                                        </div>
                                        <div class="form-group col-12 mb-3">
                                            <label for="txtModalidadERPC">MODALIDAD</label>
                                            <input class="form-control form-control-sm" id="txtModalidadERPC" name="txtModalidadERPC" type="text" placeholder="Modalidad">
                                        </div>
                                        <div class="form-group col-12 mb-3">
                                            <label for="txtNroPlazaERPC">NUMERO DE PLAZAS</label>
                                            <input class="form-control form-control-sm" id="txtNroPlazaERPC" name="txtNroPlazaERPC" type="text" placeholder="Numero de plazas">
                                        </div>
                                        <input class="form-control form-control-sm" id="txtPues_IdER" name="txtPues_IdER" type="hidden">
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
                <!-- ARCHIVOS -->
                <div class="modal fade" id="ventanaDocumentCal" data-backdrop="static" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-lg" role="document">
                        <div class="modal-content border-primary" style="border-width: 3px">
                            <div class="modal-header">
                                <h6 class="modal-title">ARCHIVOS</h6>
                                <button type="button" class="close" data-dismiss="modal"
                                        aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body pt-1">
                                <input type="hidden" id="nameFormDC" value="FrmDocumentCal">
                                <input type="hidden" id="actionDocumentCal" name="action" value="paginarDocumentCal">
                                <input type="hidden" id="txtCalendarioId" name="txtCalendarioId">
                                <input type="hidden" id="numberPageDocumentCal" name="numberPageDocumentCal" value="1">
                                <div class="row">
                                    <div class="col-12 mt-3">
                                        <div class="table-responsive" id="tablaDocumentCal">
                                            <table
                                                class="table color-bordered-table muted-bordered-table table-hover">
                                                <thead>
                                                    <tr>
                                                        <th style="width: 40%" >NOMBRE</th>
                                                        <th style="width: 15%" >ARCHIVO</th>
                                                        <th style="width: 10%" >ACCIONES</th>
                                                    </tr>
                                                </thead>
                                                <tbody id="tbodyDocumentCal">
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" id="btnAbrirNuevoDocumentCal" class="btn btn-info btn-sm mr-3" data-toggle="tooltip" title="Subir Archivo" style="height: 33px"><i class="fa fa-plus-square" aria-hidden="true"></i></button>
                                <button type="button" class="btn btn-outline-secondary btn-sm" data-dismiss="modal">Cerrar</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal fade" id="modalCargandoDocumentCal" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-hidden="true" style="padding-top: 18%; overflow-y: visible;">
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
                <div class="modal fade" id="ventanaManDocumentCal" data-backdrop="static" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <form id="FrmDocumentCalModal">
                                <div class="modal-header">
                                    <h6 class="modal-title" id="txtTituloModalManDocumentCal"></h6>
                                    <button type="button" class="close" data-dismiss="modal"
                                            aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <div class="row">
                                        <div class="form-group col-12 mb-3">
                                            <label for="txtNombreERDC">NOMBRE</label>
                                            <input class="form-control form-control-sm" id="txtNombreERDC" name="txtNombreERDC" type="text" placeholder="NOMBRE"> 
                                        </div>
                                        <div class="form-group col-12 mb-3">
                                            <label for="">ARCHIVO</label>
                                            <div style="display: inline">
                                                <input id="fileArchivo" name="fileArchivo" type="file" style="display: none">
                                                <div class="input-group">
                                                    <input type="text" class="form-control form-control-sm" name="txtNombreArchivoERDC" id="txtNombreArchivoERDC" disabled="" maxlength="100">
                                                    <button type="button" id="btnSeleccionarArchivo" class="btn btn-info btn-sm">
                                                        <i class="fa fa-folder-open"></i>
                                                    </button>
                                                </div>
                                            </div>
                                            <div class="text-center">
                                                <small>Seleccione Archivo < 1000 KB</small> <input type="hidden" id="txtCv" name="txtCv" value=""> 
                                                <input type="hidden" class="form-control form-control-sm" id="txtNombreFileResultadoActual" name="txtNombreFileResultadoActual" value="">
                                                <input type="hidden" id="txtValidacionArchivo" name="txtValidacionArchivo" value="">
                                                <div id="validarResultado" class="err-validation-file">Seleccione Adjunto!</div>
                                            </div>
                                        </div>
                                        <input id="txtDoco_IdER" name="txtDoco_IdER" type="hidden">
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
        <script src="<%out.print(getServletContext().getContextPath());%>/js_app/gc/convocatoria_pers.js"></script>

    </body>

</html>