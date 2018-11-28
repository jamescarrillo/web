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
        <link href="<%out.print(getServletContext().getContextPath());%>/assets/css/skins/corporate.css" rel="stylesheet">

        <link href="<%out.print(getServletContext().getContextPath());%>/assets/plugins/sweetalert/sweetalert.css"rel="stylesheet">
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
        <section class="section-padding grid-news" style="padding-top: 50px">
            <div class="container">
                <div class="text-center mb-30">
                    <h1 class="text-peam-verde-subrayado">Control Interno</h1>
                </div>
                <div class="row">
                    <div class="col-xs-12">
                        <div class="panel-group feature-accordion brand-accordion icon angle-icon" id="tab">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#tab" href="#tab-que-es-control-interno" aria-expanded="true" class="">
                                            ¿Qué es Control Interno?
                                        </a>
                                    </h3>
                                </div>
                                <div id="tab-que-es-control-interno" class="panel-collapse collapse in" aria-expanded="true" style="">
                                    <div class="panel-body">
                                        <div><p>El Control Interno es un proceso continuo dinámico e integral de gestión, efectuado por el Titular, funcionarios y servidores de la entidad, diseñado para enfrentar los riesgos y dar seguridad razonable de que se alcancen los objetivos institucionales. De esta manera se contribuye a prevenir irregularidades y actos de corrupción en las entidades públicas.</p></div>
                                        <div><p style="font-weight: bold;">Objetivos del Control Interno</p></div>
                                        <div>
                                            <ul style="list-style-type: disc; font-size: 14px; line-height: 25px;">
                                                <li>Promover y optimizar la eficiencia, eficacia, transparencia y economía en las operaciones de la entidad así como la calidad de los servicios públicos que presta.</li>
                                                <li>Proteger y conservar los recursos públicos contra cualquier perdida, dispendio, uso indebido, acto irregular o ilegal como mecanismo de lucha contra la corrupción.</li>
                                                <li>Efectuar una rendición de cuentas oportuna con información válida y confiable.</li>
                                                <li>Adaptarse a los cambios del entorno y lograr efectos sustantivos sobre los resultados de la entidad mediante la mejora continua.</li>
                                            </ul>
                                        </div>
                                        <div><p style="font-weight: bold;">Sistema de Control Interno</p></div>
                                        <div>
                                            <p>El SCI es el conjunto de acciones, actividades, planes, políticas, normas, registros, organización, procedimientos y métodos, incluyendo las actitudes de las autoridades y el personal, organizados y establecidos en cada entidad del Estado; cuya estructura, componentes, elementos y objetivos se regulan por la Ley Nº 28716 y la normativa técnica que emite la Contraloría sobre la materia.</p>
                                            <p>La normativa peruana respecto al SCl, toma lo establecido por el Marco Integrado de Control Interno - COSO, cuya estructura se basa en cinco componentes. Asimismo, la Ley N' 28716 establece siete componentes para el SCl, respecto de los cuales Mediante Resolución de Contraloría Nº 320-2006-CG, se agrupa en el componente de supervisión; los componentes de actividades de prevención y monitoreo, seguimiento de resultados y los compromisos de mejoramiento establecidos en la Ley Nº 28716, alineando de esta manera los componentes del SCI al COSO. </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title">
                                        <a class="collapsed" data-toggle="collapse" data-parent="#tab" href="#tab-modelo-del-sistema-de-control-interno" aria-expanded="false">
                                            Modelo del Sistema de Control Interno
                                        </a>
                                    </h3>
                                </div>
                                <div id="tab-modelo-del-sistema-de-control-interno" class="panel-collapse collapse" aria-expanded="false">
                                    <div class="panel-body">
                                        <div><p style="font-weight: bold;">Modelo de Implementación del Sistema de Control Interno</p></div>
                                        <div><p>El Modelo de implementación del SCI en las entidades del Estado comprende las fases de planificación, ejecución y evaluación, constituida cada una de ellas por etapas y estas últimas por actividades, las cuales se desarrollan secuencialmente a fin de consolidar el Control Interno de la entidad. Las entidades deben iniciar o complementar su Modelo de implementación observando en qué etapa y fase se encuentran, de tal manera que cada entidad culmine la implementación oportunamente. A continuación se muestra el Modelo de implementación del SCl, con sus respetivas fases, etapas y actividades.</p></div>
                                        <div>
                                            <img class="img-responsive" style="width: 50%; height: 50%;" src="<%out.print(getServletContext().getContextPath());%>/peam_resources_app/conf_app/img/modelosci.jpg" alt="Modelo de Implementación del Sistema de Control Interno">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title">
                                        <a class="collapsed" data-toggle="collapse" data-parent="#tab" href="#tab-implementacion-del-sistema-de-control-interno" aria-expanded="false">
                                            Implementación del Sistema de Control Interno
                                        </a>
                                    </h3>
                                </div>
                                <div id="tab-implementacion-del-sistema-de-control-interno" class="panel-collapse collapse" aria-expanded="false">
                                    <div class="panel-body">
                                        <div class="row">
                                            <div class="col-xs-12" style="padding-top: 10px"><h5>Implementación y Fortalecimiento del Sistema de Control Interno</h5></div>
                                            <div class="col-xs-6" style="padding-top: 10px">
                                                <h5 class="text-peam-negrita">ETAPA I: ACCIONES PRELIMINARES</h5>
                                                <div><p>ESTADO: IMPLEMENTADO</p></div>
                                                <div><p>Constituidas por las actividades de formalización del compromiso institucional para la implementación del sci, las cuales describen a continuación:</p></div>
                                                <ul style="list-style-type: disc; font-size: 14px; line-height: 25px;">
                                                    <li>Actividad 1: Suscribir el acta de compromiso</li>
                                                    <li>Actividad 2: Conformar el Comité de Control Interno</li>
                                                    <li>Actividad 3: Sensibilizar y capacitar en Control Interno</li>
                                                </ul>
                                                <div><p style="font-weight: bold;">Documentos</p></div>
                                                <div>
                                                    <ul style="list-style-type: disc; font-size: 14px; line-height: 25px;">
                                                        <li><i class="fa fa-check mr-10"></i> <a href="http://lib.peam.gob.pe:8081/ArcDig/OriArc.pdf?id=99940" target="_blank" title="">Acta de compromiso para la implementación del SCI en el PEAM</a></li>
                                                        <li><i class="fa fa-check mr-10"></i> <a href="http://lib.peam.gob.pe:8081/ArcDig/OriArc.pdf?id=99981" target="_blank" title="">Actas de compromiso individuales para la implementación del SCI en el PEAM</a></li>
                                                        <li>Resoluciones de conformación del Comité de Control Interno
                                                            <ul style="list-style-type: circle; font-size: 14px; line-height: 25px;">
                                                                <li><i class="fa fa-check mr-10"></i> <a href="http://lib.peam.gob.pe:8081/ArcDig/OriArc.pdf?id=16285" target="_blank" title="">Resolución Gerencial 060-2012-GRSM-PEAM-01.00</a></li>
                                                                <li><i class="fa fa-check mr-10"></i> <a href="http://lib.peam.gob.pe:8081/ArcDig/OriArc.pdf?id=30510" target="_blank" title="">Resolución Gerencial 368-2012-GRSM-PEAM-01.00</a></li>
                                                                <li><i class="fa fa-check mr-10"></i> <a href="http://lib.peam.gob.pe:8081/ArcDig/OriArc.pdf?id=90133" target="_blank" title="">Resolución Gerencial 190-2016-GRSM-PEAM-01.00</a></li>
                                                                <li><i class="fa fa-check mr-10"></i> <a href="http://lib.peam.gob.pe:8081/ArcDig/OriArc.pdf?id=91388" target="_blank" title="">Resolución Gerencial 234-2016-GRSM-PEAM-01.00</a></li>
                                                            </ul>
                                                        </li>
                                                        <li><i class="fa fa-check mr-10"></i> <a href="http://lib.peam.gob.pe:8081/ArcDig/OriArc.pdf?id=98487" target="_blank" title="">Reglamento del comité de control interno</a></li>
                                                        <li><i class="fa fa-check mr-10"></i> <a href="http://lib.peam.gob.pe:8081/ArcDig/OriArc.pdf?id=99982" target="_blank" title="">Sensibilización y capacitación en control interno</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="col-xs-6" style="padding-top: 10px">
                                                <div><p style="font-weight: bold;">ETAPA II: IDENTIFICACION DE BRECHAS</p></div>
                                                <div><p>ESTADO: IMPLEMENTADO</p></div>
                                                <div><p>Comprende las actividades preparatorias para la elaboración del diagnóstico de control interno, con la finalidad de conocer el estado situacional de su implementación en la entidad.</p></div>
                                                <div>
                                                    <ul style="list-style-type: disc; font-size: 14px; line-height: 25px;">
                                                        <li>Actividad 4: Elaborar del programa de trabajo para realizar el diagnóstico del SCI.</li>
                                                        <li>Actividad 5: Realizar el diagnóstico del SCI.</li>
                                                    </ul>
                                                </div>
                                                <div><p style="font-weight: bold;">Documentos</p></div>
                                                <div>
                                                    <ul style="list-style-type: disc; font-size: 14px; line-height: 25px;">
                                                        <li><i class="fa fa-check mr-10"></i> <a href="http://lib.peam.gob.pe:8081/ArcDig/OriArc.pdf?id=98090" target="_blank" title="">R.G. 350-2017-GRSM-PEAM-01.00: Aprueba programa de trabajo para el diagnóstico del SCI</a></li>
                                                        <li><i class="fa fa-check mr-10"></i> <a href="http://lib.peam.gob.pe:8081/ArcDig/OriArc.pdf?id=98507" target="_blank" title="">R.G. 050-2018-GRSM-PEAM-01.00: Aprueba informe de diagnóstico del SCI</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-xs-6" style="padding-top: 10px">
                                                <div><p style="font-weight: bold;">ETAPA III: ELABORACION DEL PLAN DE TRABAJO PARA EL CIERRE DE BRECHAS</p></div>
                                                <div><p>ESTADO: IMPLEMENTADO</p></div>
                                                <div><p>Comprende la formulación de las acciones para el cierre de brechas identificadas en el diagnóstico, para lo cual considera la siguiente actividad:</p></div>
                                                <div>
                                                    <ul style="list-style-type: disc; font-size: 14px; line-height: 25px;">
                                                        <li>Actividad 6: Elaborar el plan de trabajo con base en los resultados del diagnóstico del SCI.</li>
                                                    </ul>
                                                </div>
                                                <div><p style="font-weight: bold;">Documentos</p></div>
                                                <div>
                                                    <ul style="list-style-type: disc; font-size: 14px; line-height: 25px;">
                                                        <li><i class="fa fa-check mr-10"></i> <a href="http://lib.peam.gob.pe:8081/ArcDig/OriArc.pdf?id=98503" target="_blank" title="">R.G. 046-2018-GRSM-PEAM-01.00: Aprueba informe del plan de trabajo para el cierre de brechas del PEAM</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="col-xs-6" style="padding-top: 10px">
                                                <div><p style="font-weight: bold;">ETAPA IV: CIERRE DE BRECHAS</p></div>
                                                <div><p>ESTADO: PROCESO DE IMPLEMENTACION</p></div>
                                                <div><p>Comprende la ejecución de las acciones definidas en el plan de trabajo.</p></div>
                                                <div>
                                                    <ul style="list-style-type: disc; font-size: 14px; line-height: 25px;">
                                                        <li>Actividad 7: Ejecutar las acciones definidas en el plan de trabajo.</li>
                                                    </ul>
                                                </div>
                                                <div><p style="font-weight: bold;">Documentos</p></div>
                                                <div>
                                                    <ul class="check-circle-list" style="list-style-type: disc; font-size: 14px; line-height: 25px;">
                                                        <li><i class="fa fa-check mr-10"></i> <a href="http://lib.peam.gob.pe:8081/ArcDig/OriArc.pdf?id=98504" target="_blank" title="">R.G. 047-2018-GRSM-PEAM-01.00: Aprueba la política de gestión de riesgos</a></li>
                                                        <li><i class="fa fa-check mr-10"></i> <a href="http://lib.peam.gob.pe:8081/ArcDig/OriArc.pdf?id=98505" target="_blank" title="">R.G. 048-2018-GRSM-PEAM-01.00: Aprueba el manual de gestión de riesgos</a></li>
                                                        <li><i class="fa fa-check mr-10"></i> <a href="http://lib.peam.gob.pe:8081/ArcDig/OriArc.pdf?id=98506" target="_blank" title="">R.G. 049-2018-GRSM-PEAM-01.00: Aprueba el plan de gestión de riesgos</a></li>
                                                        <li><i class="fa fa-check mr-10"></i> <a href="http://lib.peam.gob.pe:8081/ArcDig/OriArc.pdf?id=98755" target="_blank" title="">R.G. 086-2018-GRSM-PEAM-01.00: Aprueba el plan de desarrollo de las personas 2018</a></li>
                                                        <li><i class="fa fa-check mr-10"></i> <a href="http://lib.peam.gob.pe:8081/ArcDig/OriArc.pdf?id=100852" target="_blank" title="">R.G. 321-2018-GRSM-PEAM-01.00: Modifica la Directiva 005-2018-GRSM-PEAM-01.00</a></li>
                                                        <li><i class="fa fa-check mr-10"></i> <a href="http://lib.peam.gob.pe:8081/ArcDig/OriArc.pdf?id=101640" target="_blank" title="">Memorando Múltiple. 070-2018-GRSM-PEAM-02.00: Difusión de la directiva</a></li>
                                                        <li><i class="fa fa-check mr-10"></i> <a href="http://lib.peam.gob.pe:8081/ArcDig/OriArc.pdf?id=101644" target="_blank" title="">R.G. 357-2018-GRSM-PEAM-01.00: Aprueba el procedimiento para la gestión de riesgos</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title">
                                        <a class="collapsed" data-toggle="collapse" data-parent="#tab" href="#tab-comite-del-sistema-de-control-interno" aria-expanded="false">
                                            Comité del Sistema de Control Interno
                                        </a>
                                    </h3>
                                </div>
                                <div id="tab-comite-del-sistema-de-control-interno" class="panel-collapse collapse" aria-expanded="false">
                                    <div class="panel-body">
                                        <div class="row">
                                            <div class="col-xs-12" style="padding-top: 10px">
                                                <h5 class="text-peam" style="font-size: 14px">Comité de Implementación del Sistema de Control Interno del Proyecto Especial Alto Mayo, el cual tendrá a su cargo la elaboración del Sistema de Control Interno de la Entidad. Está integrado por los siguientes profesionales:</h5>
                                            </div>
                                            <div class="col-xs-6" style="padding-top: 10px">
                                                <h5 class="text-peam-negrita">MIEMBROS TITULARES</h5>
                                                <ul class="check-circle-list" style="list-style-type: disc; font-size: 14px; line-height: 25px;">
                                                    <li><i class="fa fa-check mr-10"></i> Presidente: Jefe de la Oficina de Presupuesto, Planificación, Estudios y Ordenamiento Territorial</li>
                                                    <li><i class="fa fa-check mr-10"></i> Secretario Técnico: Jefe de la Oficina de Asesoría Jurídica</li>
                                                    <li><i class="fa fa-check mr-10"></i> Miembro: Jefe de la Oficina de Administración</li>
                                                    <li><i class="fa fa-check mr-10"></i> Miembro: Director de Desarrollo Agropecuario</li>
                                                    <li><i class="fa fa-check mr-10"></i> Miembro: Director de Infraestructura</li>
                                                    <li><i class="fa fa-check mr-10"></i> Miembro: Director de Manejo Ambiental</li>
                                                </ul>
                                            </div>
                                            <div class="col-xs-6" style="padding-top: 10px">
                                                <h5 class="text-peam-negrita">MIEMBROS SUPLENTES</h5>
                                                <ul class="check-circle-list" style="list-style-type: disc; font-size: 14px; line-height: 25px;">
                                                    <li><i class="fa fa-check mr-10"></i> Presidente: Contador</li>
                                                    <li><i class="fa fa-check mr-10"></i> Secretario Técnico: Especialista en Personal</li>
                                                    <li><i class="fa fa-check mr-10"></i> Miembro: Especialista en Programa de Educación Ambiental</li>
                                                    <li><i class="fa fa-check mr-10"></i> Miembro: Especialista en Planes y Monitoreo</li>
                                                    <li><i class="fa fa-check mr-10"></i> Miembro: Especialista Agropecuario</li>
                                                    <li><i class="fa fa-check mr-10"></i> Miembro: Control Previo</li>
                                                </ul>
                                            </div>
                                            <div class="col-xs-12" style="padding-top: 10px">
                                                <h5 class="text-peam-negrita">ACTAS DEL COMITE SCI</h5>
                                                <ul class="check-circle-list" style="list-style-type: disc; font-size: 14px; line-height: 25px;">
                                                    <li><i class="fa fa-check mr-10"></i> <a href="http://lib.peam.gob.pe:8081/ArcDig/OriArc.pdf?id=99983" target="_blank" title="">Acta de instalación del comité del SCI</a> - 06/11/2012</li>
                                                    <li><i class="fa fa-check mr-10"></i> <a href="http://lib.peam.gob.pe:8081/ArcDig/OriArc.pdf?id=99984" target="_blank" title="">Acta del comité del SCI</a> - 16/11/2012</li>
                                                    <li><i class="fa fa-check mr-10"></i> <a href="http://lib.peam.gob.pe:8081/ArcDig/OriArc.pdf?id=99985" target="_blank" title="">Acta del comité del SCI</a> - 21/11/2012</li>
                                                    <li><i class="fa fa-check mr-10"></i> <a href="http://lib.peam.gob.pe:8081/ArcDig/OriArc.pdf?id=99986" target="_blank" title="">Acta del comité del SCI</a> - 16/04/2013</li>
                                                    <li><i class="fa fa-check mr-10"></i> <a href="http://lib.peam.gob.pe:8081/ArcDig/OriArc.pdf?id=99987" target="_blank" title="">Acta de sensibilización del comité del SCI</a> - 09/08/2013</li>
                                                    <li><i class="fa fa-check mr-10"></i> <a href="http://lib.peam.gob.pe:8081/ArcDig/OriArc.pdf?id=99988" target="_blank" title="">Acta de reunión de trabajo del comité de implementación del SCI</a> - 24/09/2013</li>
                                                    <li><i class="fa fa-check mr-10"></i> <a href="http://lib.peam.gob.pe:8081/ArcDig/OriArc.pdf?id=99989" target="_blank" title="">Acta del plan de trabajo para el diagnóstico a nivel institucional del SCI</a> - 04/11/2013</li>
                                                    <li><i class="fa fa-check mr-10"></i> <a href="http://lib.peam.gob.pe:8081/ArcDig/OriArc.pdf?id=101641" target="_blank" title="">Acta del comité del SCI</a> - 28/01/2014</li>
                                                    <li><i class="fa fa-check mr-10"></i> <a href="http://lib.peam.gob.pe:8081/ArcDig/OriArc.pdf?id=101642" target="_blank" title="">Acta del comité del SCI</a> - 22/12/2015</li>
                                                    <li><i class="fa fa-check mr-10"></i> <a href="http://lib.peam.gob.pe:8081/ArcDig/OriArc.pdf?id=99990" target="_blank" title="">Acta de instalación del SCI</a> - 29/05/2017</li>
                                                    <li><i class="fa fa-check mr-10"></i> <a href="http://lib.peam.gob.pe:8081/ArcDig/OriArc.pdf?id=99991" target="_blank" title="">Acta del comité del SCI</a> - 26/07/2017</li>
                                                    <li><i class="fa fa-check mr-10"></i> <a href="http://lib.peam.gob.pe:8081/ArcDig/OriArc.pdf?id=99992" target="_blank" title="">Acta del comité del SCI</a> - 26/09/2017</li>
                                                    <li><i class="fa fa-check mr-10"></i> <a href="http://lib.peam.gob.pe:8081/ArcDig/OriArc.pdf?id=99993" target="_blank" title="">Acta de sesión del comité del SCI</a> - 21/11/2017</li>
                                                    <li><i class="fa fa-check mr-10"></i> <a href="http://lib.peam.gob.pe:8081/ArcDig/OriArc.pdf?id=99994" target="_blank" title="">Acta de sesión ordinaria 01-2018 del comité del SCI</a> - 29/01/2018</li>
                                                    <li><i class="fa fa-check mr-10"></i> <a href="http://lib.peam.gob.pe:8081/ArcDig/OriArc.pdf?id=99995" target="_blank" title="">Acta de sesión extra ordinaria 01-2018 del comité del SCI</a> - 08/02/2018</li>
                                                    <li><i class="fa fa-check mr-10"></i> <a href="http://lib.peam.gob.pe:8081/ArcDig/OriArc.pdf?id=99996" target="_blank" title="">Acta de sesión ordinaria 02-2018 del comité del SCI</a> - 04/04/2018</li>
                                                    <li><i class="fa fa-check mr-10"></i> <a href="http://lib.peam.gob.pe:8081/ArcDig/OriArc.pdf?id=99997" target="_blank" title="">Acta de sesión ordinaria 03-2018 del comité del SCI</a> - 04/06/2018</li>
                                                    <li><i class="fa fa-check mr-10"></i> <a href="http://lib.peam.gob.pe:8081/ArcDig/OriArc.pdf?id=99998" target="_blank" title="">Acta de sesión ordinaria 04-2018 del comité del SCI</a> - 03/08/2018</li>
                                                    <li><i class="fa fa-check mr-10"></i> <a href="http://lib.peam.gob.pe:8081/ArcDig/OriArc.pdf?id=99999" target="_blank" title="">Acta de sesión extra ordinaria 02-2018 del comité del SCI</a> - 19/09/2018</li>
                                                    <li><i class="fa fa-check mr-10"></i> <a href="http://lib.peam.gob.pe:8081/ArcDig/OriArc.pdf?id=101643" target="_blank" title="">Acta de sesión extra ordinaria 03-2018 del comité del SCI</a> - 11/10/2018</li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <%@ include file = "../../../footer.jsp" %>  
        <div id="fb-root"></div>
        <script>(function (d, s, id) {
                var js, fjs = d.getElementsByTagName(s)[0];
                if (d.getElementById(id))
                    return;
                js = d.createElement(s);
                js.id = id;
                js.src = 'https://connect.facebook.net/es_LA/sdk.js#xfbml=1&version=v3.2';
                fjs.parentNode.insertBefore(js, fjs);
            }(document, 'script', 'facebook-jssdk'));</script>
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
        <!-- RS5.0 Core JS Files -->
        <script src="<%out.print(getServletContext().getContextPath());%>/assets/plugins/sweetalert/sweetalert.min.js"></script>
        <script src="<%out.print(getServletContext().getContextPath());%>/assets/revolution/js/jquery.themepunch.tools.min.js"></script>
        <script src="<%out.print(getServletContext().getContextPath());%>/assets/revolution/js/jquery.themepunch.revolution.min.js"></script>
        <script type="text/javascript" src="<%out.print(getServletContext().getContextPath());%>/assets/plugins/toast-master/js/jquery.toast.js"></script>
        <script type="text/javascript" src="<%out.print(getServletContext().getContextPath());%>/js_app/utilities/lib-utilities.js"></script>
        <script type="text/javascript" src="<%out.print(getServletContext().getContextPath());%>/js_app/utilities/lib-validaciones.js"></script>
        <script type="text/javascript" src="<%out.print(getServletContext().getContextPath());%>/js/conf_web.js"></script>
        <script type="text/javascript" src="<%out.print(getServletContext().getContextPath());%>/js_app/web/publicaciones-multimedia.js"></script>

    </body>
</html>