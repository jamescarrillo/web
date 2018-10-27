$(document).ready(function () {

    $(".form-ver-noticia").submit(function () {

        return false;
    });

    procesarAjaxNotaPrensaWeb();

});

function procesarAjaxNotaPrensaWeb() {
    var pathname = window.location.pathname;
    pathname = pathname.substring(getContext().length, pathname.length);
    var datosSerializadosCompletos = $('#' + $('#nameFormNotaPrensa').val()).serialize();
    $.ajax({
        url: getContext() + '/publicaciones/noticias',
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        success: function (jsonResponse) {
            $('#loader_contenido').css('display', 'none');
            switch (pathname) {
                case "/index":
                    $('.noticias-peam').css('display', 'block');
                    listarNotaPrensaWebIndex(jsonResponse.BEAN_PAGINATION);
                    break;
                case "/publicaciones/noticias":

                    break;
            }
            console.log(jsonResponse);
            //listarNotaPrensaWeb(jsonResponse.BEAN_PAGINATION);
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
            $('#idNota' + (index + 1)).html(value.id);
            console.log(value.titulo);
            console.log("-> " + getTituloWeb(value.titulo, 45));
            $('#tituloNotaPrensa' + (index + 1)).html(getTituloWeb(value.titulo, 45));
            cadenaContenido = value.contenido;
            cadenaContenido = replaceAll(cadenaContenido, '<p>', '');
            cadenaContenido = replaceAll(cadenaContenido, '</p>', '\n');
            $('#resumenNotaPrensa' + (index + 1)).html(getTituloWeb(getResumenContenidoWeb(cadenaContenido, 150), 100));
        });
    }
}
