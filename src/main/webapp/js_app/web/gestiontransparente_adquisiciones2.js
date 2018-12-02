$(document).ready(function () {

    cargarAniosCombo($('#comboAnioPenalidad'), 2005, "-1", 'AÑO');
    cargarAniosCombo($('#comboAnioDocumento'), 2005, "-1", 'Año');
    cargarAniosCombo($('#comboAnioViatico'), 2010, "-1", 'AÑO');

    $("#FrmPenalidad").submit(function () {
        $("#nameFormPenalidad").val("FrmPenalidad");
        $("#numberPagePenalidad").val(1);
        $('#actionPenalidad').val("paginarPenalidad");
        $('#loader_contenido_penalidad').css("display", "block");
        procesarAjaxPenalidadWeb();
        return false;
    });

    $("#FrmDocumentos").submit(function () {
        $('#tbodyDocumentos').empty();
        $('#numberPageDocumentos').val("1");
        $('#actionDocumentos').val("paginarDocumentos");
        $('#loader_contenido').css('display', 'block');
        procesarAjaxDocumentosWeb();
        return false;
    });

    var parameters;
    $('.view-reporte').each(function () {
        $(this).click(function () {
            if ($('#comboAnioDocumento').val() !== "-1") {
                parameters = "report=reporte_documentos_adquisiciones";
                parameters += "&format=" + $(this).attr('format');
                parameters += "&anho=" + $('#comboAnioDocumento').val();
                parameters += "&cate_id=" + $('#cate_id').val();
                parameters += "&tido_id=";
                openReport(parameters);
            } else {
                viewAlertWeb('warning', 'Por favor seleccione un Año');
            }

        });
    });

    $("#FrmViatico").submit(function () {
        $("#nameFormViatico").val("FrmViatico");
        $("#numberPageViatico").val(1);
        $('#actionViatico').val("paginarViatico");
        $('#loader_contenido_viatico').css("display", "block");
        procesarAjaxViaticoWeb();
        return false;
    });

    addEventoCombosPaginar();
    processAjaxDataAdquisiciones2();
});

function processAjaxDataAdquisiciones2() {
    var datosSerializadosCompletos = $('#' + $('#nameForm').val()).serialize();
    datosSerializadosCompletos += "&" + $('#' + $('#nameFormPenalidad').val()).serialize();
    datosSerializadosCompletos += "&" + $('#' + $('#nameFormViatico').val()).serialize();
    datosSerializadosCompletos = datosSerializadosCompletos.replace("&action=paginarDocumentos", "");
    datosSerializadosCompletos = datosSerializadosCompletos.replace("&action=paginarPenalidad", "");
    datosSerializadosCompletos = datosSerializadosCompletos.replace("&action=paginarViatico", "");
    datosSerializadosCompletos += "&action=getDataAdquisiciones2";
    $.ajax({
        url: getContext() + '/documentos/operacionesweb',
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        success: function (jsonResponse) {
            listarDocumentosWeb(jsonResponse.DATA_DOCUMENTO);
            listarPenalidadWeb(jsonResponse.DATA_PENALIDAD);
            listarViaticoWeb(jsonResponse.DATA_VIATICO);
        },
        error: function () {
            console.log('Error interno al trear datos de adquisiciones!');
        }
    });
    return false;
}

function procesarAjaxDocumentosWeb() {
    var datosSerializadosCompletos = $('#' + $('#nameForm').val()).serialize();
    $.ajax({
        url: getContext() + '/documentos/operacionesweb',
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        success: function (jsonResponse) {
            $('#loader_contenido').css('display', 'none');
            listarDocumentosWeb(jsonResponse.BEAN_PAGINATION);
        },
        error: function () {
            $('#loader_contenido').css('display', 'none');
            console.log('Error interno en el servidor!');
        }
    });
    return false;
}

function listarDocumentosWeb(BEAN_PAGINATION) {
    /*PAGINATION*/
    var $pagination = $('#paginationDocumentos');
    $('#tbodyDocumentos').empty();
    if (BEAN_PAGINATION.COUNT_FILTER > 0) {
        var fila;
        var cadenaFecha;
        var color_fila;
        var fecha;
        var a;
        $.each(BEAN_PAGINATION.LIST, function (index, value) {
            if (value.docu_resumen.toLowerCase() !== "encargo interno.") {
                color_fila = "";
                a = "<a href='http://lib.peam.gob.pe:8081/ArcDig/OriArc.pdf?id=" + value.docu_id + "' target='_blank' class='pdf-documento-web' title='Ver PDF'><i class='fa fa-file-pdf-o'></i></a>";
            } else {
                color_fila = "bg-danger";
                a = "<a class='pdf-documento-web' title='PDF Restringido'><i class='fa fa-lock'></i></a>";
            }
            cadenaFecha = value.docu_fecha_docx.split('/');
            if (cadenaFecha.length === 3) {
                fecha = value.docu_fecha_docx;
            } else {
                fecha = "";
            }
            fila = "<tr class='" + color_fila + "' ";
            fila += ">";
            fila += "<td class='text-center align-middle'>" + fecha + "</td>";
            fila += "<td class='align-middle'>" + value.docu_titulo + "</td>";
            fila += "<td class='align-middle'>" + value.docu_resumen + "</td>";
            fila += "<td class='text-center align-middle'>" + a + "</td>";
            fila += "</tr>";
            $('#tbodyDocumentos').append(fila);
        });
        var defaultOptions = getDefaultOptionsPagination();
        var totalPages = getTotalPages(BEAN_PAGINATION.COUNT_FILTER, parseInt($('#sizePageDocumentos').val()));
        var options =
                {
                    startPage: parseInt($('#numberPageDocumentos').val()),
                    totalPages: totalPages,
                    visiblePages: 5,
                    initiateStartPageClick: false,
                    first: "<i class='fa fa-angle-double-left' aria-hidden='true'></i>",
                    prev: "<i class='fa fa-angle-left' aria-hidden='true'></i>",
                    next: "<i class='fa fa-angle-right' aria-hidden='true'></i>",
                    last: "<i class='fa fa-angle-double-right' aria-hidden='true'></i>",
                    onPageClick: function (evt, page) {
                        $('#actionDocumentos').val('paginarDocumentos');
                        $('#numberPageDocumentos').val(page);
                        $('#nameForm').val('FrmDocumentos');
                        $('#loader_contenido').css('display', 'block');
                        procesarAjaxDocumentosWeb();
                    }
                };
        $pagination.twbsPagination('destroy');
        $pagination.twbsPagination($.extend({}, defaultOptions, options));
        $('#txtTituloDocumento').focus();
    } else {
        $pagination.twbsPagination('destroy');
        viewAlertWeb('warning', 'No se enconntraron resultados');
    }
}

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
            console.log('Error interno en el servidor!');
        }
    });
    return false;
}

function listarPenalidadWeb(BEAN_PAGINATION) {
    var $pagination = $('#paginationPenalidad');
    $('#tbodyPenalidad').empty();
    if (BEAN_PAGINATION.COUNT_FILTER > 0) {
        var fila;
        $.each(BEAN_PAGINATION.LIST, function (index, value) {
            fila = "<tr ";
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

function procesarAjaxViaticoWeb() {
    var datosSerializadosCompletos = $('#' + $('#nameFormViatico').val()).serialize();
    console.log(datosSerializadosCompletos);
    $.ajax({
        url: getContext() + '/documentos/operacionesweb',
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        success: function (jsonResponse) {
            $('#loader_contenido_viatico').css("display", "none");
            listarViaticoWeb(jsonResponse.BEAN_PAGINATION);
        },
        error: function () {
            $('#loader_contenido_viatico').css("display", "none");
            console.log('Error interno en el servidor!');
        }
    });
    return false;
}

function listarViaticoWeb(BEAN_PAGINATION) {
    /*PAGINATION*/
    var $pagination = $('#paginationViatico');
    $('#tbodyViatico').empty();
    if (BEAN_PAGINATION.COUNT_FILTER > 0) {
        var fila;
        $.each(BEAN_PAGINATION.LIST, function (index, value) {
            fila = "<tr ";
            fila += ">";
            fila += "<td class='align-middle text-medium-table '>" + value.area_oficina + "</td>";
            fila += "<td class='align-middle text-medium-table '>" + value.usuarios + "</td>";
            fila += "<td class='align-middle text-medium-table text-center'>" + value.fecha_salida + "</td>";
            fila += "<td class='align-middle text-medium-table text-center'>" + value.fecha_retorno + "</td>";
            fila += "<td class='align-middle text-medium-table '>" + value.ruta + "</td>";
            fila += "<td class='align-middle text-medium-table text-center'>" + value.costo_pasajes + "</td>";
            fila += "<td class='align-middle text-medium-table text-center'>" + value.viaticos + "</td>";
            fila += "</tr>";
            $('#tbodyViatico').append(fila);
        });
        var defaultOptions = getDefaultOptionsPagination();
        var totalPages = getTotalPages(BEAN_PAGINATION.COUNT_FILTER, parseInt($('#sizePageViatico').val()));
        var options =
                {
                    startPage: parseInt($('#numberPageViatico').val()),
                    totalPages: totalPages,
                    visiblePages: 5,
                    initiateStartPageClick: false,
                    first: "<i class='fa fa-angle-double-left' aria-hidden='true'></i>",
                    prev: "<i class='fa fa-angle-left' aria-hidden='true'></i>",
                    next: "<i class='fa fa-angle-right' aria-hidden='true'></i>",
                    last: "<i class='fa fa-angle-double-right' aria-hidden='true'></i>",
                    onPageClick: function (evt, page) {
                        $("#nameFormViatico").val("FrmViatico");
                        $("#numberPageViatico").val(page);
                        $('#actionViatico').val("paginarViatico");
                        $('#loader_contenido_viatico').css("display", "block");
                        procesarAjaxViaticoWeb();
                    }
                };
        $pagination.twbsPagination('destroy');
        $pagination.twbsPagination($.extend({}, defaultOptions, options));
        $('#txtTituloViatico').focus();
    } else {
        $pagination.twbsPagination('destroy');
        viewAlertWeb('warning', 'No se encontraron resultados');
    }
}