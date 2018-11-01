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
        <!-- magnific-popup -->
        <link href="<%out.print(getServletContext().getContextPath());%>/assets/magnific-popup/magnific-popup.css" rel="stylesheet">
        <!-- flexslider -->
        <link href="<%out.print(getServletContext().getContextPath());%>/assets/flexSlider/flexslider.css" rel="stylesheet">
        <!-- materialize -->
        <link href="<%out.print(getServletContext().getContextPath());%>/assets/materialize/css/materialize.min.css" rel="stylesheet">
        <link href="<%out.print(getServletContext().getContextPath());%>/assets/plugins/toast-master/css/jquery.toast.css" rel="stylesheet">
        <!-- Bootstrap -->
        <link href="<%out.print(getServletContext().getContextPath());%>/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet">
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

        <!-- blog section start -->
        <section class="blog-section section-padding" style="padding-top: 50px">
            <div class="container">
                <div class="text-center mb-30" style="margin-top: 20px;">
                    <h2 class="text-peam-verde h1-title" style="font-size: 30px">Libro de Reclamaciones</h2>
                </div>
                <div style="display:block; width: 100%; text-align: center; margin-top: 7px; margin-bottom: 20px;">
                    Estimado usuario, el Libro de Reclamaciones Virtual es sólo para lo estipulado en el <b style="font-weight: bold">D.S. N° 042-2011-PCM</b>; en caso de realizar una sugerencia o comentario hacer uso del siguiente formulario: <a href="./consultas-y-sugerencias">AQUI </a>
                </div>
                <div class="row">
                    <div class="col-xs-12">
                        <div class="posts-content single-post">
                            <article class="post-wrapper">
                                <header class="entry-header-wrapper clearfix">                                    
                                    <div class="entry-header">
                                        <form id="FrmReclamo">
                                            <div class="row">
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <div class="col-6">
                                                        <div class="input-field">
                                                            <input type="text" name="txtInteresado" class="validate" id="txtInteresado">
                                                            <label for="txtInteresado" class="">APELLIDOS Y NOMBRES</label>
                                                        </div>
                                                    </div><!-- /.col-md-6 -->
                                                </div>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <div class="col-6">
                                                        <div class="input-field">
                                                            <label class="sr-only" for="txtEmail">CORREO ELECTRONICO</label>
                                                            <input id="txtEmail" type="email" name="txtEmail" class="validate">
                                                            <label for="txtEmail" data-error="wrong" data-success="right" class="">CORREO ELECTRONICO</label>
                                                        </div>
                                                    </div><!-- /.col-md-6 -->
                                                </div><!-- /.row -->
                                            </div>
                                            <div class="row">
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <div class="col-6">
                                                        <div class="input-field">
                                                            <select id="comboTipoDocumento" name="comboTipoDocumento" class="form-control" style="border: 1px solid #8bc34a; margin-top: 40px">
                                                                <option value="-1">TIPO DE DOCUMENTO</option>
                                                                <option value="D.N.I">D.N.I</option>
                                                                <option value="R.U.C">R.U.C</option>
                                                                <option value="C.E.">C.E.</option>
                                                            </select>
                                                        </div>

                                                    </div><!-- /.col-md-6 -->
                                                </div>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <div class="col-6">
                                                        <div class="input-field">
                                                            <input type="text" name="txtNroDocumento" class="validate" id="txtNroDocumento">
                                                            <label for="txtNroDocumento" class="">NUMERO DE DOCUMENTO</label>
                                                        </div>
                                                    </div><!-- /.col-md-6 -->
                                                </div><!-- /.row -->
                                            </div>
                                            <div class="row">
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <div class="col-6">
                                                        <div class="input-field">
                                                            <input type="text" name="txtTelefono" class="validate" id="txtTelefono">
                                                            <label for="txtTelefono" class="">TELEFONO</label>
                                                        </div>
                                                    </div><!-- /.col-md-6 -->
                                                </div>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <div class="col-6">
                                                        <div class="input-field">
                                                            <input type="text" name="txtDomicilio" class="validate" id="txtDomicilio">
                                                            <label for="txtDomicilio" class="">DOMICILIO</label>
                                                        </div>
                                                    </div><!-- /.col-md-6 -->
                                                </div><!-- /.row -->
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12 col-sm-12 col-xs-12">
                                                    <div class="col-12">
                                                        <div class="input-field">
                                                            <textarea name="txtMensaje" id="txtMensaje" class="materialize-textarea"></textarea>
                                                            <label for="txtMensaje" class="">RECLAMO</label>
                                                        </div>
                                                        <div class="row" id="loader_reclamo" style="display: none">
                                                            <div class="col-md-1 col-md-offset-5 col-xs-2 col-xs-offset-5 mt-30">
                                                                <div class="loader-peam_small"></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <input id="action" name="action" type="hidden">
                                            <button type="submit" id="btnGuardar" class="waves-effect waves-light btn submit-button success mt-30">ENVIAR</button>
                                        </form>
                                    </div>
                                </header>
                            </article>
                        </div>
                    </div>

                    <div class="col-xs-12 text-center">
                        <div class="widget widget_search mb-20">
                            <div class="fb-page" 
                                 data-href="https://web.facebook.com/Proyecto-Especial-Alto-Mayo-188571127885448/?ref=br_rs"
                                 data-width="380" 
                                 data-hide-cover="false"
                                 data-show-facepile="false"></div>
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
            }(document, 'script', 'facebook-jssdk'));
        </script>
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
        <script src="<%out.print(getServletContext().getContextPath());%>/assets/magnific-popup/jquery.magnific-popup.min.js"></script>
        <script src="<%out.print(getServletContext().getContextPath());%>/assets/js/scripts.js"></script>

        <!-- RS5.0 Core JS Files -->
        <script src="<%out.print(getServletContext().getContextPath());%>/assets/plugins/sweetalert/sweetalert.min.js"></script>

        <script src="<%out.print(getServletContext().getContextPath());%>/assets/revolution/js/jquery.themepunch.tools.min.js"></script>
        <script src="<%out.print(getServletContext().getContextPath());%>/assets/revolution/js/jquery.themepunch.revolution.min.js"></script>
        <script src="<%out.print(getServletContext().getContextPath());%>/js/jquery.Pagination.min.js"></script>
        <script type="text/javascript" src="<%out.print(getServletContext().getContextPath());%>/assets/plugins/toast-master/js/jquery.toast.js"></script>
        <script type="text/javascript" src="<%out.print(getServletContext().getContextPath());%>/js_app/utilities/lib-utilities.js"></script>
        <script type="text/javascript" src="<%out.print(getServletContext().getContextPath());%>/js_app/utilities/lib-validaciones.js"></script>
        <script type="text/javascript" src="<%out.print(getServletContext().getContextPath());%>/js/conf_web.js"></script>
        <script type="text/javascript" src="<%out.print(getServletContext().getContextPath());%>/js_app/web/librodereclamos.js"></script>
    </body>
</html>