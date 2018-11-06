$(document).ready(function () {

    cargarAniosCombo($('#comboAnioMultimedia_'), 2010, "-1", 'AÑO');

    $("#FrmMultimedia").submit(function () {
        $('#loader_contenido').css('display', 'block');
        procesarAjaxPublicacionesMultimediaWeb();
        return false;
    });

    addEventoCombosPaginarFormulario();
    procesarAjaxPublicacionesMultimediaWeb();

});

function procesarAjaxPublicacionesMultimediaWeb() {
    $('#containerMultimedia').empty();
    var datosSerializadosCompletos = $('#' + $('#nameFormMultimedia').val()).serialize();
    $.ajax({
        url: getContext() + '/publicaciones/noticias/multimedia',
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        success: function (jsonResponse) {
            $('#loader_contenido').css('display', 'none');
            var card;
            $.each(jsonResponse.BEAN_PAGINATION.LIST, function (index, value) {
                card = "<div class='col-md-6 col-xs-12 mb-15'>";

                card += "<div class='featured-item'>";

                card += "<div class='embed-responsive embed-responsive-16by9'>";

                card += "<iframe class='embed-responsive-item' src='" + value.fuente + "' allowfullscreen></iframe>";

                card += "</div>";

                card += "</div>";

                card += "</div>";
                $('#containerMultimedia').append(card);
            });
        },
        error: function () {
            /*MOSTRAMOS MENSAJE ERROR SERVIDOR*/
            $('#loader_contenido').css('display', 'none');
        }
    });
    return false;
}
