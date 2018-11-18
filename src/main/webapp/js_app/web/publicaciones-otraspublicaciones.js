$(document).ready(function () {

    cargarAniosCombo($('#comboAnioPublicacion'), 2005, "-1", 'Año');

    $("#FrmPublicacion").submit(function () {
        $('#tbodyPublicacion').empty();
        $('#numberPagePublicacion').val("1");
        $('#actionPublicacion').val("paginarPublicacion");
        $('#loader_contenido').css('display', 'block');
        procesarAjaxPublicacionsWeb();
        return false;
    });

    addEventoCombosPaginar();
    procesarAjaxPublicacionsWeb();

});

function procesarAjaxPublicacionsWeb() {
    var datosSerializadosCompletos = $('#' + $('#nameForm').val()).serialize();
    $.ajax({
        url: getContext() + '/publicaciones/otras-publicaciones',
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        success: function (jsonResponse) {
            $('#loader_contenido').css('display', 'none');
            listarPublicacionWeb(jsonResponse.BEAN_PAGINATION);
        },
        error: function () {
            /*MOSTRAMOS MENSAJE ERROR SERVIDOR*/
            $('#loader_contenido').css('display', 'none');
            viewAlertWeb('error', 'Error interno en el servidor!');
        }
    });
    return false;
}

function listarPublicacionWeb(BEAN_PAGINATION) {
    /*PAGINATION*/
    var $pagination = $('#paginationPublicacion');
    $('#tbodyPublicacion').empty();
    if (BEAN_PAGINATION.COUNT_FILTER > 0) {
        var fila;
        var color_fila;
        var a;
        $.each(BEAN_PAGINATION.LIST, function (index, value) {
            a = "<a href='http://lib.peam.gob.pe:8081/ArcDig/OriArc.pdf?id=" + value.docu_id + "' target='_blank' class='pdf-documento-web' title='Ver PDF'><i class='fa fa-file-pdf-o'></i></a>";
            fila = "<tr class='" + color_fila + "' ";
            fila += ">";
            fila += "<td class='text-center align-middle'>" + value.anho + "</td>";
            fila += "<td class='align-middle'>" + value.titulo + "</td>";
            fila += "<td class='align-middle'>" + value.descripcion + "</td>";
            fila += "<td class='text-center align-middle'>" + a + "</td>";
            fila += "</tr>";
            $('#tbodyPublicacion').append(fila);
        });
        var defaultOptions = getDefaultOptionsPagination();
        var totalPages = getTotalPages(BEAN_PAGINATION.COUNT_FILTER, parseInt($('#sizePagePublicacion').val()));
        var options =
                {
                    startPage: parseInt($('#numberPagePublicacion').val()),
                    totalPages: totalPages,
                    visiblePages: 5,
                    initiateStartPageClick: false,
                    first: "<i class='fa fa-angle-double-left' aria-hidden='true'></i>",
                    prev: "<i class='fa fa-angle-left' aria-hidden='true'></i>",
                    next: "<i class='fa fa-angle-right' aria-hidden='true'></i>",
                    last: "<i class='fa fa-angle-double-right' aria-hidden='true'></i>",
                    onPageClick: function (evt, page) {
                        $('#actionPublicacion').val('paginarPublicacion');
                        $('#numberPagePublicacion').val(page);
                        $('#nameForm').val('FrmPublicacion');
                        $('#loader_contenido').css('display', 'block');
                        procesarAjaxPublicacionsWeb();
                    }
                };
        $pagination.twbsPagination('destroy');
        $pagination.twbsPagination($.extend({}, defaultOptions, options));
        $('#txtTituloPublicacion').focus();
    } else {
        $pagination.twbsPagination('destroy');
        viewAlertWeb('warning', 'No se enconntraron resultados');
    }
}