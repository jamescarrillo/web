$(document).ready(function () {

    $("#FrmGlosario").submit(function () {
        $('#tbodyGlosario').empty();
        $('#numberPageGlosario').val("1");
        $('#actionGlosario').val("paginarGlosario");
        $('#loader_contenido').css('display', 'block');
        procesarAjaxGlosarioWeb();
        return false;
    });

    addEventoCombosPaginar();
    procesarAjaxGlosarioWeb();

});

function procesarAjaxGlosarioWeb() {
    var datosSerializadosCompletos = $('#' + $('#nameForm').val()).serialize();
    $.ajax({
        url: getContext() + '/glosarioweb',
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        success: function (jsonResponse) {
            $('#loader_contenido').css('display', 'none');
            listarGlosario(jsonResponse.BEAN_PAGINATION);
        },
        error: function () {
            /*MOSTRAMOS MENSAJE ERROR SERVIDOR*/
            $('#loader_contenido').css('display', 'none');
            viewAlertWeb('error', 'Error interno en el servidor!');
        }
    });
    return false;
}

function listarGlosario(BEAN_PAGINATION) {
    /*PAGINATION*/
    var $pagination = $('#paginationGlosario');
    $('#tbodyGlosario').empty();
    if (BEAN_PAGINATION.COUNT_FILTER > 0) {
        var fila;
        $.each(BEAN_PAGINATION.LIST, function (index, value) {

            fila = "<tr>";
            fila += "<td class='text-center align-middle'><strong>" + value.titulo + "</strong></td>";
            fila += "<td class='align-middle'>" + value.descripcion + "</td>";
            fila += "</tr>";
            $('#tbodyGlosario').append(fila);
        });
        var defaultOptions = getDefaultOptionsPagination();
        var totalPages = getTotalPages(BEAN_PAGINATION.COUNT_FILTER, parseInt($('#sizePageGlosario').val()));
        var options =
                {
                    startPage: parseInt($('#numberPageGlosario').val()),
                    totalPages: totalPages,
                    visiblePages: 5,
                    initiateStartPageClick: false,
                    first: "<i class='fa fa-angle-double-left' aria-hidden='true'></i>",
                    prev: "<i class='fa fa-angle-left' aria-hidden='true'></i>",
                    next: "<i class='fa fa-angle-right' aria-hidden='true'></i>",
                    last: "<i class='fa fa-angle-double-right' aria-hidden='true'></i>",
                    onPageClick: function (evt, page) {
                        $('#actionGlosario').val('paginarGlosario');
                        $('#numberPageGlosario').val(page);
                        $('#nameForm').val('FrmGlosario');
                        $('#loader_contenido').css('display', 'block');
                        procesarAjaxGlosarioWeb();
                    }
                };
        $pagination.twbsPagination('destroy');
        $pagination.twbsPagination($.extend({}, defaultOptions, options));
        $('#txtTituloGlosario').focus();
    } else {
        $pagination.twbsPagination('destroy');
        viewAlertWeb('warning', 'No se enconntraron resultados');
    }
}