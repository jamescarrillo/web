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
                                <div class="card-body p-0">
                                    <ul class="nav nav-tabs" role="tablist">
                                        <li class="nav-item">
                                            <a class="nav-link active show" data-toggle="tab" href="#funcionarios" role="tab" aria-selected="true">
                                                <span>FUNCIONARIOS</span>
                                            </a>
                                        </li>
                                        <li class="nav-item" >
                                            <a class="nav-link" data-toggle="tab" href="#directivos" role="tab" aria-selected="false">
                                                <span>DIRECTIVOS</span>
                                            </a>
                                        </li>
                                    </ul>
                                    <!-- Tab panes -->
                                    <div class="tab-content tabcontent-border">
                                        <input type="hidden" id="nameForm" value="FrmFuncionarios">
                                        <input type="hidden" id="actionFuncionarios" name="action" value="paginarFuncionario">
                                        <input type="hidden" id="actionDirectivos" name="action" value="paginarDirectivo">
                                        <input type="hidden" id="numberPageFuncionarios" name="numberPageFuncionarios" value="1">
                                        <input type="hidden" id="numberPageDirectivos" name="numberPageDirectivos" value="1">
                                        <div class="tab-pane active show" id="funcionarios"role="tabpanel">
                                            <div class="p-10">
                                                <div class="card-body pt-0">
                                                    <form id="FrmFuncionarios">
                                                        <div class="row mt-3">
                                                            <div class="form-group col-lg-8 col-md-6 col-12 mb-3">
                                                                <input type="text" name="txtNombreFuncionario" id="txtNombreFuncionario" class="form-control form-control-sm" placeholder="NOMBRE O APELLIDOS">
                                                            </div>
                                                            <div class="input-group col-lg-4 col-md-6 col-12 mb-3">
                                                                <select id="comboTipoListaFuncionarios" name="comboTipoListaFuncionarios" class="form-control form-control-sm combo-paginar mr-3" idBtnBuscar='btnBuscarFuncionario'>
                                                                    <option value="true">ACTIVOS</option>
                                                                    <option value="false">INACTIVOS</option>
                                                                    <option value="-1">TODOS</option>
                                                                </select>
                                                                <button type="submit" id="btnBuscarFuncionario" class="btn waves-effect waves-light btn-info btn-sm mr-3" data-toggle="tooltip" title="Buscar Funcionario" style="height: 31px"><i class="fas fa-search" aria-hidden="true"></i> BUSCAR</button>
                                                                <button type="button" id="btnAbrirNuevoFuncionario" class="btn waves-effect waves-light btn-info btn-sm" data-toggle="tooltip" title="Registrar Funcionario" style="height: 31px"><i class="fa fa-plus-square" aria-hidden="true"></i></button>
                                                            </div>
                                                        </div>
                                                    </form>
                                                    <div class="row">
                                                        <div class="col-12">
                                                            <div class="table-responsive" id="tablaFuncionarios">
                                                                <table
                                                                    class="table color-bordered-table muted-bordered-table table-hover">
                                                                    <thead>
                                                                        <tr>
                                                                            <th>DNI</th>
                                                                            <th>NOMBRE COMPLETO</th>
                                                                            <th>CARGO</th>
                                                                            <th>TELEFONO</th>
                                                                            <th>CV</th>
                                                                            <th colspan="2">ACCIONES</th>
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody id="tbodyFuncionarios">
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
                                                                            <select id="sizePageFuncionarios" name="sizePageFuncionarios" class="form-control form-control-sm combo-paginar" idBtnBuscar='btnBuscarFuncionario'>
                                                                                <option value="10">10</option>
                                                                                <option value="15">15</option>
                                                                                <option value="20">20</option>
                                                                            </select>
                                                                        </div>
                                                                        <div class="col-md-10 col-sm-9 col-8">
                                                                            <nav aria-label="Page navigation example">
                                                                                <ul id="paginationFuncionarios"
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
                                        <div class="tab-pane p-10" id="directivos" role="tabpanel">
                                            <div class="card-body">
                                                <form id="FrmFuncionarios" class="form-material">
                                                    <div class="input-group mb-3">
                                                        <input type="text" name="txtNombreFuncionario" id="txtNombreFuncionario" class="form-control form-control-sm mr-2" placeholder="NOMBRE">
                                                        <button type="button" id="btnBuscarFuncionario" class="btn waves-effect waves-light btn-info btn-sm mr-2" data-toggle="tooltip" title="Buscar Funcionario">BUSCAR</button>
                                                        <button type="button" id="btnAbrirNuevoFuncionario" class="btn waves-effect waves-light btn-info btn-sm" data-toggle="tooltip" title="Registrar Funcionario">
                                                            <i class="fa fa-plus-square" aria-hidden="true"></i>
                                                        </button>
                                                    </div>
                                                </form>
                                                <div class="row">
                                                    <div class="col-12">
                                                        <div class="table-responsive" id="tablaFuncionarios">
                                                            <table
                                                                class="table color-bordered-table muted-bordered-table table-hover">
                                                                <thead>
                                                                    <tr>
                                                                        <th>DNI</th>
                                                                        <th>NOMBRE COMPLETO</th>
                                                                        <th>CARGO</th>
                                                                        <th>TELEFONO</th>
                                                                        <th>CURRICULUM</th>
                                                                        <th>ACCIONES</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody id="tbodyFuncionarios">
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
                                                                        <select id="comboTamPaginaFuncionarios" name="comboTamPaginaFuncionarios"
                                                                                class="form-control form-control-sm select2-single">
                                                                            <option value="10">10</option>
                                                                            <option value="15">15</option>
                                                                            <option value="20">20</option>
                                                                        </select>
                                                                    </div>
                                                                    <div class="col-md-10 col-sm-9 col-8">
                                                                        <nav aria-label="Page navigation example">
                                                                            <ul id="idPaginacionFuncionarios"
                                                                                class="pagination pagination-sm justify-content-end">

                                                                            </ul>
                                                                            <input type="hidden" name="NumPaginaFuncionarios" id="NumPaginaFuncionarios"
                                                                                   value="1">
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
                            </div>
                        </div>
                    </div>
                    <%@ include file="../../../temas_gc.jsp"%>
                </div>
                <div class="modal fade" id="ventanaManFuncionarios" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-lg" role="document">
                        <div class="modal-content">
                            <form id="FrmFuncionariosModal">
                                <div class="modal-header">
                                    <h6 class="modal-title" id="txtTituloModalManFuncionarios"></h6>
                                    <button type="button" class="close" data-dismiss="modal"
                                            aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body p-0">
                                    <ul class="nav nav-tabs" role="tablist">
                                        <li class="nav-item">
                                            <a class="nav-link active show" id="idItemDL" data-toggle="tab" href="#datosLaborales" role="tab" aria-selected="true"><span><i class="ti-home"></i> DATOS LABORALES</span></a>
                                        </li>
                                        <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#datosAdicionales" role="tab" aria-selected="false"><span><i class="ti-user"></i></span> DATOS ADICIONALES</a></li>
                                    </ul>
                                    <div class="tab-content tabcontent-border">
                                        <div class="tab-pane p-20 active show" id="datosLaborales"
                                             role="tabpanel">
                                            <div class="row">
                                                <div class="form-group col-12 mb-3">
                                                    <label for="txtNombreCompletoER">NOMBRE COMPLETO</label>
                                                    <input class="form-control form-control-sm" id="txtNombreCompletoER" name="txtNombreCompletoER" type="text" placeholder="NOMBRE COMPLETO"> 
                                                </div>
                                                <div class="form-group col-md-6 mb-3">
                                                    <label for="txtDniER">DNI</label>
                                                    <input class="form-control form-control-sm" id="txtDniER" name="txtDniER" type="text" placeholder="DNI"> 
                                                </div>
                                                <div class="form-group col-md-6 mb-3">
                                                    <label for="datePickerFechaDesignacion">FECHA DESIGNACIÓN</label>
                                                    <input type="text" class="form-control form-control-sm" id="datePickerFechaDesignacion" name="datePickerFechaDesignacion" placeholder="DD/MM/AAAA"> 
                                                </div>
                                                <div class="form-group col-12 mb-3">
                                                    <label for="txtDesignadoPorER">DESIGNADO POR</label>
                                                    <input class="form-control form-control-sm" id="txtDesignadoPorER" name="txtDesignadoPorER" type="text" placeholder="DESIGNADO POR">
                                                </div>
                                                <div class="form-group col-12 mb-3">
                                                    <label for="comboOficinaER">OFICINA</label>
                                                    <select id="comboOficinaER" name="comboOficinaER" class="form-control form-control-sm">
                                                        <option value="-1">Seleccione...</option>
                                                        <option value="GERENCIA GENERAL" >GERENCIA GENERAL</option>
                                                        <option value="DIRECCION DE INFRAESTRUCTURA">DIRECCION DE INFRAESTRUCTURA</option>
                                                        <option value="DIRECCION DE MANEJO AMBIENTAL">DIRECCION DE MANEJO AMBIENTAL</option>
                                                        <option value="DIRECCION DE DESARROLLO AGROPECUARIO">DIRECCION DE DESARROLLO AGROPECUARIO</option>
                                                        <option value="ORGANO DE CONTROL INSTITUCIONAL">ORGANO DE CONTROL INSTITUCIONAL</option>
                                                        <option value="OFICINA DE ASESORIA JURIDICA">OFICINA DE ASESORIA JURIDICA</option>
                                                        <option value="OFICINA DE PRESUPUESTO Y PLANIFICACION">OFICINA DE PRESUPUESTO Y PLANIFICACION</option>
                                                        <option value="OFICINA DE ADMINISTRACION">OFICINA DE ADMINISTRACION</option>
                                                        <option value="OTRA OFICINA">OTRA OFICINA</option>
                                                    </select>
                                                </div>
                                                <div class="form-group col-md-6 mb-3">
                                                    <label for="txtCargoER">CARGO</label>
                                                    <input class="form-control form-control-sm" id="txtCargoER" name="txtCargoER" type="text" placeholder="CARGO">
                                                </div>
                                                <div class="form-group col-md-6 col-12 mb-3">
                                                    <label for="txtNivelER">NIVEL</label>
                                                    <input class="form-control form-control-sm" id="txtNivelER" name="txtNivelER" type="text" placeholder="NIVEL">
                                                </div>
                                                <div class="form-group col-md-6 col-12 mb-3">
                                                    <label for="txtRegimenLaboralER">REGIMEN LABORAL</label>
                                                    <input class="form-control form-control-sm" id="txtRegimenLaboralER" name="txtRegimenLaboralER" type="text" placeholder="REGIMEN LABORAL">
                                                </div>
                                                <div class="form-group col-md-6 col-12 mb-3">
                                                    <label for="txtRetribucionMensualER">RETRIBUCIÓN MENSUAL</label>
                                                    <input class="form-control form-control-sm" id="txtRetribucionMensualER" name="txtRetribucionMensualER" type="text" placeholder="RETRIBUCIÓN MENSUAL">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tab-pane p-20" id="datosAdicionales" role="tabpanel">
                                            <div class="row">
                                                <div class="form-group col-lg-8 col-12 mb-3">
                                                    <label for="txtProfesionER">PROFESIÓN</label>
                                                    <input class="form-control form-control-sm" id="txtProfesionER" name="txtProfesionER" type="text" placeholder="PROFESIÓN">
                                                </div>
                                                <div class="form-group col-lg-4 col-sm-6 col-12 mb-3">
                                                    <label for="txtTelefonoER">TELÉFONO</label>
                                                    <input class="form-control form-control-sm" id="txtTelefonoER" name="txtTelefonoER" type="text" placeholder="TELÉFONO">
                                                </div>
                                                <div class="form-group col-lg-4 col-sm-6 col-12 mb-3">
                                                    <label for="txtFaxER">FAX</label>
                                                    <input class="form-control form-control-sm" id="txtFaxER" name="txtFaxER" type="text" placeholder="FAX">
                                                </div>
                                                <div class="form-group col-lg-4 col-sm-6 col-12 mb-3">
                                                    <label for="txtEmailER">EMAIL</label>
                                                    <input class="form-control form-control-sm" id="txtEmailER" name="txtEmailER" type="text" placeholder="EMAIL">
                                                </div>
                                                <div class="form-group col-lg-4 col-sm-6 col-12 mb-3">
                                                    <label for="comboDestacadoER">DESTACADO</label>
                                                    <select id="comboDestacadoER" name="comboDestacadoER" class="form-control form-control-sm">
                                                        <option value="-1">Seleccione...</option>
                                                        <option value="true">SI</option>
                                                        <option value="false">NO</option>
                                                    </select>
                                                </div>
                                                <div class="form-group col-lg-8 col-12 mb-3">
                                                    <label for="">HOJA DE VIDA (PDF)</label>
                                                    <div style="display: inline">
                                                        <input id="fileCV" name="fileCV" type="file" style="display: none">
                                                        <div class="input-group">
                                                            <input type="text" class="form-control form-control-sm" id="txtNombreCv" disabled="" maxlength="100">
                                                            <button type="button" id="btnSeleccionarCv" class="btn btn-info btn-sm">
                                                                <i class="fa fa-folder-open"></i>
                                                            </button>
                                                        </div>
                                                    </div>
                                                    <div class="text-center">
                                                        <small>Seleccione Archivo < 1000 KB</small> <input type="hidden" id="txtCv" name="txtCv" value=""> 
                                                        <input type="hidden" class="form-control form-control-sm" id="txtNombreFileResultadoActual" name="txtNombreFileResultadoActual" value="">
                                                        <input type="hidden" id="txtValidacionCv" name="txtValidacionCv" value="">
                                                        <div id="validarResultado" class="err-validation-file">Seleccione Adjunto!</div>
                                                    </div>
                                                </div>
                                                <div class="form-group col-lg-4 col-12 mb-3">
                                                    <label for="comboEstadoER">ESTADO</label>
                                                    <select id="comboEstadoER" name="comboEstadoER" class="form-control form-control-sm">
                                                        <option value="-1">Seleccione...</option>
                                                        <option value="true">ACTIVO</option>
                                                        <option value="false">INACTIVO</option>
                                                    </select>
                                                </div>
                                                <div class="form-group col-12 mb-3">
                                                    <div class="row justify-content-sm-center">
                                                        <div class="col-sm-4 col-12 text-center">
                                                            <div class="card border-primary borde-redondeado mb-2">
                                                                <div class="card-body p-2">
                                                                    <div class="text-center">
                                                                        <img id="visorFoto" src='<%out.print(getServletContext().getContextPath());%>/peam_resources_app/conf_app/img/default_user.png' alt="user-img" class="rounded mx-auto d-block" style="width: 80px; height: 80px">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <button type="button" id="btnEliminarFoto" class="btn btn-secondary btn-sm">
                                                                <i class="fa fa-trash"></i>
                                                            </button>
                                                            <div style="display: inline">
                                                                <input id="fileFoto" name="fileFoto" type="file" style="display: none">
                                                                <button type="button" id="btnSeleccionarFoto" class="btn btn-info btn-sm">
                                                                    <i class="fa fa-folder-open"></i>
                                                                </button>
                                                                <input type="hidden" id="txtNombreFoto" name="txtNombreFoto" value="">
                                                                <input type="hidden" id="txtValidacionFoto" name="txtValidacionFoto" value="">
                                                            </div>
                                                            <br><small>Seleccione Foto < 1000 KB</small>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <input type="hidden" id="txtIdFuncionarioER" name="txtIdFuncionarioER" value="">
                                    <input type="hidden" id="txtFechaInicioER" name="txtFechaInicioER" value="">
                                    <input type="hidden" id="txtTratamientoER" name="txtTratamientoER" value="">
                                    <input type="hidden" id="txtResumenER" name="txtResumenER" value="">
                                    <div class="clearfix"></div>
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
                <div class="modal fade" id="modalCargandoFuncionarios" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-hidden="true" style="padding-top: 18%; overflow-y: visible;">
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
                <div class="modal fade" id="modalCargandoDirectivos" data-backdrop="static"
                     data-keyboard="false" tabindex="-1" role="dialog" aria-hidden="true"
                     style="padding-top: 18%; overflow-y: visible;">
                    <div class="modal-dialog modal-sm">
                        <div class="modal-content">
                            <div class="modal-body">
                                <div class="progress" style="margin-bottom: 0px;">
                                    <div
                                        class="progress-bar progress-bar-striped progress-bar-animated"
                                        role="progressbar" aria-valuenow="100" aria-valuemin="0"
                                        aria-valuemax="100" style="width: 100%">Cargando...</div>
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
        <script src="<%out.print(getServletContext().getContextPath());%>/js_app/gc/directivos.js"></script>

    </body>

</html>