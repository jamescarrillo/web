$(document).ready(function () {

    $("#FrmAgenda").submit(function () {
        $('#tbodyAgenda').empty();
        $('#numberPageAgenda').val("1");
        $('#actionAgenda').val("paginarAgenda");
        $('#loader_contenido').css('display', 'block');
        procesarAjaxAgendaWeb();
        return false;
    });

    addEventoCombosPaginar();
    procesarAjaxAgendaWeb();

});

function procesarAjaxAgendaWeb() {
    var datosSerializadosCompletos = $('#' + $('#nameForm').val()).serialize();
    datosSerializadosCompletos += "&comboFecha=todo";
    datosSerializadosCompletos += "&numberPageAgenda=" + $('#numberPageAgenda').val();
    datosSerializadosCompletos += "&sizePageAgenda=" + $('#sizePageAgenda').val();
    datosSerializadosCompletos += "&action=" + $('#actionAgenda').val();
    $.ajax({
        url: getContext() + '/agendainstitucional/operacionesweb',
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        success: function (jsonResponse) {
            $('#loader_contenido').css('display', 'none');
            if ($('#actionAgenda').val().toLowerCase() === "paginaragenda") {
                listarAgenda(jsonResponse.BEAN_PAGINATION);
            }
        },
        error: function () {
            $('#loader_contenido').css('display', 'none');
        }
    });
    return false;
}

function listarAgenda(BEAN_PAGINATION) {
    /*PAGINATION*/
    var $pagination = $('#paginationAgenda');
    $('#tbodyAgenda').empty();
    if (BEAN_PAGINATION.COUNT_FILTER > 0) {
        var fila;
        var text_color;
        var icon;
        var tooltip;
        $.each(BEAN_PAGINATION.LIST, function (index, value) {
            if (!value.estado) {
                text_color = "text-danger";
                icon = "far fa-hand-point-up";
                tooltip = "Activar";
            } else {
                text_color = "";
                icon = "far fa-hand-point-down";
                tooltip = "Finalizar";
            }
            fila = "<tr ";
            fila += ">";
            fila += "<td class='text-center align-middle " + text_color + "'>" + value.hora_inicio + "</td>";
            fila += "<td class='align-middle " + text_color + "'>" + value.fecha_inicio + "</td>";
            fila += "<td class='align-middle " + text_color + "'>" + value.actividad + "</td>";
            fila += "<td class='align-middle " + text_color + "'>" + value.ciudad + "</td>";
            fila += "<td class='align-middle " + text_color + "'>" + value.lugar + "</td>";
            fila += "</tr>";
            $('#tbodyAgenda').append(fila);
        });
        var defaultOptions = getDefaultOptionsPagination();
        var totalPages = getTotalPages(BEAN_PAGINATION.COUNT_FILTER, parseInt($('#sizePageAgenda').val()));
        var options =
                {
                    startPage: parseInt($('#numberPageAgenda').val()),
                    totalPages: totalPages,
                    visiblePages: 5,
                    initiateStartPageClick: false,
                    first: "<i class='fa fa-angle-double-left' aria-hidden='true'></i>",
                    prev: "<i class='fa fa-angle-left' aria-hidden='true'></i>",
                    next: "<i class='fa fa-angle-right' aria-hidden='true'></i>",
                    last: "<i class='fa fa-angle-double-right' aria-hidden='true'></i>",
                    onPageClick: function (evt, page) {
                        $('#actionAgenda').val('paginarAgenda');
                        $('#numberPageAgenda').val(page);
                        $('#nameForm').val('FrmAgenda');
                        $('#loader_contenido').css('display', 'block');
                        procesarAjaxAgendaWeb();
                    }
                };
        $pagination.twbsPagination('destroy');
        $pagination.twbsPagination($.extend({}, defaultOptions, options));
        $('#txtActividad').focus();
    } else {
        $pagination.twbsPagination('destroy');
        viewAlertWeb('warning', 'No se enconntraron resultados');
    }
}
