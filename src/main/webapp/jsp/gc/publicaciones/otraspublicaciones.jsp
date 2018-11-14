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
                                    <strong class="text-info">OTRAS PUBLICACIONES</strong>
                                </div>
                                <div class="card-body pt-1">
                                    <div class="modal-body p-0">

                                        <div class="tab-content tabcontent-border">

                                            <input type="hidden" id="nameForm" value="FrmPublicacion">
                                            <input type="hidden" id="actionPublicacion" name="action" value="paginarPublicacion">
                                            <input type="hidden" id="numberPagePublicacion" name="numberPagePublicacion" value="1">
                                            <form id="FrmPublicacion">
                                                <div class="row mt-3">
                                                    <div class="form-group col-lg-6 col-12 mb-3">
                                                        <input type="text" name="txtTituloPublicacion" id="txtTituloPublicacion" class="form-control form-control-sm" placeholder="DESCRIPCION">
                                                    </div>
                                                    <div class="form-group col-lg-2 col-md-6 col-12 mb-3">
                                                        <select id="comboAnioPublicacion" name="comboAnioPublicacion" class="form-control form-control-sm combo-paginar mr-3" idBtnBuscar='btnBuscarPublicacion'>

                                                        </select>
                                                    </div>
                                                    <div class="input-group col-lg-4 col-md-6 col-12 mb-3">
                                                        <select id="comboTipoListaPublicacion" name="comboTipoListaPublicacion" class="form-control form-control-sm combo-paginar mr-3" idBtnBuscar='btnBuscarPublicacion'>
                                                            <option value="-1">TODOS</option>
                                                            <option value="true">PUBLICOS</option>
                                                            <option value="false">NO PUBLICOS</option>
                                                        </select>
                                                        <button type="submit" id="btnBuscarPublicacion" class="btn waves-effect waves-light btn-info btn-sm mr-3" data-toggle="tooltip" title="Buscar Publicacion" style="height: 31px"><i class="fas fa-search" aria-hidden="true"></i> BUSCAR</button>
                                                        <button type="button" id="btnAbrirNuevoPublicacion" class="btn waves-effect waves-light btn-info btn-sm" data-toggle="tooltip" title="Agregar Publicacion" style="height: 31px"><i class="fa fa-plus-square" aria-hidden="true"></i></button>
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
                                                                    <th style="width: 10%" class="text-medium-table">AÑO</th>
                                                                    <th style="width: 45%" class="text-medium-table">TITULO</th>
                                                                    <th style="width: 45%" class="text-medium-table">DESCRIPCION</th>
                                                                    <th colspan="4" class="text-medium-table">ACCIONES</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody id="tbodyPublicacion">
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
                                                                    <select id="sizePagePublicacion" name="sizePagePublicacion" class="form-control form-control-sm combo-paginar" idBtnBuscar='btnBuscarPublicacion'>
                                                                        <option value="10">10</option>
                                                                        <option value="15">15</option>
                                                                        <option value="20">20</option>
                                                                    </select>
                                                                </div>
                                                                <div class="col-md-10 col-sm-9 col-8">
                                                                    <nav aria-label="Page navigation example">
                                                                        <ul id="paginationPublicacion"
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
            <div class="modal fade" id="ventanaManPublicacion" data-backdrop="static" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg modal-dialog-scroll" role="document">
                    <div class="modal-content">
                        <form id="FrmPublicacionModal">
                            <div class="modal-header">
                                <h6 class="modal-title" id="txtTituloModalManPublicacion"></h6>
                                <button type="button" class="close" data-dismiss="modal"
                                        aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body modal-body-scroll">
                                <div class="row">
                                    <div class="form-group text-left col-9 mb-3">
                                        <label for="txtDocu_idPublicacionER">ASIGNAR REGISTRO (ARDIG)</label>
                                        <input type="hidden" class="form-control form-control-sm" id="txtDocu_idPublicacionER" name="txtDocu_idPublicacionER" placeholder="Documento"> 
                                    </div>
                                    <div class="form-group text-right col-3 mb-3">
                                        <button type="button" id="btnAbrirVerArcdig" class="btn waves-effect waves-light btn-info btn-sm"><i class="fa fa-floppy-o"></i> BUSCAR DOCUMENTO</button>
                                    </div>
                                    <div class="form-group col-12 mb-3">
                                        <label for="txtFechaPublicacionER">FECHA</label>
                                        <input type="text" class="form-control form-control-sm " id="txtFechaPublicacionER" name="txtFechaPublicacionER" placeholder="DD/MM/AAAA"> 
                                    </div>
                                    <div class="form-group col-12 mb-3">
                                        <label for="txtTituloER">TITULO</label>
                                        <input type="text" class="form-control form-control-sm" id="txtTituloER" name="txtTituloER" placeholder="Titulo"> 
                                    </div>
                                    <div class="form-group col-12 mb-3">
                                        <label for="txtDescripcionER">DESCRIPCION</label>
                                        <textarea class="form-control form-control-sm" id="txtDescripcionER" name="txtDescripcionER" rows="5" placeholder="Descripcion" maxlength="200"></textarea>
                                    </div>
                                    <div class="form-group col-12 mb-3">
                                        <label for="txtEstadoPublicacionER">ESTADO DEL PRESUPUESTO</label>
                                        <select id="txtEstadoPublicacionER" name="txtEstadoPublicacionER" class="form-control form-control-sm">
                                            <option value="-1">Seleccione...</option>
                                            <option value="true">PUBLICO</option>
                                            <option value="false">OCULTO</option>
                                        </select>
                                    </div>
                                    <input type="hidden" name="txtIdPublicacionER" id="txtIdPublicacionER">
                                    <input type="hidden" name="txtAnhoER" id="txtAnhoER">
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

            <%@ include file="../publicaciones/publicacion_arcdig.jsp"%>

            <div class="modal fade" id="modalCargandoPublicacion" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-hidden="true" style="padding-top: 18%; overflow-y: visible;">
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
        <script src="<%out.print(getServletContext().getContextPath());%>/js_app/gc/publicacion.js"></script>
        <script src="<%out.print(getServletContext().getContextPath());%>/js_app/gc/publicacion_arcdig.js"></script>

    </body>
</html>