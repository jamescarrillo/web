$(document).ready(function () {

    cargarAniosCombo($('#comboAnioPresupuestoInstitucional'), 2010, "-1", 'Año');
    cargarAniosCombo($('#comboAnioInfoFinanciera'), 2010, "-1", 'Año');
    cargarAniosCombo($('#comboAnioInfoPresupuestal'), 2010, "-1", 'Año');

    $("#FrmPresupuestoInstitucional").submit(function () {
        $('#tbodyPresupuestoInstitucional').empty();
        $('#numberPagePresupuestoInstitucional').val("1");
        $('#actionPresupuestoInstitucional').val("paginarPresupuesto");
        $('#loader_contenido_PresupuestoInstitucional').css('display', 'block');
        procesarAjaxPresupuestosInstitucionalWeb();
        return false;
    });

    $("#FrmInfoFinanciera").submit(function () {
        $('#tbodyInfoFinanciera').empty();
        $('#numberPageInfoFinanciera').val("1");
        $('#actionInfoFinanciera').val("paginarFinanza");
        $('#loader_contenido_InfoFinanciera').css('display', 'block');
        procesarAjaxInformacionFinancieraWeb();
        return false;
    });

    $("#FrmInfoPresupuestal").submit(function () {
        $('#tbodyInfoPresupuestal').empty();
        $('#numberPageInfoPresupuestal').val("1");
        $('#actionInfoPresupuestal').val("paginarFinanza2");
        $('#loader_contenido_InfoPresupuestal').css('display', 'block');
        procesarAjaxInformacionPresupustalWeb();
        return false;
    });

    addEventoCombosPaginar();
    procesarAjaxPresupuestosInstitucionalWeb();
    procesarAjaxInformacionFinancieraWeb();
    procesarAjaxInformacionPresupustalWeb();

});

function procesarAjaxPresupuestosInstitucionalWeb() {
    var datosSerializadosCompletos = $('#' + $('#namePresupuestoInstitucional').val()).serialize();
    $.ajax({
        url: getContext() + '/documentos/operacionesweb',
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        success: function (jsonResponse) {
            $('#loader_contenido_PresupuestoInstitucional').css('display', 'none');
            listarPresupuestosInstitucional(jsonResponse.BEAN_PAGINATION);
        },
        error: function () {
            /*MOSTRAMOS MENSAJE ERROR SERVIDOR*/
            $('#loader_contenido_PresupuestoInstitucional').css('display', 'none');
            viewAlertWeb('error', 'Error interno en el servidor!');
        }
    });
    return false;
}

function listarPresupuestosInstitucional(BEAN_PAGINATION) {
    /*PAGINATION*/
    var $pagination = $('#paginationPresupuestoInstitucional');
    $('#tbodyPresupuestoInstitucional').empty();
    if (BEAN_PAGINATION.COUNT_FILTER > 0) {
        var fila;
        var cadenaFecha;
        var fecha;
        var a;
        $.each(BEAN_PAGINATION.LIST, function (index, value) {
            a = "<a href='http://lib.peam.gob.pe:8081/ArcDig/OriArc.pdf?id=" + value.docu_id + "' target='_blank' class='pdf-documento-web' title='Ver PDF'><i class='fa fa-file-pdf-o'></i></a>";
            cadenaFecha = value.fecha_aprobacion.split('/');
            if (cadenaFecha.length === 3) {
                fecha = value.fecha_aprobacion;
            } else {
                fecha = "";
            }
            fila = "<tr";
            fila += ">";
            fila += "<td class='text-center align-middle'>" + fecha + "</td>";
            fila += "<td class='align-middle'>" + value.descripcion + "</td>";
            fila += "<td class='align-middle'>" + value.resolucion_aprobacion + "</td>";
            fila += "<td class='text-center align-middle'>" + a + "</td>";
            fila += "</tr>";
            $('#tbodyPresupuestoInstitucional').append(fila);
        });
        var defaultOptions = getDefaultOptionsPagination();
        var totalPages = getTotalPages(BEAN_PAGINATION.COUNT_FILTER, parseInt($('#sizePagePresupuestoInstitucional').val()));
        var options =
                {
                    startPage: parseInt($('#numberPagePresupuestoInstitucional').val()),
                    totalPages: totalPages,
                    visiblePages: 5,
                    initiateStartPageClick: false,
                    first: "<i class='fa fa-angle-double-left' aria-hidden='true'></i>",
                    prev: "<i class='fa fa-angle-left' aria-hidden='true'></i>",
                    next: "<i class='fa fa-angle-right' aria-hidden='true'></i>",
                    last: "<i class='fa fa-angle-double-right' aria-hidden='true'></i>",
                    onPageClick: function (evt, page) {
                        $('#actionPresupuestoInstitucional').val('paginarPresupuesto');
                        $('#numberPagePresupuestoInstitucional').val(page);
                        $('#namePresupuestoInstitucional').val('FrmPresupuestoInstitucional');
                        $('#loader_contenido_PresupuestoInstitucional').css('display', 'block');
                        procesarAjaxPresupuestosInstitucionalWeb();
                    }
                };
        $pagination.twbsPagination('destroy');
        $pagination.twbsPagination($.extend({}, defaultOptions, options));
        $('#txtPresupuestoInstitucional').focus();
    } else {
        $pagination.twbsPagination('destroy');
        viewAlertWeb('warning', 'No se enconntraron resultados');
    }
}

function procesarAjaxInformacionFinancieraWeb() {
    var datosSerializadosCompletos = $('#' + $('#nameInfoFinanciera').val()).serialize();
    $.ajax({
        url: getContext() + '/documentos/operacionesweb',
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        success: function (jsonResponse) {
            $('#loader_contenido_InfoFinanciera').css('display', 'none');
            listarInformacionFinanciera(jsonResponse.BEAN_PAGINATION);
        },
        error: function () {
            /*MOSTRAMOS MENSAJE ERROR SERVIDOR*/
            $('#loader_contenido_InfoFinanciera').css('display', 'none');
            viewAlertWeb('error', 'Error interno en el servidor!');
        }
    });
    return false;
}

function listarInformacionFinanciera(BEAN_PAGINATION) {
    /*PAGINATION*/
    var $pagination = $('#paginationInfoFinanciera');
    $('#tbodyInfoFinanciera').empty();
    if (BEAN_PAGINATION.COUNT_FILTER > 0) {
        var fila;
        var a;
        $.each(BEAN_PAGINATION.LIST, function (index, value) {
            a = "<a href='http://lib.peam.gob.pe:8081/ArcDig/OriArc.pdf?id=" + value.docu_id + "' target='_blank' class='pdf-documento-web' title='Ver PDF'><i class='fa fa-file-pdf-o'></i></a>";
            fila = "<tr";
            fila += ">";
            fila += "<td class='text-center align-middle'>" + value.mes + "/" + value.anho + "</td>";
            fila += "<td class='align-middle'>" + value.descripcion + "</td>";
            fila += "<td class='text-center align-middle'>" + a + "</td>";
            fila += "</tr>";
            $('#tbodyInfoFinanciera').append(fila);
        });
        var defaultOptions = getDefaultOptionsPagination();
        var totalPages = getTotalPages(BEAN_PAGINATION.COUNT_FILTER, parseInt($('#sizePageInfoFinanciera').val()));
        var options =
                {
                    startPage: parseInt($('#numberPageInfoFinanciera').val()),
                    totalPages: totalPages,
                    visiblePages: 5,
                    initiateStartPageClick: false,
                    first: "<i class='fa fa-angle-double-left' aria-hidden='true'></i>",
                    prev: "<i class='fa fa-angle-left' aria-hidden='true'></i>",
                    next: "<i class='fa fa-angle-right' aria-hidden='true'></i>",
                    last: "<i class='fa fa-angle-double-right' aria-hidden='true'></i>",
                    onPageClick: function (evt, page) {
                        $('#actionInfoFinanciera').val('paginarFinanza');
                        $('#numberPageInfoFinanciera').val(page);
                        $('#nameInfoFinanciera').val('FrmInfoFinanciera');
                        $('#loader_contenido_InfoFinanciera').css('display', 'block');
                        procesarAjaxInformacionFinancieraWeb();
                    }
                };
        $pagination.twbsPagination('destroy');
        $pagination.twbsPagination($.extend({}, defaultOptions, options));
        $('#txtInfoFinanciera').focus();
    } else {
        $pagination.twbsPagination('destroy');
        viewAlertWeb('warning', 'No se enconntraron resultados');
    }
}

function procesarAjaxInformacionPresupustalWeb() {
    var datosSerializadosCompletos = $('#' + $('#nameInfoPresupuestal').val()).serialize();
    $.ajax({
        url: getContext() + '/documentos/operacionesweb',
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        success: function (jsonResponse) {
            $('#loader_contenido_InfoPresupuestal').css('display', 'none');
            console.log(jsonResponse);
            listarInformacionPresupustal(jsonResponse.BEAN_PAGINATION);
        },
        error: function () {
            /*MOSTRAMOS MENSAJE ERROR SERVIDOR*/
            $('#loader_contenido_InfoPresupuestal').css('display', 'none');
            viewAlertWeb('error', 'Error interno en el servidor!');
        }
    });
    return false;
}

function listarInformacionPresupustal(BEAN_PAGINATION) {
    /*PAGINATION*/
    var $pagination = $('#paginationInfoPresupuestal');
    $('#tbodyInfoPresupuestal').empty();
    if (BEAN_PAGINATION.COUNT_FILTER > 0) {
        var fila;
        var a;
        $.each(BEAN_PAGINATION.LIST, function (index, value) {
            a = "<a href='http://lib.peam.gob.pe:8081/ArcDig/OriArc.pdf?id=" + value.docu_id + "' target='_blank' class='pdf-documento-web' title='Ver PDF'><i class='fa fa-file-pdf-o'></i></a>";
            fila = "<tr";
            fila += ">";
            fila += "<td class='text-center align-middle'>" + value.mes + "/" + value.anho + "</td>";
            fila += "<td class='align-middle'>" + value.descripcion + "</td>";
            fila += "<td class='text-center align-middle'>" + a + "</td>";
            fila += "</tr>";
            $('#tbodyInfoPresupuestal').append(fila);
        });
        var defaultOptions = getDefaultOptionsPagination();
        var totalPages = getTotalPages(BEAN_PAGINATION.COUNT_FILTER, parseInt($('#sizePageInfoPresupuestal').val()));
        var options =
                {
                    startPage: parseInt($('#numberPageInfoPresupuestal').val()),
                    totalPages: totalPages,
                    visiblePages: 5,
                    initiateStartPageClick: false,
                    first: "<i class='fa fa-angle-double-left' aria-hidden='true'></i>",
                    prev: "<i class='fa fa-angle-left' aria-hidden='true'></i>",
                    next: "<i class='fa fa-angle-right' aria-hidden='true'></i>",
                    last: "<i class='fa fa-angle-double-right' aria-hidden='true'></i>",
                    onPageClick: function (evt, page) {
                        $('#actionInfoPresupuestal').val('paginarFinanza2');
                        $('#numberPageInfoPresupuestal').val(page);
                        $('#nameInfoPresupuestal').val('FrmInfoPresupuestal');
                        $('#loader_contenido_InfoPresupuestal').css('display', 'block');
                        procesarAjaxInformacionPresupustalWeb();
                    }
                };
        $pagination.twbsPagination('destroy');
        $pagination.twbsPagination($.extend({}, defaultOptions, options));
        $('#txtInfoPresupuestal').focus();
    } else {
        $pagination.twbsPagination('destroy');
        viewAlertWeb('warning', 'No se enconntraron resultados');
    }
}