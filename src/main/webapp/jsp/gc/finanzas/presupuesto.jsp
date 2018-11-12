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
                                    <strong class="text-info">PRESUPUESTOS Y FINANZAS</strong>
                                </div>
                                <div class="card-body pt-1">
                                    <div class="modal-body p-0">
                                        <ul class="nav nav-tabs" role="tablist">
                                            <li class="nav-item">
                                                <a class="nav-link active show" data-toggle="tab" href="#tipo1" role="tab" aria-selected="true"><span> DE APERTURA (PIA) </span></a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" data-toggle="tab" href="#tipo2" role="tab" aria-selected="false"><span> MODIFICADO (PIM) </span></a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" data-toggle="tab" href="#Finanzatipo1" role="tab" aria-selected="false"><span> EJECUCION PRESUPUESTAL </span></a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" data-toggle="tab" href="#Finanzatipo2" role="tab" aria-selected="false"><span> ESTADO DE SITUACION FINANCIERA </span></a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" data-toggle="tab" href="#Finanzatipo3" role="tab" aria-selected="false"><span> EVALUACION DE INGRESO </span></a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" data-toggle="tab" href="#Finanzatipo4" role="tab" aria-selected="false"><span> RESUMEN DE GASTOS </span></a>
                                            </li>
                                        </ul>
                                        <div class="tab-content tabcontent-border">
                                            <div class="tab-pane p-20 active show" id="tipo1" role="tabpanel">
                                                <input type="hidden" id="nameForm1" value="FrmPresupuesto1">
                                                <input type="hidden" id="actionPresupuesto1" name="action" value="paginarPresupuesto">
                                                <input type="hidden" id="numberPagePresupuesto1" name="numberPagePresupuesto" value="1">
                                                <form id="FrmPresupuesto1">
                                                    <div class="row mt-3">
                                                        <div class="form-group col-lg-6 col-12 mb-3">
                                                            <input type="text" name="txtTituloPresupuesto" id="txtTituloPresupuesto" class="form-control form-control-sm" placeholder="DESCRIPCION">
                                                        </div>
                                                        <div class="form-group col-lg-2 col-md-6 col-12 mb-3">
                                                            <select id="comboAnioPresupuesto1" name="comboAnioPresupuesto1" class="form-control form-control-sm combo-paginar mr-3" idBtnBuscar='btnBuscarPresupuesto1'>

                                                            </select>
                                                        </div>
                                                        <div class="input-group col-lg-4 col-md-6 col-12 mb-3">
                                                            <select id="comboTipoListaPresupuesto" name="comboTipoListaPresupuesto" class="form-control form-control-sm combo-paginar mr-3" idBtnBuscar='btnBuscarPresupuesto1'>
                                                                <option value="-1">TODOS</option>
                                                                <option value="true">PUBLICOS</option>
                                                                <option value="false">NO PUBLICOS</option>
                                                            </select>
                                                            <button type="submit" id="btnBuscarPresupuesto1" class="btn waves-effect waves-light btn-info btn-sm mr-3" data-toggle="tooltip" title="Buscar Presupuesto" style="height: 31px"><i class="fas fa-search" aria-hidden="true"></i> BUSCAR</button>
                                                            <button type="button" id="btnAbrirNuevoPresupuesto1" class="btn waves-effect waves-light btn-info btn-sm" data-toggle="tooltip" title="Agregar Presupuesto" style="height: 31px"><i class="fa fa-plus-square" aria-hidden="true"></i></button>
                                                        </div>
                                                    </div>
                                                </form>
                                                <div class="row">
                                                    <div class="col-12">
                                                        <div class="table-responsive" id="tabla1">
                                                            <table
                                                                class="table color-bordered-table muted-bordered-table table-hover">
                                                                <thead>
                                                                    <tr>
                                                                        <th style="width: 10%" class="text-medium-table">FECHA</th>
                                                                        <th style="width: 45%" class="text-medium-table">DESCRIPCION</th>
                                                                        <th style="width: 25%" class="text-medium-table">APROBADO POR</th>
                                                                        <th colspan="4" class="text-medium-table">ACCIONES</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody id="tbodyPresupuesto1">
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
                                                                        <select id="sizePagePresupuesto1" name="sizePagePresupuesto" class="form-control form-control-sm combo-paginar" idBtnBuscar='btnBuscarPresupuesto1'>
                                                                            <option value="10">10</option>
                                                                            <option value="15">15</option>
                                                                            <option value="20">20</option>
                                                                        </select>
                                                                    </div>
                                                                    <div class="col-md-10 col-sm-9 col-8">
                                                                        <nav aria-label="Page navigation example">
                                                                            <ul id="paginationPresupuesto1"
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
                                            <div class="tab-pane p-20" id="tipo2" role="tabpanel">
                                                <input type="hidden" id="nameForm2" value="FrmPresupuesto2">
                                                <input type="hidden" id="actionPresupuesto2" name="action" value="paginarPresupuesto">
                                                <input type="hidden" id="numberPagePresupuesto2" name="numberPagePresupuesto" value="1">
                                                <form id="FrmPresupuesto2">
                                                    <div class="row mt-3">
                                                        <div class="form-group col-lg-6 col-12 mb-3">
                                                            <input type="text" name="txtTituloPresupuesto" id="txtTituloPresupuesto" class="form-control form-control-sm" placeholder="DESCRIPCION">
                                                        </div>
                                                        <div class="form-group col-lg-2 col-md-6 col-12 mb-3">
                                                            <select id="comboAnioPresupuesto2" name="comboAnioPresupuesto2" class="form-control form-control-sm combo-paginar mr-3" idBtnBuscar='btnBuscarPresupuesto2'>

                                                            </select>
                                                        </div>
                                                        <div class="input-group col-lg-4 col-md-6 col-12 mb-3">
                                                            <select id="comboTipoListaPresupuesto" name="comboTipoListaPresupuesto" class="form-control form-control-sm combo-paginar mr-3" idBtnBuscar='btnBuscarPresupuesto2'>
                                                                <option value="-1">TODOS</option>
                                                                <option value="true">PUBLICOS</option>
                                                                <option value="false">NO PUBLICOS</option>
                                                            </select>
                                                            <button type="submit" id="btnBuscarPresupuesto2" class="btn waves-effect waves-light btn-info btn-sm mr-3" data-toggle="tooltip" title="Buscar Presupuesto" style="height: 31px"><i class="fas fa-search" aria-hidden="true"></i> BUSCAR</button>
                                                            <button type="button" id="btnAbrirNuevoPresupuesto2" class="btn waves-effect waves-light btn-info btn-sm" data-toggle="tooltip" title="Agregar Presupuesto" style="height: 31px"><i class="fa fa-plus-square" aria-hidden="true"></i></button>
                                                        </div>
                                                    </div>
                                                </form>
                                                <div class="row">
                                                    <div class="col-12">
                                                        <div class="table-responsive" id="tabla2">
                                                            <table
                                                                class="table color-bordered-table muted-bordered-table table-hover">
                                                                <thead>
                                                                    <tr>
                                                                        <th style="width: 10%" class="text-medium-table">FECHA</th>
                                                                        <th style="width: 45%" class="text-medium-table">DESCRIPCION</th>
                                                                        <th style="width: 25%" class="text-medium-table">APROBADO POR</th>
                                                                        <th colspan="4" class="text-medium-table">ACCIONES</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody id="tbodyPresupuesto2">
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
                                                                        <select id="sizePagePresupuesto2" name="sizePagePresupuesto" class="form-control form-control-sm combo-paginar" idBtnBuscar='btnBuscarPresupuesto2'>
                                                                            <option value="10">10</option>
                                                                            <option value="15">15</option>
                                                                            <option value="20">20</option>
                                                                        </select>
                                                                    </div>
                                                                    <div class="col-md-10 col-sm-9 col-8">
                                                                        <nav aria-label="Page navigation example">
                                                                            <ul id="paginationPresupuesto2"
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
                                            <div class="tab-pane p-20" id="Finanzatipo1" role="tabpanel">
                                                <input type="hidden" id="nameFormFinanza1" value="FrmFinanza1">
                                                <input type="hidden" id="actionFinanza1" name="action" value="paginarFinanza">
                                                <input type="hidden" id="numberPageFinanza1" name="numberPageFinanza" value="1">
                                                <form id="FrmFinanza1">
                                                    <div class="row mt-3">
                                                        <div class="form-group col-lg-6 col-12 mb-3">
                                                            <input type="text" name="txtDescripcionFinanza" id="txtDescripcionFinanza" class="form-control form-control-sm" placeholder="">
                                                        </div>
                                                        <div class="form-group col-lg-2 col-md-6 col-12 mb-3">
                                                            <select id="comboAnioFinanza1" name="comboAnioFinanza1" class="form-control form-control-sm combo-paginar mr-3" idBtnBuscar='btnBuscarFinanza1'>

                                                            </select>
                                                        </div>
                                                        <div class="input-group col-lg-4 col-md-6 col-12 mb-3">
                                                            <select id="comboTipoListaFinanza" name="comboTipoListaFinanza" class="form-control form-control-sm combo-paginar mr-3" idBtnBuscar='btnBuscarFinanza1'>
                                                                <option value="-1">TODOS</option>
                                                                <option value="true">ACTIVOS</option>
                                                                <option value="false">INACTIVOS</option>
                                                            </select>
                                                            <button type="submit" id="btnBuscarFinanza1" class="btn waves-effect waves-light btn-info btn-sm mr-3" data-toggle="tooltip" title="Buscar Documento" style="height: 31px"><i class="fas fa-search" aria-hidden="true"></i> BUSCAR</button>
                                                            <button type="button" id="btnAbrirNuevoFinanza1" class="btn waves-effect waves-light btn-info btn-sm" data-toggle="tooltip" title="Agregar Documento" style="height: 31px"><i class="fa fa-plus-square" aria-hidden="true"></i></button>
                                                        </div>
                                                    </div>
                                                </form>
                                                <div class="row">
                                                    <div class="col-12">
                                                        <div class="table-responsive">
                                                            <table class="table color-bordered-table muted-bordered-table table-hover" id="tablaFinanza1">
                                                                <thead>
                                                                    <tr>
                                                                        <th style="width: 10%" class="text-medium-table">FECHA</th>
                                                                        <th style="width: 75%" class="text-medium-table">RESUMEN</th>
                                                                        <th colspan="4" class="text-medium-table">ACCIONES</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody id="tbodyFinanza1">
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
                                                                        <select id="sizePageFinanza1" name="sizePageFinanza" class="form-control form-control-sm combo-paginar" idBtnBuscar='btnBuscarFinanza1'>
                                                                            <option value="10">10</option>
                                                                            <option value="15">15</option>
                                                                            <option value="20">20</option>
                                                                        </select>
                                                                    </div>
                                                                    <div class="col-md-10 col-sm-9 col-8">
                                                                        <nav aria-label="Page navigation example">
                                                                            <ul id="paginationFinanza1"
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
                                            <div class="tab-pane p-20" id="Finanzatipo2" role="tabpanel">
                                                <input type="hidden" id="nameFormFinanza2" value="FrmFinanza2">
                                                <input type="hidden" id="actionFinanza2" name="action" value="paginarFinanza">
                                                <input type="hidden" id="numberPageFinanza2" name="numberPageFinanza" value="1">
                                                <form id="FrmFinanza2">
                                                    <div class="row mt-3">
                                                        <div class="form-group col-lg-6 col-12 mb-3">
                                                            <input type="text" name="txtDescripcionFinanza" id="txtDescripcionFinanza" class="form-control form-control-sm" placeholder="">
                                                        </div>
                                                        <div class="form-group col-lg-2 col-md-6 col-12 mb-3">
                                                            <select id="comboAnioFinanza2" name="comboAnioFinanza2" class="form-control form-control-sm combo-paginar mr-3" idBtnBuscar='btnBuscarFinanza2'>

                                                            </select>
                                                        </div>
                                                        <div class="input-group col-lg-4 col-md-6 col-12 mb-3">
                                                            <select id="comboTipoListaFinanza" name="comboTipoListaFinanza" class="form-control form-control-sm combo-paginar mr-3" idBtnBuscar='btnBuscarFinanza2'>
                                                                <option value="-1">TODOS</option>
                                                                <option value="true">ACTIVOS</option>
                                                                <option value="false">INACTIVOS</option>
                                                            </select>
                                                            <button type="submit" id="btnBuscarFinanza2" class="btn waves-effect waves-light btn-info btn-sm mr-3" data-toggle="tooltip" title="Buscar Documento" style="height: 31px"><i class="fas fa-search" aria-hidden="true"></i> BUSCAR</button>
                                                            <button type="button" id="btnAbrirNuevoFinanza2" class="btn waves-effect waves-light btn-info btn-sm" data-toggle="tooltip" title="Agregar Documento" style="height: 31px"><i class="fa fa-plus-square" aria-hidden="true"></i></button>
                                                        </div>
                                                    </div>
                                                </form>
                                                <div class="row">
                                                    <div class="col-12">
                                                        <div class="table-responsive">
                                                            <table class="table color-bordered-table muted-bordered-table table-hover" id="tablaFinanza2">
                                                                <thead>
                                                                    <tr>
                                                                        <th style="width: 10%" class="text-medium-table">FECHA</th>
                                                                        <th style="width: 75%" class="text-medium-table">RESUMEN</th>
                                                                        <th colspan="4" class="text-medium-table">ACCIONES</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody id="tbodyFinanza2">
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
                                                                        <select id="sizePageFinanza2" name="sizePageFinanza" class="form-control form-control-sm combo-paginar" idBtnBuscar='btnBuscarFinanza2'>
                                                                            <option value="10">10</option>
                                                                            <option value="15">15</option>
                                                                            <option value="20">20</option>
                                                                        </select>
                                                                    </div>
                                                                    <div class="col-md-10 col-sm-9 col-8">
                                                                        <nav aria-label="Page navigation example">
                                                                            <ul id="paginationFinanza2"
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
                                            <div class="tab-pane p-20" id="Finanzatipo3" role="tabpanel">
                                                <input type="hidden" id="nameFormFinanza3" value="FrmFinanza3">
                                                <input type="hidden" id="actionFinanza3" name="action" value="paginarFinanza">
                                                <input type="hidden" id="numberPageFinanza3" name="numberPageFinanza" value="1">
                                                <form id="FrmFinanza3">
                                                    <div class="row mt-3">
                                                        <div class="form-group col-lg-6 col-12 mb-3">
                                                            <input type="text" name="txtDescripcionFinanza" id="txtDescripcionFinanza" class="form-control form-control-sm" placeholder="">
                                                        </div>
                                                        <div class="form-group col-lg-2 col-md-6 col-12 mb-3">
                                                            <select id="comboAnioFinanza3" name="comboAnioFinanza3" class="form-control form-control-sm combo-paginar mr-3" idBtnBuscar='btnBuscarFinanza3'>

                                                            </select>
                                                        </div>
                                                        <div class="input-group col-lg-4 col-md-6 col-12 mb-3">
                                                            <select id="comboTipoListaFinanza" name="comboTipoListaFinanza" class="form-control form-control-sm combo-paginar mr-3" idBtnBuscar='btnBuscarFinanza3'>
                                                                <option value="-1">TODOS</option>
                                                                <option value="true">ACTIVOS</option>
                                                                <option value="false">INACTIVOS</option>
                                                            </select>
                                                            <button type="submit" id="btnBuscarFinanza3" class="btn waves-effect waves-light btn-info btn-sm mr-3" data-toggle="tooltip" title="Buscar Documento" style="height: 31px"><i class="fas fa-search" aria-hidden="true"></i> BUSCAR</button>
                                                            <button type="button" id="btnAbrirNuevoFinanza3" class="btn waves-effect waves-light btn-info btn-sm" data-toggle="tooltip" title="Agregar Documento" style="height: 31px"><i class="fa fa-plus-square" aria-hidden="true"></i></button>
                                                        </div>
                                                    </div>
                                                </form>
                                                <div class="row">
                                                    <div class="col-12">
                                                        <div class="table-responsive">
                                                            <table class="table color-bordered-table muted-bordered-table table-hover" id="tablaFinanza3">
                                                                <thead>
                                                                    <tr>
                                                                        <th style="width: 10%" class="text-medium-table">FECHA</th>
                                                                        <th style="width: 75%" class="text-medium-table">RESUMEN</th>
                                                                        <th colspan="4" class="text-medium-table">ACCIONES</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody id="tbodyFinanza3">
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
                                                                        <select id="sizePageFinanza3" name="sizePageFinanza" class="form-control form-control-sm combo-paginar" idBtnBuscar='btnBuscarFinanza3'>
                                                                            <option value="10">10</option>
                                                                            <option value="15">15</option>
                                                                            <option value="20">20</option>
                                                                        </select>
                                                                    </div>
                                                                    <div class="col-md-10 col-sm-9 col-8">
                                                                        <nav aria-label="Page navigation example">
                                                                            <ul id="paginationFinanza3"
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
                                            <div class="tab-pane p-20" id="Finanzatipo4" role="tabpanel">
                                                <input type="hidden" id="nameFormFinanza4" value="FrmFinanza4">
                                                <input type="hidden" id="actionFinanza4" name="action" value="paginarFinanza">
                                                <input type="hidden" id="numberPageFinanza4" name="numberPageFinanza" value="1">
                                                <form id="FrmFinanza4">
                                                    <div class="row mt-3">
                                                        <div class="form-group col-lg-6 col-12 mb-3">
                                                            <input type="text" name="txtDescripcionFinanza" id="txtDescripcionFinanza" class="form-control form-control-sm" placeholder="">
                                                        </div>
                                                        <div class="form-group col-lg-2 col-md-6 col-12 mb-3">
                                                            <select id="comboAnioFinanza4" name="comboAnioFinanza4" class="form-control form-control-sm combo-paginar mr-3" idBtnBuscar='btnBuscarFinanza4'>

                                                            </select>
                                                        </div>
                                                        <div class="input-group col-lg-4 col-md-6 col-12 mb-3">
                                                            <select id="comboTipoListaFinanza" name="comboTipoListaFinanza" class="form-control form-control-sm combo-paginar mr-3" idBtnBuscar='btnBuscarFinanza4'>
                                                                <option value="-1">TODOS</option>
                                                                <option value="true">ACTIVOS</option>
                                                                <option value="false">INACTIVOS</option>
                                                            </select>
                                                            <button type="submit" id="btnBuscarFinanza4" class="btn waves-effect waves-light btn-info btn-sm mr-3" data-toggle="tooltip" title="Buscar Documento" style="height: 31px"><i class="fas fa-search" aria-hidden="true"></i> BUSCAR</button>
                                                            <button type="button" id="btnAbrirNuevoFinanza4" class="btn waves-effect waves-light btn-info btn-sm" data-toggle="tooltip" title="Agregar Documento" style="height: 31px"><i class="fa fa-plus-square" aria-hidden="true"></i></button>
                                                        </div>
                                                    </div>
                                                </form>
                                                <div class="row">
                                                    <div class="col-12">
                                                        <div class="table-responsive">
                                                            <table class="table color-bordered-table muted-bordered-table table-hover" id="tablaFinanza4">
                                                                <thead>
                                                                    <tr>
                                                                        <th style="width: 10%" class="text-medium-table">FECHA</th>
                                                                        <th style="width: 75%" class="text-medium-table">RESUMEN</th>
                                                                        <th colspan="4" class="text-medium-table">ACCIONES</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody id="tbodyFinanza4">
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
                                                                        <select id="sizePageFinanza4" name="sizePageFinanza" class="form-control form-control-sm combo-paginar" idBtnBuscar='btnBuscarFinanza4'>
                                                                            <option value="10">10</option>
                                                                            <option value="15">15</option>
                                                                            <option value="20">20</option>
                                                                        </select>
                                                                    </div>
                                                                    <div class="col-md-10 col-sm-9 col-8">
                                                                        <nav aria-label="Page navigation example">
                                                                            <ul id="paginationFinanza4"
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
                            </div>
                        </div>
                    </div>
                    <%@ include file="../../../temas_gc.jsp"%>
                </div>
            </div>
            <div class="modal fade" id="ventanaManPresupuesto" data-backdrop="static" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg modal-dialog-scroll" role="document">
                    <div class="modal-content">
                        <form id="FrmPresupuestoModal">
                            <div class="modal-header">
                                <h6 class="modal-title" id="txtTituloModalManPresupuesto"></h6>
                                <button type="button" class="close" data-dismiss="modal"
                                        aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body modal-body-scroll">
                                <div class="row">
                                    <div class="form-group text-left col-9 mb-3">
                                        <label for="txtDocuIdER">ASIGNAR REGISTRO (ARDIG)</label>
                                        <input type="hidden" class="form-control form-control-sm" id="txtDocuIdER" name="txtDocuIdER" placeholder="Documento"> 
                                    </div>
                                    <div class="form-group text-right col-3 mb-3">
                                        <button type="button" id="btnAbrirVerArcdig" class="btn waves-effect waves-light btn-info btn-sm"><i class="fa fa-floppy-o"></i> BUSCAR DOCUMENTO</button>
                                    </div>
                                    <div class="form-group col-12 mb-3">
                                        <label for="txtFechaAprobacionER">FECHA</label>
                                        <input type="text" class="form-control form-control-sm " id="txtFechaAprobacionER" name"="txtFechaAprobacionER" placeholder="DD/MM/AAAA"> 
                                    </div>
                                    <div class="form-group col-12 mb-3">
                                        <label for="txtDescripcionER">DESCRIPCION</label>
                                        <textarea class="form-control form-control-sm" id="txtDescripcionER" name="txtDescripcionER" rows="5" placeholder="Descripcion" maxlength="200"></textarea>
                                    </div>

                                    <div class="form-group col-12 mb-3">
                                        <label for="txtResolucionAprobacionER">APROBADO POR</label>
                                        <input class="form-control form-control-sm" id="txtResolucionAprobacionER" name="txtResolucionAprobacionER" type="text" placeholder="Aprobado por">
                                    </div>
                                    <div class="form-group col-12 mb-3">
                                        <label for="txtEstadoER">ESTADO DEL PRESUPUESTO</label>
                                        <select id="txtEstadoER" name="txtEstadoER" class="form-control form-control-sm">
                                            <option value="-1">Seleccione...</option>
                                            <option value="true">PUBLICO</option>
                                            <option value="false">OCULTO</option>
                                        </select>
                                    </div>

                                    <input id="txtIdPresupuestoER" name="txtIdPresupuestoER" type="hidden" value="">
                                    <input id="txtTipoER" name="txtTipoER" type="hidden" value="">
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
            <div class="modal fade" id="ventanaManFinanza" data-backdrop="static" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg modal-dialog-scroll" role="document">
                    <div class="modal-content">
                        <form id="FrmFinanzaModal">
                            <div class="modal-header">
                                <h6 class="modal-title" id="txtTituloModalManFinanza"></h6>
                                <button type="button" class="close" data-dismiss="modal"
                                        aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body modal-body-scroll">
                                <div class="row">
                                    <div class="form-group text-left col-9 mb-3">
                                        <label for="txtDocu_idFinanzaER">ASIGNAR REGISTRO (ARDIG)</label>
                                        <input type="hidden" class="form-control form-control-sm" id="txtDocu_idFinanzaER" name="txtDocu_idFinanzaER" placeholder="Documento"> 
                                    </div>
                                    <div class="form-group text-right col-3 mb-3">
                                        <button type="button" id="btnAbrirVerArcdigFinanza" class="btn waves-effect waves-light btn-info btn-sm"><i class="fa fa-floppy-o"></i> BUSCAR DOCUMENTO</button>
                                    </div>
                                    <div class="form-group col-12 mb-3">
                                        <label for="txtFechaFinanzaER">FECHA</label>
                                        <input type="text" class="form-control form-control-sm " id="txtFechaFinanzaER" name=txtFechaFinanzaER" placeholder="DD/MM/AAAA"> 
                                    </div>
                                    <div class="form-group col-12 mb-3">
                                        <label for="txtDescripcionFinanzaER">DESCRIPCION</label>
                                        <textarea class="form-control form-control-sm" id="txtDescripcionFinanzaER" name="txtDescripcionFinanzaER" rows="5" placeholder="Descripcion" maxlength="200"></textarea>
                                    </div>
                                    <div class="form-group col-12 mb-3">
                                        <label for="txtEstadoFinanzaER">ESTADO DEL PRESUPUESTO</label>
                                        <select id="txtEstadoFinanzaER" name="txtEstadoFinanzaER" class="form-control form-control-sm">
                                            <option value="-1">Seleccione...</option>
                                            <option value="true">PUBLICO</option>
                                            <option value="false">OCULTO</option>
                                        </select>
                                    </div>

                                    <input id="txtIdFinanzaER" name="txtIdFinanzaER" type="hidden" value="">
                                    <input id="txtTipoFinanzaER" name="txtTipoFinanzaER" type="hidden" value="">
                                    <input type="hidden" id="txtAnhoFinanzaER" name="txtAnhoFinanzaER">
                                    <input type="hidden" id="txtMesFinanzaER" name="txtMesFinanzaER">
                                    <input type="hidden" id="txtTituloFinanzaER" name="txtTituloFinanzaER">
                                    <input type="hidden" id="txtDocumentoFinanzaER" name="txtDocumentoFinanzaER">
                                    <input type="hidden" id="txtUbicacionFinanzaER" name="txtUbicacionFinanzaER">
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
                
            <%@ include file="../finanzas/presupuesto_arcdig.jsp"%>

            <div class="modal fade" id="modalCargandoPresupuesto1" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-hidden="true" style="padding-top: 18%; overflow-y: visible;">
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
            <div class="modal fade" id="modalCargandoPresupuesto2" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-hidden="true" style="padding-top: 18%; overflow-y: visible;">
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
            <div class="modal fade" id="modalCargandoFinanza1" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-hidden="true" style="padding-top: 18%; overflow-y: visible;">
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
            <div class="modal fade" id="modalCargandoFinanza2" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-hidden="true" style="padding-top: 18%; overflow-y: visible;">
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
            <div class="modal fade" id="modalCargandoFinanza3" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-hidden="true" style="padding-top: 18%; overflow-y: visible;">
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
            <div class="modal fade" id="modalCargandoFinanza4" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-hidden="true" style="padding-top: 18%; overflow-y: visible;">
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
    <script src="<%out.print(getServletContext().getContextPath());%>/js_app/gc/presupuesto.js"></script>
    <script src="<%out.print(getServletContext().getContextPath());%>/js_app/gc/presupusto_arcdig.js"></script>

</body>
</html>
