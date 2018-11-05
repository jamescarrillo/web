<footer class="footer footer-four">
    <div class="primary-footer light-green text-center">
        <div class="container">
            <a href="#top" class="page-scroll btn-floating btn-large back-top waves-effect waves-light" style="background-color:  #a20505" data-section="#top">
                <i class="material-icons">&#xE316;</i>
            </a>
            <ul class="social-link tt-animate ltr mt-20">
                <%
                    for (int i = 0; i < valoresRedesSociales.length; i++) {
                        valorItem = valoresRedesSociales[i].split("::");
                        if (valorItem[3].equals("1")) {
                            target = "target='_blank'";
                        } else {
                            target = "";
                        }
                        out.print("<li><a href='" + valorItem[1] + "' " + target + "><i class='" + valorItem[2] + "' style='color: #a20505'></i></a></li>");
                    }
                %>
           </ul>
            <hr class="mt-15">
            <div class="row">
                <div class="col-md-12">
                    <br>
                    <span style="color: #a20505">Copyright &copy; 2018 <strong style="cursor: pointer">Peam</strong> &nbsp; | &nbsp;  Todos los derechos reservados &nbsp;</span>
                    <!--h6 style="color: #ffffff"><strong>Ubícanos</strong></h6-->
                    <br>
                    <div class="footer-intro" style="margin-top: 10px">
                        <h6 style="color: #ffffff"><a style="color: #ffffff" href="https://www.google.com/maps/@-6.043346,-76.971502,15z?hl=es" target="_blank"><i class="fa fa-map-marker" aria-hidden="true"></i></a> Calle La Marginal N° 233 Sector Uchuglla - Moyobamba - San Martín - Perú </h6>
                        <h6 style="color: #ffffff"><i class="fa fa-phone" aria-hidden="true"></i> (042) 562522</h6>
                        <h6 style="color: #ffffff"><i class="fa fa-envelope" aria-hidden="true"></i> Lunes a Viernes: De 7:30 a 13:00 horas / 14:30 a 17:00 horas</h6>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="secondary-footer light-green darken-2 text-center" style="padding-bottom: 0px">
        <div class="container">
            <h6 style="color: #ffffff">Responsable del Acceso a la Información Pública y Libro de Reclamaciones: <strong style="color:#a20505">Ing. Ernesto Segundo Ríos Sandoval</strong> | <a href="http://lib.peam.gob.pe:8081/ArcDig/OriArc.pdf?id=98428" target="_blank" style="color: #ffffff"> Designado por Resolución Gerencial: 024-2018-GRSM-PEAM-01.00</a></h6>
            <h6 style="color: #ffffff">Responsable del Portal de Transparencia Estándar y Portal Institucional: <strong style="color:#a20505">Ing. Ernesto Segundo Ríos Sandoval</strong> | <a href="http://lib.peam.gob.pe:8081/ArcDig/OriArc.pdf?id=97250" style="color: #ffffff"> Designado por Resolución Gerencial: 245-2017-GRSM-PEAM-01.00</a></h6>
        </div>
    </div>
</footer>
<!-- Preloader -->
<div id="preloader">
    <div class="preloader-position"> 
        <img src="<%out.print(getServletContext().getContextPath());%>/assets/img/logo-colored.png" alt="logo" style="height: 40px;">
        <div class="progress">
            <div class="indeterminate"></div>
        </div>
    </div>
</div>