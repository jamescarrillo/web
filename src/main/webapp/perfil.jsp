<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="es">
    <head>
        <%@ include file = "att_head_gc.jsp" %> 
        <!-- Bootstrap Core CSS -->
        <link href="<%out.print(getServletContext().getContextPath());%>/assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="<%out.print(getServletContext().getContextPath());%>/assets/plugins/sweetalert/sweetalert.css"rel="stylesheet">
        <!-- Custom CSS -->
        <link href="<%out.print(getServletContext().getContextPath());%>/css/style.css" rel="stylesheet">
        <!-- You can change the theme colors from here -->
        <link href="<%out.print(getServletContext().getContextPath());%>/css/colors/blue.css" id="theme" rel="stylesheet">
        <link href="<%out.print(getServletContext().getContextPath());%>/css/views/estilos.css" rel="stylesheet">
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
                <%@ include file = "navbar_gc.jsp" %>
            </header>
            <%@ include file = "menu_gc.jsp" %>
            <div class="page-wrapper">
                <!-- ============================================================== -->
                <!-- Container fluid  -->
                <!-- ============================================================== -->
                <div class="container-fluid">
                    <%@ include file = "row_username.jsp" %>
                    <!-- Start Page Content -->
                    <div class="row justify-content-center">
                        <div class="col-lg-6 col-md-8 col-sm-10 col-12">
                            <div class="card">
                                <div class="card-header bg-light">
                                    <strong class="text-info">ACTUALIZAR DATOS DE ACCESO</strong>
                                    <%
                                        Usuario usuario = (Usuario) request.getSession().getAttribute("user");
                                    %>
                                </div>
                                <div class="card-body pt-1">
                                    <form id="FrmPerfil">
                                        <div class="row mt-3">
                                            <div class="form-group col-12">
                                                <label for="txtLoginER">CUENTA DE ACCESO</label>
                                                <div class="input-group input-group-sm">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text" id="basic-addon1"><i class="fa fa-user"></i></span>
                                                    </div>
                                                    <input type="text" id="txtLoginER" name="txtLoginER" class="form-control form-control-sm" placeholder="LOGIN" value="<%out.print(usuario.getUsua_login());%>">
                                                </div>
                                                <div id="validarLogin" class="err-validation">Ingrese una cuenta para logearse</div>
                                            </div>
                                            <div class="form-group col-12">
                                                <label for="txtPassER">CONTRASEÑA</label>
                                                <div class="input-group input-group-sm">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text" id="basic-addon1"><i class="fa fa-asterisk"></i></span>
                                                    </div>
                                                    <input type="password" class="form-control form-control-sm" id="txtPassER" name="txtPassER" placeholder="INGRESE NUEVA CLAVE">
                                                </div>
                                                <div id="validarPass" class="err-validation">Ingrese clave</div>
                                            </div>
                                            <div class="form-group col-12 text-right">
                                                <button type="submit" class="btn btn-info"><i class="fa fa-save"></i> GUARDAR CAMBIOS</button>
                                            </div>
                                        </div>
                                        <input type="hidden" id="txtIdUsuarioER" name="txtIdUsuarioER" value="<%out.print(usuario.getUsua_id());%>">
                                        <input type="hidden" id="actionPerfil" name="action" value="updateUsuario">
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%@ include file = "temas_gc.jsp" %>
                </div>
                <div class="modal fade" id="modalCargandoPerfil" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-hidden="true" style="padding-top: 18%; overflow-y: visible;">
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
        <!-- ============================================================== -->
        <!-- This page plugins -->
        <!-- ============================================================== -->
        <script src="<%out.print(getServletContext().getContextPath());%>/assets/plugins/styleswitcher/jQuery.style.switcher.js"></script>
        <script src="<%out.print(getServletContext().getContextPath());%>/js_app/utilities/lib-utilities.js"></script>
        <script src="<%out.print(getServletContext().getContextPath());%>/js_app/utilities/lib-validaciones.js"></script>
        <script src="<%out.print(getServletContext().getContextPath());%>/js_app/perfil.js"></script>

    </body>
</html>