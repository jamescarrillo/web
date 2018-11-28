$(document).ready(function () {


    cargarAniosCombo($('#comboAnioOrdenCompra'), 2007, "-1", "AÑO");
    cargarAniosCombo($('#comboAnioOrdenServicio'), 2007, "-1", "AÑO");
    cargarAniosCombo($('#comboAnioPublicidad'), 2009, "-1", "AÑO");
    cargarAniosCombo($('#comboAnioTelefonia'), 2009, "-1", "AÑO");
    cargarAniosCombo($('#comboAnioVehiculo'), 2007, "-1", "AÑO");
    cargarAniosCombo($('#comboAnioProveedor'), 2007, "-1", "AÑO");

    $("#FrmOrdenCompra").submit(function () {
        $("#nameFormOrdenCompra").val("FrmOrdenCompra");
        $("#numberPageOrdenCompra").val(1);
        $('#actionOrdenCompra').val("paginarOrdenCompra");
        $('#loader_contenido_orden_compra').css('display', 'block');
        processAjaxOrdenCompra();
        return false;
    });

    $("#FrmOrdenServicio").submit(function () {
        $("#nameFormOrdenServicio").val("FrmOrdenServicio");
        $("#numberPageOrdenServicio").val(1);
        $('#actionOrdenServicio').val("paginarOrdenServicio");
        $('#loader_contenido_orden_servicio').css('display', 'block');
        processAjaxOrdenServicio();
        return false;
    });

    $("#FrmPublicidad").submit(function () {
        $("#nameFormPublicidad").val("FrmPublicidad");
        $("#numberPagePublicidad").val(1);
        $('#actionPublicidad').val("paginarPublicidad");
        $('#loader_contenido_publicidad').css('display', 'block');
        processAjaxPublicidad();
        return false;
    });

    $("#FrmTelefonia").submit(function () {
        $("#nameFormTelefonia").val("FrmTelefonia");
        $("#numberPageTelefonia").val(1);
        $('#actionTelefonia').val("paginarTelefonia");
        $('#loader_contenido_telefonia').css('display', 'block');
        processAjaxTelefonia();
        return false;
    });

    $("#FrmVehiculo").submit(function () {
        $("#nameFormVehiculo").val("FrmVehiculo");
        $("#numberPageVehiculo").val(1);
        $('#actionVehiculo').val("paginarVehiculo");
        $('#loader_contenido_vehiculo').css('display', 'block');
        processAjaxVehiculo();
        return false;
    });

    $("#FrmProveedor").submit(function () {
        $("#nameFormProveedor").val("FrmProveedor");
        $("#numberPageProveedor").val(1);
        $('#actionProveedor').val("paginarProveedor");
        $('#loader_contenido_proveedor').css('display', 'block');
        processAjaxProveedor();
        return false;
    });

    addEventoCombosPaginar();
    processAjaxDataAdquisiciones();

});

function processAjaxDataAdquisiciones() {
    var datosSerializadosCompletos = $('#' + $('#nameFormOrdenCompra').val()).serialize();
    datosSerializadosCompletos += "&" + $('#' + $('#nameFormOrdenServicio').val()).serialize();
    datosSerializadosCompletos += "&" + $('#' + $('#nameFormPublicidad').val()).serialize();
    datosSerializadosCompletos += "&" + $('#' + $('#nameFormTelefonia').val()).serialize();
    datosSerializadosCompletos += "&" + $('#' + $('#nameFormVehiculo').val()).serialize();
    datosSerializadosCompletos += "&" + $('#' + $('#nameFormProveedor').val()).serialize();
    datosSerializadosCompletos = datosSerializadosCompletos.replace("&action=paginarOrdenCompra", "");
    datosSerializadosCompletos = datosSerializadosCompletos.replace("&action=paginarOrdenServicio", "");
    datosSerializadosCompletos = datosSerializadosCompletos.replace("&action=paginarPublicidad", "");
    datosSerializadosCompletos = datosSerializadosCompletos.replace("&action=paginarTelefonia", "");
    datosSerializadosCompletos = datosSerializadosCompletos.replace("&action=paginarVehiculo", "");
    datosSerializadosCompletos = datosSerializadosCompletos.replace("&action=paginarProveedor", "");
    datosSerializadosCompletos += "&action=getDataAdquisiciones";
    $.ajax({
        url: getContext() + '/gestiontransparente/adquisiciones-y-contrataciones',
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        success: function (jsonResponse) {
            listarOrdenCompra(jsonResponse.DATA_ORDEN_COMPRA);
            listarOrdenServicio(jsonResponse.DATA_ORDEN_SERVICIO);
            listarPublicidad(jsonResponse.DATA_PUBLICIDAD);
            listarTelefonia(jsonResponse.DATA_TELEFONIA);
            listarVehiculo(jsonResponse.DATA_VEHICULO);
            listarProveedor(jsonResponse.DATA_PROVEEDOR);
        },
        error: function () {
            console.log('Error interno al trear datos de adquisiciones!');
        }
    });
    return false;
}

function processAjaxOrdenCompra() {
    var datosSerializadosCompletos = $('#' + $('#nameFormOrdenCompra').val()).serialize();
    $.ajax({
        url: getContext() + '/gestiontransparente/adquisiciones-y-contrataciones',
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        success: function (jsonResponse) {
            $('#loader_contenido_orden_compra').css('display', 'none');
            if (jsonResponse.BEAN_PAGINATION !== undefined) {
                listarOrdenCompra(jsonResponse.BEAN_PAGINATION);
            }
        },
        error: function () {
            $('#loader_contenido_orden_compra').css('display', 'none');
            console.log('Error interno en el servidor!');
        }
    });
    return false;
}

function listarOrdenCompra(BEAN_PAGINATION) {
    var $pagination = $('#paginationOrdenCompra');
    $('#tbodyOrdenCompra').empty();
    if (BEAN_PAGINATION.COUNT_FILTER > 0) {
        var tr;
        var siaf;
        $(BEAN_PAGINATION.LIST).each(function (index, value) {
            if(value.nro_siaf !== undefined){
                siaf = value.nro_siaf;
            }else{
                siaf = "";
            }
            tr = "<tr>";
            tr += "<td class='text-center'>" + value.orden_compra + "</td>";
            tr += "<td class='text-center'>" + siaf + "</td>";
            tr += "<td class='text-center'>" + value.fecha_compra + "</td>";
            tr += "<td>" + value.fuente_financiamiento + "</td>";
            tr += "<td>" + value.proveedor + "</td>";
            tr += "<td class='text-center'>" + value.monto + "</td>";
            tr += "</tr>";
            $('#tbodyOrdenCompra').append(tr);
        });
        /*PAGINACION*/
        var defaultOptions = getDefaultOptionsPagination();
        var totalPages = getTotalPages(BEAN_PAGINATION.COUNT_FILTER, parseInt($('#sizePageOrdenCompra').val()));
        var options =
                {
                    startPage: parseInt($("#numberPageOrdenCompra").val()),
                    totalPages: totalPages,
                    visiblePages: 5,
                    initiateStartPageClick: false,
                    first: "<i class='fa fa-angle-double-left' aria-hidden='true'></i>",
                    prev: "<i class='fa fa-angle-left' aria-hidden='true'></i>",
                    next: "<i class='fa fa-angle-right' aria-hidden='true'></i>",
                    last: "<i class='fa fa-angle-double-right' aria-hidden='true'></i>",
                    onPageClick: function (evt, page) {
                        $('#actionOrdenCompra').val("paginarOrdenCompra");
                        $('#numberPageOrdenCompra').val(page);
                        $('#nameFormOrdenCompra').val("FrmOrdenCompra");
                        $('#loader_contenido_orden_compra').css('display', 'block');
                        processAjaxOrdenCompra();
                    }
                };
        $pagination.twbsPagination('destroy');
        $pagination.twbsPagination($.extend({}, defaultOptions, options));
        $('#txtProveedorOrdenCompra').focus();
    } else {
        $pagination.twbsPagination('destroy');
        viewAlertWeb('warning', 'No se encontraron resultados');
    }
}

function processAjaxOrdenServicio() {
    var datosSerializadosCompletos = $('#' + $('#nameFormOrdenServicio').val()).serialize();
    $.ajax({
        url: getContext() + '/gestiontransparente/adquisiciones-y-contrataciones',
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        success: function (jsonResponse) {
            $('#loader_contenido_orden_servicio').css('display', 'none');
            if (jsonResponse.BEAN_PAGINATION !== undefined) {
                listarOrdenServicio(jsonResponse.BEAN_PAGINATION);
            }
        },
        error: function () {
            $('#loader_contenido_orden_servicio').css('display', 'none');
            console.log('Error interno en el servidor!');
        }
    });
    return false;
}

function listarOrdenServicio(BEAN_PAGINATION) {
    var $pagination = $('#paginationOrdenServicio');
    $('#tbodyOrdenServicio').empty();
    if (BEAN_PAGINATION.COUNT_FILTER > 0) {
        var tr;
        var siaf;
        $(BEAN_PAGINATION.LIST).each(function (index, value) {
            if(value.nro_siaf !== undefined){
                siaf = value.nro_siaf;
            }else{
                siaf = "";
            }
            tr = "<tr>";
            tr += "<td class='text-center'>" + value.orden_servicio + "</td>";
            tr += "<td class='text-center'>" + siaf + "</td>";
            tr += "<td class='text-center'>" + value.fecha_compra + "</td>";
            tr += "<td>" + value.fuente_financiamiento + "</td>";
            tr += "<td>" + value.proveedor + "</td>";
            tr += "<td class='text-center'>" + value.monto + "</td>";
            tr += "</tr>";
            $('#tbodyOrdenServicio').append(tr);
        });
        var defaultOptions = getDefaultOptionsPagination();
        var totalPages = getTotalPages(BEAN_PAGINATION.COUNT_FILTER, parseInt($('#sizePageOrdenServicio').val()));
        var options =
                {
                    startPage: parseInt($("#numberPageOrdenServicio").val()),
                    totalPages: totalPages,
                    visiblePages: 5,
                    initiateStartPageClick: false,
                    first: "<i class='fa fa-angle-double-left' aria-hidden='true'></i>",
                    prev: "<i class='fa fa-angle-left' aria-hidden='true'></i>",
                    next: "<i class='fa fa-angle-right' aria-hidden='true'></i>",
                    last: "<i class='fa fa-angle-double-right' aria-hidden='true'></i>",
                    onPageClick: function (evt, page) {
                        $('#actionOrdenServicio').val("paginarOrdenServicio");
                        $('#numberPageOrdenServicio').val(page);
                        $('#nameFormOrdenServicio').val("FrmOrdenServicio");
                        $('#loader_contenido_orden_servicio').css('display', 'block');
                        processAjaxOrdenServicio();
                    }
                };
        $pagination.twbsPagination('destroy');
        $pagination.twbsPagination($.extend({}, defaultOptions, options));
        $('#txtProveedorOrdenServicio').focus();
    } else {
        $pagination.twbsPagination('destroy');
        viewAlertWeb('warning', 'No se encontraron resultados');
    }
}

function processAjaxPublicidad() {
    var datosSerializadosCompletos = $('#' + $('#nameFormPublicidad').val()).serialize();
    $.ajax({
        url: getContext() + '/gestiontransparente/adquisiciones-y-contrataciones',
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        success: function (jsonResponse) {
            $('#loader_contenido_publicidad').css('display', 'none');
            if (jsonResponse.BEAN_PAGINATION !== undefined) {
                listarPublicidad(jsonResponse.BEAN_PAGINATION);
            }
        },
        error: function () {
            $('#loader_contenido_publicidad').css('display', 'none');
            console.log('Error interno en el servidor!');
        }
    });
    return false;
}

function listarPublicidad(BEAN_PAGINATION) {
    var $pagination = $('#paginationPublicidad');
    $('#tbodyPublicidad').empty();
    if (BEAN_PAGINATION.COUNT_FILTER > 0) {
        var tr;
        var contrato;
        $(BEAN_PAGINATION.LIST).each(function (index, value) {
            if (value.contrato !== undefined) {
                contrato = value.contrato;
            } else {
                contrato = "";
            }
            tr = "<tr>";
            tr += "<td class='text-center'>" + contrato + "</td>";
            tr += "<td>" + value.objeto_contrato + "</td>";
            tr += "<td class='text-center'>" + value.ruc + "</td>";
            tr += "<td>" + value.proveedor + "</td>";
            tr += "<td class='text-center'>" + value.penalidad + "</td>";
            tr += "<td class='text-center'>" + value.monto_contrato + "</td>";
            tr += "</tr>";
            $('#tbodyPublicidad').append(tr);
        });
        /*PAGINACION*/
        var defaultOptions = getDefaultOptionsPagination();
        var totalPages = getTotalPages(BEAN_PAGINATION.COUNT_FILTER, parseInt($('#sizePagePublicidad').val()));
        var options =
                {
                    startPage: parseInt($("#numberPagePublicidad").val()),
                    totalPages: totalPages,
                    visiblePages: 5,
                    initiateStartPageClick: false,
                    first: "<i class='fa fa-angle-double-left' aria-hidden='true'></i>",
                    prev: "<i class='fa fa-angle-left' aria-hidden='true'></i>",
                    next: "<i class='fa fa-angle-right' aria-hidden='true'></i>",
                    last: "<i class='fa fa-angle-double-right' aria-hidden='true'></i>",
                    onPageClick: function (evt, page) {
                        $('#actionPublicidad').val("paginarPublicidad");
                        $('#numberPagePublicidad').val(page);
                        $('#nameFormPublicidad').val("FrmPublicidad");
                        $('#loader_contenido_publicidad').css('display', 'block');
                        processAjaxPublicidad();
                    }
                };
        $pagination.twbsPagination('destroy');
        $pagination.twbsPagination($.extend({}, defaultOptions, options));
        $('#txtProveedorPublicidad').focus();
    } else {
        $pagination.twbsPagination('destroy');
        viewAlertWeb('warning', 'No se encontraron resultados');
    }
}

function processAjaxTelefonia() {
    var datosSerializadosCompletos = $('#' + $('#nameFormTelefonia').val()).serialize();
    $.ajax({
        url: getContext() + '/gestiontransparente/adquisiciones-y-contrataciones',
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        success: function (jsonResponse) {
            $('#loader_contenido_telefonia').css('display', 'none');
            if (jsonResponse.BEAN_PAGINATION !== undefined) {
                listarTelefonia(jsonResponse.BEAN_PAGINATION);
            }
        },
        error: function () {
            $('#loader_contenido_telefonia').css('display', 'none');
            console.log('Error interno en el servidor!');
        }
    });
    return false;
}

function listarTelefonia(BEAN_PAGINATION) {
    var $pagination = $('#paginationTelefonia');
    $('#tbodyTelefonia').empty();
    if (BEAN_PAGINATION.COUNT_FILTER > 0) {
        var tr;
        $(BEAN_PAGINATION.LIST).each(function (index, value) {
            tr = "<tr>";
            tr += "<td class='text-center'>" + value.tipo + "</td>";
            tr += "<td class='text-center'>" + value.numero + "</td>";
            tr += "<td>" + value.area_oficina + "</td>";
            tr += "<td>" + value.asignado_a + "</td>";
            tr += "<td>" + value.cargo_actividad + "</td>";
            tr += "<td class='text-center'>" + value.importe + "</td>";
            tr += "</tr>";
            $('#tbodyTelefonia').append(tr);
        });
        var defaultOptions = getDefaultOptionsPagination();
        var totalPages = getTotalPages(BEAN_PAGINATION.COUNT_FILTER, parseInt($('#sizePageTelefonia').val()));
        var options =
                {
                    startPage: parseInt($("#numberPageTelefonia").val()),
                    totalPages: totalPages,
                    visiblePages: 5,
                    initiateStartPageClick: false,
                    first: "<i class='fa fa-angle-double-left' aria-hidden='true'></i>",
                    prev: "<i class='fa fa-angle-left' aria-hidden='true'></i>",
                    next: "<i class='fa fa-angle-right' aria-hidden='true'></i>",
                    last: "<i class='fa fa-angle-double-right' aria-hidden='true'></i>",
                    onPageClick: function (evt, page) {
                        $('#actionTelefonia').val("paginarTelefonia");
                        $('#numberPageTelefonia').val(page);
                        $('#nameFormTelefonia').val("FrmTelefonia");
                        $('#loader_contenido_telefonia').css('display', 'block');
                        processAjaxTelefonia();
                    }
                };
        $pagination.twbsPagination('destroy');
        $pagination.twbsPagination($.extend({}, defaultOptions, options));
        $('#txtAreaTelefonia').focus();
    } else {
        $pagination.twbsPagination('destroy');
        viewAlertWeb('warning', 'No se encontraron resultados');
    }
}

function processAjaxVehiculo() {
    var datosSerializadosCompletos = $('#' + $('#nameFormVehiculo').val()).serialize();
    $.ajax({
        url: getContext() + '/gestiontransparente/adquisiciones-y-contrataciones',
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        success: function (jsonResponse) {
            $('#loader_contenido_vehiculo').css('display', 'none');
            if (jsonResponse.BEAN_PAGINATION !== undefined) {
                listarVehiculo(jsonResponse.BEAN_PAGINATION);
            }
        },
        error: function () {
            $('#loader_contenido_vehiculo').css('display', 'none');
            console.log('Error interno en el servidor!');
        }
    });
    return false;
}

function listarVehiculo(BEAN_PAGINATION) {
    var $pagination = $('#paginationVehiculo');
    $('#tbodyVehiculo').empty();
    if (BEAN_PAGINATION.COUNT_FILTER > 0) {
        var tr;
        var soat;
        $(BEAN_PAGINATION.LIST).each(function (index, value) {
            if (value.soat_fecha_vencimiento !== undefined) {
                soat = value.soat_fecha_vencimiento;
            } else {
                soat = "";
            }
            tr = "<tr>";
            tr += "<td class='text-medium-table text-center'>" + value.clase_vehiculo + "</td>";
            tr += "<td class='text-medium-table'>" + value.cargo_actividad + "</td>";
            tr += "<td class='text-medium-table'>" + value.asignado_a + "</td>";
            tr += "<td class='text-medium-table text-center'>" + value.recorrido_km + "</td>";
            tr += "<td class='text-medium-table text-center'>" + soat + "</td>";
            tr += "<td class='text-medium-table text-center'>" + value.tipo_combustible + "</td>";
            tr += "<td class='text-medium-table text-center'>" + value.costo_combustible + "</td>";
            tr += "<td class='text-medium-table text-center'>" + value.placa + "</td>";
            tr += "</tr>";
            $('#tbodyVehiculo').append(tr);
        });
        var defaultOptions = getDefaultOptionsPagination();
        var totalPages = getTotalPages(BEAN_PAGINATION.COUNT_FILTER, parseInt($('#sizePageVehiculo').val()));
        var options =
                {
                    startPage: parseInt($("#numberPageVehiculo").val()),
                    totalPages: totalPages,
                    visiblePages: 5,
                    initiateStartPageClick: false,
                    first: "<i class='fa fa-angle-double-left' aria-hidden='true'></i>",
                    prev: "<i class='fa fa-angle-left' aria-hidden='true'></i>",
                    next: "<i class='fa fa-angle-right' aria-hidden='true'></i>",
                    last: "<i class='fa fa-angle-double-right' aria-hidden='true'></i>",
                    onPageClick: function (evt, page) {
                        $('#actionVehiculo').val("paginarVehiculo");
                        $('#numberPageVehiculo').val(page);
                        $('#nameFormVehiculo').val("FrmVehiculo");
                        $('#loader_contenido_vehiculo').css('display', 'block');
                        processAjaxVehiculo();
                    }
                };
        $pagination.twbsPagination('destroy');
        $pagination.twbsPagination($.extend({}, defaultOptions, options));
        $('#txtAreaVehiculo').focus();
    } else {
        $pagination.twbsPagination('destroy');
        viewAlertWeb('warning', 'No se encontraron resultados');
    }
}

function processAjaxProveedor() {
    var datosSerializadosCompletos = $('#' + $('#nameFormProveedor').val()).serialize();
    $.ajax({
        url: getContext() + '/gestiontransparente/adquisiciones-y-contrataciones',
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        success: function (jsonResponse) {
            $('#loader_contenido_proveedor').css('display', 'none');
            if (jsonResponse.BEAN_PAGINATION !== undefined) {
                listarProveedor(jsonResponse.BEAN_PAGINATION);
            }
        },
        error: function () {
            $('#loader_contenido_proveedor').css('display', 'none');
            console.log('Error interno en el servidor!');
        }
    });
    return false;
}

function listarProveedor(BEAN_PAGINATION) {
    var $pagination = $('#paginationProveedor');
    $('#tbodyProveedor').empty();
    if (BEAN_PAGINATION.COUNT_FILTER > 0) {
        var tr;
        $(BEAN_PAGINATION.LIST).each(function (index, value) {
            tr = "<tr>";
            tr += "<td class='text-medium-table text-center'>" + value.ruc + "</td>";
            tr += "<td class='text-medium-table'>" + value.proveedor + "</td>";
            tr += "<td class='text-medium-table text-center'>" + value.importe + "</td>";
            tr += "</tr>";
            $('#tbodyProveedor').append(tr);
        });
        var defaultOptions = getDefaultOptionsPagination();
        var totalPages = getTotalPages(BEAN_PAGINATION.COUNT_FILTER, parseInt($('#sizePageProveedor').val()));
        var options =
                {
                    startPage: parseInt($("#numberPageProveedor").val()),
                    totalPages: totalPages,
                    visiblePages: 5,
                    initiateStartPageClick: false,
                    first: "<i class='fa fa-angle-double-left' aria-hidden='true'></i>",
                    prev: "<i class='fa fa-angle-left' aria-hidden='true'></i>",
                    next: "<i class='fa fa-angle-right' aria-hidden='true'></i>",
                    last: "<i class='fa fa-angle-double-right' aria-hidden='true'></i>",
                    onPageClick: function (evt, page) {
                        $('#actionProveedor').val("paginarProveedor");
                        $('#numberPageProveedor').val(page);
                        $('#nameFormProveedor').val("FrmProveedor");
                        $('#loader_contenido_proveedor').css('display', 'block');
                        processAjaxProveedor();
                    }
                };
        $pagination.twbsPagination('destroy');
        $pagination.twbsPagination($.extend({}, defaultOptions, options));
        $('#txtProveedor').focus();
    } else {
        $pagination.twbsPagination('destroy');
        viewAlertWeb('warning', 'No se encontraron resultados');
    }
}
