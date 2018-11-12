<%-- 
    Document   : login
    Created on : 16/09/2018, 11:17:00 PM
    Author     : James Carrillo
--%>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <!-- Tell the browser to be responsive to screen width -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <!-- Favicon icon -->
        <!--link rel="icon" type="image/png" sizes="16x16" href="../assets/images/favicon.png"-->
        <link rel="shortcut icon" href="<%out.print(getServletContext().getContextPath());%>/peam_resources/logos_principales/logo-peam.png">
        <title><%out.print(getServletContext().getInitParameter("name.app.page"));%></title>
        <!-- Bootstrap Core CSS -->
        <link href="<%out.print(getServletContext().getContextPath());%>/assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="<%out.print(getServletContext().getContextPath());%>/assets/plugins/toast-master/css/jquery.toast.css" rel="stylesheet">
        <link href="<%out.print(getServletContext().getContextPath());%>/assets/plugins/sweetalert/sweetalert.css" rel="stylesheet">
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
    <body>
        <!-- ============================================================== -->
        <!-- Preloader - style you can find in spinners.css -->
        <!-- ============================================================== -->
        <div class="preloader">
            <svg class="circular" viewBox="25 25 50 50">
            <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="2" stroke-miterlimit="10" /> </svg>
        </div>
        <!-- ============================================================== -->
        <!-- Main wrapper - style you can find in pages.scss -->
        <!-- ============================================================== -->
        <section id="wrapper">
            <div class="login-register" style="background-image:url(<%out.print(getServletContext().getContextPath());%>/assets/images/background/login-register.jpg); padding-top: 60px">
                <div class="login-box card">
                    <div class="card-body">
                        <form class="form-horizontal form-material" method="POST" id="FrmLogin">
                            <div class="text-center">
                                <img src="<%out.print(getServletContext().getContextPath());%>/peam_resources/logos_principales/peam_login.jpg" alt="Img Login" style="height: 150px; width: 250px" />
                            </div>
                            <div class="form-group m-t-30">
                                <div class="col-xs-12">
                                    <input class="form-control" type="text" name="txtUsuario" id="txtUsuario" placeholder="Usuario">
                                </div>
                                <div id="validarUsuario" class="err-validation-login-2">Ingrese Usuario</div>
                            </div>
                            <div class="form-group">
                                <div class="col-xs-12">
                                    <input class="form-control" type="password" name="txtPass" id="txtPass" placeholder="Contraseña">
                                </div>
                                <div id="validarPass" class="err-validation-login-2">Ingrese Contraseña</div>
                            </div>
                            <div class="form-group text-center m-t-40">
                                <div class="col-xs-12">
                                    <button class="btn btn-info btn-block text-uppercase waves-effect waves-light" type="submit">INGRESAR</button>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xs-12 col-sm-12 col-md-12 m-t-10 text-center">
                                    <div class="social">
                                        <button type="button" class="btn" data-toggle="tooltip" title="Compatible con Google Ghrome"> <i aria-hidden="true" class="fab fa-google"></i> </button>
                                        <button type="button" class="btn" data-toggle="tooltip" title="Compatible con Mozila Firefox"> <i aria-hidden="true" class="fab fa-firefox"></i> </button>
                                        <button type="button" class="btn" data-toggle="tooltip" title="Compatible con Opera"> <i aria-hidden="true" class="fab fa-opera"></i> </button>
                                        <button type="button" class="btn" data-toggle="tooltip" title="Compatible con Internet Explore"> <i aria-hidden="true" class="fab fa-internet-explorer"></i> </button>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group m-b-0">
                                <div class="col-sm-12 text-center">
                                    Gestor de Contenidos PEAM
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>
        <div class="modal fade" data-backdrop="static" id="modalCargando" data-keyboard="false" tabindex="-1" role="dialog" aria-hidden="true" style="padding-top:20%; overflow-y:visible;">
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
        <!-- ============================================================== -->
        <!-- End Wrapper -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- All Jquery -->
        <!-- ============================================================== -->
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
        <!-- Style switcher -->
        <!-- ============================================================== -->
        <script src="<%out.print(getServletContext().getContextPath());%>/assets/plugins/styleswitcher/jQuery.style.switcher.js"></script>
        <script src="<%out.print(getServletContext().getContextPath());%>/assets/plugins/toast-master/js/jquery.toast.js"></script>
        <script src="<%out.print(getServletContext().getContextPath());%>/assets/plugins/sweetalert/sweetalert.min.js"></script>
        <script src="<%out.print(getServletContext().getContextPath());%>/js_app/gc/login.js"></script>
    </body>
</html>