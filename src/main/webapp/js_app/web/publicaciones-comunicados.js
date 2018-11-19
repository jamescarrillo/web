$(document).ready(function () {

    cargarAniosCombo($('#comboAnioComunicado_'), 2010, "-1", 'AÑO');

    $("#FrmComunicado").submit(function () {
        $('#loader_contenido').css('display', 'block');
        procesarAjaxPublicacionesComunicadosWeb();
        return false;
    });

    addEventoCombosPaginarFormulario();
    procesarAjaxPublicacionesComunicadosWeb();

});

function procesarAjaxPublicacionesComunicadosWeb() {
    var datosSerializadosCompletos = $('#' + $('#nameFormComunicado').val()).serialize();
    $.ajax({
        url: getContext() + '/publicaciones/comunicados',
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        success: function (jsonResponse) {
            $('#loader_contenido').css('display', 'none');
            listarComunicadoWeb(jsonResponse.BEAN_PAGINATION);
        },
        error: function () {
            /*MOSTRAMOS MENSAJE ERROR SERVIDOR*/
            $('#loader_contenido').css('display', 'none');
        }
    });
    return false;
}

function listarComunicadoWeb(BEAN_PAGINATION) {
    /*PAGINATION*/
    $('#contenedorComunicados').empty();
    if (BEAN_PAGINATION.COUNT_FILTER > 0) {
        var cadenaContenido;
        var row = "<div class='row'>";
        var contador = 0;
        $.each(BEAN_PAGINATION.LIST, function (index, value) {
            cadenaContenido = removeTagHTML(value.contenido);
            contador++;
            if (contador % 3 === 0) {
                row += getCardViewComunicado(value.titulo, getResumenContenidoWeb(value.contenido, 200), value.contenido) + "";
                row += "</div>";
                $('#contenedorComunicados').append(row);
                row = "<div class='row'>";
            } else {
                row += getCardViewComunicado(value.titulo, getResumenContenidoWeb(value.contenido, 200), value.contenido) + "";
            }
        });
        $('.ver-anuncio').each(function (index, value) {
            $(this).click(function () {
                var boton = $(this);
                $.toast({
                    heading: $(boton).attr('titulo'),
                    text: $(boton).attr('contenido'),
                    position: 'top-right',
                    hideAfter: false
                });
                $('.jq-toast-single').css('border', '3px solid #00793D');
                $('.jq-toast-heading').addClass('text-peam text-center');
                $('.jq-toast-heading').css('color', '#00793D');
                $('.jq-toast-heading').css('font-weight', 'bold');
            });
        });
    } else {
        viewAlertWeb('warning', 'No se encontraron resultados');
    }
}

function getCardViewComunicado(titulo, contenido, contenidofull) {
    var article = "";
    article += "<div class='col-sm-4 col-xs-6'>";
    article += "<article class='post-wrapper'>";
    article += "<div class='blog-content'>";
    article += "<header class='entry-header-wrapper'>";
    article += "<div class=''>";
    article += "<h3><a class='text-peam-negrita-verde' style='font-size: 15px;'>" + titulo + "</a></h3>";
    article += "</div>";
    article += "</header>";
    article += "<div class='entry-content text-peam'>" + contenido + " <a class='ver-anuncio' titulo='" + titulo + "' contenido='" + contenidofull + "'>Ver más</a></div>";
    article += "</div>";
    article += "</article>";
    article += "</div>";
    return article;
}

$(window).resize(function () {
    var ancho = $(window).width();
    if (ancho < 1200) {
        $('#containerFBLG').css('display', 'none');
    } else {
        $('#containerFBLG').css('display', 'block');
    }
});