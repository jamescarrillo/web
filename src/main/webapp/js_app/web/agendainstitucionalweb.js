$(document).ready(function () {

    $("#FrmAgendaGG").submit(function () {
        $('#tbodyAgendaGG').empty();
        $('#numberPageAgendaGG').val("1");
        $('#actionAgendaGG').val("paginarAgenda");
        $('#loader_contenidoGG').css('display', 'block');
        procesarAjaxAgendaWeb("GG");
        return false;
    });

    $("#FrmAgendaDI").submit(function () {
        $('#tbodyAgendaDI').empty();
        $('#numberPageAgendaDI').val("1");
        $('#actionAgendaDI').val("paginarAgenda");
        $('#loader_contenidoDI').css('display', 'block');
        procesarAjaxAgendaWeb("DI");
        return false;
    });

    $("#FrmAgendaDDA").submit(function () {
        $('#tbodyAgendaDDA').empty();
        $('#numberPageAgendaDDA').val("1");
        $('#actionAgendaDDA').val("paginarAgenda");
        $('#loader_contenidoDDA').css('display', 'block');
        procesarAjaxAgendaWeb("DDA");
        return false;
    });

    $("#FrmAgendaDMA").submit(function () {
        $('#tbodyAgendaDMA').empty();
        $('#numberPageAgendaDMA').val("1");
        $('#actionAgendaDMA').val("paginarAgenda");
        $('#loader_contenidoDMA').css('display', 'block');
        procesarAjaxAgendaWeb("DMA");
        return false;
    });

    $('.agenda-ad').each(function (index, value) {
        $(this).click(function () {
            procesarAjaxAgendaWeb($(this).attr("complemento"));
        });
    });

    addEventoCombosPaginar();

});

function returnTipo(complemento){
    var tipo;
    switch (complemento) {
        case "GG":
            tipo= 1;
            break;
        case "DI":
            tipo= 2;
            break;
        case "DDA":
            tipo= 3;
            break;
        case "DMA":
            tipo= 4;
            break;
    }
    return tipo;
}

function procesarAjaxAgendaWeb(complemento) {
    var datosSerializadosCompletos = $('#' + $('#nameForm' + complemento).val()).serialize();
    datosSerializadosCompletos += "&comboFecha=todo";
    datosSerializadosCompletos += "&numberPageAgenda" + complemento + "=" + $('#numberPageAgenda' + complemento).val();
    datosSerializadosCompletos += "&sizePageAgenda" + complemento + "=" + $('#sizePageAgenda' + complemento).val();
    datosSerializadosCompletos += "&complemento=" + complemento;
    datosSerializadosCompletos += "&cbotipo=" + returnTipo(complemento);
    datosSerializadosCompletos += "&action=" + $('#actionAgenda' + complemento).val();
    $.ajax({
        url: getContext() + '/agendainstitucional/operacionesweb',
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        success: function (jsonResponse) {
            $('#loader_contenido' + complemento).css('display', 'none');
            if ($('#actionAgenda' + complemento).val().toLowerCase() === "paginaragenda") {
                listarAgenda(jsonResponse.BEAN_PAGINATION, complemento);
            }
        },
        error: function () {
            $('#loader_contenido' + complemento).css('display', 'none');
        }
    });
    return false;
}

function listarAgenda(BEAN_PAGINATION, complemento) {
    /*PAGINATION*/
    var $pagination = $('#paginationAgenda' + complemento);
    $('#tbodyAgenda' + complemento).empty();
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
            fila += "<td class='text-center align-middle " + text_color + "'>" + value.hora_inicio +"-"+value.hora_final+"</td>";
            fila += "<td class='align-middle " + text_color + "'>" + value.fecha_inicio + "</td>";
            fila += "<td class='align-middle " + text_color + "'>" + value.actividad + "</td>";
            fila += "<td class='align-middle " + text_color + "'>" + value.ciudad + "</td>";
            fila += "<td class='align-middle " + text_color + "'>" + value.lugar + "</td>";
            fila += "</tr>";
            $('#tbodyAgenda' + complemento).append(fila);
        });
        var defaultOptions = getDefaultOptionsPagination();
        var totalPages = getTotalPages(BEAN_PAGINATION.COUNT_FILTER, parseInt($('#sizePageAgenda' + complemento).val()));
        var options =
                {
                    startPage: parseInt($('#numberPageAgenda' + complemento).val()),
                    totalPages: totalPages,
                    visiblePages: 5,
                    initiateStartPageClick: false,
                    first: "<i class='fa fa-angle-double-left' aria-hidden='true'></i>",
                    prev: "<i class='fa fa-angle-left' aria-hidden='true'></i>",
                    next: "<i class='fa fa-angle-right' aria-hidden='true'></i>",
                    last: "<i class='fa fa-angle-double-right' aria-hidden='true'></i>",
                    onPageClick: function (evt, page) {
                        $('#actionAgenda' + complemento).val('paginarAgenda');
                        $('#numberPageAgenda' + complemento).val(page);
                        $('#nameForm' + complemento).val('FrmAgenda' + complemento);
                        $('#loader_contenido' + complemento).css('display', 'block');
                        procesarAjaxAgendaWeb(complemento);
                    }
                };
        $pagination.twbsPagination('destroy');
        $pagination.twbsPagination($.extend({}, defaultOptions, options));
        $('#txtActividad' + complemento).focus();
        $('#txtCalendario' + complemento).val("");
    } else {
        $pagination.twbsPagination('destroy');
        viewAlertWeb('warning', 'No se enconntraron resultados');
    }
}
