$(document).ready(function () {

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

    var parameters;
    $('.view-reporte-oc').each(function () {
        $(this).click(function () {
            if ($('#comboAnioOrdenCompra').val() !== "-1") {
                parameters = "report=reporte_ordenes_compra";
                parameters += "&format=" + $(this).attr('format');
                parameters += "&anho=" + $('#comboAnioOrdenCompra').val();
                openReport(parameters);
            } else {
                viewAlertWeb('warning', 'Por favor seleccione un Año');
            }
        });
    });

    $('.view-reporte-os').each(function () {
        $(this).click(function () {
            if ($('#comboAnioOrdenServicio').val() !== "-1") {
                parameters = "report=reporte_ordenes_servicio";
                parameters += "&format=" + $(this).attr('format');
                parameters += "&anho=" + $('#comboAnioOrdenServicio').val();
                openReport(parameters);
            } else {
                viewAlertWeb('warning', 'Por favor seleccione un Año');
            }
        });
    });

    $('.view-reporte-pu').each(function () {
        $(this).click(function () {
            if ($('#comboAnioPublicidad').val() !== "-1") {
                parameters = "report=reporte_gastos_publicidad";
                parameters += "&format=" + $(this).attr('format');
                parameters += "&anho=" + $('#comboAnioPublicidad').val();
                openReport(parameters);
            } else {
                viewAlertWeb('warning', 'Por favor seleccione un Año');
            }
        });
    });

    $('.view-reporte-tel').each(function () {
        $(this).click(function () {
            if ($('#comboAnioTelefonia').val() !== "-1") {
                parameters = "report=reporte_gastos_telefonia";
                parameters += "&format=" + $(this).attr('format');
                parameters += "&anho=" + $('#comboAnioTelefonia').val();
                openReport(parameters);
            } else {
                viewAlertWeb('warning', 'Por favor seleccione un Año');
            }
        });
    });

    $('.view-reporte-vehiculo').each(function () {
        $(this).click(function () {
            if ($('#comboAnioVehiculo').val() !== "-1") {
                parameters = "report=reporte_uso_vehiculo";
                parameters += "&format=" + $(this).attr('format');
                parameters += "&anho=" + $('#comboAnioVehiculo').val();
                openReport(parameters);
            } else {
                viewAlertWeb('warning', 'Por favor seleccione un Año');
            }
        });
    });

    $('.view-reporte-proveedor').each(function () {
        $(this).click(function () {
            if ($('#comboAnioProveedor').val() !== "-1") {
                parameters = "report=reporte_proveedores";
                parameters += "&format=" + $(this).attr('format');
                parameters += "&anho=" + $('#comboAnioProveedor').val();
                openReport(parameters);
            } else {
                viewAlertWeb('warning', 'Por favor seleccione un Año');
            }
        });
    });

    $('.view-reporte-viatico').each(function () {
        $(this).click(function () {
            if ($('#comboAnioViatico').val() !== "-1") {
                parameters = "report=reporte_viaticos";
                parameters += "&format=" + $(this).attr('format');
                parameters += "&anho=" + $('#comboAnioViatico').val();
                openReport(parameters);
            } else {
                viewAlertWeb('warning', 'Por favor seleccione un Año');
            }
        });
    });
    $('.combo-paginarOrden').on('change', function () {
        if ($(this).attr('tipo') === "2") {
            procesarAjaxMesOrdenesServicios();
        }
        if ($(this).attr('tipo') === "1") {
            procesarAjaxMesOrdenesCompra();
        }
        if ($(this).attr('tipo') === "3") {
            procesarAjaxMesTelefonia();
        }
        if ($(this).attr('tipo') === "4") {
            procesarAjaxMesVehiculo();
        }
        if ($(this).attr('tipo') === "5") {
            procesarAjaxMesViatico();
        }
        $("#" + $(this).attr('idBtnBuscar')).trigger("click");
    });

    $('.AnioOrdenTipo').each(function (index, value) {
        $(this).click(function () {
            if ($(this).attr('tipo') === "2") {
                procesarAjaxAnhosOrdenesServicios();
            }
            if ($(this).attr('tipo') === "1") {
                procesarAjaxAnhosOrdenesCompra();
            }
            if ($(this).attr('tipo') === "3") {
                procesarAjaxAnhosPublicidad();
            }
            if ($(this).attr('tipo') === "4") {
                procesarAjaxAnhosPenalidad();
            }
            if ($(this).attr('tipo') === "5") {
                procesarAjaxAnhosTelefonia();
            }
            if ($(this).attr('tipo') === "6") {
                procesarAjaxAnhosVehiculo();
            }
            if ($(this).attr('tipo') === "7") {
                procesarAjaxAnhosProveedor();
            }
            if ($(this).attr('tipo') === "8") {
                procesarAjaxAnhosViatico();
            }
        });
    });

    addEventoCombosPaginar();
    //processAjaxDataAdquisiciones();

});

function procesarAjaxAnhosProveedor() {
    var datosSerializadosCompletos = "action=listarAnhosProveedor";
    $.ajax({
        url: getContext() + '/gestiontransparente/adquisiciones-y-contrataciones',
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        success: function (jsonResponse) {
            listarAnhosProveedor(jsonResponse.BEAN_PAGINATION);
        },
        error: function () {
            console.log('Error interno en el servidor!');
        }
    });

//    }
    return false;
}
function listarAnhosProveedor(BEAN_PAGINATION) {
    $('#comboAnioProveedor').empty();
    if (BEAN_PAGINATION.COUNT_FILTER > 0) {
        var option;
        $.each(BEAN_PAGINATION.LIST, function (index, value) {
            option = "<option value='" + value.anho + "'>" + value.anho + "</option>";
            $('#comboAnioProveedor').append(option);
        });
        cargarTrimestreComboActuales($('#comboAnioProveedor').val(), $('#comboMesesProveedor'));
        processAjaxProveedor();
    } else {
        console.log("vacio");
    }
}

function procesarAjaxAnhosVehiculo() {
    var datosSerializadosCompletos = "action=listarAnhosVehiculo";
    $.ajax({
        url: getContext() + '/gestiontransparente/adquisiciones-y-contrataciones',
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        success: function (jsonResponse) {
            listarAnhosVehiculo(jsonResponse.BEAN_PAGINATION);
        },
        error: function () {
            console.log('Error interno en el servidor!');
        }
    });

//    }
    return false;
}
function listarAnhosVehiculo(BEAN_PAGINATION) {
    $('#comboAnioVehiculo').empty();
    if (BEAN_PAGINATION.COUNT_FILTER > 0) {
        var option;
        $.each(BEAN_PAGINATION.LIST, function (index, value) {
            option = "<option value='" + value.anho + "'>" + value.anho + "</option>";
            $('#comboAnioVehiculo').append(option);
        });
        procesarAjaxMesVehiculo();
    } else {
        console.log("vacio");
    }
}

function procesarAjaxMesVehiculo() {
    var datosSerializadosCompletos = "action=listarMesVehiculo";
    datosSerializadosCompletos += "&anho=" + $('#comboAnioVehiculo').val().toString();
    $.ajax({
        url: getContext() + '/gestiontransparente/adquisiciones-y-contrataciones',
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        success: function (jsonResponse) {
            listarMesVehiculo(jsonResponse.BEAN_PAGINATION);
        },
        error: function () {
            console.log('Error interno en el servidor!');
        }
    });

//    }
    return false;
}
function listarMesVehiculo(BEAN_PAGINATION) {
    $('#comboMesesVehiculo').empty();
    if (BEAN_PAGINATION.COUNT_FILTER > 0) {
        var option;
        var mes;
        $.each(BEAN_PAGINATION.LIST, function (index, value) {
            mes = traerNombreMes(value.mes);
            option = "<option value='" + value.mes + "'>" + mes + "</option>";
            $('#comboMesesVehiculo').append(option);
        });
        processAjaxVehiculo();
    } else {
        console.log("vacio");
    }
}


function procesarAjaxAnhosTelefonia() {
    var datosSerializadosCompletos = "action=listarAnhosTelefonia";
    $.ajax({
        url: getContext() + '/gestiontransparente/adquisiciones-y-contrataciones',
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        success: function (jsonResponse) {
            listarAnhosTelefonia(jsonResponse.BEAN_PAGINATION);
        },
        error: function () {
            console.log('Error interno en el servidor!');
        }
    });

//    }
    return false;
}
function listarAnhosTelefonia(BEAN_PAGINATION) {
    $('#comboAnioTelefonia').empty();
    if (BEAN_PAGINATION.COUNT_FILTER > 0) {
        var option;
        $.each(BEAN_PAGINATION.LIST, function (index, value) {
            option = "<option value='" + value.anho + "'>" + value.anho + "</option>";
            $('#comboAnioTelefonia').append(option);
        });
        procesarAjaxMesTelefonia();
    } else {
        console.log("vacio");
    }
}

function procesarAjaxMesTelefonia() {
    var datosSerializadosCompletos = "action=listarMesTelefonia";
    datosSerializadosCompletos += "&anho=" + $('#comboAnioTelefonia').val().toString();
    $.ajax({
        url: getContext() + '/gestiontransparente/adquisiciones-y-contrataciones',
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        success: function (jsonResponse) {
            listarMesTelefonia(jsonResponse.BEAN_PAGINATION);
        },
        error: function () {
            console.log('Error interno en el servidor!');
        }
    });

//    }
    return false;
}
function listarMesTelefonia(BEAN_PAGINATION) {
    $('#comboMesesTelefonia').empty();
    if (BEAN_PAGINATION.COUNT_FILTER > 0) {
        var option;
        var mes;
        $.each(BEAN_PAGINATION.LIST, function (index, value) {
            mes = traerNombreMes(value.mes);
            option = "<option value='" + value.mes + "'>" + mes + "</option>";
            $('#comboMesesTelefonia').append(option);
        });
        processAjaxTelefonia();
    } else {
        console.log("vacio");
    }
}



function procesarAjaxAnhosPublicidad() {
    var datosSerializadosCompletos = "action=listarAnhosPublicidad";
    $.ajax({
        url: getContext() + '/gestiontransparente/adquisiciones-y-contrataciones',
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        success: function (jsonResponse) {
            listarAnhosPublicidad(jsonResponse.BEAN_PAGINATION);
        },
        error: function () {
            console.log('Error interno en el servidor!');
        }
    });

//    }
    return false;
}
function listarAnhosPublicidad(BEAN_PAGINATION) {
    $('#comboAnioPublicidad').empty();
    if (BEAN_PAGINATION.COUNT_FILTER > 0) {
        var option;
        $.each(BEAN_PAGINATION.LIST, function (index, value) {
            option = "<option value='" + value.anho + "'>" + value.anho + "</option>";
            $('#comboAnioPublicidad').append(option);
        });
        processAjaxPublicidad();
    } else {
        console.log("vacio");
    }
}

function procesarAjaxAnhosOrdenesServicios() {
    var datosSerializadosCompletos = "action=listarAnhosOS";
    $.ajax({
        url: getContext() + '/gestiontransparente/adquisiciones-y-contrataciones',
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        success: function (jsonResponse) {
            listarAnhosOrdenesServicios(jsonResponse.BEAN_PAGINATION);
        },
        error: function () {
            console.log('Error interno en el servidor!');
        }
    });

//    }
    return false;
}
function listarAnhosOrdenesServicios(BEAN_PAGINATION) {
    $('#comboAnioOrdenServicio').empty();
    if (BEAN_PAGINATION.COUNT_FILTER > 0) {
        var option;
        $.each(BEAN_PAGINATION.LIST, function (index, value) {
            option = "<option value='" + value.anho + "'>" + value.anho + "</option>";
            $('#comboAnioOrdenServicio').append(option);
        });
        procesarAjaxMesOrdenesServicios();
    } else {
        console.log("vacio");
    }
}

function procesarAjaxMesOrdenesServicios() {
    var datosSerializadosCompletos = "action=listarMesOS";
    datosSerializadosCompletos += "&anho=" + $('#comboAnioOrdenServicio').val().toString();
    $.ajax({
        url: getContext() + '/gestiontransparente/adquisiciones-y-contrataciones',
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        success: function (jsonResponse) {
            listarMesOrdenesServicios(jsonResponse.BEAN_PAGINATION);
        },
        error: function () {
            console.log('Error interno en el servidor!');
        }
    });

//    }
    return false;
}
function listarMesOrdenesServicios(BEAN_PAGINATION) {
    $('#comboMesesOrdenServicio').empty();
    if (BEAN_PAGINATION.COUNT_FILTER > 0) {
        var option;
        var mes;
        $.each(BEAN_PAGINATION.LIST, function (index, value) {
            mes = traerNombreMes(value.mes);
            option = "<option value='" + value.mes + "'>" + mes + "</option>";
            $('#comboMesesOrdenServicio').append(option);
        });
        processAjaxOrdenServicio();
    } else {
        console.log("vacio");
    }
}

function procesarAjaxAnhosOrdenesCompra() {
    var datosSerializadosCompletos = "action=listarAnhosOC";
    $.ajax({
        url: getContext() + '/gestiontransparente/adquisiciones-y-contrataciones',
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        success: function (jsonResponse) {
            listarAnhosOrdenesCompra(jsonResponse.BEAN_PAGINATION);
        },
        error: function () {
            console.log('Error interno en el servidor!');
        }
    });

//    }
    return false;
}
function listarAnhosOrdenesCompra(BEAN_PAGINATION) {
    $('#comboAnioOrdenCompra').empty();
    if (BEAN_PAGINATION.COUNT_FILTER > 0) {
        var option;
        $.each(BEAN_PAGINATION.LIST, function (index, value) {
            option = "<option value='" + value.anho + "'>" + value.anho + "</option>";
            $('#comboAnioOrdenCompra').append(option);
        });
        procesarAjaxMesOrdenesCompra();
    } else {
        console.log("vacio");
    }
}

function procesarAjaxMesOrdenesCompra() {
    var datosSerializadosCompletos = "action=listarMesOC";
    datosSerializadosCompletos += "&anho=" + $('#comboAnioOrdenCompra').val().toString();
    $.ajax({
        url: getContext() + '/gestiontransparente/adquisiciones-y-contrataciones',
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        success: function (jsonResponse) {
            listarMesOrdenesCompra(jsonResponse.BEAN_PAGINATION);
        },
        error: function () {
            console.log('Error interno en el servidor!');
        }
    });

//    }
    return false;
}
function listarMesOrdenesCompra(BEAN_PAGINATION) {
    $('#comboMesesOrdenCompra').empty();
    if (BEAN_PAGINATION.COUNT_FILTER > 0) {
        var option;
        var mes;
        $.each(BEAN_PAGINATION.LIST, function (index, value) {
            mes = traerNombreMes(value.mes);
            option = "<option value='" + value.mes + "'>" + mes + "</option>";
            $('#comboMesesOrdenCompra').append(option);
        });
        processAjaxOrdenCompra();
    } else {
        console.log("vacio");
    }
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
        case "2 ":
            mes = "Febrero";
            break;
        case "3 ":
            mes = "Marzo";
            break;
        case "4 ":
            mes = "Abril";
            break;
        case "5 ":
            mes = "Mayo";
            break;
        case "6 ":
            mes = "Junio";
            break;
        case "7 ":
            mes = "Julio";
            break;
        case "8 ":
            mes = "Agosto";
            break;
        case "9 ":
            mes = "Setiembre";
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
            if (value.nro_siaf !== undefined) {
                siaf = value.nro_siaf;
            } else {
                siaf = "";
            }
            tr = "<tr>";
            tr += "<td class='text-center'>" + value.orden_compra + "</td>";
            tr += "<td class='text-center'>" + siaf + "</td>";
            tr += "<td class='text-center'>" + value.fecha_compra + "</td>";
            tr += "<td>" + value.fuente_financiamiento + "</td>";
            tr += "<td>" + value.proveedor + "</td>";
            tr += "<td class='text-center'>" + value.monto.toFixed(2) + "</td>";
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
        //viewAlertWeb('warning', 'No se encontraron resultados');
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
            if (value.nro_siaf !== undefined) {
                siaf = value.nro_siaf;
            } else {
                siaf = "";
            }
            tr = "<tr>";
            tr += "<td class='text-center'>" + value.orden_servicio + "</td>";
            tr += "<td class='text-center'>" + siaf + "</td>";
            tr += "<td class='text-center'>" + value.fecha_compra + "</td>";
            tr += "<td>" + value.fuente_financiamiento + "</td>";
            tr += "<td>" + value.proveedor + "</td>";
            tr += "<td class='text-center'>" + value.monto.toFixed(2) + "</td>";
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
        //viewAlertWeb('warning', 'No se encontraron resultados');
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
            tr += "<td class='text-medium-table text-center'>" + value.importe.toFixed(2) + "</td>";
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
