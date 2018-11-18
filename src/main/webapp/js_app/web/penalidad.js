$(document).ready(function () {

    cargarAniosCombo($('#comboAnioPenalidad'), 2005, "-1", 'AÑO');

    $("#FrmPenalidad").submit(function () {
        $("#nameFormPenalidad").val("FrmPenalidad");
        $("#numberPagePenalidad").val(1);
        $('#actionPenalidad').val("paginarPenalidad");
        $('#loader_contenido_penalidad').css("display", "block");
        procesarAjaxPenalidadWeb();
        return false;
    });

    addEventoCombosPaginar();
    procesarAjaxPenalidadWeb();

});

function procesarAjaxPenalidadWeb() {
    var datosSerializadosCompletos = $('#' + $('#nameFormPenalidad').val()).serialize();
    $.ajax({
        url: getContext() + '/documentos/operacionesweb',
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        success: function (jsonResponse) {
            $('#loader_contenido_penalidad').css("display", "none");
            listarPenalidadWeb(jsonResponse.BEAN_PAGINATION);
        },
        error: function () {
            $('#loader_contenido_penalidad').css("display", "none");
            viewAlertWeb('error', 'Error interno en el servidor!');
        }
    });
    return false;
}

function listarPenalidadWeb(BEAN_PAGINATION) {
    /*PAGINATION*/
    var $pagination = $('#paginationPenalidad');
    $('#tbodyPenalidad').empty();
    if (BEAN_PAGINATION.COUNT_FILTER > 0) {
        var fila;
        $.each(BEAN_PAGINATION.LIST, function (index, value) {

            fila = "<tr ";
            /*
             fila += "id='" + value.id + "' ";
             fila += "anho='" + value.anho + "' ";
             fila += "contratista='" + value.contratista + "' ";
             fila += "ruc='" + value.ruc + "' ";
             fila += "objeto='" + value.objeto + "' ";
             fila += "nro_proceso='" + value.nro_proceso + "' ";
             fila += "nro_contrato='" + value.nro_contrato + "' ";
             fila += "tipo='" + value.tipo + "' ";
             fila += "monto_contrato='" + value.monto_contrato + "' ";
             fila += "monto_penalidad='" + value.monto_penalidad + "' ";
             */
            fila += ">";
            fila += "<td class='text-center align-middle text-small-table'>" + value.monto_contrato + "</td>";
            fila += "<td class='align-middle text-small-table'>" + value.contratista + "</td>";
            fila += "<td class='text-center align-middle text-small-table'>" + value.ruc + "</td>";
            fila += "<td class='text-center align-middle text-small-table'>" + value.tipo + "</td>";
            fila += "<td class='align-middle text-small-table'>" + value.objeto + "</td>";
            fila += "<td class='text-center align-middle text-small-table'>" + value.monto_penalidad + "</td>";
            fila += "</tr>";
            $('#tbodyPenalidad').append(fila);
        });
        var defaultOptions = getDefaultOptionsPagination();
        var totalPages = getTotalPages(BEAN_PAGINATION.COUNT_FILTER, parseInt($('#sizePagePenalidad').val()));
        var options =
                {
                    startPage: parseInt($('#numberPagePenalidad').val()),
                    totalPages: totalPages,
                    visiblePages: 5,
                    initiateStartPageClick: false,
                    first: "<i class='fa fa-angle-double-left' aria-hidden='true'></i>",
                    prev: "<i class='fa fa-angle-left' aria-hidden='true'></i>",
                    next: "<i class='fa fa-angle-right' aria-hidden='true'></i>",
                    last: "<i class='fa fa-angle-double-right' aria-hidden='true'></i>",
                    onPageClick: function (evt, page) {
                        $("#nameFormPenalidad").val("FrmPenalidad");
                        $("#numberPagePenalidad").val(page);
                        $('#actionPenalidad').val("paginarPenalidad");
                        $('#loader_contenido_penalidad').css("display", "block");
                        procesarAjaxPenalidadWeb();
                    }
                };
        $pagination.twbsPagination('destroy');
        $pagination.twbsPagination($.extend({}, defaultOptions, options));
        $('#txtPenalidad').focus();
    } else {
        $pagination.twbsPagination('destroy');
        viewAlertWeb('warning', 'No se enconntraron resultados');
    }
}

