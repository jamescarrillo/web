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
                                    <strong class="text-info">LIBRO DE RECLAMACIONES</strong>
                                </div>
                                <div class="card-body pt-1">
                                    <input type="hidden" id="nameForm" value="FrmLibroReclamo">
                                    <input type="hidden" id="actionLibroReclamo" name="action" value="paginarLibroReclamo">
                                    <input type="hidden" id="numberPageLibroReclamo" name="numberPageLibroReclamo" value="1">
                                    <form id="FrmLibroReclamo">
                                        <div class="row mt-3">
                                            <div class="form-group col-lg-5 col-md-8 col-12 mb-3">
                                                <input type="text" name="txtLibroReclamo" id="txtLibroReclamo" class="form-control form-control-sm" placeholder="USUARIO">
                                            </div>
                                            <div class="input-group col-lg-3 col-md-4 col-12 mb-3">
                                                <select id="comboTipoListaReclamo" name="comboTipoListaReclamo" class="form-control form-control-sm combo-paginar mr-3" idBtnBuscar='btnBuscarLibroReclamo'>
                                                    <option value="-1">TODOS</option>
                                                    <option value="false">SIN RESPONDER</option>
                                                    <option value="true">RESPONDIDOS</option>
                                                    
                                                </select>
                                            </div>
                                            <div class="input-group col-lg-4 col-md-4 col-12 mb-3">
                                                <select id="comboAnio" name="comboAnio" class="form-control form-control-sm combo-paginar mr-3" idBtnBuscar='btnBuscarLibroReclamo'>

                                                </select>
                                                <button type="submit" id="btnBuscarLibroReclamo" class="btn waves-effect waves-light btn-info btn-sm mr-3" data-toggle="tooltip" title="Buscar Usuario" style="height: 31px"><i class="fas fa-search" aria-hidden="true"></i> BUSCAR</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row" id="containerComentarios">
                        
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <div class="card "
                                 style="height: 50px; margin-bottom: 0px">
                                <div class="card-body"
                                     style="padding-top: 10px; padding-bottom: 10px">
                                    <div class="row">
                                        <div class="col-md-2 col-sm-3 col-4">
                                            <select id="sizePageLibroReclamo" name="sizePageLibroReclamo" class="form-control form-control-sm combo-paginar" idBtnBuscar='btnBuscarLibroReclamo'>
                                                <option value="12">12</option>
                                                <option value="15">15</option>
                                                <option value="18">18</option>
                                                <option value="21">21</option>
                                            </select>
                                        </div>
                                        <div class="col-md-10 col-sm-9 col-8">
                                            <nav aria-label="Page navigation example">
                                                <ul id="paginationLibroReclamo"
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
                <div class="modal fade" id="ventanaManLibroReclamo" data-backdrop="static" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-lg modal-dialog-scroll" role="document">
                        <div class="modal-content">
                            <form id="FrmLibroReclamoModal">
                                <div class="modal-header">
                                    <h6 class="modal-title" id="txtTituloModalManLibroReclamo"></h6>
                                    <button type="button" class="close" data-dismiss="modal"
                                            aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body modal-body-scroll">
                                    <div class="row">
                                        <div class="form-group col-12 mb-3">
                                            <label for="txtFechaER">FECHA PUBLICACIÓN</label>
                                            <input type="text" class="form-control form-control-sm" id="txtFechaER" name="txtFechaER" placeholder="DD/MM/AAAA"> 
                                        </div>
                                        <div class="form-group col-12 mb-3">
                                            <label for="txtUsuarioER">NOMBRE DEL INTERESADO</label>
                                            <input class="form-control form-control-sm" id="txtUsuarioER" name="txtUsuarioER" type="text" placeholder="USUARIO INTERESADO" maxlength="200">
                                        </div>
                                        <div class="form-group col-4 mb-3">
                                            <label for="txtTipoDocumentoER">TTIPO DE DOCUMENTO</label>
                                            <input class="form-control form-control-sm" id="txtTipoDocumentoER" name="txtTipoDocumentoER" type="text" placeholder="TIPO DE DOCUMENTO">
                                        </div>
                                        <div class="form-group col-4 mb-3">
                                            <label for="txtDniER">NUMERO DE DOCUMENTO</label>
                                            <input class="form-control form-control-sm" id="txtDniER" name="txtDniER" type="text" placeholder="DNI">
                                        </div>
                                        <div class="form-group col-4 mb-3">
                                            <label for="txtTelefonoER">TELEFONO</label>
                                            <input class="form-control form-control-sm" id="txtTelefonoER" name="txtTelefonoER" type="text" placeholder="TELEFONO">
                                        </div>
                                        <div class="form-group col-12 mb-3">
                                            <label for="txtDomicilioER">DOMICILIO</label>
                                            <input class="form-control form-control-sm" id="txtDomicilioER" name="txtDomicilioER" type="text" placeholder="DOMICILIO">
                                        </div>
                                        <div class="form-group col-12 mb-3">
                                            <label for="txtCorreoER">CORREO</label>
                                            <input class="form-control form-control-sm" id="txtCorreoER" name="txtCorreoER" type="text" placeholder="CORREO">
                                        </div>
                                        <div class="form-group col-12 mb-3">
                                            <label for="txtDescripcionER">CONTENIDO DEL RECLAMO</label>
                                            <textarea class="form-control form-control-sm" id="txtDescripcionER" name="txtDescripcionER" rows="10" placeholder="RECLAMO"></textarea>
                                        </div>
                                        <div class="form-group col-12 mb-3">
                                            <label for="txtRespuestaER">RESPUESTA DEL RECLAMO</label>
                                            <textarea class="form-control form-control-sm" id="txtRespuestaER" name="txtRespuestaER" rows="10" placeholder="RESPUESTA"></textarea>
                                        </div>
                                        <input id="txtNumeroER" name="txtNumeroER" type="hidden" value="">
                                        <input id="txtAnhoER" name="txtAnhoER" type="hidden" value="">
                                        <input id="txtEstadoER" name="txtEstadoER" type="hidden" value="0">
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
                
            <div class="modal fade" id="modalCargandoLibroReclamo" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-hidden="true" style="padding-top: 18%; overflow-y: visible;">
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
    <script src="<%out.print(getServletContext().getContextPath());%>/js_app/gc/libroreclamacion.js"></script>

</body>

</html>