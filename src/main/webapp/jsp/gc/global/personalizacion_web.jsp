<%-- 
    Document   : penalidad
    Created on : 21/10/2018, 04:14:18 PM
    Author     : James Carrillo
--%>

<%@page import="java.nio.charset.StandardCharsets"%>
<%@page import="java.io.File"%>
<%@page import="gob.peam.web.model.others.Conf_Web"%>
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
        <link href="<%out.print(getServletContext().getContextPath());%>/assets/plugins/toast-master/css/jquery.toast.css" rel="stylesheet">

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
                                <div class="card-header bg-info">
                                    <strong class="text-white">CONFIGURACIÓN WEB</strong>
                                </div>
                                <%
                                    Conf_Web conf_web = (Conf_Web) request.getAttribute("conf_web");
                                    conf_web.setDirector_infraestructura(new String(conf_web.getDirector_infraestructura().getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8));
                                    conf_web.setDirector_desarrollo_agropecuario(new String(conf_web.getDirector_desarrollo_agropecuario().getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8));
                                    conf_web.setDirector_manejo_ambiental(new String(conf_web.getDirector_manejo_ambiental().getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8));
                                    conf_web.setDirector_area_estudios(new String(conf_web.getDirector_area_estudios().getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8));
                                %>
                                <div class="card-body pt-1">
                                    <div class="row mt-3">
                                        <div class="form-group col-12 col-sm-6">
                                            <label for="numero_videos_multimedia">NÚMERO DE VIDEOS A MOSTRAR EN MULTIMEDIA</label>
                                            <input type="text" class="form-control form-control-sm" id="numero_videos_multimedia" name="numero_videos_multimedia" value="<%out.print(conf_web.getNumero_videos_multimedia());%>">
                                        </div>
                                        <div class="form-group col-12 col-sm-6">
                                            <label for="numero_anuncios_mostrar">NÚMERO DE ANUNCIOS A MOSTRAR EN LA WEB</label>
                                            <input type="text" class="form-control form-control-sm" id="numero_anuncios_mostrar" name="numero_anuncios_mostrar" value="<%out.print(conf_web.getNumero_anuncios_mostrar());%>">
                                        </div>
                                        <div class="form-group col-12">
                                            <label for="apikey">API KEY</label>
                                            <input type="text" class="form-control form-control-sm" id="apikey" name="apikey" value="<%out.print(conf_web.getApikey());%>">
                                        </div>
                                        <div class="form-group col-12 col-sm-6">
                                            <label for="idusuario">IDUSUARIO</label>
                                            <input type="text" class="form-control form-control-sm" id="idusuario" name="idusuario" value="<%out.print(conf_web.getIdusuario());%>">
                                        </div>
                                        <div class="form-group col-12 col-sm-6">
                                            <label for="idalbum">IDALBUM</label>
                                            <input type="text" class="form-control form-control-sm" id="idalbum" name="idalbum" value="<%out.print(conf_web.getIdalbum());%>">
                                        </div>
                                        <input type="hidden" class="form-control form-control-sm" id="numero_fotos_galeria" name="numero_fotos_galeria" value="<%out.print(conf_web.getNumero_fotos_galeria());%>">
                                        <input type="hidden" id="action" name="action" value="guardarPersonalizacionWeb">
                                        <input type="hidden" id="icono_pagina" name="icono_pagina" value="logo-peam.png">
                                        <input type="hidden" id="redes_sociales" value="">
                                    </div>
                                    <hr style="border-top: 5px solid rgba(0,0,0,.1)">
                                    <div class="row">
                                        <div class="col-10 text-left mb-1">
                                            <label><strong>REDES SOCIALES</strong></label>
                                        </div>
                                        <div class="col-2 text-right mb-1">
                                            <button type="button" id="btnAbrirNuevaRedSocial" class="btn waves-effect waves-light btn-info btn-sm" data-toggle="tooltip" title="Registrar Red Social" style="height: 31px"><i class="fa fa-plus-square" aria-hidden="true"></i></button>
                                        </div>
                                        <div class="col-12">
                                            <div class="table-responsive" id="tablaRedesSociales">
                                                <table
                                                    class="table color-bordered-table muted-bordered-table table-hover">
                                                    <thead>
                                                        <tr>
                                                            <th class="text-medium-table" style="width: 20%">NOMBRE</th>
                                                            <th class="text-medium-table" style="width: 70%">LINK</th>
                                                            <th class="text-medium-table text-center" style="width: 10%">NUEVA VENTANTA</th>
                                                            <th class="text-medium-table" style="width: 10%">OPCIONES</th>
                                                        </tr>
                                                    </thead>
                                                    <%
                                                        String[] valoresRedes = conf_web.getRedes_sociales().split(":::");
                                                    %>
                                                    <tbody id="tbodyRedesSociales">
                                                        <%
                                                            String tr;
                                                            String check;
                                                            String[] valoresRed;
                                                            String atributos;
                                                            for (int i = 0; i < valoresRedes.length; i++) {
                                                                valoresRed = valoresRedes[i].split("::");
                                                                atributos = "";
                                                                atributos += "nombre_red_social='" + valoresRed[0] + "' ";
                                                                atributos += "link='" + valoresRed[1] + "' ";
                                                                atributos += "icono='" + valoresRed[2] + "' ";
                                                                atributos += "abrir_nueva_ventana='" + valoresRed[3] + "' ";
                                                                tr = "<tr " + atributos + ">";
                                                                tr += "<td class='text-medium-table'>" + valoresRed[0] + "</td>";
                                                                tr += "<td class='text-medium-table'>" + valoresRed[1] + "</td>";
                                                                if (valoresRed[3].equals("1")) {
                                                                    check = "<label class='custom-control custom-checkbox' style='cursor: pointer'>";
                                                                    check += "<input type='checkbox' checked disabled class='custom-control-input'>";
                                                                    check += "<span class='custom-control-label'></span>";
                                                                    check += "</label>";
                                                                } else {
                                                                    check = "<label class='custom-control custom-checkbox' style='cursor: pointer'>";
                                                                    check += "<input type='checkbox' disabled class='custom-control-input'>";
                                                                    check += "<span class='custom-control-label'></span>";
                                                                    check += "</label>";
                                                                }
                                                                tr += "<td class='text-medium-table text-center'>" + check + "" + "</td>";
                                                                tr += "<td class='text-medium-table text-center'><button class='btn btn-outline-secondary btn-sm eliminar-redsocial'><i class='fas fa-trash-alt'></i></button></td>";
                                                                tr += "</tr>";
                                                                out.print(tr);
                                                            }
                                                        %>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                    <hr style="border-top: 5px solid rgba(0,0,0,.1)">           
                                    <form id="FrmPersonalizacionWEB">
                                        <div class="row mt-3">
                                            <div class="form-group col-12 mb-3">
                                                <label>DIRECTOR DE INFRAESTRUCTURA</label>
                                                <input id="txtDirectorInfraestructura" name="txtDirectorInfraestructura" type="text" class="form-control form-control-sm mb-2" placeholder="DIRECTOR DE INFRAESTRUCTURA" value="<%out.print(conf_web.getDirector_infraestructura());%>">
                                                <div class="row justify-content-sm-center">
                                                    <div class="col-lg-3 col-md-4 col-xs-6 col-12 text-center">
                                                        <div class="card border-primary borde-redondeado mb-2">
                                                            <div class="card-body p-2">
                                                                <div class="text-center">
                                                                    <%
                                                                        String path_director_infraestructura;
                                                                        path_director_infraestructura = getServletContext().getContextPath() + "/peam_resources/logos_complementos/lineas_accion/directores/" + conf_web.getNombre_foto_director_infraestructura();
                                                                        if (!new File(path_director_infraestructura).exists()) {
                                                                            path_director_infraestructura = getServletContext().getContextPath() + "/peam_resources/logos_complementos/lineas_accion/directores/default_director.png";
                                                                            //System.out.println(path_director_infraestructura);
                                                                        }
                                                                    %>
                                                                    <img id="visorFotoDirInfra" src='<%out.print(path_director_infraestructura);%>' alt="director-img" class="rounded mx-auto d-block img-responsive" >
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <button type="button" class="btn btn-secondary btn-sm btn-eliminar-logo" idvisor="visorFotoDirInfra" idinputfile="fileFotoDirInfra" inputvalidacion="txtValidacionFotoDirInfra" inputname="txtNombreFotoDirInfra" logo_default="<%out.print(getServletContext().getContextPath() + "/peam_resources/logos_complementos/lineas_accion/directores/default_director.png");%>">
                                                            <i class="fa fa-trash"></i>
                                                        </button>
                                                        <div style="display: inline">
                                                            <input id="fileFotoDirInfra" name="fileFotoDirInfra" inputvalidacion="txtValidacionFotoDirInfra" class="input-file-logo" idvisor="visorFotoDirInfra" type="file" style="display: none">
                                                            <button type="button" class="btn btn-info btn-sm btn-seleccionar-logo" idvisor="visorFotoDirInfra" idinputfile="fileFotoDirInfra">
                                                                <i class="fa fa-folder-open"></i>
                                                            </button>
                                                            <input type="hidden" id="txtNombreFotoDirInfra" name="txtNombreFotoDirInfra" value="<%out.print(conf_web.getNombre_foto_director_infraestructura());%>">
                                                            <input type="hidden" id="txtValidacionFotoDirInfra" name="txtValidacionFotoDirInfra" value="">
                                                        </div>
                                                        <br><small>Seleccione Foto</small>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group col-12 mb-3">
                                                <label>DIRECTOR DE MANEJO AMBIENTAL</label>
                                                <input id="txtDirectorManejoAmbiental" name="txtDirectorManejoAmbiental" type="text" class="form-control form-control-sm mb-2" placeholder="DIRECTOR DE MANEJO AMBIENTAL" value="<%out.print(conf_web.getDirector_manejo_ambiental());%>">
                                                <div class="row justify-content-sm-center">
                                                    <div class="col-lg-3 col-md-4 col-xs-6 col-12 text-center">
                                                        <div class="card border-primary borde-redondeado mb-2">
                                                            <div class="card-body p-2">
                                                                <div class="text-center">
                                                                    <%
                                                                        String path_director_manejo_ambiental;
                                                                        path_director_manejo_ambiental = getServletContext().getContextPath() + "/peam_resources/logos_complementos/lineas_accion/directores/" + conf_web.getNombre_foto_director_manejo_ambiental();
                                                                        if (!new File(path_director_manejo_ambiental).exists()) {
                                                                            path_director_manejo_ambiental = getServletContext().getContextPath() + "/peam_resources/logos_complementos/lineas_accion/directores/default_director.png";
                                                                        }
                                                                    %>
                                                                    <img id="visorFotoDirManAmbi" src='<%out.print(path_director_manejo_ambiental);%>' alt="director-img" class="rounded mx-auto d-block img-responsive" >
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <button type="button" class="btn btn-secondary btn-sm btn-eliminar-logo" idvisor="visorFotoDirManAmbi" idinputfile="fileFotoDirManAmbi" inputvalidacion="txtValidacionFotoDirManAmbi" inputname="txtNombreFotoDirManAmbi" logo_default="<%out.print(getServletContext().getContextPath() + "/peam_resources/logos_complementos/lineas_accion/directores/default_director.png");%>">
                                                            <i class="fa fa-trash"></i>
                                                        </button>
                                                        <div style="display: inline">
                                                            <input id="fileFotoDirManAmbi" name="fileFotoDirManAmbi" inputvalidacion="txtValidacionFotoDirManAmbi" class="input-file-logo" idvisor="visorFotoDirManAmbi" type="file" style="display: none">
                                                            <button type="button" class="btn btn-info btn-sm btn-seleccionar-logo" idvisor="visorFotoDirManAmbi" idinputfile="fileFotoDirManAmbi">
                                                                <i class="fa fa-folder-open"></i>
                                                            </button>
                                                            <input type="hidden" id="txtNombreFotoDirManAmbi" name="txtNombreFotoDirManAmbi" value="<%out.print(conf_web.getNombre_foto_director_manejo_ambiental());%>">
                                                            <input type="hidden" id="txtValidacionFotoDirManAmbi" name="txtValidacionFotoDirManAmbi" value="">
                                                        </div>
                                                        <br><small>Seleccione Foto</small>
                                                    </div>
                                                </div>
                                            </div>    
                                            <div class="form-group col-12 mb-3">
                                                <label>DIRECTOR DE DESARROLLO AGROPECUARIO</label>
                                                <input id="txtDirectorDesarrolloAgropecuario" name="txtDirectorDesarrolloAgropecuario" type="text" class="form-control form-control-sm mb-2" placeholder="DIRECTOR DE DESARROLLO AGROPECUARIO" value="<%out.print(conf_web.getDirector_desarrollo_agropecuario());%>">
                                                <div class="row justify-content-sm-center">
                                                    <div class="col-lg-3 col-md-4 col-xs-6 col-12 text-center">
                                                        <div class="card border-primary borde-redondeado mb-2">
                                                            <div class="card-body p-2">
                                                                <div class="text-center">
                                                                    <%
                                                                        String path_director_desarrollo_agropecuario;
                                                                        path_director_desarrollo_agropecuario = getServletContext().getContextPath() + "/peam_resources/logos_complementos/lineas_accion/directores/" + conf_web.getNombre_foto_director_desarrollo_agropecuario();
                                                                        if (!new File(path_director_desarrollo_agropecuario).exists()) {
                                                                            path_director_desarrollo_agropecuario = getServletContext().getContextPath() + "/peam_resources/logos_complementos/lineas_accion/directores/default_director.png";
                                                                        }
                                                                    %>
                                                                    <img id="visorFotoDirDesAgro" src='<%out.print(path_director_desarrollo_agropecuario);%>' alt="director-img" class="rounded mx-auto d-block img-responsive" >
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <button type="button" class="btn btn-secondary btn-sm btn-eliminar-logo" idvisor="visorFotoDirDesAgro" idinputfile="fileFotoDirDesAgro" inputvalidacion="txtValidacionFotoDirDesAgro" inputname="txtNombreFotoDirDesAgro" logo_default="<%out.print(getServletContext().getContextPath() + "/peam_resources/logos_complementos/lineas_accion/directores/default_director.png");%>">
                                                            <i class="fa fa-trash"></i>
                                                        </button>
                                                        <div style="display: inline">
                                                            <input id="fileFotoDirDesAgro" name="fileFotoDirDesAgro" inputvalidacion="txtValidacionFotoDirDesAgro" class="input-file-logo" idvisor="visorFotoDirDesAgro" type="file" style="display: none">
                                                            <button type="button" class="btn btn-info btn-sm btn-seleccionar-logo" idvisor="visorFotoDirDesAgro" idinputfile="fileFotoDirDesAgro">
                                                                <i class="fa fa-folder-open"></i>
                                                            </button>
                                                            <input type="hidden" id="txtNombreFotoDirDesAgro" name="txtNombreFotoDirDesAgro" value="<%out.print(conf_web.getNombre_foto_director_desarrollo_agropecuario());%>">
                                                            <input type="hidden" id="txtValidacionFotoDirDesAgro" name="txtValidacionFotoDirDesAgro" value="">
                                                        </div>
                                                        <br><small>Seleccione Foto</small>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group col-12 mb-3">
                                                <label>RESPONSABLE DEL ÁREA ESTUDIOS</label>
                                                <input id="txtResponsableEstudios" name="txtResponsableEstudios" type="text" class="form-control form-control-sm mb-2" placeholder="RESPONSABLE DEL ÁREA ESTUDIOS" value="<%out.print(conf_web.getDirector_area_estudios());%>">
                                                <div class="row justify-content-sm-center">
                                                    <div class="col-lg-3 col-md-4 col-xs-6 col-12 text-center">
                                                        <div class="card border-primary borde-redondeado mb-2">
                                                            <div class="card-body p-2">
                                                                <div class="text-center">
                                                                    <%
                                                                        String path_director_estudios;
                                                                        path_director_estudios = getServletContext().getContextPath() + "/peam_resources/logos_complementos/lineas_accion/directores/" + conf_web.getNombre_foto_director_area_estudios();
                                                                        if (!new File(path_director_estudios).exists()) {
                                                                            path_director_estudios = getServletContext().getContextPath() + "/peam_resources/logos_complementos/lineas_accion/directores/default_director.png";
                                                                        }
                                                                    %>
                                                                    <img id="visorFotoDirEstudios" src='<%out.print(path_director_estudios);%>' alt="director-img" class="rounded mx-auto d-block img-responsive" >
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <button type="button" class="btn btn-secondary btn-sm btn-eliminar-logo" idvisor="visorFotoDirEstudios" idinputfile="fileFotoDirEstudios" inputvalidacion="txtValidacionFotoDirEstudios" inputname="txtNombreFotoDirEstudios" logo_default="<%out.print(getServletContext().getContextPath() + "/peam_resources/logos_complementos/lineas_accion/directores/default_director.png");%>">
                                                            <i class="fa fa-trash"></i>
                                                        </button>
                                                        <div style="display: inline">
                                                            <input id="fileFotoDirEstudios" name="fileFotoDirEstudios" inputvalidacion="txtValidacionFotoDirEstudios" class="input-file-logo" idvisor="visorFotoDirEstudios" type="file" style="display: none">
                                                            <button type="button" class="btn btn-info btn-sm btn-seleccionar-logo" idvisor="visorFotoDirEstudios" idinputfile="fileFotoDirEstudios">
                                                                <i class="fa fa-folder-open"></i>
                                                            </button>
                                                            <input type="hidden" id="txtNombreFotoDirEstudios" name="txtNombreFotoDirEstudios" value="<%out.print(conf_web.getNombre_foto_director_area_estudios());%>">
                                                            <input type="hidden" id="txtValidacionFotoDirEstudios" name="txtValidacionFotoDirEstudios" value="">
                                                        </div>
                                                        <br><small>Seleccione Foto</small>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="container">
                                                <div class="col-12 mt-3 mb-3" style="border-top: 5px solid rgba(0,0,0,.1);"></div>
                                            </div>    
                                            <div class="form-group col-12 mb-3">
                                                <div class="row justify-content-sm-center">
                                                    <div class="col-12 text-center">
                                                        <div class="card border-primary borde-redondeado mb-2">
                                                            <div class="card-body p-2">
                                                                <div class="text-center">
                                                                    <%
                                                                        String path_logo_peam;
                                                                        path_logo_peam = getServletContext().getContextPath() + "/peam_resources/logos_principales/" + conf_web.getNombre_logo_peam();
                                                                        if (!new File(path_logo_peam).exists()) {
                                                                            path_logo_peam = getServletContext().getContextPath() + "/peam_resources/logos_principales/logo_peam_combinado_large.png";
                                                                        }
                                                                    %>
                                                                    <img id="visorFotoLogoPeam" src='<%out.print(path_logo_peam);%>' alt="peam-img" class="rounded mx-auto d-block img-responsive" >
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <button type="button" class="btn btn-secondary btn-sm btn-eliminar-logo" idvisor="visorFotoLogoPeam" idinputfile="fileFotoLogoPeam" inputvalidacion="txtValidacionFotoLogoPeam" inputname="txtNombreFotoLogoPeam" logo_default="<%out.print(getServletContext().getContextPath() + "/peam_resources/logos_principales/logo_peam_combinado_large.png");%>">
                                                            <i class="fa fa-trash"></i>
                                                        </button>
                                                        <div style="display: inline">
                                                            <input id="fileFotoLogoPeam" name="fileFotoLogoPeam" inputvalidacion="txtValidacionFotoLogoPeam" class="input-file-logo" idvisor="visorFotoLogoPeam" type="file" style="display: none">
                                                            <button type="button" class="btn btn-info btn-sm btn-seleccionar-logo" idvisor="visorFotoLogoPeam" idinputfile="fileFotoLogoPeam">
                                                                <i class="fa fa-folder-open"></i>
                                                            </button>
                                                            <input type="hidden" id="txtNombreFotoLogoPeam" name="txtNombreFotoLogoPeam" value="<%out.print(conf_web.getNombre_logo_peam());%>">
                                                            <input type="hidden" id="txtValidacionFotoLogoPeam" name="txtValidacionFotoLogoPeam" value="">
                                                        </div>
                                                        <br><small>Seleccione Logo (Recomendado: 1175px x 85px )</small>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group col-12 mb-3">
                                                <div class="row justify-content-sm-center">
                                                    <div class="col-lg-4 col-md-6  col-12 text-center">
                                                        <div class="card border-primary borde-redondeado mb-2">
                                                            <div class="card-body p-2">
                                                                <div class="text-center">
                                                                    <%
                                                                        String path_logo_goresam;
                                                                        path_logo_goresam = getServletContext().getContextPath() + "/peam_resources/logos_principales/" + conf_web.getNombre_logo_goresam();
                                                                        if (!new File(path_logo_goresam).exists()) {
                                                                            path_logo_goresam = getServletContext().getContextPath() + "/peam_resources/logos_principales/logo-goresam.png";
                                                                        }
                                                                    %>
                                                                    <img id="visorFotoLogoGoresam" src='<%out.print(path_logo_goresam);%>' alt="goresam-img" class="rounded mx-auto d-block img-responsive" >
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <button type="button" class="btn btn-secondary btn-sm btn-eliminar-logo" idvisor="visorFotoLogoGoresam" idinputfile="fileFotoLogoGoresam" inputvalidacion="txtValidacionFotoLogoGoresam" inputname="txtNombreFotoLogoGoresam" logo_default="<%out.print(getServletContext().getContextPath() + "/peam_resources/logos_principales/logo-goresam.png");%>">
                                                            <i class="fa fa-trash"></i>
                                                        </button>
                                                        <div style="display: inline">
                                                            <input id="fileFotoLogoGoresam" name="fileFotoLogoGoresam" inputvalidacion="txtValidacionFotoLogoGoresam" class="input-file-logo" idvisor="visorFotoLogoGoresam" type="file" style="display: none">
                                                            <button type="button" class="btn btn-info btn-sm btn-seleccionar-logo" idvisor="visorFotoLogoGoresam" idinputfile="fileFotoLogoGoresam">
                                                                <i class="fa fa-folder-open"></i>
                                                            </button>
                                                            <input type="hidden" id="txtNombreFotoLogoGoresam" name="txtNombreFotoLogoGoresam" value="<%out.print(conf_web.getNombre_logo_goresam());%>">
                                                            <input type="hidden" id="txtValidacionFotoLogoGoresam" name="txtValidacionFotoLogoGoresam" value="">
                                                        </div>
                                                        <br><small>Seleccione Logo (Recomendado: 262px x 160px )</small>
                                                    </div>
                                                </div>
                                                <input type="text" id="url_goresam" name="url_goresam" class="form-control form-control-sm mt-2" placeholder="URL GORESAM" value="<%out.print(conf_web.getUrl_logo_goresam());%>">
                                            </div>
                                            <div class="form-group col-12 mb-3">
                                                <div class="row justify-content-sm-center">
                                                    <div class="col-lg-4 col-md-6 col-12 text-center">
                                                        <div class="card border-primary borde-redondeado mb-2">
                                                            <div class="card-body p-2">
                                                                <div class="text-center">
                                                                    <%
                                                                        String path_logo_portal;
                                                                        path_logo_portal = getServletContext().getContextPath() + "/peam_resources/logos_principales/" + conf_web.getNombre_logo_portal();
                                                                        if (!new File(path_logo_portal).exists()) {
                                                                            path_logo_portal = getServletContext().getContextPath() + "/peam_resources/logos_principales/portal_transparencia.png";
                                                                        }
                                                                    %>
                                                                    <img id="visorFotoLogoPortal" src='<%out.print(path_logo_portal);%>' alt="portal-img" class="rounded mx-auto d-block img-responsive">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <button type="button" class="btn btn-secondary btn-sm btn-eliminar-logo" idvisor="visorFotoLogoPortal" idinputfile="fileFotoLogoPortal" inputvalidacion="txtValidacionFotoLogoPortal" inputname="txtNombreFotoLogoPortal" logo_default="<%out.print(getServletContext().getContextPath() + "/peam_resources/logos_principales/portal_transparencia.png");%>">
                                                            <i class="fa fa-trash"></i>
                                                        </button>
                                                        <div style="display: inline">
                                                            <input id="fileFotoLogoPortal" name="fileFotoLogoPortal" inputvalidacion="txtValidacionFotoLogoPortal" class="input-file-logo" idvisor="visorFotoLogoPortal" type="file" style="display: none">
                                                            <button type="button" class="btn btn-info btn-sm btn-seleccionar-logo" idvisor="visorFotoLogoPortal" idinputfile="fileFotoLogoPortal">
                                                                <i class="fa fa-folder-open"></i>
                                                            </button>
                                                            <input type="hidden" id="txtNombreFotoLogoPortal" name="txtNombreFotoLogoPortal" value="<%out.print(conf_web.getNombre_logo_portal());%>">
                                                            <input type="hidden" id="txtValidacionFotoLogoPortal" name="txtValidacionFotoLogoPortal" value="">
                                                        </div>
                                                        <br><small>Seleccione Logo (Recomendado: 370px x 160px )</small>
                                                    </div>
                                                </div>
                                                <input type="text" id="url_portal_transparencia" name="url_portal_transparencia" class="form-control form-control-sm mt-2" placeholder="URL PORTAL DE TRANSPARENCIA" value="<%out.print(conf_web.getUrl_logo_portal());%>">
                                            </div>
                                            <div class="form-group col-12 mb-3">
                                                <div class="row justify-content-sm-center">
                                                    <div class="col-lg-4 col-md-6 col-12 text-center">
                                                        <div class="card border-primary borde-redondeado mb-2">
                                                            <div class="card-body p-2">
                                                                <div class="text-center">
                                                                    <%
                                                                        String path_logo_presentacion_actualidad;
                                                                        path_logo_presentacion_actualidad = getServletContext().getContextPath() + "/peam_resources/logos_principales/" + conf_web.getNombre_logo_presentacion_actualidad();
                                                                        if (!new File(path_logo_presentacion_actualidad).exists()) {
                                                                            path_logo_presentacion_actualidad = getServletContext().getContextPath() + "/peam_resources/logos_principales/fachada_peam.png";
                                                                        }
                                                                    %>
                                                                    <img id="visorFotoLogoPresentacionActualidad" src='<%out.print(path_logo_presentacion_actualidad);%>' alt="escudo-img" class="rounded mx-auto d-block img-responsive">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <button type="button" class="btn btn-secondary btn-sm btn-eliminar-logo" idvisor="visorFotoLogoPresentacionActualidad" idinputfile="fileFotoLogoPresentacionActualidad" inputvalidacion="txtValidacionFotoPresentacionActualidad" inputname="txtNombreFotoLogoPresentacionActualidad" logo_default="<%out.print(getServletContext().getContextPath() + "/peam_resources/logos_principales/fachada_peam.png");%>">
                                                            <i class="fa fa-trash"></i>
                                                        </button>
                                                        <div style="display: inline">
                                                            <input id="fileFotoLogoPresentacionActualidad" name="fileFotoLogoPresentacionActualidad" class="input-file-logo" idvisor="visorFotoLogoPresentacionActualidad" inputvalidacion="txtValidacionFotoPresentacionActualidad" type="file" style="display: none">
                                                            <button type="button" class="btn btn-info btn-sm btn-seleccionar-logo" idvisor="visorFotoLogoPresentacionActualidad" idinputfile="fileFotoLogoPresentacionActualidad">
                                                                <i class="fa fa-folder-open"></i>
                                                            </button>
                                                            <input type="hidden" id="txtNombreFotoLogoPresentacionActualidad" name="txtNombreFotoLogoPresentacionActualidad" value="<%out.print(conf_web.getNombre_logo_presentacion_actualidad());%>">
                                                            <input type="hidden" id="txtValidacionFotoPresentacionActualidad" name="txtValidacionFotoPresentacionActualidad" value="">
                                                        </div>
                                                        <br><small>Seleccione Logo (Recomendado: 380px x 200px )</small>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-12 text-right">
                                                <button type="submit" class="btn btn-info btn-sm"><i class="fa fa-floppy-o"></i>GUARDAR CONFIGURACIÓN</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%@ include file="../../../temas_gc.jsp"%>
                </div>
                <div class="modal fade" id="ventanaManRedSocial" data-backdrop="static" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-lg" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h6 class="modal-title" id="txtTituloModalManRedSocial"></h6>
                                <button type="button" class="close" data-dismiss="modal"
                                        aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <div class="row">                                        
                                    <div class="form-group col-12 mb-1">
                                        <label>RED SOCIAL</label>
                                    </div>
                                    <div class="btn-group col-4 col-md-3 col-lg-2 mb-3">
                                        <button id="btnIconoRedSocial" type="button" class="btn btn-sm btn-outline-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            Seleccione...  
                                        </button>                           
                                        <div class="dropdown-menu">
                                            <a icono="" nombre_red_social="-1" class="dropdown-item item-red-social" style="cursor: pointer">Seleccione...</a>
                                            <a icono="fa fa-facebook" nombre_red_social="Facebok" class="dropdown-item item-red-social" style="cursor: pointer"><i class="fab fa-facebook"></i> Facebook</a>
                                            <a icono="fa fa-twitter" nombre_red_social="Twitter" class="dropdown-item item-red-social" style="cursor: pointer"><i class="fab fa-twitter"></i> Twitter</a>
                                            <a icono="fa fa-instagram" nombre_red_social="Instagram" class="dropdown-item item-red-social" style="cursor: pointer"><i class="fab fa-instagram"></i> Instagram</a>
                                            <a icono="fa fa-youtube" nombre_red_social="Youtube" class="dropdown-item item-red-social" style="cursor: pointer"><i class="fab fa-youtube"></i> Youtube</a>
                                            <a icono="fa fa-google" nombre_red_social="Google" class="dropdown-item item-red-social" style="cursor: pointer"><i class="fab fa-google"></i> Google</a>
                                            <a icono="fa fa-linkedin" nombre_red_social="LinkedIn" class="dropdown-item item-red-social" style="cursor: pointer"><i class="fab fa-linkedin"></i> LinkedIn</a>
                                            <a icono="fa fa-rss" nombre_red_social="Rss" class="dropdown-item item-red-social" style="cursor: pointer"><i class="fas fa-rss"></i> Rss</a>
                                            <a icono="fa fa-dribbble" nombre_red_social="Dribbble" class="dropdown-item item-red-social" style="cursor: pointer"><i class="fab fa-dribbble"></i> Dribbble</a>
                                            <a icono="fa fa-flickr" nombre_red_social="Flickr" class="dropdown-item item-red-social" style="cursor: pointer"><i class="fab fa-flickr"></i> Flickr</a>
                                        </div>
                                    </div>
                                    <div class="form-group col-8 col-md-9 col-lg-10 mb-3">
                                        <label class="custom-control custom-checkbox" style="cursor: pointer">
                                            <input id="abrirNuevaVentanaRedSocial" type="checkbox" class="custom-control-input">
                                            <span class="custom-control-label">ABRIR EN UNA NUEVA VENTANA?</span>
                                        </label>
                                    </div>
                                    <div class="form-group col-12 mb-3">
                                        <label for="txtLinkRedSocial">LINK</label>
                                        <input class="form-control form-control-sm" id="txtLinkRedSocial" name="txtLinkRedSocial" type="text" placeholder="LINK">
                                    </div>

                                    <input type="hidden" id="nombreRedSocial" value="">
                                    <input type="hidden" id="iconoRedSocial" value="">
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-outline-secondary btn-sm" data-dismiss="modal">CANCELAR</button>
                                <button type="button" class="btn btn-outline-info btn-sm" id="btnGuardarRedSocial"><i class="fa fa-floppy-o"></i></button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal fade" id="modalCargandoPersonalizacion" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-hidden="true" style="padding-top: 18%; overflow-y: visible;">
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

        <script src="<%out.print(getServletContext().getContextPath());%>/assets/plugins/moment/moment.js"></script>
        <script src="<%out.print(getServletContext().getContextPath());%>/assets/plugins/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>

        <!-- ============================================================== -->
        <!-- This page plugins -->
        <!-- ============================================================== -->
        <script src="<%out.print(getServletContext().getContextPath());%>/assets/plugins/styleswitcher/jQuery.style.switcher.js"></script>
        <script src="<%out.print(getServletContext().getContextPath());%>/js/jquery.Pagination.min.js"></script>
        <script src="<%out.print(getServletContext().getContextPath());%>/js_app/utilities/lib-utilities.js"></script>
        <script src="<%out.print(getServletContext().getContextPath());%>/js_app/utilities/lib-validaciones.js"></script>
        <script type="text/javascript" src="<%out.print(getServletContext().getContextPath());%>/assets/plugins/toast-master/js/jquery.toast.js"></script>
        <script src="<%out.print(getServletContext().getContextPath());%>/js_app/gc/personalizacion_web.js"></script>
    </body>
</html>
