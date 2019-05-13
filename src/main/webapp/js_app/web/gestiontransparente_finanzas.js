$(document).ready(function () {

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
    
    $('#comboAnioPresupuestoInstitucional').hide();

    addEventoCombosPaginar();
    procesarAjaxAnhosPresupuestoInstitucional();
    procesarAjaxAnhosInfoFinanciera();
    procesarAjaxAnhosPresupuestal();

});

function procesarAjaxAnhosPresupuestoInstitucional() {
    var datosSerializadosCompletos = "action=paginarPresupuestoAnhos";
    datosSerializadosCompletos += "&comboTipoPresupuestoInstitucional="+$('#comboTipoPresupuestoInstitucional').val();
    $.ajax({
        url: getContext() + '/documentos/operacionesweb',
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        success: function (jsonResponse) {
            listarAnhosPresupuestoInstitucional(jsonResponse.BEAN_PAGINATION);
        },
        error: function () {
            console.log('Error interno en el servidor!');
        }
    });

//    }
    return false;
}

function sinAño(tipo){
    if (tipo==="1") {
        $('#comboAnioPresupuestoInstitucional').hide();
    }else{
        $('#comboAnioPresupuestoInstitucional').show();
    }
}

function listarAnhosPresupuestoInstitucional(BEAN_PAGINATION) {
    $('#comboAnioPresupuestoInstitucional').empty();
    if (BEAN_PAGINATION.COUNT_FILTER > 0) {
        var option;
        $.each(BEAN_PAGINATION.LIST, function (index, value) {
            option = "<option value='" + value.anho + "'>" + value.anho + "</option>";
            $('#comboAnioPresupuestoInstitucional').append(option);
        });
        procesarAjaxPresupuestosInstitucionalWeb();
    } else {
        console.log("vacio");
    }
}

function procesarAjaxAnhosInfoFinanciera() {
    var datosSerializadosCompletos = "action=paginarFinanzasAnhos1";
    datosSerializadosCompletos += "&comboCategoriaInfoFinanciera="+$('#comboCategoriaInfoFinanciera').val();
    $.ajax({
        url: getContext() + '/documentos/operacionesweb',
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        success: function (jsonResponse) {
            listarAnhosInfoFinanciera(jsonResponse.BEAN_PAGINATION);
        },
        error: function () {
            console.log('Error interno en el servidor!');
        }
    });

//    }
    return false;
}
function listarAnhosInfoFinanciera(BEAN_PAGINATION) {
    $('#comboAnioInfoFinanciera').empty();
    if (BEAN_PAGINATION.COUNT_FILTER > 0) {
        var option;
        $.each(BEAN_PAGINATION.LIST, function (index, value) {
            option = "<option value='" + value.anho + "'>" + value.anho + "</option>";
            $('#comboAnioInfoFinanciera').append(option);
        });
        procesarAjaxInformacionFinancieraWeb();
    } else {
        console.log("vacio");
    }
}

function cambioPresupuesto(value){
    procesarAjaxAnhosPresupuestal();
}

function cambioFinanciero(value){
    procesarAjaxAnhosInfoFinanciera();
}

function procesarAjaxAnhosPresupuestal() {
    var datosSerializadosCompletos = "action=paginarFinanzasAnhos2";
    datosSerializadosCompletos += "&comboCategoriaInfoPresupuestal="+$('#comboCategoriaInfoPresupuestal').val();
    $.ajax({
        url: getContext() + '/documentos/operacionesweb',
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        success: function (jsonResponse) {
            listarAnhosPresupuestal(jsonResponse.BEAN_PAGINATION);
        },
        error: function () {
            console.log('Error interno en el servidor!');
        }
    });

//    }
    return false;
}
function listarAnhosPresupuestal(BEAN_PAGINATION) {
    $('#comboAnioInfoPresupuestal').empty();
    if (BEAN_PAGINATION.COUNT_FILTER > 0) {
        var option;
        $.each(BEAN_PAGINATION.LIST, function (index, value) {
            option = "<option value='" + value.anho + "'>" + value.anho + "</option>";
            $('#comboAnioInfoPresupuestal').append(option);
        });
        procesarAjaxInformacionPresupustalWeb();
    } else {
        console.log("vacio");
    }
}

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
            console.log('error', 'Error interno en el servidor!');
        }
    });
    return false;
}

function traerNombreMes(orden) {
    var mes;
    switch (orden) {
        case "01":
            mes = "Enero";
            break;
        case "1 ":
            mes = "Enero";
            break;
        case "02":
            mes = "Febrero";
            break;
        case "03":
            mes = "Marzo";
            break;
        case "04":
            mes = "Abril";
            break;
        case "05":
            mes = "Mayo";
            break;
        case "06":
            mes = "Junio";
            break;
        case "07":
            mes = "Julio";
            break;
        case "08":
            mes = "Agosto";
            break;
        case "09":
            mes = "Setiembre";
            break;
        case "10":
            mes = "Octubre";
            break;
        case "11":
            mes = "Noviembre";
            break;
        case "12":
            mes = "Diciembre";
            break;
    }
    return mes;
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
            console.log('error', 'Error interno en el servidor!');
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
        var mes;
        $.each(BEAN_PAGINATION.LIST, function (index, value) {
            mes = traerNombreMes(value.mes);
            a = "<a href='http://lib.peam.gob.pe:8081/ArcDig/OriArc.pdf?id=" + value.docu_id + "' target='_blank' class='pdf-documento-web' title='Ver PDF'><i class='fa fa-file-pdf-o'></i></a>";
            fila = "<tr";
            fila += ">";
            fila += "<td class='text-center align-middle'>" + mes + "</td>";
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
            console.log('error', 'Error interno en el servidor!');
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
        var mes;
        $.each(BEAN_PAGINATION.LIST, function (index, value) {
            mes = traerNombreMes(value.mes);
            a = "<a href='http://lib.peam.gob.pe:8081/ArcDig/OriArc.pdf?id=" + value.docu_id + "' target='_blank' class='pdf-documento-web' title='Ver PDF'><i class='fa fa-file-pdf-o'></i></a>";
            fila = "<tr";
            fila += ">";
            fila += "<td class='text-center align-middle'>" + mes +"</td>";
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