<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="es">
    <head>
        <%@ include file = "../../../att_head.jsp" %> 
        <link href='https://fonts.googleapis.com/css?family=Raleway:400,300,500,700,900' rel='stylesheet' type='text/css'>
        <!-- Material Icons CSS -->
        <link href="<%out.print(getServletContext().getContextPath());%>/assets/fonts/iconfont/material-icons.css" rel="stylesheet">
        <!-- FontAwesome CSS -->
        <link href="<%out.print(getServletContext().getContextPath());%>/assets/fonts/font-awesome/css/font-awesome.min.css" rel="stylesheet">
        <!-- flexslider -->
        <link href="<%out.print(getServletContext().getContextPath());%>/assets/flexSlider/flexslider.css" rel="stylesheet">
        <!-- materialize -->
        <link href="<%out.print(getServletContext().getContextPath());%>/assets/materialize/css/materialize.min.css" rel="stylesheet">
        <!-- Bootstrap -->
        <link href="<%out.print(getServletContext().getContextPath());%>/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="<%out.print(getServletContext().getContextPath());%>/assets/plugins/toast-master/css/jquery.toast.css" rel="stylesheet">
        <!-- shortcodes -->
        <link href="<%out.print(getServletContext().getContextPath());%>/assets/css/shortcodes/shortcodes.css" rel="stylesheet">
        <!-- Style CSS -->
        <link href="<%out.print(getServletContext().getContextPath());%>/css/style_web.css" rel="stylesheet">
        <link href="<%out.print(getServletContext().getContextPath());%>/css/views/estilos.css" rel="stylesheet">
        <link href="<%out.print(getServletContext().getContextPath());%>/organigrama/organigrama.css" rel="stylesheet">
        <link href="<%out.print(getServletContext().getContextPath());%>/assets/css/skins/corporate.css" rel="stylesheet">

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <body id="top" class="has-header-search">
        <%@ include file = "../../../top_bar.jsp" %> 
        <div class="header-sticky light-header">
            <%@ include file = "../../../container_logos.jsp" %> 
        </div>
        <%@ include file = "../../../header.jsp" %> 
        <section class="padding-bottom-100">
            <div class="container">
                <div class="text-center mb-0" style="margin-top: 60px;">
                    <h2 class="text-peam-verde-subrayado" style="font-size: 30px">Estructura Orgánica</h2>
                    <input type="hidden" name="jsonFuncionarios" id="jsonFuncionarios">
                </div>
            </div>
            <div class="row">
                <div class="col-md-10 col-md-offset-1 col-xs-12- col-xs-offset-0" style="
                     overflow: auto;
                     /* background: #ecf0f1; */
                     background: #ffffff;
                     padding: 50px;
                     -webkit-user-select: none;
                     -moz-user-select: none;
                     -ms-user-select: none;
                     user-select: none;
                     ">
                    <table>
                        <tbody id="tbodyOrganigrama">
                            <tr>
                                <td style="width: 12.5%"></td>
                                <td style="width: 12.5%"></td>
                                <td style="width: 12.5%"></td>
                                <td style="width: 12.5%"></td>
                                <td style="width: 12.5%"></td>
                                <td style="width: 12.5%"></td>
                                <td style="width: 12.5%"></td>
                                <td style="width: 12.5%"></td>
                            </tr>
                            <tr>
                                <td colspan="8" class="text-center">
                                    <div 
                                        style="
                                        position: relative;
                                        width: 120px;
                                        border-bottom: 5px solid #466c92;
                                        background: #466c92;
                                        color: #ecf0f1;
                                        display: inline-block;
                                        padding: 10px 5px;
                                        margin: 0 10px;
                                        cursor: pointer;
                                        " id="idgrsm">
                                        GRSM
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4" 
                                    style="
                                    border-width: 2px;
                                    border-right: 2px solid #34495e;
                                    height: 30px
                                    ">                                    
                                </td>
                                <td colspan="4" 
                                    style="
                                    border-width: 2px;
                                    border-left: 2px solid #34495e;
                                    height: 30px
                                    ">                                    
                                </td>
                            </tr>

                            <tr>
                                <td colspan="8" class="text-center">
                                    <div 
                                        style="
                                        position: relative;
                                        width: 120px;
                                        border-bottom: 5px solid #466c92;
                                        background: #466c92;
                                        color: #ecf0f1;
                                        display: inline-block;
                                        padding: 10px 5px;
                                        margin: 0 10px;
                                        cursor: pointer;
                                        " id="idConsejoDirectivo">
                                        CONSEJO DIRECTIVO
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4" 
                                    style="
                                    border-width: 2px;
                                    border-right: 2px solid #34495e;
                                    height: 30px
                                    ">                                    
                                </td>
                                <td colspan="4" 
                                    style="
                                    border-width: 2px;
                                    border-left: 2px solid #34495e;
                                    height: 30px
                                    ">                                    
                                </td>
                            </tr>
                            <tr>
                                <td colspan="6" class="text-center">
                                    <div 
                                        style="
                                        position: relative;
                                        width: 180px;
                                        border-bottom: 5px solid #00793D;
                                        background: #00793D;
                                        color: #ecf0f1;
                                        display: inline-block;
                                        padding: 10px 5px;
                                        margin: 0 0px;
                                        cursor: pointer;
                                        text-align: center;
                                        " id="idOrganoControlInstitucional">
                                        ÓRGANO DE CONTROL INSTITUCIONAL
                                    </div>
                                    <div 
                                        style="
                                        position: relative;
                                        width: 70px;
                                        border-bottom: 2px solid #34495e;
                                        display: inline-block;
                                        ">
                                    </div>
                                    <div
                                        style="
                                        position: relative;
                                        width: 120px;
                                        border-bottom: 5px solid #466c92;
                                        background: #466c92;
                                        color: #ecf0f1;
                                        display: inline-block;
                                        padding: 10px 5px;
                                        margin: 0 0px;
                                        cursor: pointer;
                                        " id="idGerenciaGeneral">
                                        GERENCIA GENERAL
                                    </div>
                                </td>
                                <td colspan="2"></td>
                            </tr>
                            <tr>
                                <td colspan="4" 
                                    style="
                                    border-width: 2px;
                                    border-right: 2px solid #34495e;
                                    height: 30px
                                    ">                                    
                                </td>
                                <td colspan="4" class="text-left">
                                    <div 
                                        style="
                                        position: relative;
                                        width: 120px;
                                        border-bottom: 2px solid #34495e;
                                        display: inline-block;
                                        ">
                                    </div>
                                    <div 
                                        style="
                                        position: relative;
                                        width: 180px;
                                        border-bottom: 5px solid #00793D;
                                        background: #00793D;
                                        color: #ecf0f1;
                                        display: inline-block;
                                        padding: 10px 5px;
                                        margin: 0 0px;
                                        cursor: pointer;
                                        text-align: center;
                                        " id="idOficinaPresupuestoPlanificacion">
                                        OFICINA DE PRESUPUESTO Y PLANIFICACIÓN
                                    </div>
                                </td>
                            </tr>
                            <tr>

                                <td colspan="4" class="text-right">

                                    <div 
                                        style="
                                        position: relative;
                                        width: 180px;
                                        border-bottom: 5px solid #00793D;
                                        background: #00793D;
                                        color: #ecf0f1;
                                        display: inline-block;
                                        padding: 10px 5px;
                                        margin: 0 0px;
                                        cursor: pointer;
                                        text-align: center;
                                        " id="idOficinaAdministracion">
                                        OFICINA DE ADMINISTACION
                                    </div>
                                    <div 
                                        style="
                                        position: relative;
                                        width: 135px;
                                        border-bottom: 2px solid #34495e;
                                        display: inline-block;
                                        ">
                                    </div>
                                </td>
                                <td colspan="4" 
                                    style="
                                    border-width: 2px;
                                    border-left: 2px solid #34495e;
                                    height: 10px
                                    ">                                    
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4" 
                                    style="
                                    border-width: 2px;
                                    border-right: 2px solid #34495e;
                                    height: 30px
                                    ">                                    
                                </td>
                                <td colspan="4" class="text-left">
                                    <div 
                                        style="
                                        position: relative;
                                        width: 120px;
                                        border-bottom: 2px solid #34495e;
                                        display: inline-block;
                                        ">
                                    </div>
                                    <div 
                                        style="
                                        position: relative;
                                        width: 180px;
                                        border-bottom: 5px solid #00793D;
                                        background: #00793D;
                                        color: #ecf0f1;
                                        display: inline-block;
                                        padding: 10px 5px;
                                        margin: 0 0px;
                                        cursor: pointer;
                                        text-align: center;
                                        " id="idOficinaAsesoriaJuridica">
                                        OFICINA DE ASESORÍA JURÍDICA
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4" 
                                    style="
                                    border-width: 2px;
                                    border-right: 2px solid #34495e;
                                    height: 20px
                                    ">                                    
                                </td>
                            </tr>
                            <tr>
                                <td class="text-center"
                                    style="
                                    border-width: 2px;
                                    border-right: 2px solid #34495e;
                                    height: 20px;
                                    ">                                    
                                </td>
                                <td colspan="3" class="text-center"
                                    style="
                                    border-width: 2px;
                                    border-top: 2px solid #34495e;
                                    border-right: 2px solid #34495e;
                                    height: 20px;
                                    ">                                    
                                </td>
                                <td colspan="3" class="text-center"
                                    style="
                                    border-width: 2px;
                                    border-top: 2px solid #34495e;
                                    border-left: 2px solid #34495e;
                                    height: 20px;
                                    ">                                    
                                </td>                                
                                <td class="text-center"
                                    style="
                                    border-width: 2px;
                                    border-left: 2px solid #34495e;
                                    height: 20px;
                                    ">                                    
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" class="text-center">
                                    <div 
                                        style="
                                        position: relative;
                                        width: 210px;
                                        border-bottom: 5px solid #f3a486;
                                        background: #f3a486;
                                        color: #ecf0f1;
                                        display: inline-block;
                                        padding: 10px 5px;
                                        margin: 0 10px;
                                        cursor: pointer;
                                        text-align: center;
                                        " id="idDireccionManejoAmbiental">
                                        DIRECCIÓN DE MANEJO AMBIENTAL
                                    </div>
                                </td>
                                <td></td>
                                <td colspan="2" class="text-center">
                                    <div 
                                        style="
                                        position: relative;
                                        width: 210px;
                                        border-bottom: 5px solid #f3a486;
                                        background: #f3a486;
                                        color: #ecf0f1;
                                        display: inline-block;
                                        padding: 10px 5px;
                                        margin: 0 10px;
                                        cursor: pointer;
                                        text-align: center;
                                        " id="idDireccionInfraestructura">
                                        DIRECCIÓN DE INFRAESTRUCTURA
                                    </div>
                                </td>
                                <td></td>
                                <td colspan="2" class="text-center">
                                    <div 
                                        style="
                                        position: relative;
                                        width: 210px;
                                        border-bottom: 5px solid #f3a486;
                                        background: #f3a486;
                                        color: #ecf0f1;
                                        display: inline-block;
                                        padding: 10px 5px;
                                        margin: 0 10px;
                                        cursor: pointer;
                                        text-align: center;
                                        " id="idDireccionDesarrolloAgropecuario">
                                        DIRECCIÓN DE DESARROLLO AGROPECUARIO
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>                
            </div>
            <div class="row">
                <!--div class="col-xs-12" id="organigrama">

                </div-->
            </div>
            <br>
            <hr>
            </div>
        </section>
        <div id="myModal" class="modal-peam">
            <!-- Modal content -->
            <div class="modal-content-peam  modal-dialog-scroll contentMyModal" style="width: 80%">
                <div class="modal-header-peam" style="background-color: #ffffff; border-bottom: #00793D solid; border-width: 2px">
                    <span class="close" id="btnCerrarModal">&times;</span>
                    <h5 class="text-peam-verde text-peam-negrita" style="margin-top: 15px;">
                        FUNCIONARIOS
                    </h5>
                </div>
                <div class="modal-body-peam modal-body-scroll">
                    <div class="row" style="margin-top: 20px" id="containerModalFuncionarios">

                    </div>
                </div>
                <div class="modal-footer-peam" style="background-color: #ffffff; border-top: #00793D solid; border-width: 2px">
                    <h6 style="margin-top: 10px;" class="text-peam-negrita">PROYECTO ESPECIAL ALTO MAYO</h6>
                </div>
            </div>
        </div>
        <div id="myModalDirectivos" class="modal-peam">
            <!-- Modal content -->
            <div class="modal-content-peam  modal-dialog-scroll contentMyModal" style="width: 80%">
                <div class="modal-header-peam" style="background-color: #ffffff; border-bottom: #00793D solid; border-width: 2px">
                    <span class="close" id="btnCerrarModalDirectivos">&times;</span>
                    <h5 class="text-peam-verde text-peam-negrita" style="margin-top: 15px;">
                        CONSEJO DIRECTIVO
                    </h5>
                </div>
                <div class="modal-body-peam modal-body-scroll">
                    <div class="row" style="margin-top: 20px;" id="containerModalDirectivos">

                    </div>
                </div>
                <div class="modal-footer-peam" style="background-color: #ffffff; border-top: #00793D solid; border-width: 2px">
                    <h6 style="margin-top: 10px;" class="text-peam-negrita">PROYECTO ESPECIAL ALTO MAYO</h6>
                </div>
            </div>
        </div>
        <div id="myModalPEAM" class="modal-peam">
            <!-- Modal content -->
            <div class="modal-content-peam  modal-dialog-scroll contentMyModal" style="width: 80%">
                <div class="modal-header-peam" style="background-color: #ffffff; border-bottom: #00793D solid; border-width: 2px">
                    <span class="close" id="btnCerrarModalPEAM">&times;</span>
                    <h5 class="text-peam-verde text-peam-negrita" style="margin-top: 15px;">
                        GORESAM
                    </h5>
                </div>
                <div class="modal-body-peam modal-body-scroll">
                    <div class="row" style="margin-top: 20px;">
                        <div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2 col-xs-10 col-xs-offset-1 mt-20 mb-10">
                            <a href="http://www.regionsanmartin.gob.pe/"><img src="<%out.print(getServletContext().getContextPath());%>/peam_resources/logos_principales/logo-goresam.png" class="img-responsive" alt="Imagen"></a>
                        </div>
                        <div class="col-xs-12">
                            <div class="team-title text-center" style="padding-top: 15px;">
                                <h4 class="text-peam-verde-subrayado text-peam-negrita-negro">
                                    <a href="http://www.regionsanmartin.gob.pe/" style="text-transform: none">Gobierno Regional San Martín</a>
                                </h4>
                            </div>
                            <h5 class="text-peam-negrita">
                                El Proyecto Especial Alto Mayo (PEAM) es una unidad ejecutora del Gobierno Regional de San Martín desde el 
                                09 de setiembre del año 2003, fecha en que mediante D.S. Nº. 024-2003-VIVIENDA se dispone su transferencia 
                                definitiva desde el Instituto Nacional de Desarrollo (INADE).
                                <a href="http://lib.peam.gob.pe:8081/ArcDig/OriArc.pdf?id=26794">Ver Documento de Aprobación</a>
                            </h5>
                        </div>
                    </div>
                </div>
                <div class="modal-footer-peam" style="background-color: #ffffff; border-top: #00793D solid; border-width: 2px">
                    <h6 style="margin-top: 10px;" class="text-peam-negrita">PROYECTO ESPECIAL ALTO MAYO</h6>
                </div>
            </div>
        </div>
        <%@ include file = "../../../footer.jsp" %>  
        <!-- jQuery -->
        <script src="<%out.print(getServletContext().getContextPath());%>/assets/js/jquery-2.1.3.min.js"></script>
        <script src="<%out.print(getServletContext().getContextPath());%>/assets/bootstrap/js/bootstrap.min.js"></script>
        <script src="<%out.print(getServletContext().getContextPath());%>/assets/materialize/js/materialize.min.js"></script>
        <script src="<%out.print(getServletContext().getContextPath());%>/assets/js/menuzord.js"></script>
        <script src="<%out.print(getServletContext().getContextPath());%>/assets/js/jquery.easing.min.js"></script>
        <script src="<%out.print(getServletContext().getContextPath());%>/assets/js/jquery.sticky.min.js"></script>
        <script src="<%out.print(getServletContext().getContextPath());%>/assets/js/smoothscroll.min.js"></script>
        <script src="<%out.print(getServletContext().getContextPath());%>/assets/js/imagesloaded.js"></script>
        <script src="<%out.print(getServletContext().getContextPath());%>/assets/js/jquery.stellar.min.js"></script>
        <script src="<%out.print(getServletContext().getContextPath());%>/assets/js/jquery.inview.min.js"></script>
        <script src="<%out.print(getServletContext().getContextPath());%>/assets/js/jquery.shuffle.min.js"></script>
        <script src="<%out.print(getServletContext().getContextPath());%>/assets/flexSlider/jquery.flexslider-min.js"></script>
        <script src="<%out.print(getServletContext().getContextPath());%>/assets/js/scripts.js"></script>
        <script type="text/javascript" src="<%out.print(getServletContext().getContextPath());%>/assets/plugins/toast-master/js/jquery.toast.js"></script>
        <script type="text/javascript" src="<%out.print(getServletContext().getContextPath());%>/js_app/utilities/lib-utilities.js"></script>
        <script type="text/javascript" src="<%out.print(getServletContext().getContextPath());%>/js_app/utilities/lib-validaciones.js"></script>
        <script type="text/javascript" src="<%out.print(getServletContext().getContextPath());%>/js/conf_web.js"></script>
        <script type="text/javascript" src="<%out.print(getServletContext().getContextPath());%>/organigrama/organigrama.js"></script>
        <script type="text/javascript" src="<%out.print(getServletContext().getContextPath());%>/js_app/web/estructura_organica.js"></script>
    </body>
</html>