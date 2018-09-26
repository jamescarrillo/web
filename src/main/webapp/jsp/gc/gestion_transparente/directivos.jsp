<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="es">
    <head>
        <%@ include file = "../../../att_head.jsp" %> 
        <!-- Bootstrap Core CSS -->
        <link href="<%out.print(getServletContext().getContextPath());%>/assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <!-- Custom CSS -->
        <link href="<%out.print(getServletContext().getContextPath());%>/css/style.css" rel="stylesheet">
        <link href="<%out.print(getServletContext().getContextPath());%>/css/views/estilos.css" rel="stylesheet">
        <!-- You can change the theme colors from here -->
        <link href="<%out.print(getServletContext().getContextPath());%>/css/colors/blue.css" id="theme" rel="stylesheet">
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
                            <form id="FrmCargoModal" class="form-material">
                                <div class="modal-header">
                                    <h6 class="modal-title" id="txtTituloModalMan"></h6>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <div class="row">
                                        <div class="form-group col-md-3 col-12">
                                            <input class="form-control form-control-sm" id="txtDniER" name="txtDniER" type="text" placeholder="DNI">
                                            <div id="validarNombre" class="err-validation">Ingrese Campo</div>
                                        </div>
                                        <div class="form-group col-md-9 col-12">
                                            <input class="form-control form-control-sm" id="txtNombreCompletoER" name="txtNombreCompletoER" type="text" placeholder="NOMBRE COMPLETO">
                                            <div id="validarNombre" class="err-validation">Ingrese Campo</div>
                                        </div>
                                        <div class="form-group col-md-6 col-12">
                                            <input class="form-control form-control-sm" id="txtCargoER" name="txtCargoER" type="text" placeholder="CARGO">
                                            <div id="validarCargo" class="err-validation">Ingrese Campo</div>
                                        </div>
                                        <div class="form-group col-md-6 col-12">
                                            <input class="form-control form-control-sm" id="txtOficinaER" name="txtOficinaER" type="text" placeholder="OFICINA">
                                            <div id="validarCargo" class="err-validation">Ingrese Campo</div>
                                        </div>
                                        <div class="form-group col-md-6 col-12">
                                            <input class="form-control form-control-sm" id="txtNivelER" name="txtNivelER" type="text" placeholder="NIVEL">
                                            <div id="validarCargo" class="err-validation">Ingrese Campo</div>
                                        </div>
                                        <div class="form-group col-md-6 col-12">
                                            <input class="form-control form-control-sm" id="txtRegimenLaboralER" name="txtRegimenLaboralER" type="text" placeholder="REGIMEN LABORAL">
                                            <div id="validarCargo" class="err-validation">Ingrese Campo</div>
                                        </div>
                                    </div>
                                    <input type="hidden" id="txtIdFuncionarioER" name="txtIdFuncionarioER" value="">
                                    <input type="hidden" id="accionModal" name="accion" value="">
                                    <div class="clearfix"></div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-outline-secondary btn-sm" data-dismiss="modal">CANCELAR</button>
                                    <button type="submit" id="btnGuardar" class="btn btn-outline-primary btn-sm"><i class="fa fa-floppy-o"></i> GUARDAR</button>
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
        <!-- ============================================================== -->
        <!-- This page plugins -->
        <!-- ============================================================== -->
        <script src="<%out.print(getServletContext().getContextPath());%>/assets/plugins/styleswitcher/jQuery.style.switcher.js"></script>
        <script src="<%out.print(getServletContext().getContextPath());%>/js_app/directivos.js"></script>

    </body>

</html>