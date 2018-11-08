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
                                    <strong class="text-info">OBRAS Y PROYECTOS</strong>
                                </div>
                                <div class="card-body pt-1">
                                    <input type="hidden" id="nameForm" value="FrmObra">
                                    <input type="hidden" id="actionObra" name="action" value="paginarObra">
                                    <input type="hidden" id="numberPageObra" name="numberPageObra" value="1">
                                    <form id="FrmObra">
                                        <div class="row mt-3">
                                            <div class="form-group col-lg-7 col-md-8 col-12 mb-3">
                                                <input type="text" name="txtObra" id="txtObra" class="form-control form-control-sm" placeholder="DESCRIPCION">
                                            </div>
                                            <div class="input-group col-lg-5 col-md-4 col-12 mb-3">
                                                <select id="comboAnio" name="comboAnio" class="form-control form-control-sm combo-paginar mr-3" idBtnBuscar='btnBuscarObra'>

                                                </select>
                                                <button type="submit" id="btnBuscarObra" class="btn waves-effect waves-light btn-info btn-sm mr-3" data-toggle="tooltip" title="Buscar Obra" style="height: 31px"><i class="fas fa-search" aria-hidden="true"></i> BUSCAR</button>
                                                <button type="button" id="btnAbrirNuevoObra" class="btn waves-effect waves-light btn-info btn-sm" data-toggle="tooltip" title="Registrar Obra" style="height: 31px"><i class="fa fa-plus-square" aria-hidden="true"></i></button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row" id="containerRegistrosObra">

                    </div>
                    <div class="row">
                        <div class="col-12">
                            <div class="card "
                                 style="height: 50px; margin-bottom: 0px">
                                <div class="card-body"
                                     style="padding-top: 10px; padding-bottom: 10px">
                                    <div class="row">
                                        <div class="col-md-2 col-sm-3 col-4">
                                            <select id="sizePageObra" name="sizePageObra" class="form-control form-control-sm combo-paginar" idBtnBuscar='btnBuscarObra'>
                                                <option value="12">12</option>
                                                <option value="15">15</option>
                                                <option value="18">18</option>
                                                <option value="21">21</option>
                                            </select>
                                        </div>
                                        <div class="col-md-10 col-sm-9 col-8">
                                            <nav aria-label="Page navigation example">
                                                <ul id="paginationObra"
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
                <div class="modal fade" id="ventanaManObra" data-backdrop="static" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-lg modal-dialog-scroll" role="document">
                        <div class="modal-content">
                            <form id="FrmObraModal">
                                <div class="modal-header">
                                    <h6 class="modal-title" id="txtTituloModalManObra"></h6>
                                    <button type="button" class="close" data-dismiss="modal"
                                            aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body p-0 modal-body-scroll">
                                    <ul class="nav nav-tabs" role="tablist">
                                        <li class="nav-item">
                                            <a id="d1" class="nav-link active show" id="idItemDL" data-toggle="tab" href="#datos1" role="tab" aria-selected="true"><span> PARTE 1 </span></a>
                                        </li>
                                        <li class="nav-item"><a id="d2" class="nav-link" data-toggle="tab" href="#datos2" role="tab" aria-selected="false"><span> PARTE 2 </span></a></li>
                                    </ul>
                                    <div class="tab-content tabcontent-border">
                                        <div class="tab-pane p-20 active show" id="datos1" role="tabpanel">
                                            <div class="row">
                                                <div class="form-group col-12 mb-3">
                                                    <label for="comboAreaER">DIRECCION/OBRA</label>
                                                    <select id="comboAreaER" name="comboAreaER" class="form-control form-control-sm">
                                                        <option value="-1">Seleccione...</option>
                                                        <option value="1">Dirección de Infraestructura</option>
                                                        <option value="2">Dirección de Manejo Ambiental</option>
                                                        <option value="3">Dirección de Desarrollo Agropecuario</option>
                                                    </select>
                                                </div>
                                                <div class="form-group col-12 mb-3">
                                                    <label for="txtDescripcionER">NOMBRA DE LA OBRA</label>
                                                    <textarea class="form-control form-control-sm" id="txtDescripcionER" name="txtDescripcionER" rows="3" placeholder="Descripcion"></textarea>
                                                </div>
                                                <div class="form-group col-6 mb-3">
                                                    <label for="txtMontoInversionER">MONTO DE INVERSION</label>
                                                    <input class="form-control form-control-sm" id="txtMontoInversionER" name="txtMontoInversionER" type="text" placeholder="Monto de la Inversion" maxlength="200">
                                                </div>
                                                <div class="form-group col-6 mb-3">
                                                    <label for="txtMontoGastadoER">MONTO GASTADO</label>
                                                    <input class="form-control form-control-sm" id="txtMontoGastadoER" name="txtMontoGastadoER" type="text" placeholder="Monto gastado" maxlength="200">
                                                </div>
                                                <div class="form-group col-6 mb-3">
                                                    <label for="txtFechaInicioER">FECHA INICIO</label>
                                                    <input class="form-control form-control-sm" id="txtFechaInicioER" name="txtFechaInicioER" type="text" placeholder="Fecha de Inicio" maxlength="200">
                                                </div>
                                                <div class="form-group col-6 mb-3">
                                                    <label for="txtFechaFinER">FECHA FIN</label>
                                                    <input class="form-control form-control-sm" id="txtFechaFinER" name="txtFechaFinER" type="text" placeholder="Fecha Fin" maxlength="200">
                                                </div>
                                                <div class="form-group col-6 mb-3">
                                                    <label for="txtMesActualizacionER">MES ACTUALIZACION</label>
                                                    <select class="form-control form-control-sm" id="txtMesActualizacionER" name="txtMesActualizacionER">
                                                        <option value="-1">Seleccione...</option>
                                                        <option value="Enero">Enero</option>
                                                        <option value="Febrero">Febrero</option>
                                                        <option value="Marzo">Marzo</option>
                                                        <option value="Abril">Abril</option>
                                                        <option value="Mayo">Mayo</option>
                                                        <option value="Junio">Junio</option>
                                                        <option value="Julio">Julio</option>
                                                        <option value="Agosto">Agosto</option>
                                                        <option value="Septiembre">Septiembre</option>
                                                        <option value="Octubre">Octubre</option>
                                                        <option value="Noviembre">Noviembre</option>
                                                        <option value="Diciembre">Diciembre</option>
                                                    </select>
                                                </div>
                                                <div class="form-group col-6 mb-3">
                                                    <label for="txtAnhoActualizacionER">AÑO ACTUALIZACION</label>
                                                    <select class="form-control form-control-sm" id="txtAnhoActualizacionER" name="txtAnhoActualizacionER">
                                                        
                                                    </select>
                                                </div>
                                                <div class="form-group col-6 mb-3">
                                                    <label for="txtTiempoEjecucionER">TIEMPO DE EJECUCION</label>
                                                    <input class="form-control form-control-sm" id="txtTiempoEjecucionER" name="txtTiempoEjecucionER" type="text" placeholder="(DIAS)" maxlength="200">
                                                </div>
                                                <div class="form-group col-6 mb-3">
                                                    <label for="txtModalidadEjecucionER">MODALIDAD DE EJECUCION</label>
                                                    <input class="form-control form-control-sm" id="txtModalidadEjecucionER" name="txtModalidadEjecucionER" type="text" placeholder="Modalidad" maxlength="200">
                                                </div>
                                                <div class="form-group col-4 mb-3">
                                                    <label for="comboSeguimientoER">ESTADO DE LA OBRA</label>
                                                    <select class="form-control form-control-sm" id="comboSeguimientoER" name="comboSeguimientoER">
                                                        <option value="-1">Seleccione...</option>
                                                        <option value="Finalizado">Finalizado</option>
                                                        <option value="En Ejecucion">En Ejecución</option>
                                                    </select>
                                                </div>
                                                <div class="form-group col-4 mb-3">
                                                    <label for="txtAvanceFisicoER">AVANCE FISICO (%)</label>
                                                    <input class="form-control form-control-sm" id="txtAvanceFisicoER" name="txtAvanceFisicoER" type="text" placeholder="Avance" maxlength="200">
                                                </div>
                                                <div class="form-group col-4 mb-3">
                                                    <label for="txtSnipER">SNIP DE LA OBRA</label>
                                                    <input class="form-control form-control-sm" id="txtSnipER" name="txtSnipER" type="text" placeholder="SNIP" maxlength="200">
                                                </div>
                                                <div class="form-group col-12 mb-3">
                                                    <label for="txtUbicacionER">UBICACION DE LA OBRA</label>
                                                    <input class="form-control form-control-sm" id="txtUbicacionER" name="txtUbicacionER" type="text" placeholder="Ubicacion">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tab-pane p-20" id="datos2" role="tabpanel">
                                            <div class="row">
                                                <div class="form-group col-12 mb-3">
                                                    <label for="txtContratistaER">CONTRATISTA DE LA OBRA</label>
                                                    <input class="form-control form-control-sm" id="txtContratistaER" name="txtContratistaER" type="text" placeholder="Contratista">
                                                </div>
                                                <div class="form-group col-12 mb-3">
                                                    <label for="txtSuppervisorER">SUPERVISOR DE LA OBRA</label>
                                                    <input class="form-control form-control-sm" id="txtSuppervisorER" name="txtSuppervisorER" type="text" placeholder="Supervisor">
                                                </div>
                                                <div class="form-group col-12 mb-3">
                                                    <label for="txtResidenteER">RESIDENTE DE LA OBRA</label>
                                                    <input class="form-control form-control-sm" id="txtResidenteER" name="txtResidenteER" type="text" placeholder="Residente">
                                                </div>
                                                <div class="form-group col-12 mb-3">
                                                    <label for="txtInfobrasER">LINK INFOBRAS</label>
                                                    <input class="form-control form-control-sm" id="txtInfobrasER" name="txtInfobrasER" type="text" placeholder="Infobras">
                                                </div>
                                                <div class="form-group col-12 mb-3">
                                                    <label for="txtGaleriaER">GALERIA (FLICKR)</label>
                                                    <input class="form-control form-control-sm" id="txtGaleriaER" name="txtGaleriaER" type="text" placeholder="Galeria">
                                                </div>
                                                <div class="form-group col-12 mb-3">
                                                    <label for="txtFotoER">FOTO MUESTRA (FLICKR)</label>
                                                    <input class="form-control form-control-sm" id="txtFotoER" name="txtFotoER" type="text" placeholder="Foto">
                                                </div>
                                                <div class="form-group col-12 mb-3">
                                                    <label for="txtLeyendaER">LEYENDA (FOTO)</label>
                                                    <input class="form-control form-control-sm" id="txtLeyendaER" name="txtLeyendaER" type="text" placeholder="Leyenda">
                                                </div>
                                                <div class="form-group col-12 mb-3">
                                                    <label for="txtObservacionER">OBSERVACION</label>
                                                    <textarea class="form-control form-control-sm" id="txtObservacionER" name="txtObservacionER" rows="3" placeholder="Observacion"></textarea>
                                                </div>
                                                <input id="txtIdER" name="txtIdER" type="hidden" value="">
                                                <input id="txtEstadoObraER" name="txtEstadoObraER" type="hidden" value="0">
                                            </div>
                                        </div>
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
                <div class="modal fade" id="ventanaVistaPreviaObra" data-backdrop="static" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
                                                    <h3 class="text-peam-negrita" style="margin-bottom: 30px" id="tituloObraVP">First title goes here</h3>
                                                    <p class="text-peam" style="margin-bottom: 100px" id="resumenObraVP">this is the subcontent you can use this</p>
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
            <div class="modal fade" id="modalCargandoObra" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-hidden="true" style="padding-top: 18%; overflow-y: visible;">
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
    <script src="<%out.print(getServletContext().getContextPath());%>/js_app/gc/obra.js"></script>

</body>

</html>

