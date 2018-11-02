$(document).ready(function () {

    cargarAniosCombo($('#comboAnioNoticia_'), 2010, "-1", 'AÑO');

    $("#FrmNotaPrensa").submit(function () {
        $('#loader_contenido').css('display', 'block');
        procesarAjaxNotaPrensaWeb();
        return false;
    });

    addEventoCombosPaginarFormulario();
    procesarAjaxNotaPrensaWeb();

});

function procesarAjaxNotaPrensaWeb() {
    var pathname = window.location.pathname;
    pathname = pathname.substring(getContext().length, pathname.length);
    var datosSerializadosCompletos = $('#' + $('#nameFormNotaPrensa').val()).serialize();
    $.ajax({
        url: getContext() + '/publicaciones/noticias/notas-de-prensa',
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        success: function (jsonResponse) {
            $('#loader_contenido').css('display', 'none');
            switch (pathname) {
                case "/":
                    listarNotaPrensaWebIndex(jsonResponse.BEAN_PAGINATION);
                    break;
                case "/index":
                    listarNotaPrensaWebIndex(jsonResponse.BEAN_PAGINATION);
                    break;
                case "/publicaciones/noticias/notas-de-prensa":
                    listarNotaPrensaWebVerNoticias(jsonResponse.BEAN_PAGINATION);
                    break;
            }
        },
        error: function () {
            /*MOSTRAMOS MENSAJE ERROR SERVIDOR*/
            $('#loader_contenido').css('display', 'none');
            viewAlertWeb('error', 'Error interno en el servidor!');
        }
    });
    return false;
}

function listarNotaPrensaWebIndex(BEAN_PAGINATION) {
    /*PAGINATION*/
    if (BEAN_PAGINATION.COUNT_FILTER > 0) {
        var cadenaContenido;
        $.each(BEAN_PAGINATION.LIST, function (index, value) {
            cadenaContenido = removeTagHTML(value.contenido);
            if (index < 5) {
                $('#idNota' + (index + 1)).val(value.id);
                $('#tituloNotaPrensa' + (index + 1)).html(getTituloWeb(value.titulo, 45));
                $('#resumenNotaPrensa' + (index + 1)).html(getTituloWeb(getResumenContenidoWeb(cadenaContenido, 150), 90));
            }
            $('#imgCNotaPrensa' + index).attr('src', value.foto);
            $('#tituloCNotaPrensa' + index).html(value.titulo + getFormViewNotice(value.id));

        });
        $("#contenedorCarrusel").owlCarousel();
        addEventsNoticias();
    } else {
        viewAlertWeb('warning', 'No se encontraron resultados');
    }
}

function listarNotaPrensaWebVerNoticias(BEAN_PAGINATION) {
    /*PAGINATION*/
    $('#contenedorArticulos').empty();
    if (BEAN_PAGINATION.COUNT_FILTER > 0) {
        var cadenaContenido;
        var row = "<div class='row'>";
        var contador = 0;
        if ($('#idNota').val() === "-1") {
            $('#idTituloMasNoticias').html("<strong>Noticias</strong>");
            $('#contenedorNoticiaPrincial').css('display', 'none');
        } else {
            $('#idTituloMasNoticias').html("<strong>Más Noticias</strong>");
            $('#contenedorNoticiaPrincial').css('display', 'block');
        }
        $.each(BEAN_PAGINATION.LIST, function (index, value) {
            cadenaContenido = removeTagHTML(value.contenido);
            if (value.id.toString() === $('#idNota').val()) {
                $('#idImgNoticiaPrincipal').attr('src', value.foto);
                $('#idTituloNoticiaPrincipal').html(value.titulo);
                $('#idFuenteNoticiaPrincipal').html(value.fuente);
                $('#idContenidoNoticiaPrincipal').html(value.contenido + "<br>");
                $('#idFechaPublicacionNoticiaPrincipal').html(value.fecha);
            } else {
                contador++;
                if (contador % 3 === 0) {
                    row += getCardViewNoticia(value.foto, value.titulo, getResumenContenidoWeb(cadenaContenido, 300 - value.titulo.length), value.id, value.fecha, value.fuente) + "";
                    row += "</div>";
                    $('#contenedorArticulos').append(row);
                    row = "<div class='row'>";
                } else {
                    row += getCardViewNoticia(value.foto, value.titulo, getResumenContenidoWeb(cadenaContenido, 300 - value.titulo.length), value.id, value.fecha, value.fuente) + "";
                }
            }
        });

        $('.ir-ver-noticia').each(function (index, value) {
            $(this).click(function () {
                $(this.parentElement).submit();
            });
        });
    } else {
        viewAlertWeb('warning', 'No se encontraron resultados');
    }
}

function addEventsNoticias() {
    jQuery(document).ready(function () {
        jQuery(".materialize-slider").revolution({
            sliderType: "standard",
            sliderLayout: "fullwidth",
            delay: 9000,
            navigation: {
                keyboardNavigation: "on",
                keyboard_direction: "horizontal",
                mouseScrollNavigation: "off",
                onHoverStop: "off",
                touch: {
                    touchenabled: "on",
                    swipe_threshold: 75,
                    swipe_min_touches: 1,
                    swipe_direction: "horizontal",
                    drag_block_vertical: false
                },
                arrows: {
                    style: "gyges",
                    enable: true,
                    hide_onmobile: false,
                    hide_onleave: true,
                    tmp: '',
                    left: {
                        h_align: "left",
                        v_align: "center",
                        h_offset: 10,
                        v_offset: 0
                    },
                    right: {
                        h_align: "right",
                        v_align: "center",
                        h_offset: 10,
                        v_offset: 0
                    }
                }
            },
            responsiveLevels: [1240, 1024, 778, 480],
            gridwidth: [1240, 1024, 778, 480],
            gridheight: [500, 500, 500, 500],
            disableProgressBar: "on",
            parallax: {
                type: "mouse",
                origo: "slidercenter",
                speed: 2000,
                levels: [2, 3, 4, 5, 6, 7, 12, 16, 10, 50]
            }
        });
    });
}

function getFormViewNotice(idNoticia) {
    var form = "";
    form += "<form class='form-ver-noticia' method='POST' action='notas-de-prensa'>";
    form += "<input type='hidden' name='idNota' value='" + idNoticia + "'>";
    form += "<input type='hidden' name='action' value='readNotaPrensa'>";
    //form += "<button type='submit' class='btn-link' style='color: #a20505; font-weight: bold;'>Ver Noticia <i class='fa fa-long-arrow-right'></i></button>";
    form += "</form>";
    return form;
}

function getCardCarrusel(urlImage, titulo, contenido) {
    var card = "";
    card += "<article class='card'>";
    card += "<div class='card-image waves-effect waves-block waves-light'>";
    card += "<img class='activator' src='" + urlImage + "' alt='image'>";
    card += "</div>";
    card += "<div class='card-content' style='height: 330px'>";
    card += "<h2 class='text-peam-verde activator'>" + titulo + "</h2>";
    card += "<p class='text-peam'>" + contenido + "</p>";
    card += "</div>";
    card += "</article> ";
    return card;
}

function getCardViewNoticia(foto, titulo, contenido, idnota, fecha_publicacion, fuente) {
    var article = "";
    article += "<div class='col-md-4 col-sm-6 col-xs-12'>";
    article += "<article class='post-wrapper'>";
    article += "<div class='thumb-wrapper waves-effect waves-block waves-light'><a><img src='" + foto + "' class='img-responsive' alt=''></a></div>";
    article += "<div class='blog-content'>";
    article += "<header class='entry-header-wrapper'>";
    article += "<div class='entry-header'>";
    article += "<h2 class='entry-title text-peam-negrita'><a>" + titulo + "</a></h2>";
    article += "<div class='entry-meta'><ul class='list-inline'><li><a>" + fuente + "</a></li><li><i class='fa fa-clock-o'></i> <a>" + fecha_publicacion + "</a></li></ul></div>";
    article += "</div>";
    article += "</header>";
    article += "<div class='entry-content text-peam'><p>" + contenido + "</p></div>";
    article += "<footer class='entry-footer'>";
    article += "<form class='form-ver-noticia' method='POST' action='notas-de-prensa'>";
    article += "<input type='hidden' name='idNota' value='" + idnota + "'>";
    article += "<input type='hidden' name='action' value='readNotaPrensa'>";
    article += "<a class='readmore pull-right ir-ver-noticia'>Leer m&aacute;s <i class='fa fa-long-arrow-right'></i></a>";
    article += "</form>";
    article += "</footer>";
    article += "</div>";
    article += "</article>";
    article += "</div>";
    return article;
}