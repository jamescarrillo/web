$(document).ready(function () {

    $("#FrmDirectorio").submit(function () {
        $('#tbodyDirectorio').empty();
        $('#numberPageDirectorio').val("1");
        $('#actionDirectorio').val("paginarDirectorio");
        $('#loader_contenido_Directorio').css('display', 'block');
        procesarAjaxDirectorioWeb();
        return false;
    });

    $("#FrmFuncionario").submit(function () {
        $('#tbodyFuncionario').empty();
        $('#numberPageFuncionario').val("1");
        $('#actionFuncionario').val("paginarFuncionario");
        $('#loader_contenido_Funcionario').css('display', 'block');
        procesarAjaxDirectorioWeb();
        return false;
    });

    addEventoCombosPaginar();
    procesarAjaxDirectorioWeb();

});

function procesarAjaxDirectorioWeb() {
    var datosSerializadosCompletos = $('#' + $('#nameFormDirectorio').val()).serialize();
    $.ajax({
        url: getContext() + '/institucion/directorios-de-contactos',
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        success: function (jsonResponse) {
            $('#loader_contenido_Directorio').css('display', 'none');
            listarDirectorio(jsonResponse.BEAN_PAGINATION);
        },
        error: function () {
            /*MOSTRAMOS MENSAJE ERROR SERVIDOR*/
            $('#loader_contenido_Directorio').css('display', 'none');
            //viewAlertWeb('error', 'Error interno en el servidor!');
        }
    });
    return false;
}

function procesarAjaxFuncionarioWeb() {
    var datosSerializadosCompletos = $('#' + $('#nameFormFuncionario').val()).serialize();
    $.ajax({
        url: getContext() + '/institucion/directorios-de-contactos',
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        success: function (jsonResponse) {
            $('#loader_contenido_Funcionario').css('display', 'none');
            listarFuncionario(jsonResponse.BEAN_PAGINATION);
        },
        error: function () {
            /*MOSTRAMOS MENSAJE ERROR SERVIDOR*/
            $('#loader_contenido_Funcionario').css('display', 'none');
            //viewAlertWeb('error', 'Error interno en el servidor!');
        }
    });
    return false;
}

function listarDirectorio(BEAN_PAGINATION) {
    /*PAGINATION*/
    var $pagination = $('#paginationDirectorio');
    $('#tbodyDirectorio').empty();
    if (BEAN_PAGINATION.COUNT_FILTER > 0) {
        var fila;
        $.each(BEAN_PAGINATION.LIST, function (index, value) {
            fila = "<tr>";
            fila += "<td class='align-middle'>" + value.oficina + "</td>";
            fila += "<td class='align-middle'>" + value.seccion + "</td>";
            fila += "<td class='align-middle'>" + value.anexo + "</td>";
            fila += "</tr>";
            $('#tbodyDirectorio').append(fila);
        });
        var defaultOptions = getDefaultOptionsPagination();
        var totalPages = getTotalPages(BEAN_PAGINATION.COUNT_FILTER, parseInt($('#sizePageDirectorio').val()));
        var options =
                {
                    startPage: parseInt($('#numberPageDirectorio').val()),
                    totalPages: totalPages,
                    visiblePages: 5,
                    initiateStartPageClick: false,
                    first: "<i class='fa fa-angle-double-left' aria-hidden='true'></i>",
                    prev: "<i class='fa fa-angle-left' aria-hidden='true'></i>",
                    next: "<i class='fa fa-angle-right' aria-hidden='true'></i>",
                    last: "<i class='fa fa-angle-double-right' aria-hidden='true'></i>",
                    onPageClick: function (evt, page) {
                        $('#actionDirectorio').val('paginarDirectorio');
                        $('#numberPageDirectorio').val(page);
                        $('#nameForm').val('FrmDirectorio');
                        $('#loader_contenido_Directorio').css('display', 'block');
                        procesarAjaxDirectorioWeb();
                    }
                };
        $pagination.twbsPagination('destroy');
        $pagination.twbsPagination($.extend({}, defaultOptions, options));
        $('#txtTituloDirectorio').focus();
    } else {
        $pagination.twbsPagination('destroy');
        viewAlertWeb('warning', 'No se enconntraron resultados');
    }
    procesarAjaxFuncionarioWeb();
}

function listarFuncionario(BEAN_PAGINATION) {
    /*PAGINATION*/
    var $pagination = $('#paginationFuncionario');
    $('#tbodyFuncionario').empty();
    if (BEAN_PAGINATION.COUNT_FILTER > 0) {
        var fila;
        $.each(BEAN_PAGINATION.LIST, function (index, value) {
            fila = "<tr>";
            fila += "<td class='align-middle'>" + value.cargo + "</td>";
            fila += "<td class='align-middle'>" + value.nombres_apellidos + "</td>";
            fila += "<td class='align-middle'>" + value.telefono + "</td>";
            fila += "<td class='align-middle'>" + value.e_mail + "</td>";
            fila += "</tr>";
            $('#tbodyFuncionario').append(fila);
        });
        var defaultOptions = getDefaultOptionsPagination();
        var totalPages = getTotalPages(BEAN_PAGINATION.COUNT_FILTER, parseInt($('#sizePageFuncionario').val()));
        var options =
                {
                    startPage: parseInt($('#numberPageFuncionario').val()),
                    totalPages: totalPages,
                    visiblePages: 5,
                    initiateStartPageClick: false,
                    first: "<i class='fa fa-angle-double-left' aria-hidden='true'></i>",
                    prev: "<i class='fa fa-angle-left' aria-hidden='true'></i>",
                    next: "<i class='fa fa-angle-right' aria-hidden='true'></i>",
                    last: "<i class='fa fa-angle-double-right' aria-hidden='true'></i>",
                    onPageClick: function (evt, page) {
                        $('#actionFuncionario').val('paginarFuncionario');
                        $('#numberPageFuncionario').val(page);
                        $('#nameForm').val('FrmFuncionario');
                        $('#loader_contenido_Funcionario').css('display', 'block');
                        procesarAjaxDirectorioWeb();
                    }
                };
        $pagination.twbsPagination('destroy');
        $pagination.twbsPagination($.extend({}, defaultOptions, options));
        $('#txtFuncionario').focus();
    } else {
        $pagination.twbsPagination('destroy');
        viewAlertWeb('warning', 'No se enconntraron resultados');
    }
}