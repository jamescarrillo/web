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
                                    <strong class="text-info">PERSONAL</strong>
                                </div>
                                <div class="card-body" style="padding: 0px">
                                    <div class="modal-body p-0">
                                        <ul class="nav nav-tabs" role="tablist">
                                            <li class="nav-item">
                                                <a class="nav-link active show" data-toggle="tab" href="#tab-personal" role="tab" aria-selected="true"><span> Personal</span></a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" data-toggle="tab" href="#tab-personal-por-categorias" role="tab" aria-selected="false"><span> Personal por Categorías</span></a>
                                            </li>
                                        </ul>
                                        <div class="tab-content tabcontent-border">
                                            <div class="tab-pane p-20 active show" id="tab-personal" role="tabpanel">
                                                <input type="hidden" id="nameFormPersonal" value="FrmPersonal">
                                                <input type="hidden" id="actionPersonal" name="action" value="paginarPersonal">
                                                <input type="hidden" id="numberPagePersonal" name="numberPagePersonal" value="1">
                                                <form id="FrmPersonal">
                                                    <div class="row">
                                                        <div class="form-group col-lg-3 col-md-4 col-12 mb-3">
                                                            <select class="form-control form-control-sm combo-paginar" id="cboTipoPersonal" name="cboTipoPersonal" idBtnBuscar='btnBuscarPersonal'>
                                                                <option value="1">PLANILLA</option>
                                                                <option value="2">LOCADOR DE SERVICIOS</option>
                                                                <option value="3">CONTRATOS ADMINISTRATIVOS DE SERVICIO</option>
                                                            </select>
                                                        </div>
                                                        <div class="form-group col-lg-6 col-md-8 col-12 mb-3">
                                                            <input type="text" name="txtPersonal" id="txtPersonal" class="form-control form-control-sm" placeholder="APELLIDO O NOMBRE">
                                                        </div>
                                                        <div class="input-group col-lg-3 col-12 mb-3">
                                                            <select id="comboAnioPersonal" name="comboAnioPersonal" class="form-control form-control-sm combo-paginar mr-3" idBtnBuscar='btnBuscarPersonal'>

                                                            </select>
                                                            <button type="submit" id="btnBuscarPersonal" class="btn waves-effect waves-light btn-info btn-sm mr-3" data-toggle="tooltip" title="Buscar Personal" style="height: 31px"><i class="fas fa-search" aria-hidden="true"></i> BUSCAR</button>
                                                            <button type="button" id="btnAbrirNPersonal" class="btn waves-effect waves-light btn-info btn-sm btn-abrir-modal" data-toggle="tooltip" title="Agregar Personal" style="height: 31px"><i class="fa fa-plus-square" aria-hidden="true"></i></button>
                                                        </div>
                                                    </div>
                                                </form>
                                                <div class="row">
                                                    <div class="col-12">
                                                        <div class="table-responsive">
                                                            <table class="table color-bordered-table muted-bordered-table table-hover">
                                                                <thead>
                                                                    <tr>
                                                                        <th style="width: 10%" class="text-medium-table">DNI</th>
                                                                        <th style="width: 30%" class="text-medium-table">APELLIDOS Y NOMBRES</th>
                                                                        <th style="width: 10%" class="text-medium-table">CATEGORIA</th>
                                                                        <th style="width: 25%" class="text-medium-table">CARGO</th>
                                                                        <th style="width: 10%" class="text-medium-table">REGIMEN LABORAL</th>
                                                                        <th style="width: 10%" class="text-medium-table">INGRESO TOTAL</th>
                                                                        <th style="width: 5%" class="text-medium-table"></th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody id="tbodyPersonal">
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
                                                                        <select id="sizePagePersonal" name="sizePagePersonal" class="form-control form-control-sm combo-paginar" idBtnBuscar='btnBuscarPersonal'>
                                                                            <option value="10">10</option>
                                                                            <option value="15">15</option>
                                                                            <option value="20">20</option>
                                                                        </select>
                                                                    </div>
                                                                    <div class="col-md-10 col-sm-9 col-8">
                                                                        <nav aria-label="Page navigation example">
                                                                            <ul id="paginationPersonal" class="pagination pagination-sm justify-content-end">

                                                                            </ul>
                                                                        </nav>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="tab-pane p-20" id="tab-personal-por-categorias" role="tabpanel">
                                                <input type="hidden" id="nameFormPersonalCategoria" value="FrmPersonalCategoria">
                                                <input type="hidden" id="actionPersonalCategoria" name="action" value="paginarPersonalCategoria">
                                                <input type="hidden" id="numberPagePersonalCategoria" name="numberPagePersonalCategoria" value="1">
                                                <form id="FrmPersonalCategoria">
                                                    <div class="row">
                                                        <div class="form-group col-lg-8 col-12 mb-3">
                                                            <input type="text" name="txtCategoriaPersonalCategoria" id="txtCategoriaPersonalCategoria" class="form-control form-control-sm" placeholder="CATEGORIA">
                                                        </div>
                                                        <div class="input-group col-lg-4 col-12 mb-3">
                                                            <select id="comboAnioPersonalCategoria" name="comboAnioPersonalCategoria" class="form-control form-control-sm combo-paginar mr-3" idBtnBuscar='btnBuscarPersonalCategoria'>

                                                            </select>
                                                            <button type="submit" id="btnBuscarPersonalCategoria" class="btn waves-effect waves-light btn-info btn-sm mr-3" data-toggle="tooltip" title="Buscar Personal por Categoría" style="height: 31px"><i class="fas fa-search" aria-hidden="true"></i> BUSCAR</button>
                                                            <button type="button" id="btnAbrirNPersonalCategoria" class="btn waves-effect waves-light btn-info btn-sm btn-abrir-modal" data-toggle="tooltip" title="Agregar Personal por Categoría" style="height: 31px"><i class="fa fa-plus-square" aria-hidden="true"></i></button>
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
                                                                        <th style="width: 10%" class="text-medium-table">CÓDIGO</th>
                                                                        <th style="width: 10%" class="text-medium-table">TRIMESTRE</th>
                                                                        <th style="width: 20%" class="text-medium-table">CARGO</th>
                                                                        <th style="width: 10%" class="text-medium-table">REMUERACIÓN MÍNIMA</th>
                                                                        <th style="width: 10%" class="text-medium-table">REMUERACIÓN MÁXIMA</th>
                                                                        <th style="width: 10%" class="text-medium-table">N° TRABAJADORES</th>
                                                                        <th style="width: 5%" class="text-medium-table"></th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody id="tbodyPersonalCategoria">
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
                                                                        <select id="sizePagePersonalCategoria" name="sizePagePersonalCategoria" class="form-control form-control-sm combo-paginar" idBtnBuscar='btnBuscarPersonalCategoria'>
                                                                            <option value="10">10</option>
                                                                            <option value="15">15</option>
                                                                            <option value="20">20</option>
                                                                        </select>
                                                                    </div>
                                                                    <div class="col-md-10 col-sm-9 col-8">
                                                                        <nav aria-label="Page navigation example">
                                                                            <ul id="paginationPersonalCategoria" class="pagination pagination-sm justify-content-end">

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
            <div class="modal fade" id="ventanaManPersonal" data-backdrop="static" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg modal-dialog-scroll" role="document">
                    <div class="modal-content">
                        <form id="FrmPersonalModal">
                            <div class="modal-header">
                                <h6 class="modal-title" id="titleModalPersonal"></h6>
                                <button type="button" class="close" data-dismiss="modal"
                                        aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body modal-body-scroll">
                                <div class="row">
                                    <div class="form-group col-12 mb-3">
                                        <label for="cboTipoPersonalER">TIPO</label>
                                        <select class="form-control form-control-sm input-select" id="cboTipoPersonalER" name="cboTipoPersonalER">
                                            <option value="-1">Seleccione...</option>
                                            <option value="1">PLANILLA</option>
                                            <option value="2">LOCADOR DE SERVICIOS</option>
                                            <option value="3">CONTRATOS ADMINISTRATIVOS DE SERVICIO</option>
                                        </select>
                                    </div>
                                    <div class="form-group col-lg-3 col-sm-6 col-12 mb-3">
                                        <label for="txtAnhoPersonalER">AÑO</label>
                                        <input type="text" class="form-control form-control-sm input-text" id="txtAnhoPersonalER" name="txtAnhoPersonalER" placeholder="AÑO"> 
                                    </div>
                                    <div class="form-group col-lg-3 col-sm-6 col-12 mb-3">
                                        <label for="txtTrimestrePersonalER">MES</label>
                                        <select class="form-control form-control-sm input-select" id="txtTrimestrePersonalER" name="txtTrimestrePersonalER">
                                            <option value="-1">Seleccione...</option>
                                            <option value="1">Enero</option>
                                            <option value="2">Febrero</option>
                                            <option value="3">Marzo</option>
                                            <option value="4">Abril</option>
                                            <option value="5">Mayo</option>
                                            <option value="6">Junio</option>
                                            <option value="7">Julio</option>
                                            <option value="8">Agosto</option>
                                            <option value="9">Setiembre</option>
                                            <option value="10">Octubre</option>
                                            <option value="11">Noviembre</option>
                                            <option value="12">Diciembre</option>
                                        </select>
                                    </div>
                                    <div class="form-group col-lg-3 col-sm-6 col-12 mb-3">
                                        <label for="txtFechaIngresoPersonalER">FECHA INGRESO</label>
                                        <input type="text" class="form-control form-control-sm input-date input-text" id="txtFechaIngresoPersonalER" name="txtFechaIngresoPersonalER" placeholder="DD/MM/AAAA"> 
                                    </div>
                                    <div class="form-group col-lg-3 col-sm-6 col-12 mb-3">
                                        <label for="txtFechaSesePersonalER">FECHA CESE</label>
                                        <input type="text" class="form-control form-control-sm input-date input-text" id="txtFechaSesePersonalER" name="txtFechaSesePersonalER" placeholder="DD/MM/AAAA"> 
                                    </div>      
                                    <div class="form-group col-md-3 col-12 mb-3">  
                                        <label for="txtDniPersonal">DNI</label>
                                        <input type="text" class="form-control form-control-sm input-text" id="txtDniPersonal" name="txtDniPersonal" placeholder="DNI"> 
                                    </div>
                                    <div class="form-group col-md-9 col-12 mb-3">
                                        <label for="txtApellidosNombresPersonalER">APELLIDOS Y NOMBRES</label>
                                        <input type="text" class="form-control form-control-sm input-text" id="txtApellidosNombresPersonalER" name="txtApellidosNombresPersonalER" placeholder="APELLIDOS Y NOMBRES"> 
                                    </div>
                                    <div class="form-group col-sm-6 col-12 mb-3">  
                                        <label for="txtAreaDependenciaPersonalER">AREA DEPENDENCIA</label>
                                        <input type="text" class="form-control form-control-sm input-text" id="txtAreaDependenciaPersonalER" name="txtAreaDependenciaPersonalER" placeholder="ÁREA DEPENDENCIA"> 
                                    </div>
                                    <div class="form-group col-sm-6 col-12 mb-3">  
                                        <label for="txtCargoDependenciaPersonalER">CARGO DEPENDENCIA</label>
                                        <input type="text" class="form-control form-control-sm input-text" id="txtCargoDependenciaPersonalER" name="txtCargoDependenciaPersonalER" placeholder="CARGO DEPENDENCIA"> 
                                    </div>
                                    <div class="form-group col-md-3 col-12 mb-3">  
                                        <label for="txtCategoriaPersonalER">CATEGORÍA</label>
                                        <input type="text" class="form-control form-control-sm input-text" id="txtCategoriaPersonalER" name="txtCategoriaPersonalER" placeholder="CATEGORIA" maxlength="3"> 
                                    </div>
                                    <div class="form-group col-md-3 col-12 mb-3">  
                                        <label for="txtRegimenLaboralPersonalER">REGIMEN LABORAL</label>
                                        <input type="text" class="form-control form-control-sm input-text" id="txtRegimenLaboralPersonalER" name="txtRegimenLaboralPersonalER" placeholder="REGIMEN LABORAL"> 
                                    </div>
                                    <div class="form-group col-md-3 col-12 mb-3">  
                                        <label for="txtPensionPersonalER">PENSIÓN</label>
                                        <input type="text" class="form-control form-control-sm input-text" id="txtPensionPersonalER" name="txtPensionPersonalER" placeholder="PENSIÓN"> 
                                    </div>
                                    <div class="form-group col-md-3 col-12 mb-3">  
                                        <label for="txtRemuneracionHonorarioPersonalER">REMUNERACIÓN POR HONORARIO</label>
                                        <input type="text" class="form-control form-control-sm input-text" id="txtRemuneracionHonorarioPersonalER" name="txtRemuneracionHonorarioPersonalER" placeholder="HONORARIO"> 
                                    </div>
                                    <div class="form-group col-md-3 col-12 mb-3">  
                                        <label for="txtOtrosIngresosER">OTROS INGRESOS</label>
                                        <input type="text" class="form-control form-control-sm input-text" id="txtOtrosIngresosER" name="txtOtrosIngresosER" placeholder="OTROS INGRESOS"> 
                                    </div>
                                    <div class="form-group col-md-3 col-12 mb-3">  
                                        <label for="txtEscolaridadER">ESCOLARIDAD</label>
                                        <input type="text" class="form-control form-control-sm input-text" id="txtEscolaridadER" name="txtEscolaridadER" placeholder="ESCOLARIDAD"> 
                                    </div>
                                    <div class="form-group col-md-3 col-12 mb-3">  
                                        <label for="txtIngresoTotalER">INGRESO TOTAL</label>
                                        <input type="text" class="form-control form-control-sm input-text" id="txtIngresoTotalER" name="txtIngresoTotalER" placeholder="INGRESO TOTAL"> 
                                    </div>
                                    <div class="form-group col-12 mb-3">  
                                        <label for="txtObservacionER">OBSERVACIÓN</label>
                                        <textarea type="text" class="form-control form-control-sm input-text" id="txtObservacionER" name="txtObservacionER" placeholder="OBSERVACION" rows="3"></textarea>
                                    </div>
                                    <input id="txtIdPersonalER" name="txtIdPersonalER" type="hidden" value="">
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
            <div class="modal fade" id="ventanaManPersonalCategoria" data-backdrop="static" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg modal-dialog-scroll" role="document">
                    <div class="modal-content">
                        <form id="FrmPersonalCategoriaModal">
                            <div class="modal-header">
                                <h6 class="modal-title" id="titlePersonalCategoria"></h6>
                                <button type="button" class="close" data-dismiss="modal"
                                        aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body modal-body-scroll">
                                <div class="row">
                                    <div class="form-group col-sm-4 col-12 mb-3">
                                        <label for="txtAnhoPersonalCategoriaER">AÑO</label>
                                        <input type="text" class="form-control form-control-sm input-text" id="txtAnhoPersonalCategoriaER" name="txtAnhoPersonalCategoriaER" placeholder="AÑO"> 
                                    </div>
                                    <div class="form-group col-sm-4 col-12 mb-3">
                                        <label for="txtTrimestrePersonalCategoriaER">TRIMESTRE</label>
                                        <input type="text" class="form-control form-control-sm input-text" id="txtTrimestrePersonalCategoriaER" name="txtTrimestrePersonalCategoriaER" placeholder="TRIMESTRE"> 
                                    </div>
                                    <div class="form-group col-sm-4 col-12 mb-3">
                                        <label for="txtCodigoPersonalCategoriaER">CÓDIGO</label>
                                        <input type="text" class="form-control form-control-sm input-text" id="txtCodigoPersonalCategoriaER" name="txtCodigoPersonalCategoriaER" placeholder="CODIGO"> 
                                    </div>
                                    <div class="form-group col-12 mb-3">
                                        <label for="txtCategoriaPersonalCategoriaER">CATEGORÍA</label>
                                        <input type="text" class="form-control form-control-sm input-text" id="txtCategoriaPersonalCategoriaER" name="txtCategoriaPersonalCategoriaER" placeholder="CATEGORÍA"> 
                                    </div>
                                    <div class="form-group col-sm-6 col-12 mb-3">
                                        <label for="txtRMinimaPersonalCategoriaER">REMUNERACIÓN MÍNIMA</label>
                                        <input type="text" class="form-control form-control-sm input-text" id="txtRMinimaPersonalCategoriaER" name="txtRMinimaPersonalCategoriaER" placeholder="REMUNERACIÓN MÍNIMA"> 
                                    </div>
                                    <div class="form-group col-sm-6 col-12 mb-3">
                                        <label for="txtRMaximaPersonalCategoriaER">REMUNERACIÓN MÁXIMA</label>
                                        <input type="text" class="form-control form-control-sm input-text" id="txtRMaximaPersonalCategoriaER" name="txtRMaximaPersonalCategoriaER" placeholder="REMUNERACIÓN MÁXIMA"> 
                                    </div>
                                    <div class="form-group col-12 mb-3">
                                        <label for="txtNTrabajadoresPersonalCategoriaER">N° TRABAJADORES</label>
                                        <input type="text" class="form-control form-control-sm input-text" id="txtNTrabajadoresPersonalCategoriaER" name="txtNTrabajadoresPersonalCategoriaER" placeholder="N° TRABAJADORES"> 
                                    </div>
                                    <input id="txtIdPersonalCategoriaER" name="txtIdPersonalCategoriaER" type="hidden" value="">
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
            <div class="modal fade" id="modalCargandoPersonal" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-hidden="true" style="padding-top: 18%; overflow-y: visible;">
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
            <div class="modal fade" id="modalCargandoPersonalCategoria" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-hidden="true" style="padding-top: 18%; overflow-y: visible;">
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
    <script src="<%out.print(getServletContext().getContextPath());%>/assets/plugins/jquery/jquery.min.js"></script>
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
    <script src="<%out.print(getServletContext().getContextPath());%>/js_app/gc/personal.js"></script>

</body>
</html>
