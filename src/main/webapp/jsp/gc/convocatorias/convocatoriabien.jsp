
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
                                    <strong class="text-info">CONVOCATORIAS DE BIENES, SERVICIOS Y CONCE.</strong>
                                </div>
                                <div class="card-body pt-1">
                                    <input type="hidden" id="nameForm" value="FrmConvocatoriaBien">
                                    <input type="hidden" id="actionConvocatoriaBien" name="action" value="paginarConvocatoriaBien">
                                    <input type="hidden" id="numberPageConvocatoriaBien" name="numberPageConvocatoriaBien" value="1">
                                    <form id="FrmConvocatoriaBien">
                                        <div class="row mt-3">
                                            <div class="form-group col-lg-6 col-md-8 col-12 mb-3">
                                                <input type="text" name="txtConvocatoriaBien" id="txtConvocatoriaBien" class="form-control form-control-sm" placeholder="SINTESIS">
                                            </div>
                                            <div class="input-group col-lg-2 col-md-4 col-12 mb-3">
                                                <select id="comboAnio" name="comboAnio" class="form-control form-control-sm combo-paginar mr-3" idBtnBuscar='btnBuscarConvocatoriaBien'>

                                                </select>

                                            </div>
                                            <div class="input-group col-lg-4 col-md-6 col-12 mb-3">
                                                <select id="comboTipoListaConvocatoriaBien" name="comboTipoListaConvocatoriaBien" class="form-control form-control-sm combo-paginar mr-3" idBtnBuscar='btnBuscarConvocatoriaBien'>
                                                    <option value="-1">TODAS</option>
                                                    <option value="true">ACTIVAS</option>
                                                    <option value="false">INACTIVAS</option>
                                                </select>
                                                <button type="submit" id="btnBuscarConvocatoriaBien" class="btn waves-effect waves-light btn-info btn-sm mr-3" data-toggle="tooltip" title="Buscar Convocatoria" style="height: 31px"><i class="fas fa-search" aria-hidden="true"></i> BUSCAR</button>
                                                <button type="button" id="btnAbrirNuevoConvocatoriaBien" class="btn waves-effect waves-light btn-info btn-sm" data-toggle="tooltip" title="Registrar Convocatoria" style="height: 31px"><i class="fa fa-plus-square" aria-hidden="true"></i></button>
                                            </div>
                                            <input id="txtEstadoER" name="txtEstadoER" type="hidden" value="0">
                                        </div>
                                    </form>
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="table-responsive" id="tablaConvocatoriaBien">
                                                <table
                                                    class="table color-bordered-table muted-bordered-table table-hover">
                                                    <thead>
                                                        <tr>
                                                            <th style="width: 10%" class="text-medium-table">FECHA</th>
                                                            <th style="width: 60%" class="text-medium-table">SINTESIS</th>
                                                            <th style="width: 10%" class="text-medium-table">TIPO</th>
                                                            <th style="width: 20%" class="text-medium-table">PROCESO</th>
                                                            <th colspan="5" class="text-medium-table">ACCIONES</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody id="tbodyConvocatoriaBien">
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
                                                            <select id="sizePageConvocatoriaBien" name="sizePageConvocatoriaBien" class="form-control form-control-sm combo-paginar" idBtnBuscar='btnBuscarConvocatoriaBien'>
                                                                <option value="10">10</option>
                                                                <option value="15">15</option>
                                                                <option value="20">20</option>
                                                            </select>
                                                        </div>
                                                        <div class="col-md-10 col-sm-9 col-8">
                                                            <nav aria-label="Page navigation example">
                                                                <ul id="paginationConvocatoriaBien"
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
                <div class="modal fade" id="ventanaManConvocatoriaBien" data-backdrop="static" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-lg" role="document">
                        <div class="modal-content">
                            <form id="FrmConvocatoriaBienModal">
                                <div class="modal-header">
                                    <h6 class="modal-title" id="txtTituloModalManConvocatoriaBien"></h6>
                                    <button type="button" class="close" data-dismiss="modal"
                                            aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <div class="row">
                                        <div class="form-group col-12 mb-3">
                                            <label for="txtTituloER">TITULO</label>
                                            <input class="form-control form-control-sm" id="txtTituloER" name="txtTituloER" type="text" placeholder="Titulo de la Convocatoria">
                                        </div>
                                        <div class="form-group col-12 mb-3">
                                            <label for="txtReferenciaER">SINTESIS</label>
                                            <textarea class="form-control form-control-sm" id="txtReferenciaER" name="txtReferenciaER" rows="6" placeholder="Sintesis de la Convocatoria"></textarea>
                                        </div>
                                        <div class="form-group col-4 mb-3">
                                            <label for="txtFechaER">FECHA</label>
                                            <input class="form-control form-control-sm" id="txtFechaER" name="txtFechaER" type="text" placeholder="Fecha de la Convocatoria">
                                        </div>
                                        <div class="form-group col-4 mb-3">
                                            <label for="txtTipoER">OBJETO</label>
                                            <select id="txtTipoER" name="txtTipoER" class="form-control form-control-sm">
                                                <option value="-1">Seleccione...</option>
                                                <option value="1">BIENES</option>
                                                <option value="2">SERVICIOS</option>
                                                <option value="3">OBRAS</option>
                                                <option value="4">CONCESION</option>
                                            </select>
                                        </div>
                                        <div class="form-group col-4 mb-3">
                                            <label for="txtValorReferencialER">VALOR REFERENCIAL</label>
                                            <input class="form-control form-control-sm" id="txtValorReferencialER" name="txtValorReferencialER" type="text" placeholder="Valor Referencial">
                                        </div>
                                        <div class="form-group col-4 mb-3">
                                            <label for="txtCostoParticipacionER">PARTICIPACION</label>
                                            <input class="form-control form-control-sm" id="txtCostoParticipacionER" name="txtCostoParticipacionER" type="text" placeholder="Costo de Participación"> 
                                        </div>
                                        <div class="form-group col-4 mb-3">
                                            <label for="txtLugarRegistroER">ORIGEN</label>
                                            <input class="form-control form-control-sm" id="txtLugarRegistroER" name="txtLugarRegistroER" type="text" placeholder="Lugar de Registro"> 
                                        </div>
                                        <div class="form-group col-4 mb-3">
                                            <label for="txtProcesoER">PROCESO</label>
                                            <select id="txtProcesoER" name="txtProcesoER" class="form-control form-control-sm">
                                                <option value="-1">Seleccione...</option>
                                                <option value="1">VIGENTE</option>
                                                <option value="2">ANULADO</option>
                                                <option value="3">FINALIZADO</option>
                                                <option value="4">DESIERTO</option>
                                            </select>
                                        </div>
                                        <input id="txtConvoIdER" name="txtConvoIdER" type="hidden" value="">
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
                <div class="modal fade" id="modalCargandoConvocatoriaBien" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-hidden="true" style="padding-top: 18%; overflow-y: visible;">
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
                <div class="modal fade" id="modalCargandoArchivos" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-hidden="true" style="padding-top: 18%; overflow-y: visible;">
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
                <div class="modal fade" id="ventanaArchivos" data-backdrop="static" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-lg" role="document">
                        <div class="modal-content">
                            <form id="FrmArchivosModal">
                                <div class="modal-header">
                                    <h6 class="modal-title">SUBIR DOCUMENTOS A ESTA CONVOCATORIA</h6>
                                    <button type="button" class="close" data-dismiss="modal"
                                            aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">

                                    <div class="row">
                                        <div class="form-group col-6 mb-3">
                                            <label for="CB1">Bases</label>
                                            <div style="display: inline">
                                                <input id="fileArchivoCB1" name="fileArchivoCB1" type="file" style="display: none">
                                                <div class="input-group">
                                                    <input type="text" class="form-control form-control-sm" name="txtNombreArchivoCB1" id="txtNombreArchivoCB1" disabled="" maxlength="100">
                                                    <button type="button" id="btnSeleccionarArchivoCB1" class="btn btn-info btn-sm">
                                                        <i class="fa fa-folder-open"></i>
                                                    </button>
                                                </div>
                                            </div>
                                            <input type="hidden" id="txtCvCB1" name="txtCvCB1" value=""> 
                                            <input type="hidden" class="form-control form-control-sm" id="txtNombreFileResultadoActualCB1" name="txtNombreFileResultadoActualCB1" value="">
                                            <input type="hidden" id="txtValidacionArchivoCB1" name="txtValidacionArchivoCB1" value="">
                                            <div id="validarResultadoCB1" class="err-validation-file">Seleccione Adjunto!</div>
                                        </div>
                                        <div class="form-group col-6 mb-3">
                                            <label for="CB2">Resumen</label>
                                            <div style="display: inline">
                                                <input id="fileArchivoCB2" name="fileArchivoCB2" type="file" style="display: none">
                                                <div class="input-group">
                                                    <input type="text" class="form-control form-control-sm" name="txtNombreArchivoCB2" id="txtNombreArchivoCB2" disabled="" maxlength="100">
                                                    <button type="button" id="btnSeleccionarArchivoCB2" class="btn btn-info btn-sm">
                                                        <i class="fa fa-folder-open"></i>
                                                    </button>
                                                </div>
                                            </div>
                                            <input type="hidden" id="txtCvCB2" name="txtCvCB2" value=""> 
                                            <input type="hidden" class="form-control form-control-sm" id="txtNombreFileResultadoActualCB2" name="txtNombreFileResultadoActualCB2" value="">
                                            <input type="hidden" id="txtValidacionArchivoCB2" name="txtValidacionArchivoCB2" value="">
                                            <div id="validarResultadoCB2" class="err-validation-file">Seleccione Adjunto!</div>
                                        </div>
                                        <div class="form-group col-6 mb-3">
                                            <label for="CB3">Absolución de Consultas y Observaciones</label>
                                            <div style="display: inline">
                                                <input id="fileArchivoCB3" name="fileArchivoCB3" type="file" style="display: none">
                                                <div class="input-group">
                                                    <input type="text" class="form-control form-control-sm" name="txtNombreArchivoCB3" id="txtNombreArchivoCB3" disabled="" maxlength="100">
                                                    <button type="button" id="btnSeleccionarArchivoCB3" class="btn btn-info btn-sm">
                                                        <i class="fa fa-folder-open"></i>
                                                    </button>
                                                </div>
                                            </div>
                                            <input type="hidden" id="txtCvCB3" name="txtCvCB3" value=""> 
                                            <input type="hidden" class="form-control form-control-sm" id="txtNombreFileResultadoActualCB3" name="txtNombreFileResultadoActualCB3" value="">
                                            <input type="hidden" id="txtValidacionArchivoCB3" name="txtValidacionArchivoCB3" value="">
                                            <div id="validarResultadoCB3" class="err-validation-file">Seleccione Adjunto!</div>
                                        </div>
                                        <div class="form-group col-6 mb-3">
                                            <label for="CB4">Absolución Consultas</label>
                                            <div style="display: inline">
                                                <input id="fileArchivoCB4" name="fileArchivoCB4" type="file" style="display: none">
                                                <div class="input-group">
                                                    <input type="text" class="form-control form-control-sm" name="txtNombreArchivoCB4" id="txtNombreArchivoCB4" disabled="" maxlength="100">
                                                    <button type="button" id="btnSeleccionarArchivoCB4" class="btn btn-info btn-sm">
                                                        <i class="fa fa-folder-open"></i>
                                                    </button>
                                                </div>
                                            </div>
                                            <input type="hidden" id="txtCvCB4" name="txtCvCB4" value=""> 
                                            <input type="hidden" class="form-control form-control-sm" id="txtNombreFileResultadoActualCB4" name="txtNombreFileResultadoActualCB4" value="">
                                            <input type="hidden" id="txtValidacionArchivoCB4" name="txtValidacionArchivoCB4" value="">
                                            <div id="validarResultadoCB4" class="err-validation-file">Seleccione Adjunto!</div>
                                        </div>
                                        <div class="form-group col-6 mb-3">
                                            <label for="CB5">Absolución Observaciones</label>
                                            <div style="display: inline">
                                                <input id="fileArchivoCB5" name="fileArchivoCB5" type="file" style="display: none">
                                                <div class="input-group">
                                                    <input type="text" class="form-control form-control-sm" name="txtNombreArchivoCB5" id="txtNombreArchivoCB5" disabled="" maxlength="100">
                                                    <button type="button" id="btnSeleccionarArchivoCB5" class="btn btn-info btn-sm">
                                                        <i class="fa fa-folder-open"></i>
                                                    </button>
                                                </div>
                                            </div>
                                            <input type="hidden" id="txtCvCB5" name="txtCvCB5" value=""> 
                                            <input type="hidden" class="form-control form-control-sm" id="txtNombreFileResultadoActualCB5" name="txtNombreFileResultadoActualCB5" value="">
                                            <input type="hidden" id="txtValidacionArchivoCB5" name="txtValidacionArchivoCB5" value="">
                                            <div id="validarResultadoCB5" class="err-validation-file">Seleccione Adjunto!</div>
                                        </div>
                                        <div class="form-group col-6 mb-3">
                                            <label for="CB6">Pronuncia. Entidad</label>
                                            <div style="display: inline">
                                                <input id="fileArchivoCB6" name="fileArchivoCB6" type="file" style="display: none">
                                                <div class="input-group">
                                                    <input type="text" class="form-control form-control-sm" name="txtNombreArchivoCB6" id="txtNombreArchivoCB6" disabled="" maxlength="100">
                                                    <button type="button" id="btnSeleccionarArchivoCB6" class="btn btn-info btn-sm">
                                                        <i class="fa fa-folder-open"></i>
                                                    </button>
                                                </div>
                                            </div>
                                            <input type="hidden" id="txtCvCB6" name="txtCvCB6" value=""> 
                                            <input type="hidden" class="form-control form-control-sm" id="txtNombreFileResultadoActualCB6" name="txtNombreFileResultadoActualCB6" value="">
                                            <input type="hidden" id="txtValidacionArchivoCB6" name="txtValidacionArchivoCB6" value="">
                                            <div id="validarResultadoCB6" class="err-validation-file">Seleccione Adjunto!</div>
                                        </div>
                                        <div class="form-group col-6 mb-3">
                                            <label for="CB7">Pronuncia. OSCE</label>
                                            <div style="display: inline">
                                                <input id="fileArchivoCB7" name="fileArchivoCB7" type="file" style="display: none">
                                                <div class="input-group">
                                                    <input type="text" class="form-control form-control-sm" name="txtNombreArchivoCB7" id="txtNombreArchivoCB7" disabled="" maxlength="100">
                                                    <button type="button" id="btnSeleccionarArchivoCB7" class="btn btn-info btn-sm">
                                                        <i class="fa fa-folder-open"></i>
                                                    </button>
                                                </div>
                                            </div>
                                            <input type="hidden" id="txtCvCB7" name="txtCvCB7" value=""> 
                                            <input type="hidden" class="form-control form-control-sm" id="txtNombreFileResultadoActualCB7" name="txtNombreFileResultadoActualCB7" value="">
                                            <input type="hidden" id="txtValidacionArchivoCB7" name="txtValidacionArchivoCB7" value="">
                                            <div id="validarResultadoCB7" class="err-validation-file">Seleccione Adjunto!</div>
                                        </div>
                                        <div class="form-group col-6 mb-3">
                                            <label for="CB8">Bases Integradas</label>
                                            <div style="display: inline">
                                                <input id="fileArchivoCB8" name="fileArchivoCB8" type="file" style="display: none">
                                                <div class="input-group">
                                                    <input type="text" class="form-control form-control-sm" name="txtNombreArchivoCB8" id="txtNombreArchivoCB8" disabled="" maxlength="100">
                                                    <button type="button" id="btnSeleccionarArchivoCB8" class="btn btn-info btn-sm">
                                                        <i class="fa fa-folder-open"></i>
                                                    </button>
                                                </div>
                                            </div>
                                            <input type="hidden" id="txtCvCB8" name="txtCvCB8" value=""> 
                                            <input type="hidden" class="form-control form-control-sm" id="txtNombreFileResultadoActualCB8" name="txtNombreFileResultadoActualCB8" value="">
                                            <input type="hidden" id="txtValidacionArchivoCB8" name="txtValidacionArchivoCB8" value="">
                                            <div id="validarResultadoCB8" class="err-validation-file">Seleccione Adjunto!</div>
                                        </div>
                                        <div class="form-group col-6 mb-3">
                                            <label for="CB9">Acta de Evaluación Técnica</label>
                                            <div style="display: inline">
                                                <input id="fileArchivoCB9" name="fileArchivoCB9" type="file" style="display: none">
                                                <div class="input-group">
                                                    <input type="text" class="form-control form-control-sm" name="txtNombreArchivoCB9" id="txtNombreArchivoCB9" disabled="" maxlength="100">
                                                    <button type="button" id="btnSeleccionarArchivoCB9" class="btn btn-info btn-sm">
                                                        <i class="fa fa-folder-open"></i>
                                                    </button>
                                                </div>
                                            </div>
                                            <input type="hidden" id="txtCvCB9" name="txtCvCB9" value=""> 
                                            <input type="hidden" class="form-control form-control-sm" id="txtNombreFileResultadoActualCB9" name="txtNombreFileResultadoActualCB9" value="">
                                            <input type="hidden" id="txtValidacionArchivoCB9" name="txtValidacionArchivoCB9" value="">
                                            <div id="validarResultadoCB9" class="err-validation-file">Seleccione Adjunto!</div>
                                        </div>
                                        <div class="form-group col-6 mb-3">
                                            <label for="CB10">Cuadro Comparativo y/o Actas</label>
                                            <div style="display: inline">
                                                <input id="fileArchivoCB10" name="fileArchivoCB10" type="file" style="display: none">
                                                <div class="input-group">
                                                    <input type="text" class="form-control form-control-sm" name="txtNombreArchivoCB10" id="txtNombreArchivoCB10" disabled="" maxlength="100">
                                                    <button type="button" id="btnSeleccionarArchivoCB10" class="btn btn-info btn-sm">
                                                        <i class="fa fa-folder-open"></i>
                                                    </button>
                                                </div>
                                            </div>
                                            <input type="hidden" id="txtCvCB10" name="txtCvCB10" value=""> 
                                            <input type="hidden" class="form-control form-control-sm" id="txtNombreFileResultadoActualCB10" name="txtNombreFileResultadoActualCB10" value="">
                                            <input type="hidden" id="txtValidacionArchivoCB10" name="txtValidacionArchivoCB10" value="">
                                            <div id="validarResultadoCB10" class="err-validation-file">Seleccione Adjunto!</div>
                                        </div>
                                        <div class="form-group col-6 mb-3">
                                            <label for="CB11">Acta Buena Pro</label>
                                            <div style="display: inline">
                                                <input id="fileArchivoCB11" name="fileArchivoCB11" type="file" style="display: none">
                                                <div class="input-group">
                                                    <input type="text" class="form-control form-control-sm" name="txtNombreArchivoCB11" id="txtNombreArchivoCB11" disabled="" maxlength="100">
                                                    <button type="button" id="btnSeleccionarArchivoCB11" class="btn btn-info btn-sm">
                                                        <i class="fa fa-folder-open"></i>
                                                    </button>
                                                </div>
                                            </div>
                                            <input type="hidden" id="txtCvCB11" name="txtCvCB11" value=""> 
                                            <input type="hidden" class="form-control form-control-sm" id="txtNombreFileResultadoActualCB11" name="txtNombreFileResultadoActualCB11" value="">
                                            <input type="hidden" id="txtValidacionArchivoCB11" name="txtValidacionArchivoCB11" value="">
                                            <div id="validarResultadoCB11" class="err-validation-file">Seleccione Adjunto!</div>
                                        </div>
                                        <div class="form-group col-6 mb-3">
                                            <label for="CB12">Notificación Suscripción de Acuerdo</label>
                                            <div style="display: inline">
                                                <input id="fileArchivoCB12" name="fileArchivoCB12" type="file" style="display: none">
                                                <div class="input-group">
                                                    <input type="text" class="form-control form-control-sm" name="txtNombreArchivoCB12" id="txtNombreArchivoCB12" disabled="" maxlength="100">
                                                    <button type="button" id="btnSeleccionarArchivoCB12" class="btn btn-info btn-sm">
                                                        <i class="fa fa-folder-open"></i>
                                                    </button>
                                                </div>
                                            </div>
                                            <input type="hidden" id="txtCvCB12" name="txtCvCB12" value=""> 
                                            <input type="hidden" class="form-control form-control-sm" id="txtNombreFileResultadoActualCB12" name="txtNombreFileResultadoActualCB12" value="">
                                            <input type="hidden" id="txtValidacionArchivoCB12" name="txtValidacionArchivoCB12" value="">
                                            <div id="validarResultadoCB12" class="err-validation-file">Seleccione Adjunto!</div>
                                        </div>
                                        <div class="form-group col-6 mb-3">
                                            <label for="CB13">Resolución de Recurso de Apelación de la Entidad</label>
                                            <div style="display: inline">
                                                <input id="fileArchivoCB13" name="fileArchivoCB13" type="file" style="display: none">
                                                <div class="input-group">
                                                    <input type="text" class="form-control form-control-sm" name="txtNombreArchivoCB13" id="txtNombreArchivoCB13" disabled="" maxlength="100">
                                                    <button type="button" id="btnSeleccionarArchivoCB13" class="btn btn-info btn-sm">
                                                        <i class="fa fa-folder-open"></i>
                                                    </button>
                                                </div>
                                            </div>
                                            <input type="hidden" id="txtCvCB13" name="txtCvCB13" value=""> 
                                            <input type="hidden" class="form-control form-control-sm" id="txtNombreFileResultadoActualCB13" name="txtNombreFileResultadoActualCB13" value="">
                                            <input type="hidden" id="txtValidacionArchivoCB13" name="txtValidacionArchivoCB13" value="">
                                            <div id="validarResultadoCB13" class="err-validation-file">Seleccione Adjunto!</div>
                                        </div>
                                        <div class="form-group col-6 mb-3">
                                            <label for="CB14">Resolución de Recurso de Apelación del Tribunal</label>
                                            <div style="display: inline">
                                                <input id="fileArchivoCB14" name="fileArchivoCB14" type="file" style="display: none">
                                                <div class="input-group">
                                                    <input type="text" class="form-control form-control-sm" name="txtNombreArchivoCB14" id="txtNombreArchivoCB14" disabled="" maxlength="100">
                                                    <button type="button" id="btnSeleccionarArchivoCB14" class="btn btn-info btn-sm">
                                                        <i class="fa fa-folder-open"></i>
                                                    </button>
                                                </div>
                                            </div>
                                            <input type="hidden" id="txtCvCB14" name="txtCvCB14" value=""> 
                                            <input type="hidden" class="form-control form-control-sm" id="txtNombreFileResultadoActualCB14" name="txtNombreFileResultadoActualCB14" value="">
                                            <input type="hidden" id="txtValidacionArchivoCB14" name="txtValidacionArchivoCB14" value="">
                                            <div id="validarResultadoCB14" class="err-validation-file">Seleccione Adjunto!</div>
                                        </div>
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
                                                        <th style="width: 40%" >ACTIVIDAD</th>
                                                        <th style="width: 10%" >FECHA_INICIO</th>
                                                        <th style="width: 10%" >FECHA_FIN</th>
                                                        <th colspan="2" style="width: 20%" >ACCIONES</th>
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
                        <div class="modal-content">
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
                                        <div class="form-group col-12 mb-3">
                                            <label for="txtFechaInicioERCC">FECHA INICIAL</label>
                                            <input class="form-control form-control-sm" id="txtFechaInicioERCC" name="txtFechaInicioERCC" type="text" placeholder="Fecha Inicial"> 
                                        </div>
                                        <div class="form-group col-12 mb-3">
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
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
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
                                            <input class="form-control form-control-sm" id="txtActividadERAC" name="txtActividadERAC" type="text" placeholder="Nombre de Actividad"> 
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
        <script src="<%out.print(getServletContext().getContextPath());%>/js_app/gc/convocatoriabien.js"></script>

    </body>

</html>

