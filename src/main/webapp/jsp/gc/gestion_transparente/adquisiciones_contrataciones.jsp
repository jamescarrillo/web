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
                                    <strong class="text-info">ADQUISICIONES Y CONTRATACIONES</strong>
                                </div>
                                <div class="card-body" style="padding: 0px">
                                    <div class="modal-body p-0">
                                        <ul class="nav nav-tabs" role="tablist">
                                            <li class="nav-item">
                                                <a class="nav-link active show" data-toggle="tab" href="#tab-compra-de-bienes" role="tab" aria-selected="true"><span> COMPRA DE BIENES</span></a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" data-toggle="tab" href="#tab-compra-de-servicios" role="tab" aria-selected="false"><span> COMPRA DE SERVICIOS</span></a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" data-toggle="tab" href="#tab-gastos-en-publicidad" role="tab" aria-selected="false"><span> GASTOS EN PUBLICIDAD</span></a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" data-toggle="tab" href="#tab-compras-en-telefonias" role="tab" aria-selected="false"><span> COMPRAS EN TELEFONÍAS</span></a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" data-toggle="tab" href="#tab-uso-de-vehiculos" role="tab" aria-selected="false"><span> USO DE VEHÍCULOS</span></a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" data-toggle="tab" href="#tab-principales-proveedores" role="tab" aria-selected="false"><span> PRINCIPALES PROVEEDORES</span></a>
                                            </li>
                                        </ul>
                                        <div class="tab-content tabcontent-border">
                                            <div class="tab-pane p-20 active show" id="tab-compra-de-bienes" role="tabpanel">
                                                <input type="hidden" id="nameFormOrdenCompra" value="FrmOrdenCompra">
                                                <input type="hidden" id="actionOrdenCompra" name="action" value="paginarOrdenCompra">
                                                <input type="hidden" id="numberPageOrdenCompra" name="numberPageOrdenCompra" value="1">
                                                <form id="FrmOrdenCompra">
                                                    <div class="row mt-3">
                                                        <div class="form-group col-lg-8 col-12 mb-3">
                                                            <input type="text" name="txtProveedorOrdenCompra" id="txtProveedorOrdenCompra" class="form-control form-control-sm" placeholder="PROVEEDOR">
                                                        </div>
                                                        <div class="input-group col-lg-4 col-12 mb-3">
                                                            <select id="comboAnioOrdenCompra" name="comboAnioOrdenCompra" class="form-control form-control-sm combo-paginar mr-3" idBtnBuscar='btnBuscarOrdenCompra'>

                                                            </select>
                                                            <button type="submit" id="btnBuscarOrdenCompra" class="btn waves-effect waves-light btn-info btn-sm mr-3" data-toggle="tooltip" title="Buscar Orden de Compra" style="height: 31px"><i class="fas fa-search" aria-hidden="true"></i> BUSCAR</button>
                                                            <button type="button" class="btn waves-effect waves-light btn-info btn-sm btn-abrir-modal" idmodal="ventanaManOrdenCompra" idaccion="actionOrdenCompra" value_accion="addOrdenCompra" data-toggle="tooltip" title="Agregar Orden de Compra" style="height: 31px"><i class="fa fa-plus-square" aria-hidden="true"></i></button>
                                                        </div>
                                                    </div>
                                                </form>
                                                <div class="row">
                                                    <div class="col-12">
                                                        <div class="table-responsive">
                                                            <table class="table color-bordered-table muted-bordered-table table-hover">
                                                                <thead>
                                                                    <tr>
                                                                        <th style="width: 10%" class="text-medium-table">N°</th>
                                                                        <th style="width: 10%" class="text-medium-table">Fecha</th>
                                                                        <th style="width: 35%" class="text-medium-table">Fuente Financiamiento</th>
                                                                        <th style="width: 35%" class="text-medium-table">Proveedor</th>
                                                                        <th style="width: 10%" class="text-medium-table">Finan.</th>
                                                                        <th style="width: 10%" class="text-medium-table">Monto</th>
                                                                        <th style="width: 10%" class="text-medium-table">N°SIAF</th>
                                                                        <th style="width: 5%" class="text-medium-table"></th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody id="tbodyOrdenCompra">
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-12">
                                                        <div class="card" style="height: 50px; margin-bottom: 0px">
                                                            <div class="card-body"
                                                                 style="padding-top: 10px; padding-bottom: 10px">
                                                                <div class="row">
                                                                    <div class="col-md-2 col-sm-3 col-4">
                                                                        <select id="sizePageOrdenCompra" name="sizePageOrdenCompra" class="form-control form-control-sm combo-paginar" idBtnBuscar='btnBuscarOrdenCompra'>
                                                                            <option value="10">10</option>
                                                                            <option value="15">15</option>
                                                                            <option value="20">20</option>
                                                                        </select>
                                                                    </div>
                                                                    <div class="col-md-10 col-sm-9 col-8">
                                                                        <nav aria-label="Page navigation example">
                                                                            <ul id="paginationOrdenCompra"
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
                                            <div class="tab-pane p-20" id="tab-compra-de-servicios" role="tabpanel">
                                                <input type="hidden" id="nameFormOrdenServicio" value="FrmOrdenServicio">
                                                <input type="hidden" id="actionOrdenServicio" name="action" value="paginarOrdenServicio">
                                                <input type="hidden" id="numberPageOrdenServicio" name="numberPageOrdenServicio" value="1">
                                                <form id="FrmOrdenServicio">
                                                    <div class="row mt-3">
                                                        <div class="form-group col-lg-8 col-12 mb-3">
                                                            <input type="text" name="txtProveedorOrdenServicio" id="txtProveedorOrdenServicio" class="form-control form-control-sm" placeholder="PROVEEDOR">
                                                        </div>
                                                        <div class="input-group col-lg-4 col-12 mb-3">
                                                            <select id="comboAnioOrdenServicio" name="comboAnioOrdenServicio" class="form-control form-control-sm combo-paginar mr-3" idBtnBuscar='btnBuscarOrdenServicio'>

                                                            </select>
                                                            <button type="submit" id="btnBuscarOrdenServicio" class="btn waves-effect waves-light btn-info btn-sm mr-3" data-toggle="tooltip" title="Buscar Orden de Servicio" style="height: 31px"><i class="fas fa-search" aria-hidden="true"></i> BUSCAR</button>
                                                            <button type="button" class="btn waves-effect waves-light btn-info btn-sm btn-abrir-modal" idmodal="ventanaManOrdenServicio" idaccion="actionOrdenServicio" value_accion="addOrdenServicio" data-toggle="tooltip" title="Agregar Orden de Servicio" style="height: 31px"><i class="fa fa-plus-square" aria-hidden="true"></i></button>
                                                        </div>
                                                    </div>
                                                </form>
                                                <div class="row">
                                                    <div class="col-12">
                                                        <div class="table-responsive">
                                                            <table
                                                                class="table color-bordered-table muted-bordered-table table-hover">
                                                                <thead>
                                                                    <tr>
                                                                        <th style="width: 10%" class="text-medium-table">N°</th>
                                                                        <th style="width: 10%" class="text-medium-table">Fecha</th>
                                                                        <th style="width: 35%" class="text-medium-table">Fuente Financiamiento</th>
                                                                        <th style="width: 35%" class="text-medium-table">Proveedor</th>
                                                                        <th style="width: 10%" class="text-medium-table">Finan.</th>
                                                                        <th style="width: 10%" class="text-medium-table">Monto</th>
                                                                        <th style="width: 10%" class="text-medium-table">N°Siaf</th>
                                                                        <th style="width: 5%" class="text-medium-table"></th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody id="tbodyOrdenServicio">
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-12">
                                                        <div class="card" style="height: 50px; margin-bottom: 0px">
                                                            <div class="card-body"
                                                                 style="padding-top: 10px; padding-bottom: 10px">
                                                                <div class="row">
                                                                    <div class="col-md-2 col-sm-3 col-4">
                                                                        <select id="sizePageOrdenServicio" name="sizePageOrdenServicio" class="form-control form-control-sm combo-paginar" idBtnBuscar='btnBuscarOrdenServicio'>
                                                                            <option value="10">10</option>
                                                                            <option value="15">15</option>
                                                                            <option value="20">20</option>
                                                                        </select>
                                                                    </div>
                                                                    <div class="col-md-10 col-sm-9 col-8">
                                                                        <nav aria-label="Page navigation example">
                                                                            <ul id="paginationOrdenServicio" class="pagination pagination-sm justify-content-end">

                                                                            </ul>
                                                                        </nav>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="tab-pane p-20" id="tab-gastos-en-publicidad" role="tabpanel">
                                                <input type="hidden" id="nameFormPublicidad" value="FrmPublicidad">
                                                <input type="hidden" id="actionPublicidad" name="action" value="paginarPublicidad">
                                                <input type="hidden" id="numberPagePublicidad" name="numberPagePublicidad" value="1">
                                                <form id="FrmPublicidad">
                                                    <div class="row mt-3">
                                                        <div class="form-group col-lg-8 col-12 mb-3">
                                                            <input type="text" name="txtProveedorPublicidad" id="txtProveedorPublicidad" class="form-control form-control-sm" placeholder="PROVEEDOR">
                                                        </div>
                                                        <div class="input-group col-lg-4 col-12 mb-3">
                                                            <select id="comboAnioPublicidad" name="comboAnioPublicidad" class="form-control form-control-sm combo-paginar mr-3" idBtnBuscar='btnBuscarPublicidad'>

                                                            </select>
                                                            <button type="submit" id="btnBuscarPublicidad" class="btn waves-effect waves-light btn-info btn-sm mr-3" data-toggle="tooltip" title="Buscar Publicidad" style="height: 31px"><i class="fas fa-search" aria-hidden="true"></i> BUSCAR</button>
                                                            <button type="button" class="btn waves-effect waves-light btn-info btn-sm btn-abrir-modal" idmodal="ventanaManPublicidad" idaccion="actionPublicidad" value_accion="addPublicidad"  data-toggle="tooltip" title="Agregar Publicidad" style="height: 31px"><i class="fa fa-plus-square" aria-hidden="true"></i></button>
                                                        </div>
                                                    </div>
                                                </form>
                                                <div class="row">
                                                    <div class="col-12">
                                                        <div class="table-responsive">
                                                            <table class="table color-bordered-table muted-bordered-table table-hover">
                                                                <thead>
                                                                    <tr>
                                                                        <th style="width: 15%" class="text-medium-table">Fuente Financiamiento</th>
                                                                        <th style="width: 25%" class="text-medium-table">Contrato</th>
                                                                        <th style="width: 25%" class="text-medium-table">Objeto</th>
                                                                        <th style="width: 10%" class="text-medium-table">Ruc</th>
                                                                        <th style="width: 20%" class="text-medium-table">Proveedor</th>
                                                                        <th style="width: 10%" class="text-medium-table">Penalidad</th>
                                                                        <th style="width: 10%" class="text-medium-table">Monto</th>
                                                                        <th style="width: 5%"class="text-medium-table"></th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody id="tbodyPublicidad">
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-12">
                                                        <div class="card" style="height: 50px; margin-bottom: 0px">
                                                            <div class="card-body"
                                                                 style="padding-top: 10px; padding-bottom: 10px">
                                                                <div class="row">
                                                                    <div class="col-md-2 col-sm-3 col-4">
                                                                        <select id="sizePagePublicidad" name="sizePagePublicidad" class="form-control form-control-sm combo-paginar" idBtnBuscar='btnBuscarPublicidad'>
                                                                            <option value="10">10</option>
                                                                            <option value="15">15</option>
                                                                            <option value="20">20</option>
                                                                        </select>
                                                                    </div>
                                                                    <div class="col-md-10 col-sm-9 col-8">
                                                                        <nav aria-label="Page navigation example">
                                                                            <ul id="paginationPublicidad" class="pagination pagination-sm justify-content-end">
                                                                            </ul>
                                                                        </nav>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="tab-pane p-20" id="tab-compras-en-telefonias" role="tabpanel">
                                                <input type="hidden" id="nameFormTelefonia" value="FrmTelefonia">
                                                <input type="hidden" id="actionTelefonia" name="action" value="paginarTelefonia">
                                                <input type="hidden" id="numberPageTelefonia" name="numberPageTelefonia" value="1">
                                                <form id="FrmTelefonia">
                                                    <div class="row mt-3">
                                                        <div class="form-group col-lg-8 col-12 mb-3">
                                                            <input type="text" name="txtAreaTelefonia" id="txtAreaTelefonia" class="form-control form-control-sm" placeholder="AREA / OFICINA">
                                                        </div>
                                                        <div class="input-group col-lg-4 col-12 mb-3">
                                                            <select id="comboAnioTelefonia" name="comboAnioTelefonia" class="form-control form-control-sm combo-paginar mr-3" idBtnBuscar='btnBuscarTelefonia'>

                                                            </select>
                                                            <button type="submit" id="btnBuscarTelefonia" class="btn waves-effect waves-light btn-info btn-sm mr-3" data-toggle="tooltip" title="Buscar Telefonia" style="height: 31px"><i class="fas fa-search" aria-hidden="true"></i> BUSCAR</button>
                                                            <button type="button" class="btn waves-effect waves-light btn-info btn-sm btn-abrir-modal" idmodal="ventanaManTelefonia" idaccion="actionTelefonia" value_accion="addTelefonia" data-toggle="tooltip" title="Agregar Documento" style="height: 31px"><i class="fa fa-plus-square" aria-hidden="true"></i></button>
                                                        </div>
                                                    </div>
                                                </form>
                                                <div class="row">
                                                    <div class="col-12">
                                                        <div class="table-responsive">
                                                            <table class="table color-bordered-table muted-bordered-table table-hover">
                                                                <thead>
                                                                    <tr>
                                                                        <th style="width: 15%" class="text-medium-table">TIPO</th>
                                                                        <th style="width: 15%" class="text-medium-table">NUMERO</th>
                                                                        <th style="width: 25%" class="text-medium-table">AREA/OFICINA</th>
                                                                        <th style="width: 25%" class="text-medium-table">ASIGNADO A</th>
                                                                        <th style="width: 20%" class="text-medium-table">CARGO</th>
                                                                        <th style="width: 10%" class="text-medium-table">IMPORTE</th>
                                                                        <th style="width: 5%" class="text-medium-table"></th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody id="tbodyTelefonia">
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-12">
                                                        <div class="card" style="height: 50px; margin-bottom: 0px">
                                                            <div class="card-body"
                                                                 style="padding-top: 10px; padding-bottom: 10px">
                                                                <div class="row">
                                                                    <div class="col-md-2 col-sm-3 col-4">
                                                                        <select id="sizePageTelefonia" name="sizePageTelefonia" class="form-control form-control-sm combo-paginar" idBtnBuscar='btnBuscarTelefonia'>
                                                                            <option value="10">10</option>
                                                                            <option value="15">15</option>
                                                                            <option value="20">20</option>
                                                                        </select>
                                                                    </div>
                                                                    <div class="col-md-10 col-sm-9 col-8">
                                                                        <nav aria-label="Page navigation example">
                                                                            <ul id="paginationTelefonia" class="pagination pagination-sm justify-content-end">

                                                                            </ul>

                                                                        </nav>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="tab-pane p-20" id="tab-uso-de-vehiculos" role="tabpanel">
                                                <input type="hidden" id="nameFormVehiculo" value="FrmVehiculo">
                                                <input type="hidden" id="actionVehiculo" name="action" value="paginarVehiculo">
                                                <input type="hidden" id="numberPageVehiculo" name="numberPageVehiculo" value="1">
                                                <form id="FrmVehiculo">
                                                    <div class="row mt-3">
                                                        <div class="form-group col-lg-8 col-12 mb-3">
                                                            <input type="text" name="txtAreaVehiculo" id="txtAreaVehiculo" class="form-control form-control-sm" placeholder="ASIGNADO">
                                                        </div>
                                                        <div class="input-group col-lg-4 col-12 mb-3">
                                                            <select id="comboAnioVehiculo" name="comboAnioVehiculo" class="form-control form-control-sm combo-paginar mr-3" idBtnBuscar='btnBuscarVehiculo'>

                                                            </select>
                                                            <button type="submit" id="btnBuscarVehiculo" class="btn waves-effect waves-light btn-info btn-sm mr-3" data-toggle="tooltip" title="Buscar Documento" style="height: 31px"><i class="fas fa-search" aria-hidden="true"></i> BUSCAR</button>
                                                            <button type="button" class="btn waves-effect waves-light btn-info btn-sm btn-abrir-modal" idmodal="ventanaManVehiculo" idaccion="actionVehiculo" value_accion="addVehiculo" data-toggle="tooltip" title="Agregar Documento" style="height: 31px"><i class="fa fa-plus-square" aria-hidden="true"></i></button>
                                                        </div>
                                                    </div>
                                                </form>
                                                <div class="row">
                                                    <div class="col-12">
                                                        <div class="table-responsive">
                                                            <table class="table color-bordered-table muted-bordered-table table-hover" id="tablaFinanza3">
                                                                <thead>
                                                                    <tr>
                                                                        <th style="width: 10%" class="text-medium-table">Clase</th>
                                                                        <th style="width: 10%" class="text-medium-table">Vehículo</th>
                                                                        <th style="width: 15%" class="text-medium-table">Placa</th>
                                                                        <th style="width: 10%" class="text-medium-table">SOAT</th>
                                                                        <th style="width: 35%" class="text-medium-table">Asignado a</th>
                                                                        <th style="width: 10%" class="text-medium-table">Recorrido Km</th>
                                                                        <th style="width: 8%" class="text-medium-table">Tipo Combustible</th>
                                                                        <th style="width: 8%" class="text-medium-table">Costo Combustible</th>
                                                                        <th style="width: 5%" class="text-medium-table"></th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody id="tbodyVehiculo">
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-12">
                                                        <div class="card " style="height: 50px; margin-bottom: 0px">
                                                            <div class="card-body"
                                                                 style="padding-top: 10px; padding-bottom: 10px">
                                                                <div class="row">
                                                                    <div class="col-md-2 col-sm-3 col-4">
                                                                        <select id="sizePageVehiculo" name="sizePageVehiculo" class="form-control form-control-sm combo-paginar" idBtnBuscar='btnBuscarVehiculo'>
                                                                            <option value="10">10</option>
                                                                            <option value="15">15</option>
                                                                            <option value="20">20</option>
                                                                        </select>
                                                                    </div>
                                                                    <div class="col-md-10 col-sm-9 col-8">
                                                                        <nav aria-label="Page navigation example">
                                                                            <ul id="paginationVehiculo"
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
                                            <div class="tab-pane p-20" id="tab-principales-proveedores" role="tabpanel">
                                                <input type="hidden" id="nameFormProveedor" value="FrmProveedor">
                                                <input type="hidden" id="actionProveedor" name="action" value="paginarProveedor">
                                                <input type="hidden" id="numberPageProveedor" name="numberPageProveedor" value="1">
                                                <form id="FrmProveedor">
                                                    <div class="row mt-3">
                                                        <div class="form-group col-lg-8 col-12 mb-3">
                                                            <input type="text" name="txtProveedor" id="txtProveedor" class="form-control form-control-sm" placeholder="PROVEEDOR">
                                                        </div>
                                                        <div class="input-group col-lg-4 col-12 mb-3">
                                                            <select id="comboAnioProveedor" name="comboAnioProveedor" class="form-control form-control-sm combo-paginar mr-3" idBtnBuscar='btnBuscarProveedor'>

                                                            </select>
                                                            <button type="submit" id="btnBuscarProveedor" class="btn waves-effect waves-light btn-info btn-sm mr-3" data-toggle="tooltip" title="Buscar Proveedor" style="height: 31px"><i class="fas fa-search" aria-hidden="true"></i> BUSCAR</button>
                                                            <button type="button" class="btn waves-effect waves-light btn-info btn-sm btn-abrir-modal" idmodal="ventanaManProveedor" idaccion="actionProveedor" value_accion="addProveedor" data-toggle="tooltip" title="Agregar Proveedor" style="height: 31px"><i class="fa fa-plus-square" aria-hidden="true"></i></button>
                                                        </div>
                                                    </div>
                                                </form>
                                                <div class="row">
                                                    <div class="col-12">
                                                        <div class="table-responsive">
                                                            <table class="table color-bordered-table muted-bordered-table table-hover" id="tablaProveedor">
                                                                <thead>
                                                                    <tr>
                                                                        <th style="width: 10%" class="text-medium-table">RUC</th>
                                                                        <th style="width: 75%" class="text-medium-table">PROVEEDOR</th>
                                                                        <th style="width: 15%" class="text-medium-table">IMPORTE</th>
                                                                        <th style="width: 5%" class="text-medium-table"></th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody id="tbodyProveedor">
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-12">
                                                        <div class="card "
                                                             style="height: 50px; margin-bottom: 0px">
                                                            <div class="card-body" style="padding-top: 10px; padding-bottom: 10px">
                                                                <div class="row">
                                                                    <div class="col-md-2 col-sm-3 col-4">
                                                                        <select id="sizePageProveedor" name="sizePageProveedor" class="form-control form-control-sm combo-paginar" idBtnBuscar='btnBuscarProveedor'>
                                                                            <option value="10">10</option>
                                                                            <option value="15">15</option>
                                                                            <option value="20">20</option>
                                                                        </select>
                                                                    </div>
                                                                    <div class="col-md-10 col-sm-9 col-8">
                                                                        <nav aria-label="Page navigation example">
                                                                            <ul id="paginationProveedor"
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
            <div class="modal fade" id="ventanaManOrdenCompra" data-backdrop="static" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg modal-dialog-scroll" role="document">
                    <div class="modal-content">
                        <form id="FrmOrdenCompraModal">
                            <div class="modal-header">
                                <h6 class="modal-title">REGISTRAR ORDEN DE COMPRA</h6>
                                <button type="button" class="close" data-dismiss="modal"
                                        aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body modal-body-scroll">
                                <div class="row">
                                    <div class="form-group col-sm-6 col-12 mb-3">
                                        <label for="txtFechaOrdenCompraER">FECHA</label>
                                        <input type="text" class="form-control form-control-sm input-date input-text" id="txtFechaOrdenCompraER" name="txtFechaOrdenCompraER" placeholder="FECHA"> 
                                    </div>
                                    <div class="form-group col-sm-6 col-12 mb-3">
                                        <label for="txtOrdenCompraOrdenCompraER">N° ORDEN</label>
                                        <input type="text" class="form-control form-control-sm input-text" id="txtOrdenCompraOrdenCompraER" name="txtOrdenCompraOrdenCompraER" placeholder="N° ORDEN"> 
                                    </div>
                                    <div class="form-group col-12 mb-3">
                                        <label for="txtFuenteFinanciamientoOrdenCompraER">FUENTE FINANCIAMIENTO</label>
                                        <input type="text" class="form-control form-control-sm input-text" id="txtFuenteFinanciamientoOrdenCompraER" name="txtFuenteFinanciamientoOrdenCompraER" placeholder="FUENTE FINANCIAMIENTO"> 
                                    </div>
                                    <div class="form-group col-12 mb-3">
                                        <label for="txtProveedorOrdenCompraER">PROVEEDOR</label>
                                        <input type="text" class="form-control form-control-sm input-text" id="txtProveedorOrdenCompraER" name="txtProveedorOrdenCompraER" placeholder="PROVEEDOR"> 
                                    </div>
                                    <div class="form-group col-md-4 col-sm-6 col-12 mb-3">  
                                        <label for="txtMontoOrdenCompraER">MONTO</label>
                                        <input type="text" class="form-control form-control-sm input-text" id="txtMontoOrdenCompraER" name="txtMontoOrdenCompraER" placeholder="MONTO"> 
                                    </div>
                                    <div class="form-group col-md-4 col-sm-6 col-12 mb-3">
                                        <label for="txtFinanciamientoOrdenCompraER">FINANCIAMIENTO</label>
                                        <input type="text" class="form-control form-control-sm input-text" id="txtFinanciamientoOrdenCompraER" name="txtFinanciamientoOrdenCompraER" placeholder="FINANCIAMIENTO"> 
                                    </div>
                                    <div class="form-group col-md-4 col-sm-6 col-12 mb-3">
                                        <label for="txtNSiafOrdenCompraER">N° SIAF</label>
                                        <input type="text" class="form-control form-control-sm input-text" id="txtNSiafOrdenCompraER" name="txtNSiafOrdenCompraER" placeholder="N° SIAF"> 
                                    </div>
                                    <input id="txtIdOrdenCompraER" name="txtIdOrdenCompraER" type="hidden" value="">
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
            <div class="modal fade" id="ventanaManOrdenServicio" data-backdrop="static" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg modal-dialog-scroll" role="document">
                    <div class="modal-content">
                        <form id="FrmOrdenServicioModal">
                            <div class="modal-header">
                                <h6 class="modal-title">REGISTRAR ORDEN DE SERVICIO</h6>
                                <button type="button" class="close" data-dismiss="modal"
                                        aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body modal-body-scroll">
                                <div class="row">
                                    <div class="form-group col-sm-6 col-12 mb-3">
                                        <label for="txtFechaOrdenServicioER">FECHA</label>
                                        <input type="text" class="form-control form-control-sm input-date input-text" id="txtFechaOrdenServicioER" name="txtFechaOrdenServicioER" placeholder="FECHA"> 
                                    </div>
                                    <div class="form-group col-sm-6 col-12 mb-3">
                                        <label for="txtOrdenServicioOrdenServicioER">N° ORDEN</label>
                                        <input type="text" class="form-control form-control-sm input-text" id="txtOrdenServicioOrdenServicioER" name="txtOrdenServicioOrdenServicioER" placeholder="N° ORDEN"> 
                                    </div>
                                    <div class="form-group col-12 mb-3">
                                        <label for="txtFuenteFinanciamientoOrdenServicioER">FUENTE FINANCIAMIENTO</label>
                                        <input type="text" class="form-control form-control-sm input-text" id="txtFuenteFinanciamientoOrdenServicioER" name="txtFuenteFinanciamientoOrdenServicioER" placeholder="FUENTE FINANCIAMIENTO"> 
                                    </div>
                                    <div class="form-group col-12 mb-3">
                                        <label for="txtProveedorOrdenServicioER">PROVEEDOR</label>
                                        <input type="text" class="form-control form-control-sm input-text" id="txtProveedorOrdenServicioER" name="txtProveedorOrdenServicioER" placeholder="PROVEEDOR"> 
                                    </div>
                                    <div class="form-group col-md-4 col-sm-6 col-12 mb-3">
                                        <label for="txtMontoOrdenServicioER">MONTO</label>
                                        <input type="text" class="form-control form-control-sm input-text" id="txtMontoOrdenServicioER" name="txtMontoOrdenServicioER" placeholder="MONTO"> 
                                    </div>
                                    <div class="form-group col-md-4 col-sm-6 col-12 mb-3">
                                        <label for="txtFinanciamientoOrdenServicioER">FINANCIAMIENTO</label>
                                        <input type="text" class="form-control form-control-sm input-text" id="txtFinanciamientoOrdenServicioER" name="txtFinanciamientoOrdenServicioER" placeholder="FINANCIAMIENTO"> 
                                    </div>
                                    <div class="form-group col-md-4 col-sm-6 col-12 mb-3">
                                        <label for="txtNSiafOrdenServicioER">N° SIAF</label>
                                        <input type="text" class="form-control form-control-sm input-text" id="txtNSiafOrdenServicioER" name="txtNSiafOrdenServicioER" placeholder="N° SIAF"> 
                                    </div>
                                    <input id="txtIdOrdenServicioER" name="txtIdOrdenServicioER" type="hidden" value="">
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
            <div class="modal fade" id="ventanaManPublicidad" data-backdrop="static" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg modal-dialog-scroll" role="document">
                    <div class="modal-content">
                        <form id="FrmPublicidadModal">
                            <div class="modal-header">
                                <h6 class="modal-title">REGISTRAR PUBLICIDAD</h6>
                                <button type="button" class="close" data-dismiss="modal"
                                        aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body modal-body-scroll">
                                <div class="row">
                                    <div class="form-group col-lg-4 col-sm-6 col-12 mb-3">
                                        <label for="txtAnhoPublicidadER">AÑO</label>
                                        <input type="text" class="form-control form-control-sm input-text" id="txtAnhoPublicidadER" name="txtAnhoPublicidadER" placeholder="AÑO"> 
                                    </div>
                                    <div class="form-group col-lg-4 col-sm-6 col-12 mb-3">
                                        <label for="txtBienesServiciosPublicidadER">BIEN/SERVICIO</label>
                                        <input type="text" class="form-control form-control-sm input-text" id="txtBienesServiciosPublicidadER" name="txtBienesServiciosPublicidadER" placeholder="BIEN/SERVICIO"> 
                                    </div>
                                    <div class="form-group col-lg-4 col-sm-6 col-12 mb-3">
                                        <label for="txtProcesoPublicidadER">PROCESO</label>
                                        <input type="text" class="form-control form-control-sm input-text" id="txtProcesoPublicidadER" name="txtProcesoPublicidadER" placeholder="PROCESO"> 
                                    </div>
                                    <div class="form-group col-lg-4 col-sm-6 col-12 mb-3">
                                        <label for="txtContratoPublicidadER">CONTRATO</label>
                                        <input type="text" class="form-control form-control-sm input-text" id="txtContratoPublicidadER" name="txtContratoPublicidadER" placeholder="CONTRATO"> 
                                    </div>
                                    <div class="form-group col-lg-8 col-12 mb-3">
                                        <label for="txtFuenteFinanciamientoPublicidadER">FUENTE FINANCIAMIENTO</label>
                                        <input type="text" class="form-control form-control-sm input-text" id="txtFuenteFinanciamientoPublicidadER" name="txtFuenteFinanciamientoPublicidadER" placeholder="FUENTE FINANCIAMIENTO"> 
                                    </div>
                                    <div class="form-group col-12 mb-3">
                                        <label for="txtObjetoContratoPublicidadER">OBJETO CONTRATO</label>
                                        <textarea type="text" class="form-control form-control-sm input-text" id="txtObjetoContratoPublicidadER" name="txtObjetoContratoPublicidadER" placeholder="OBJETO CONTRATO" rows="3"></textarea>
                                    </div>
                                    <div class="form-group col-lg-8 col-sm-6 col-12 mb-3">
                                        <label for="txtValorReferenciaPublicidadER">VALOR DE REFERENCIA</label>
                                        <input type="text" class="form-control form-control-sm input-text" id="txtValorReferenciaPublicidadER" name="txtValorReferenciaPublicidadER" placeholder="VALOR DE REFERENCIA"> 
                                    </div>
                                    <div class="form-group col-lg-4 col-sm-6 col-12 mb-3">
                                        <label for="txtRucPublicidadER">RUC</label>
                                        <input type="text" class="form-control form-control-sm input-text" id="txtRucPublicidadER" name="txtRucPublicidadER" placeholder="RUC"> 
                                    </div>
                                    <div class="form-group col-12 mb-3">
                                        <label for="txtProveedorPublicidadER">PROVEEDOR</label>
                                        <input type="text" class="form-control form-control-sm input-text" id="txtProveedorPublicidadER" name="txtProveedorPublicidadER" placeholder="PROVEEDOR"> 
                                    </div>
                                    <div class="form-group col-lg-4 col-sm-6 col-12 mb-3">
                                        <label for="txtNContratoPublicidadER">MONTO CONTRATO</label>
                                        <input type="text" class="form-control form-control-sm input-text" id="txtNContratoPublicidadER" name="txtNContratoPublicidadER" placeholder="MONTO CONTRATO"> 
                                    </div>
                                    <div class="form-group col-lg-4 col-sm-6 col-12 mb-3">
                                        <label for="txtPenalidadPublicidadER">PENALIDAD</label>
                                        <input type="text" class="form-control form-control-sm input-text" id="txtPenalidadPublicidadER" name="txtPenalidadPublicidadER" placeholder="PENALIDAD"> 
                                    </div>
                                    <div class="form-group col-lg-4 col-sm-6 col-12 mb-3">
                                        <label for="txtCostoFinalPublicidadER">COSTO FINAL</label>
                                        <input type="text" class="form-control form-control-sm input-text" id="txtCostoFinalPublicidadER" name="txtCostoFinalPublicidadER" placeholder="COSTO FINAL"> 
                                    </div>
                                    <div class="form-group col-12 mb-3">
                                        <label for="txtObservacionesPublicidadER">OBSERVACIONES</label>
                                        <textarea type="text" class="form-control form-control-sm input-text" id="txtObservacionesPublicidadER" name="txtObservacionesPublicidadER" placeholder="OBSERVACIONES" rows="3"></textarea>
                                    </div>  
                                    <input id="txtIdPublicidadER" name="txtIdPublicidadER" type="hidden" value="">
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
            <div class="modal fade" id="ventanaManTelefonia" data-backdrop="static" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg modal-dialog-scroll" role="document">
                    <div class="modal-content">
                        <form id="FrmTelefoniaModal">
                            <div class="modal-header">
                                <h6 class="modal-title">REGISTRAR TELEFONÍA</h6>
                                <button type="button" class="close" data-dismiss="modal"
                                        aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body modal-body-scroll">
                                <div class="row">
                                    <div class="form-group col-sm-6 col-12 mb-3">
                                        <label for="txtMesTelefoniaER">MES</label>
                                        <select class="form-control form-control-sm cbo-meses input-select" id="txtMesTelefoniaER" name="txtMesTelefoniaER">
                                            <option value="-1">Seleccione...</option>
                                        </select>
                                    </div>
                                    <div class="form-group col-sm-6 col-12 mb-3">
                                        <label for="txtAnhoTelefoniaER">AÑO</label>
                                        <input type="text" class="form-control form-control-sm input-text" id="txtAnhoTelefoniaER" name="txtAnhoTelefoniaER" placeholder="AÑO"> 
                                    </div>
                                    <div class="form-group col-sm-6 col-12 mb-3">
                                        <label for="txtTipoTelefoniaER">TIPO</label>
                                        <input type="text" class="form-control form-control-sm input-text" id="txtTipoTelefoniaER" name="txtTipoTelefoniaER" placeholder="TIPO">
                                    </div>
                                    <div class="form-group col-sm-6 col-12 mb-3">
                                        <label for="txtNumeroTelefoniaER">NUMERO</label>
                                        <input type="text" class="form-control form-control-sm input-text" id="txtNumeroTelefoniaER" name="txtNumeroTelefoniaER" placeholder="NUMERO">
                                    </div>
                                    <div class="form-group col-12 mb-3">
                                        <label for="txtAreaOficinaTelefoniaER">AREA / OFICINA</label>
                                        <input type="text" class="form-control form-control-sm input-text" id="txtAreaOficinaTelefoniaER" name="txtAreaOficinaTelefoniaER" placeholder="AREA / OFICINA"> 
                                    </div>
                                    <div class="form-group col-12 mb-3">
                                        <label for="txtAsignadoATelefoniaER">ASIGNADO A</label>
                                        <input type="text" class="form-control form-control-sm input-text" id="txtAsignadoATelefoniaER" name="txtAsignadoATelefoniaER" placeholder="ASIGNADO A"> 
                                    </div>
                                    <div class="form-group col-sm-6 col-12 mb-3">
                                        <label for="txtCargoActividadTelefoniaER">CARGO / ACTIVIDAD</label>
                                        <input type="text" class="form-control form-control-sm input-text" id="txtCargoActividadTelefoniaER" name="txtCargoActividadTelefoniaER" placeholder="CARGO / ACTIVIDAD"> 
                                    </div>
                                    <div class="form-group col-sm-6 col-12 mb-3">
                                        <label for="txtImporteTelefoniaER">IMPORTE</label>
                                        <input type="text" class="form-control form-control-sm input-text" id="txtImporteTelefoniaER" name="txtImporteTelefoniaER" placeholder="IMPORTE"> 
                                    </div>
                                    <input id="txtIdTelefoniaER" name="txtIdTelefoniaER" type="hidden" value="">
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
            <div class="modal fade" id="ventanaManVehiculo" data-backdrop="static" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                        <form id="FrmVehiculoModal">
                            <div class="modal-header">
                                <h6 class="modal-title">REGISTRAR VEHÍCULO</h6>
                                <button type="button" class="close" data-dismiss="modal"
                                        aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <div class="row">
                                    <div class="form-group col-lg-4 col-sm-6 col-12 mb-3">
                                        <label for="txtMesVehiculoER">MES</label>
                                        <select class="form-control form-control-sm cbo-meses input-select" id="txtMesVehiculoER" name="txtMesVehiculoER">
                                            <option value="-1">Seleccione...</option>
                                        </select>
                                    </div>
                                    <div class="form-group col-lg-4 col-sm-6 col-12 mb-3">
                                        <label for="txtAnhoVehiculoER">AÑO</label>
                                        <input type="text" class="form-control form-control-sm input-text" id="txtAnhoVehiculoER" name="txtAnhoVehiculoER" placeholder="AÑO"> 
                                    </div>
                                    <div class="form-group col-lg-4 col-sm-6 col-12 mb-3">
                                        <label for="txtTipoClaseVehiculoER">TIPO CLASE</label>
                                        <input type="text" class="form-control form-control-sm input-text" id="txtTipoClaseVehiculoER" name="txtTipoClaseVehiculoER" placeholder="TIPO CLASE">
                                    </div>
                                    <div class="form-group col-lg-4 col-sm-6 col-12 mb-3">
                                        <label for="txtClaseVehiculoER">CLASE VEHÍCULO</label>
                                        <input type="text" class="form-control form-control-sm input-text" id="txtClaseVehiculoER" name="txtClaseVehiculoER" placeholder="CLASE VEHÍCULO">
                                    </div>
                                    <div class="form-group col-lg-4 col-sm-6 col-12 mb-3">
                                        <label for="txtTipoCombustibleVehiculoER">TIPO COMBUSTIBLE</label>
                                        <input type="text" class="form-control form-control-sm input-text" id="txtTipoCombustibleVehiculoER" name="txtTipoCombustibleVehiculoER" placeholder="TIPO COMBUSTIBLE">
                                    </div>
                                    <div class="form-group col-lg-4 col-sm-6 col-12 mb-3">
                                        <label for="txtRecorridoKmVehiculoER">RECORRIDO KM</label>
                                        <input type="text" class="form-control form-control-sm input-text" id="txtRecorridoKmVehiculoER" name="txtRecorridoKmVehiculoER" placeholder="RECORRIDO KM">
                                    </div>
                                    <div class="form-group col-12 mb-3">
                                        <label for="txtAsignadoVehiculoER">ASIGNADO A</label>
                                        <input type="text" class="form-control form-control-sm input-text" id="txtAsignadoVehiculoER" name="txtAsignadoVehiculoER" placeholder="ASIGNADO A"> 
                                    </div>  
                                    <div class="form-group col-12 mb-3">
                                        <label for="txtCargoActividadVehiculoER">CARGO / ACTIVIDAD</label>
                                        <input type="text" class="form-control form-control-sm input-text" id="txtCargoActividadVehiculoER" name="txtCargoActividadVehiculoER" placeholder="CARGO / ACTIVIDAD"> 
                                    </div>                                    
                                    <div class="form-group col-lg-4 col-sm-6 col-12 mb-3">
                                        <label for="txtCostoCombustibleVehiculoER">COSTO COMBUSTIBLE</label>
                                        <input type="text" class="form-control form-control-sm input-text" id="txtCostoCombustibleVehiculoER" name="txtCostoCombustibleVehiculoER" placeholder="COSTO COMBUSTIBLE">
                                    </div>
                                    <div class="form-group col-lg-4 col-sm-6 col-12 mb-3">
                                        <label for="txtSoatFechaVencimientoVehiculoER">FECHA VENCIMIENTO SOAT</label>
                                        <input type="text" class="form-control form-control-sm input-text input-date" id="txtSoatFechaVencimientoVehiculoER" name="txtSoatFechaVencimientoVehiculoER" placeholder="DD/MM/AAAA">
                                    </div>
                                    <div class="form-group col-lg-4 col-12 mb-3">
                                        <label for="txtPlacaVehiculoER">PLACA</label>
                                        <input type="text" class="form-control form-control-sm input-text" id="txtPlacaVehiculoER" name="txtPlacaVehiculoER" placeholder="PLACA">
                                    </div>
                                    <div class="form-group col-12 mb-3">
                                        <label for="txtObservacionesVehiculoER">OBSERVACIONES</label>
                                        <textarea type="text" class="form-control form-control-sm input-text" id="txtObservacionesVehiculoER" name="txtObservacionesVehiculoER" placeholder="OBSERVACIONES" rows="3"></textarea>
                                    </div>
                                    <input id="txtIdVehiculoER" name="txtIdVehiculoER" type="hidden" value="">
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
            <div class="modal fade" id="ventanaManProveedor" data-backdrop="static" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                        <form id="FrmProveedorModal">
                            <div class="modal-header">
                                <h6 class="modal-title">REGISTRAR PROVEEDOR</h6>
                                <button type="button" class="close" data-dismiss="modal"
                                        aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <div class="row">
                                    <div class="form-group col-lg-4 col-sm-6 col-12 mb-3">
                                        <label for="txtAnhoProveedorER">AÑO</label>
                                        <input type="text" class="form-control form-control-sm input-text" id="txtAnhoProveedorER" name="txtAnhoProveedorER" placeholder="AÑO"> 
                                    </div>
                                    <div class="form-group col-lg-4 col-sm-6 col-12 mb-3">
                                        <label for="txtTrimestreProveedorER">TRIMESTRE</label>
                                        <input type="text" class="form-control form-control-sm input-text" id="txtTrimestreProveedorER" name="txtTrimestreProveedorER" placeholder="TRIMESTRE"> 
                                    </div>
                                    <div class="form-group col-lg-4 col-12 mb-3">
                                        <label for="txtRucProveedorER">RUC</label>
                                        <input type="text" class="form-control form-control-sm input-text" id="txtRucProveedorER" name="txtRucProveedorER" placeholder="RUC">
                                    </div>
                                    <div class="form-group col-12 mb-3">
                                        <label for="txtProveedorER">PROVEEDOR</label>
                                        <input type="text" class="form-control form-control-sm input-text" id="txtProveedorER" name="txtProveedorER" placeholder="PROVEEDOR">
                                    </div>
                                    <div class="form-group col-12 mb-3">
                                        <label for="txtImporteProveedorER">IMPORTE</label>
                                        <input type="text" class="form-control form-control-sm input-text" id="txtImporteProveedorER" name="txtImporteProveedorER" placeholder="IMPORTE"> 
                                    </div>
                                    <input id="txtIdProveedorER" name="txtIdProveedorER" type="hidden" value="">
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
            <div class="modal fade" id="modalCargandoOrdenCompra" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-hidden="true" style="padding-top: 18%; overflow-y: visible;">
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
            <div class="modal fade" id="modalCargandoOrdenServicio" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-hidden="true" style="padding-top: 18%; overflow-y: visible;">
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
            <div class="modal fade" id="modalCargandoPublicidad" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-hidden="true" style="padding-top: 18%; overflow-y: visible;">
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
            <div class="modal fade" id="modalCargandoTelefonia" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-hidden="true" style="padding-top: 18%; overflow-y: visible;">
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
            <div class="modal fade" id="modalCargandoVehiculo" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-hidden="true" style="padding-top: 18%; overflow-y: visible;">
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
            <div class="modal fade" id="modalCargandoProveedor" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-hidden="true" style="padding-top: 18%; overflow-y: visible;">
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
    <script src="<%out.print(getServletContext().getContextPath());%>/js_app/gc/adquisiciones_contrataciones.js"></script>

</body>
</html>
