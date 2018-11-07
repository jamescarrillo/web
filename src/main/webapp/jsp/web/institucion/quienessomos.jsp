<!DOCTYPE html>
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
        <section class="padding-bottom-100" style="padding-top: 50px">
            <div class="container">
                <div class="text-center mb-30" style="margin-top: 20px;">
                    <h2 class="text-peam-verde h1-title" style="font-size: 30px">¿Quiénes Somos?</h2>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="border-tab transparent-nav">
                            <ul class="nav nav-tabs nav-justified" role="tablist">
                                <li role="presentation" class="active"><a href="#tab-base_legal" class="waves-effect waves-dark"  role="tab" data-toggle="tab">Base Legal</a></li>
                                <li role="presentation"><a href="#tab-resenia_historica" class="waves-effect waves-dark" role="tab" data-toggle="tab">Reseña Histórica</a></li>
                                <li role="presentation"><a href="#tab-actualidad" class="waves-effect waves-dark" role="tab" data-toggle="tab">Actualidad</a></li>
                            </ul>
                            <div class="panel-body">
                                <div class="tab-content">
                                    <div role="tabpanel" class="tab-pane fade in active" id="tab-base_legal" style="font-size: 16px;text-align: justify">
                                        <p>El Proyecto Especial Alto Mayo (PEAM) fue creado mediante Decreto Supremo Nº. 031-81-PCM como una institución pública descentralizada. En 1990 adquirió la categoría de Programa Presupuestario, con personería jurídica y autonomía económica, financiera, técnica y administrativa, D.L. Nº. 556 Art. 419. <a class="text-primary" href="http://www.peam.gob.pe/GestionTransparente?action=verNormaDirectiva&id=31249" target="_blank">Ver Documento</a></p>
                                        <p>El PEAM es transferido al Gobierno Regional de San Martín, el 09 de setiembre del 2003 mediante D.S. Nº. 024-2003-VIVIENDA, en concordancia con la Ley Nº. 27902 en el que establece el inicio del proceso de transferencia a los Gobiernos Regionales y en el marco del proceso establecido por el Consejo Nacional de Descentralización. <a class="text-primary" href="http://www.peam.gob.pe/GestionTransparente?action=verNormaDirectiva&id=31248" target="_blank">Ver Documento</a> </p>
                                    </div>
                                    <div role="tabpanel" class="tab-pane fade" id="tab-resenia_historica" style="font-size: 16px;text-align: justify">
                                        <p>En la década del 80, con la elaboración del Plan Nacional de Desarrollo, y la definición de objetivos y determinación de medidas para la estabilización de la economía, el gobierno decide impulsar los Proyectos de Desarrollo Rural, adquiriendo importancia los proyectos ubicados en la Zona de Selva, considerada como una importante frontera agrícola y despensa nacional.</p>
                                        <p>Dentro de éste marco se crea el Proyecto Especial Alto Mayo como un Subprograma Presupuestario del Proyecto Especial Huallaga Central y Bajo Mayo, D.S. Nº. 031-81-PCM, adquiriendo en 1990 la categoría de Programa Presupuestario con personería jurídica, autonomía económica, financiera, técnica y administrativa, D.L. Nº. 556- Artículo 419. </p>
                                        <p>Desde su concepción, el Proyecto Especial Alto Mayo estima su ejecución en dos etapas, la primera etapa con 120,000 Ha. ubicadas en la Margen Derecha del Río Mayo con un presupuesto aproximado de US$ 83?700,000 a precios de 1,983 con Financiamiento Externo, mediante Convenio de Préstamo con el Banco Mundial (BIRF) con US$ 21?882,291 y Convenio de Préstamo con el Fondo Internacional de Desarrollo Agrícola (FIDA) por US$ 22?857,058 DEG, y la segunda etapa con 37,000 Ha. ubicadas en la Margen Izquierda del Río Mayo con una inversión aproximada de 18?000,000 DM mediante el financiamiento de Cooperación Económica de la KfW de Alemania y la contraparte con Recursos Nacionales.</p>
                                        <p>El Proyecto Desarrollo Integral Alto Mayo (DIAM) establece el Componente de Protección Ambiental mediante Canje de Deuda por Naturaleza por DM 10 millones, a través de un aporte financiero del Estado Peruano de DM 4 millones, administrados por PROFONANPE. </p>
                                    </div>
                                    <div role="tabpanel" class="tab-pane fade" id="tab-actualidad" style="font-size: 16px;text-align: justify">
                                        <div class="text-center mb-30">
                                            <img src="<%out.print(getServletContext().getContextPath() +"/peam_resources/logos_principales/" + conf_web.getNombre_logo_presentacion_actualidad());%>" />
                                        </div>
                                        <p>En este contexto el Proyecto Especial Alto Mayo ha venido ejecutando sus acciones con el uso combinado de recursos del Tesoro Público, Donaciones y Crédito Externo, en base a políticas y
                                            lineamientos del Instituto Nacional de Desarrollo (INADE) hasta el 09 de setiembre del 2,003, fecha en que mediante D.S. Nº. 024-2003-VIVIENDA se dispone la transferencia definitiva al
                                            Gobierno Regional San Martín, continuando como Unidad Ejecutora dependiente de este.
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div><!-- /.border-bottom-tab -->
                    </div><!-- /.col-md-12 -->
                </div><!-- /.row -->

                <hr>

            </div><!-- /.container -->
        </section>
        <%@ include file = "../../../footer.jsp" %>  
        <!-- jQuery -->
        <script src="<%out.print(getServletContext().getContextPath());%>/assets/js/jquery-2.1.3.min.js"></script>
        <script src="<%out.print(getServletContext().getContextPath());%>/assets/bootstrap/js/bootstrap.min.js"></script>
        <script src="<%out.print(getServletContext().getContextPath());%>/assets/materialize/js/materialize.min.js"></script>
        <script src="<%out.print(getServletContext().getContextPath());%>/assets/js/menuzord.js"></script>
        <script src="<%out.print(getServletContext().getContextPath());%>/assets/js/bootstrap-tabcollapse.min.js"></script>
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

    </body>
</html>