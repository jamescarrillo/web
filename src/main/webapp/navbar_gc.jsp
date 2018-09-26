<%@page import="gob.peam.web.model.Usuario"%>
<nav class="navbar top-navbar navbar-expand-md navbar-light">
    <!-- ============================================================== -->
    <!-- Logo -->
    <!-- ============================================================== -->
    <div class="navbar-header">
        <a class="navbar-brand" href="indexgc">
            <!-- Logo icon -->
            <b>
                <!--You can put here icon as well // <i class="wi wi-sunset"></i> //-->
                <!-- Dark Logo icon -->
                <img src="<%out.print(getServletContext().getContextPath());%>/assets/images/logo-icon.png" alt="homepage" class="dark-logo" />
                <!-- Light Logo icon -->
                <img src="<%out.print(getServletContext().getContextPath());%>/assets/images/logo-light-icon.png" alt="homepage" class="light-logo" />
            </b>
            <!--End Logo icon -->
            <!-- Logo text -->
            <span>
                <!-- dark Logo text -->
                <img src="<%out.print(getServletContext().getContextPath());%>/assets/images/logo-text.png" alt="homepage" class="dark-logo" />
                <!-- Light Logo text -->    
                <img src="<%out.print(getServletContext().getContextPath());%>/assets/images/logo-light-text.png" class="light-logo" alt="homepage" /></span> 
        </a>
    </div>
    <!-- ============================================================== -->
    <!-- End Logo -->
    <!-- ============================================================== -->
    <div class="navbar-collapse">
        <!-- ============================================================== -->
        <!-- toggle and nav items -->
        <!-- ============================================================== -->
        <ul class="navbar-nav mr-auto mt-md-0">
            <!-- This is  -->
            <li class="nav-item"> <a class="nav-link nav-toggler hidden-md-up text-muted waves-effect waves-dark" href="javascript:void(0)"><i class="mdi mdi-menu"></i></a> </li>
            <li class="nav-item"> <a class="nav-link sidebartoggler hidden-sm-down text-muted waves-effect waves-dark" href="javascript:void(0)"><i class="ti-menu"></i></a> </li>
        </ul>
        <!-- ============================================================== -->
        <!-- User profile and search -->
        <!-- ============================================================== -->
        <ul class="navbar-nav my-lg-0">
            <!-- Profile -->
            <!-- ============================================================== -->
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle text-muted waves-effect waves-dark" href="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img src="<%out.print(getServletContext().getContextPath());%>/assets/images/users/1.jpg" alt="user" class="profile-pic" /></a>
                <div class="dropdown-menu dropdown-menu-right scale-up">
                    <ul class="dropdown-user">
                        <li>
                            <div class="dw-user-box">
                                <div class="u-img"><img src="<%out.print(getServletContext().getContextPath());%>/assets/images/users/1.jpg" alt="user"></div>
                                <div class="u-text">
                                    <h4><%out.print(((Usuario) request.getSession().getAttribute("user")).getPersona().getPers_nombre() + " " + ((Usuario) request.getSession().getAttribute("user")).getPersona().getPers_apellido_paterno());%></h4>
                                    <p class="text-muted"><%out.print(((Usuario) request.getSession().getAttribute("user")).getPersona().getPers_cargo());%></p>
                                    <a href="perfil" class="btn btn-rounded btn-danger btn-sm">Ver Perfil</a>
                                </div>
                            </div>
                        </li>
                        <li role="separator" class="divider"></li>
                        <li><a href="perfil"><i class="ti-user"></i> Mi Perfil</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="cerrarsession"><i class="fa fa-power-off"></i> Cerrar Sesión</a></li>
                    </ul>
                </div>
            </li>
        </ul>
    </div>
</nav>