<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="es">
    <head>
        <%@ include file = "../../../att_head.jsp" %> 
        <!-- Bootstrap Core CSS -->
        <link href="<%out.print(getServletContext().getContextPath());%>/assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="<%out.print(getServletContext().getContextPath());%>/assets/plugins/bootstrap-datepicker/bootstrap-datepicker.min.css" rel="stylesheet">
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
            <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="2" stroke-miterlimit="10" /> </svg>
        </div>
        <div id="main-wrapper">
            <header class="topbar">
                <%@ include file = "../../../navbar_gc.jsp" %>
            </header>
            <%@ include file = "../../../menu_gc.jsp" %>
            <div class="page-wrapper">
                <!-- ============================================================== -->
                <!-- Container fluid  -->
                <!-- ============================================================== -->
                <div class="container-fluid">
                    <%@ include file = "../../../row_username.jsp" %>
                    <!-- Start Page Content -->
                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="text-info">FUNCIONARIOS</h4>
                                </div>
                                <input type="hidden" id="nombreFormulario" value="FrmFuncionarios">
                                <div class="card-body pt-0">
                                    <form id="FrmFuncionarios" class="form-material">
                                        <div class="input-group mb-3">
                                            <input type="text" name="txtNombreFuncionario" id="txtNombreFuncionario" class="form-control form-control-sm mr-2" placeholder="NOMBRE">
                                            <button type="button" id="btnBuscarFuncionario" class="btn waves-effect waves-light btn-info btn-sm mr-2" data-toggle="tooltip" title="Buscar Funcionario">BUSCAR</button>
                                            <button type="button" id="btnAbrirNuevoFuncionario" class="btn waves-effect waves-light btn-info btn-sm" data-toggle="tooltip" title="Registrar Funcionario"><i class="fa fa-plus-square" aria-hidden="true"></i></button>
                                        </div>
                                    </form>
                                    <div class="row">
                                        <!--div class="col-12">
                                            <table class="table table-responsive table-bordered table-hover table-sm">
                                                <thead>
                                                    <tr class="table-info">
                                                        <th style="width: 10%;" colspan="2" class="text-center">OPERACIONES</th>
                                                        <th>NOMBRE</th>
                                                    </tr>
                                                </thead>
                                                <tbody id="registrosTabla">

                                                </tbody>
                                            </table>
                                        </div-->
                                        <div class="col-12">
                                            <div class="table-responsive" id="tablaFuncionarios">
                                                <table class="table color-bordered-table muted-bordered-table table-hover">
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
                                            <div class="card " style="height: 50px; margin-bottom: 0px">
                                                <div class="card-body" style="padding-top: 10px; padding-bottom: 10px">
                                                    <div class="row">
                                                        <div class="col-md-2 col-sm-3 col-4">
                                                            <select id="comboTamPagina" name="comboTamPagina" class="form-control form-control-sm select2-single">
                                                                <option value="10">10</option>
                                                                <option value="15">15</option>
                                                                <option value="20">20</option>
                                                            </select>
                                                        </div>
                                                        <div class="col-md-10 col-sm-9 col-8">
                                                            <nav aria-label="Page navigation example">
                                                                <ul id="idPaginacion" class="pagination pagination-sm justify-content-end">

                                                                </ul>
                                                                <input type="hidden" name="NumPagina" id="NumPagina" value="1"> 
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
                        <!--div class="col-12">
                            <div class="accordion" id="accordionExample">
                                <div class="card">
                                    <div class="card-header" id="headingOne">
                                        <h5 class="mb-0">
                                            <button class="btn btn-info" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                                FUNCIONARIOS
                                            </button>
                                        </h5>
                                    </div>

                                    <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
                                        <div class="card-body">
                                            Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                                        </div>
                                    </div>
                                </div>
                                <div class="card">
                                    <div class="card-header" id="headingTwo">
                                        <h5 class="mb-0">
                                            <button class="btn btn-info collapsed" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                                DIRECTIVOS
                                            </button>
                                        </h5>
                                    </div>
                                    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
                                        <div class="card-body">
                                            Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div-->
                    </div>
                    <%@ include file = "../../../temas_gc.jsp" %>
                </div>
                <div class="modal fade" id="ventanaMan" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-lg" role="document">
                        <div class="modal-content">
                            <form id="FrmCargoModal" class="floating-labels">
                                <div class="modal-header">
                                    <h6 class="modal-title" id="txtTituloModalMan"></h6>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body p-0">
                                    <ul class="nav nav-tabs" role="tablist">
                                        <li class="nav-item"> <a class="nav-link active show" data-toggle="tab" href="#home8" role="tab" aria-selected="true"><span><i class="ti-home"></i> DATOS LABORALES</span></a></li>
                                        <li class="nav-item"> <a class="nav-link" data-toggle="tab" href="#profile8" role="tab" aria-selected="false"><span><i class="ti-user"></i></span> DATOS ADICIONALES</a> </li>
                                    </ul>
                                    <div class="tab-content tabcontent-border">
                                        <div class="tab-pane p-20 active show" id="home8" role="tabpanel">
                                            <div class="row">
                                                <div class="form-group col-12 m-b-25">
                                                    <input class="form-control input-sm" id="txtNombreCompletoER" name="txtNombreCompletoER" type="text">
                                                    <span class="bar"></span>
                                                    <label for="txtNombreCompletoER">NOMBRE COMPLETO</label>
                                                </div>
                                                <div class="form-group col-md-6 col-12 m-b-25">
                                                    <input class="form-control input-sm" id="txtDniER" name="txtDniER" type="text">
                                                    <span class="bar"></span>
                                                    <label for="txtDniER">DNI</label>
                                                </div>
                                                <div class="form-group col-md-6">
                                                    <input type="text" class="form-control input-sm" id="mydatepicker1" placeholder="">
                                                    <span class="bar"></span>
                                                    <label for="mdate">FECHA DESIGNACIÓN</label>
                                                </div>
                                                <div class="form-group col-12 m-b-25">
                                                    <input class="form-control input-sm" id="txtDesignadoPorER" name="txtDesignadoPorER" type="text">
                                                    <span class="bar"></span>
                                                    <label for="txtDesignadoPorER">DESIGNADO POR</label>
                                                </div>
                                                <div class="form-group col-12 m-b-25">
                                                    <select id="comboOficinaER" name="comboOficinaER" class="form-control input-sm p-0">
                                                        <option value=""></option>
                                                        <option value="1">SI</option>
                                                        <option value="0">NO</option>
                                                    </select>
                                                    <span class="bar"></span>
                                                    <label for="comboOficinaER">OFICINA</label>
                                                </div>
                                                <div class="form-group col-md-6 col-12 m-b-25">
                                                    <input class="form-control input-sm" id="txtCargoER" name="txtCargoER" type="text">
                                                    <span class="bar"></span>
                                                    <label for="txtCargoER">CARGO</label>
                                                </div>
                                                <div class="form-group col-md-6 col-12 m-b-25">
                                                    <input class="form-control input-sm" id="txtNivelER" name="txtNivelER" type="text">
                                                    <span class="bar"></span>
                                                    <label for="txtNivelER">NIVEL</label>
                                                </div>
                                                <div class="form-group col-md-6 col-12 m-b-25">
                                                    <input class="form-control input-sm" id="txtRegimenLaboralER" name="txtRegimenLaboralER" type="text">
                                                    <span class="bar"></span>
                                                    <label for="txtRegimenLaboralER">REGIMEN LABORAL</label>
                                                </div>
                                                <div class="form-group col-md-6 col-12 m-b-25">
                                                    <input class="form-control input-sm" id="txtRetribucionMensualER" name="txtRetribucionMensualER" type="text">
                                                    <span class="bar"></span>
                                                    <label for="txtRetribucionMensualER">RETRIBUCIÓN MENSUAL</label>
                                                </div>

                                            </div>
                                        </div>
                                        <div class="tab-pane p-20" id="profile8" role="tabpanel">
                                            <div class="row">
                                                <div class="form-group col-md-8 col-12 m-b-25">
                                                    <input class="form-control input-sm" id="txtProfesionER" name="txtProfesionER" type="text">
                                                    <span class="bar"></span>
                                                    <label for="txtProfesionER">PROFESIÓN</label>
                                                </div>
                                                <div class="form-group col-md-4 col-sm-6 col-12 m-b-25">
                                                    <input class="form-control input-sm" id="txtTelefonoER" name="txtTelefonoER" type="text">
                                                    <span class="bar"></span>
                                                    <label for="txtTelefonoER">TELÉFONO</label>
                                                </div>
                                                <div class="form-group col-md-4 col-sm-6 col-12 m-b-25">
                                                    <input class="form-control input-sm" id="txtFaxER" name="txtFaxER" type="text">
                                                    <span class="bar"></span>
                                                    <label for="txtFaxER">FAX</label>
                                                </div>
                                                <div class="form-group col-md-4 col-sm-6 col-12 m-b-25">
                                                    <input class="form-control input-sm" id="txtEmailER" name="txtEmailER" type="text">
                                                    <span class="bar"></span>
                                                    <label for="txtEmailER">EMAIL</label>
                                                </div>
                                                <div class="form-group col-md-4 col-sm-6 col-12 m-b-25">
                                                    <select id="comboDestacadoER" name="comboDestacadoER" class="form-control input-sm p-0" style="height: 45px;">
                                                        <option></option>
                                                        <option value="1">SI</option>
                                                        <option value="0">NO</option>
                                                    </select>
                                                    <span class="bar"></span>
                                                    <label for="comboDestacadoER">DESTACADO</label>
                                                </div>
                                                <div class="col-12">
                                                    <div class="form-group">
                                                        <label for="">HOJA DE VIDA (PDF)</label>
                                                        <div style="display: inline">
                                                            <input id="fileCV" name="fileCV" type="file" style="display: none" >
                                                            <div class="input-group">
                                                                <input type="text" class="form-control input-sm" id="txtNombreCv" disabled="">
                                                                <button type="button" id="btnSeleccionarCv" class="btn btn-info btn-sm"><i class="fa fa-folder-open"></i></button>
                                                            </div>
                                                        </div>
                                                        <div class="text-center">
                                                            <small>Seleccione Archivo < 1000 KB</small>
                                                            <input type="hidden" id="txtCv" name="txtCv" value="">
                                                            <input type="hidden" class="form-control form-control-sm" id="txtNombreFileResultadoActual" name="txtNombreFileResultadoActual" value="">
                                                            <input type="hidden" id="txtValidacionCv" name="txtValidacionCv" value="">
                                                            <div id="validarResultado" class="err-validation-file">Seleccione Adjunto!</div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group col-12">
                                                    <div class="row justify-content-sm-center">
                                                        <div class="col-sm-4 col-12 text-center">
                                                            <div class="card border-primary borde-redondeado mb-2">
                                                                <div class="card-body p-2">
                                                                    <div class="text-center">
                                                                        <img id="visorFoto" src='<%out.print(getServletContext().getContextPath());%>/peam_resources_app/conf_app/img/default_user.png' alt="user-img" class="rounded mx-auto d-block" style="width: 80px; height: 80px">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <button type="button" id="btnEliminarFoto" class="btn btn-secondary btn-sm"><i class="fa fa-trash"></i></button>
                                                            <div style="display: inline">
                                                                <input id="fileFoto" name="fileFoto" type="file" style="display: none" >
                                                                <button type="button" id="btnSeleccionarFoto" class="btn btn-info btn-sm"><i class="fa fa-folder-open"></i></button>
                                                                <input type="hidden" id="txtNombreFoto" name="txtNombreFoto" value="">
                                                                <input type="hidden" id="txtValidacionFoto" name="txtValidacionFoto" value="">
                                                            </div>
                                                            <br>
                                                            <small>Seleccione Foto < 1000 KB</small>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <input type="hidden" id="txtIdFuncionarioER" name="txtIdFuncionarioER" value="">
                                    <input type="hidden" id="accionModal" name="accion" value="">
                                    <div class="clearfix"></div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-outline-secondary btn-sm" data-dismiss="modal">CANCELAR</button>
                                    <button type="submit" id="btnGuardar" class="btn btn-outline-info btn-sm"><i class="fa fa-floppy-o"></i> GUARDAR</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="modal fade" id="modalCargando" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-hidden="true" style="padding-top:18%; overflow-y:visible;">
                    <div class="modal-dialog modal-sm">
                        <div class="modal-content">
                            <div class="modal-body">
                                <div class="progress" style="margin-bottom: 0px;">
                                    <div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar"
                                         aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width:100%">
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

        <script src="<%out.print(getServletContext().getContextPath());%>/js_app/utilities/lib-utilities.js"></script>
        <script src="<%out.print(getServletContext().getContextPath());%>/js_app/utilities/lib-validaciones.js"></script>

        <script src="<%out.print(getServletContext().getContextPath());%>/js_app/directivos.js"></script>

    </body>

</html>