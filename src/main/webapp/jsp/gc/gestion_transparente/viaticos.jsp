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
                                    <strong class="text-info">VIATICOS</strong>
                                </div>
                                <div class="card-body pt-1">
                                    <div class="modal-body p-0">

                                        <div class="tab-content tabcontent-border">

                                            <input type="hidden" id="nameForm" value="FrmViatico">
                                            <input type="hidden" id="actionViatico" name="action" value="paginarViatico">
                                            <input type="hidden" id="numberPageViatico" name="numberPageViatico" value="1">
                                            <form id="FrmViatico">
                                                <div class="row mt-3">
                                                    <div class="form-group col-lg-8 col-12 mb-3">
                                                        <input type="text" name="txtTituloViatico" id="txtTituloViatico" class="form-control form-control-sm" placeholder="RUTA O USUARIOS">
                                                    </div>
                                                    <div class="input-group col-lg-4 col-md-6 col-12 mb-3">
                                                        <select id="comboAnioViatico" name="comboAnioViatico" class="form-control form-control-sm combo-paginar mr-3" idBtnBuscar='btnBuscarViatico'>
                                                        </select>
                                                        <button type="submit" id="btnBuscarViatico" class="btn waves-effect waves-light btn-info btn-sm mr-3" data-toggle="tooltip" title="Buscar Viatico" style="height: 31px"><i class="fas fa-search" aria-hidden="true"></i> BUSCAR</button>
                                                        <button type="button" id="btnAbrirNuevoViatico" class="btn waves-effect waves-light btn-info btn-sm" data-toggle="tooltip" title="Agregar Viatico" style="height: 31px"><i class="fa fa-plus-square" aria-hidden="true"></i></button>
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
                                                                    <th style="width: 25%" class="text-medium-table">AREA</th>
                                                                    <th style="width: 25%" class="text-medium-table">USUARIO</th>
                                                                    <th style="width: 8%" class="text-medium-table">SALIDA</th>
                                                                    <th style="width: 8%" class="text-medium-table">RETORNO</th>
                                                                    <th style="width: 25%" class="text-medium-table">RUTA</th>
                                                                    <th style="width: 8%" class="text-medium-table">PASAJE</th>
                                                                    <th style="width: 8%" class="text-medium-table">VIATICO</th>
                                                                    <th colspan="2" class="text-medium-table">ACCIONES</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody id="tbodyViatico">
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
                                                                    <select id="sizePageViatico" name="sizePageViatico" class="form-control form-control-sm combo-paginar" idBtnBuscar='btnBuscarViatico'>
                                                                        <option value="10">10</option>
                                                                        <option value="15">15</option>
                                                                        <option value="20">20</option>
                                                                    </select>
                                                                </div>
                                                                <div class="col-md-10 col-sm-9 col-8">
                                                                    <nav aria-label="Page navigation example">
                                                                        <ul id="paginationViatico"
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
                    <%@ include file="../../../temas_gc.jsp"%>
                </div>
            </div>
            <div class="modal fade" id="ventanaManViatico" data-backdrop="static" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg modal-dialog-scroll" role="document">
                    <div class="modal-content">
                        <form id="FrmViaticoModal">
                            <div class="modal-header">
                                <h6 class="modal-title" id="txtTituloModalManViatico"></h6>
                                <button type="button" class="close" data-dismiss="modal"
                                        aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body modal-body-scroll">
                                <div class="row">
                                    <div class="form-group col-6 mb-3">
                                        <label for="txtFechaSalidaER">FECHA SALIDA</label>
                                        <input type="text" class="form-control form-control-sm " id="txtFechaSalidaER" name="txtFechaSalidaER" placeholder="DD/MM/AAAA"> 
                                    </div>
                                    <div class="form-group col-6 mb-3">
                                        <label for="txtFechaRetornoER">FECHA RETORNO</label>
                                        <input type="text" class="form-control form-control-sm " id="txtFechaRetornoER" name="txtFechaRetornoER" placeholder="DD/MM/AAAA"> 
                                    </div>
                                    <div class="form-group col-6 mb-3">
                                        <label for="comboTipoViaticoER">TIPO DE VIATICO</label>
                                        <select id="comboTipoViaticoER" name="comboTipoViaticoER" class="form-control form-control-sm">
                                            <option value="-1">Seleccione...</option>
                                            <option value="Nacional">NACIONAL</option>
                                            <option value="Regional">REGIONAL</option>
                                        </select>
                                    </div>
                                    <div class="form-group col-6 mb-3">
                                        <label for="comboModalidadER">MODALIDAD</label>
                                        <select id="comboModalidadER" name="comboModalidadER" class="form-control form-control-sm">
                                            <option value="-1">Seleccione...</option>
                                            <option value="Aereo">AEREO</option>
                                            <option value="Terrestre/Aereo">TERRESTRE/AEREO</option>
                                            <option value="Terrestre">TERRESTRE</option>
                                            <option value="Fluvial">FLUVIAL</option>
                                        </select>
                                    </div>
                                    <div class="form-group col-6 mb-3">
                                        <label for="txtAreaOficinaER">OFICINA</label>
                                        <input type="text" class="form-control form-control-sm " id="txtAreaOficinaER" name="txtAreaOficinaER" placeholder="Oficina"> 
                                    </div>
                                    <div class="form-group col-6 mb-3">
                                        <label for="txtUsuariosER">USUARIO</label>
                                        <input type="text" class="form-control form-control-sm " id="txtUsuariosER" name="txtUsuariosER" placeholder="Usuarios"> 
                                    </div>
                                    <div class="form-group col-6 mb-3">
                                        <label for="txtFuenteFinanciamientoER">FINANCIAMINETO</label>
                                        <input type="text" class="form-control form-control-sm " id="txtFuenteFinanciamientoER" name="txtFuenteFinanciamientoER" placeholder="Fuente"> 
                                    </div>
                                    <div class="form-group col-6 mb-3">
                                        <label for="txtAutorizacionViajeER">AUTORIZACION DE VIAJE</label>
                                        <input type="text" class="form-control form-control-sm " id="txtAutorizacionViajeER" name="txtAutorizacionViajeER" placeholder="Autorizacion"> 
                                    </div>
                                    <div class="form-group col-12 mb-3">
                                        <label for="txtRutaER">RUTA</label>
                                        <input type="text" class="form-control form-control-sm" id="txtRutaER" name="txtRutaER" placeholder="Ruta"> 
                                    </div>
                                    <div class="form-group col-6 mb-3">
                                        <label for="txtCostoPasajesER">COSTOS PASAJES</label>
                                        <input type="text" class="form-control form-control-sm " id="txtCostoPasajesER" name="txtCostoPasajesER" placeholder="Costos"> 
                                    </div>
                                    <div class="form-group col-6 mb-3">
                                        <label for="txtViaticosER">VIATICOS</label>
                                        <input type="text" class="form-control form-control-sm " id="txtViaticosER" name="txtViaticosER" placeholder="Viaticos"> 
                                    </div>
                                    <input type="hidden" name="txtIdER" id="txtIdER">
                                    <input type="hidden" name="txtEstadoViaticoER" id="txtEstadoViaticoER" value="true">
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

            <div class="modal fade" id="modalCargandoViatico" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-hidden="true" style="padding-top: 18%; overflow-y: visible;">
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

        <script src="<%out.print(getServletContext().getContextPath());%>/js/jquery.Pagination.min.js"></script>
        <script src="<%out.print(getServletContext().getContextPath());%>/js_app/utilities/lib-utilities.js"></script>
        <script src="<%out.print(getServletContext().getContextPath());%>/js_app/utilities/lib-validaciones.js"></script>
        <script src="<%out.print(getServletContext().getContextPath());%>/js_app/gc/viaticos.js"></script>

    </body>
</html>
