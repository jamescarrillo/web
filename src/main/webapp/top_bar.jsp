<%@page import="gob.peam.web.model.others.Conf_Web"%>
<%@page import="gob.peam.web.utilities.Utilities"%>
<div class="top-bar light-green visible-md visible-lg">
    <div class="container">
        <div class="row">
            <div class="col-lg-4 col-md-3">
                <ul class="list-inline social-top tt-animate btt">
                    <%
                        Conf_Web conf_web = Utilities.getConf_Web(getServletContext().getRealPath("/peam_resources_app/conf_app/files/"), "conf_web.properties");
                        String[] valoresRedesSociales = conf_web.getRedes_sociales().split(":::");
                        // nombre::link::icono::target
                        String[] valorItem;
                        String target;
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
            </div>
            <div class="col-lg-8 col-me-9 text-right">
                <ul class="topbar-cta no-margin">
                    <li class="mr-20 li-top">
                        <a class="a-top"><i class="material-icons mr-10">&#xE0B9;</i>info@peam.com</a>
                    </li>
                    <li>
                        <a href="<%out.print(getServletContext().getContextPath());%>/index" class="a-top">Inicio </a><strong style="color: #ffffff">|</strong>
                    </li>
                    <li >
                        <a class="a-top">Mapa de Sitio </a><strong style="color: #ffffff">|</strong>
                    </li>
                    <li>
                        <a class="a-top">Intranet </a><strong style="color: #ffffff">|</strong>
                    </li>
                    <li>
                        <a href="https://correo.peam.gob.pe/" class="a-top" target="_blank">Correo </a><strong style="color: #ffffff">|</strong>
                    </li>
                    <li>
                        <a href="<%out.print(getServletContext().getContextPath());%>/servicios" class="a-top">Servicios </a><strong style="color: #ffffff">|</strong>
                    </li>
                    <li>
                        <a href="<%out.print(getServletContext().getContextPath());%>/glosario" class="a-top">Glosario</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
