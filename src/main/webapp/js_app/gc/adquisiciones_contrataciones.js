$(document).ready(function () {

    $('.cbo-meses').append("<option value='1'>ENERO</option>");
    $('.cbo-meses').append("<option value='2'>FEBRERO</option>");
    $('.cbo-meses').append("<option value='3'>MARZO</option>");
    $('.cbo-meses').append("<option value='4'>ABRIL</option>");
    $('.cbo-meses').append("<option value='5'>MAYO</option>");
    $('.cbo-meses').append("<option value='6'>JUNIO</option>");
    $('.cbo-meses').append("<option value='7'>JULIO</option>");
    $('.cbo-meses').append("<option value='8'>AGOSTO</option>");
    $('.cbo-meses').append("<option value='9'>SEPTIEMBRE</option>");
    $('.cbo-meses').append("<option value='10'>OCTUBRE</option>");
    $('.cbo-meses').append("<option value='11'>NOVIEMBRE</option>");
    $('.cbo-meses').append("<option value='12'>DICIEMBRE</option>");

    cargarAniosCombo($('#comboAnioOrdenCompra'), 2007, "-1", "AÑO");
    cargarAniosCombo($('#comboAnioOrdenServicio'), 2007, "-1", "AÑO");
    cargarAniosCombo($('#comboAnioPublicidad'), 2007, "-1", "AÑO");
    cargarAniosCombo($('#comboAnioTelefonia'), 2007, "-1", "AÑO");
    cargarAniosCombo($('#comboAnioVehiculo'), 2007, "-1", "AÑO");
    cargarAniosCombo($('#comboAnioProveedor'), 2007, "-1", "AÑO");

    $('.input-date').datepicker({
        format: 'dd/mm/yyyy',
        todayHighlight: true,
        autoclose: true
    });

    $('.btn-abrir-modal').click(function () {
        $('.input-text').parent().removeClass('has-danger');
        $('.input-text').val("");
        $('.input-select').parent().removeClass('has-danger');
        $('.input-select').val("-1");
        $('#' + $(this).attr('idaccion')).val($(this).attr("value_accion"));
        $('#' + $(this).attr('idmodal')).modal('show');
    });

    $("#FrmOrdenCompra").submit(function () {
        $("#nameFormOrdenCompra").val("FrmOrdenCompra");
        $("#numberPageOrdenCompra").val(1);
        $('#actionOrdenCompra').val("paginarOrdenCompra");
        $('#modalCargandoOrdenCompra').modal("show");
        return false;
    });

    $("#FrmOrdenServicio").submit(function () {
        $("#nameFormOrdenServicio").val("FrmOrdenServicio");
        $("#numberPageOrdenServicio").val(1);
        $('#actionOrdenServicio').val("paginarOrdenServicio");
        $('#modalCargandoOrdenServicio').modal("show");
        return false;
    });

    $("#FrmPublicidad").submit(function () {
        $("#nameFormPublicidad").val("FrmPublicidad");
        $("#numberPagePublicidad").val(1);
        $('#actionPublicidad').val("paginarPublicidad");
        $('#modalCargandoPublicidad').modal("show");
        return false;
    });

    $("#FrmTelefonia").submit(function () {
        $("#nameFormTelefonia").val("FrmTelefonia");
        $("#numberPageTelefonia").val(1);
        $('#actionTelefonia').val("paginarTelefonia");
        $('#modalCargandoTelefonia').modal("show");
        return false;
    });

    $("#FrmVehiculo").submit(function () {
        $("#nameFormVehiculo").val("FrmVehiculo");
        $("#numberPageVehiculo").val(1);
        $('#actionVehiculo').val("paginarVehiculo");
        $('#modalCargandoVehiculo').modal("show");
        return false;
    });

    $("#FrmProveedor").submit(function () {
        $("#nameFormProveedor").val("FrmProveedor");
        $("#numberPageProveedor").val(1);
        $('#actionProveedor').val("paginarProveedor");
        $('#modalCargandoProveedor').modal("show");
        return false;
    });

    $("#FrmOrdenCompraModal").submit(function () {
        if (validarFormularioOrdenCompra()) {
            $("#numberPageOrdenCompra").val(1);
            $("#nameFormOrdenCompra").val("FrmOrdenCompraModal");
            $('#modalCargandoOrdenCompra').modal("show");
        }
        return false;
    });

    $("#FrmOrdenServicioModal").submit(function () {
        if (validarFormularioOrdenServicio()) {
            $("#numberPageOrdenServicio").val(1);
            $("#nameFormOrdenServicio").val("FrmOrdenServicioModal");
            $('#modalCargandoOrdenServicio').modal("show");
        }
        return false;
    });

    $("#FrmPublicidadModal").submit(function () {
        if (validarFormularioPublicidad()) {
            $("#numberPagePublicacion").val(1);
            $("#nameFormPublicidad").val("FrmPublicidadModal");
            $('#modalCargandoPublicidad').modal("show");
        }
        return false;
    });

    $("#FrmTelefoniaModal").submit(function () {
        if (validarFormularioTelefonia()) {
            $("#numberPageTelefonia").val(1);
            $("#nameFormTelefonia").val("FrmTelefoniaModal");
            $('#modalCargandoTelefonia').modal("show");
        }
        return false;
    });

    $("#FrmVehiculoModal").submit(function () {
        if (validarFormularioVehiculo()) {
            $("#numberPageVehiculo").val(1);
            $("#nameFormVehiculo").val("FrmVehiculoModal");
            $('#modalCargandoVehiculo').modal("show");
        }
        return false;
    });

    $("#FrmProveedorModal").submit(function () {
        if (validarFormularioProveedor()) {
            $("#numberPageProveedor").val(1);
            $("#nameFormProveedor").val("FrmProveedorModal");
            $('#modalCargandoProveedor').modal("show");
        }
        return false;
    });

    $("#modalCargandoOrdenCompra").on('shown.bs.modal', function () {
        processAjaxOrdenCompra();
    });

    $("#modalCargandoOrdenServicio").on('shown.bs.modal', function () {
        processAjaxOrdenServicio();
    });

    $("#modalCargandoPublicidad").on('shown.bs.modal', function () {
        processAjaxPublicidad();
    });

    $("#modalCargandoTelefonia").on('shown.bs.modal', function () {
        processAjaxTelefonia();
    });

    $("#modalCargandoVehiculo").on('shown.bs.modal', function () {
        processAjaxVehiculo();
    });
    
    $("#modalCargandoProveedor").on('shown.bs.modal', function () {
        processAjaxProveedor();
    });

    addEventoCombosPaginar();

    $('.input-text').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });

    $('.input-select').on('change', function () {
        $(this).val() === "-1" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });

    $("#modalCargandoOrdenCompra").modal("show");
    processAjaxOrdenServicio();
    processAjaxPublicidad();
    processAjaxTelefonia();
    processAjaxVehiculo();
    processAjaxProveedor();

});


function processAjaxOrdenCompra() {
    var datosSerializadosCompletos = $('#' + $('#nameFormOrdenCompra').val()).serialize();
    if ($('#nameFormOrdenCompra').val().toLowerCase() !== "frmordencompra") {
        datosSerializadosCompletos += "&txtProveedorOrdenCompra=";
        datosSerializadosCompletos += "&comboAnioOrdenCompra=" + $('#comboAnioOrdenCompra').val();
    }
    datosSerializadosCompletos += "&action=" + $('#actionOrdenCompra').val();
    datosSerializadosCompletos += "&numberPageOrdenCompra=" + $('#numberPageOrdenCompra').val();
    datosSerializadosCompletos += "&sizePageOrdenCompra=" + $('#sizePageOrdenCompra').val();
    $.ajax({
        url: getContext() + '/gestiontransparente/adquisiciones',
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        success: function (jsonResponse) {
            $('#modalCargandoOrdenCompra').modal("hide");
            if (jsonResponse.BEAN_PAGINATION !== undefined) {
                listarOrdenCompra(jsonResponse.BEAN_PAGINATION);
            }
            if (jsonResponse.MESSAGE_SERVER !== undefined) {
                if (jsonResponse.MESSAGE_SERVER.toLowerCase() === "ok") {
                    $("#ventanaManOrdenCompra").modal("hide");
                    viewAlert('success', getMessageServerTransaction($('#actionOrdenCompra').val(), 'Orden de Compra', 'a'));
                    listarOrdenCompra(jsonResponse.BEAN_PAGINATION);
                } else {
                    viewAlert('warning', jsonResponse.MESSAGE_SERVER);
                }
            }
        },
        error: function () {
            $('#modalCargandoOrdenCompra').modal("hide");
            $("#ventanaManOrdenCompra").modal("hide");
            viewAlert('error', 'Error interno en el servidor!');
        }
    });
    return false;
}

function listarOrdenCompra(BEAN_PAGINATION) {
    var $pagination = $('#paginationOrdenCompra');
    $('#tbodyOrdenCompra').empty();
    if (BEAN_PAGINATION.COUNT_FILTER > 0) {
        var tr;
        $(BEAN_PAGINATION.LIST).each(function (index, value) {
            tr = "<tr>";
            tr += "<td>" + value.orden_compra + "</td>";
            tr += "<td>" + value.fecha_compra + "</td>";
            tr += "<td>" + value.fuente_financiamiento + "</td>";
            tr += "<td>" + value.proveedor + "</td>";
            tr += "<td>" + value.financiamiento + "</td>";
            tr += "<td>" + value.monto + "</td>";
            tr += "<td>" + value.nro_siaf + "</td>";
            tr += "<td><button id='" + value.id + "' class='eliminar-orden-compra btn btn-outline-secondary btn-sm' title='Eliminar Orden de Compra'><i class='fas fa-trash-alt'></i></button></td>";
            tr += "</tr>";
            $('#tbodyOrdenCompra').append(tr);
        });
        /*EVENTOS ELIMINAR*/
        $('.eliminar-orden-compra').each(function (index, value) {
            $(this).click(function () {
                $('#nameFormOrdenCompra').val("FrmOrdenCompraModal");
                $('#txtIdOrdenCompraER').val($(this).attr("id"));
                viewAlertDelete('OrdenCompra');
            });
        });
        /*PAGINACION*/
        var defaultOptions = getDefaultOptionsPagination();
        var options = getOptionsPagination(BEAN_PAGINATION.COUNT_FILTER, $('#sizePageOrdenCompra'),
                $('#numberPageOrdenCompra'), $('#actionOrdenCompra'), 'paginarOrdenCompra',
                $('#nameFormOrdenCompra'), 'FrmOrdenCompra', $('#modalCargandoOrdenCompra'));
        $pagination.twbsPagination('destroy');
        $pagination.twbsPagination($.extend({}, defaultOptions, options));
        $('#txtProveedorOrdenCompra').focus();
    } else {
        $pagination.twbsPagination('destroy');
        viewAlert('warning', 'No se encontraron resultados');
    }
}

function processAjaxOrdenServicio() {
    var datosSerializadosCompletos = $('#' + $('#nameFormOrdenServicio').val()).serialize();
    if ($('#nameFormOrdenServicio').val().toLowerCase() !== "frmordenservicio") {
        datosSerializadosCompletos += "&txtProveedorOrdenServicio=";
        datosSerializadosCompletos += "&comboAnioOrdenServicio=" + $('#comboAnioOrdenServicio').val();
    }
    datosSerializadosCompletos += "&action=" + $('#actionOrdenServicio').val();
    datosSerializadosCompletos += "&numberPageOrdenServicio=" + $('#numberPageOrdenServicio').val();
    datosSerializadosCompletos += "&sizePageOrdenServicio=" + $('#sizePageOrdenServicio').val();
    $.ajax({
        url: getContext() + '/gestiontransparente/adquisiciones',
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        success: function (jsonResponse) {
            $('#modalCargandoOrdenServicio').modal("hide");
            if (jsonResponse.BEAN_PAGINATION !== undefined) {
                listarOrdenServicio(jsonResponse.BEAN_PAGINATION);
            }
            if (jsonResponse.MESSAGE_SERVER !== undefined) {
                if (jsonResponse.MESSAGE_SERVER.toLowerCase() === "ok") {
                    $("#ventanaManOrdenServicio").modal("hide");
                    viewAlert('success', getMessageServerTransaction($('#actionOrdenServicio').val(), 'Orden de Servicio', 'o'));
                    listarOrdenServicio(jsonResponse.BEAN_PAGINATION);
                } else {
                    viewAlert('warning', jsonResponse.MESSAGE_SERVER);
                }
            }
        },
        error: function () {
            $('#modalCargandoOrdenServicio').modal("hide");
            $("#ventanaManOrdenServicio").modal("hide");
            viewAlert('error', 'Error interno en el servidor!');
        }
    });
    return false;
}

function listarOrdenServicio(BEAN_PAGINATION) {
    var $pagination = $('#paginationOrdenServicio');
    $('#tbodyOrdenServicio').empty();
    if (BEAN_PAGINATION.COUNT_FILTER > 0) {
        var tr;
        $(BEAN_PAGINATION.LIST).each(function (index, value) {
            tr = "<tr>";
            tr += "<td>" + value.orden_servicio + "</td>";
            tr += "<td>" + value.fecha_compra + "</td>";
            tr += "<td>" + value.fuente_financiamiento + "</td>";
            tr += "<td>" + value.proveedor + "</td>";
            tr += "<td>" + value.financiamiento + "</td>";
            tr += "<td>" + value.monto + "</td>";
            tr += "<td>" + value.nro_siaf + "</td>";
            tr += "<td><button id='" + value.id + "' class='eliminar-orden-servicio btn btn-outline-secondary btn-sm' title='Eliminar Orden de Servicio'><i class='fas fa-trash-alt'></i></button></td>";
            tr += "</tr>";
            $('#tbodyOrdenServicio').append(tr);
        });
        /*EVENTOS ELIMINAR*/
        $('.eliminar-orden-servicio').each(function (index, value) {
            $(this).click(function () {
                $('#nameFormOrdenServicio').val("FrmOrdenServicioModal");
                $('#txtIdOrdenServicioER').val($(this).attr("id"));
                viewAlertDelete('OrdenServicio');
            });
        });
        /*PAGINACION*/
        var defaultOptions = getDefaultOptionsPagination();
        var options = getOptionsPagination(BEAN_PAGINATION.COUNT_FILTER, $('#sizePageOrdenServicio'),
                $('#numberPageOrdenServicio'), $('#actionOrdenServicio'), 'paginarOrdenServicio',
                $('#nameFormOrdenServicio'), 'FrmOrdenServicio', $('#modalCargandoOrdenServicio'));
        $pagination.twbsPagination('destroy');
        $pagination.twbsPagination($.extend({}, defaultOptions, options));
        $('#txtProveedorOrdenServicio').focus();
    } else {
        $pagination.twbsPagination('destroy');
        viewAlert('warning', 'No se encontraron resultados');
    }
}

function processAjaxPublicidad() {
    var datosSerializadosCompletos = $('#' + $('#nameFormPublicidad').val()).serialize();
    if ($('#nameFormPublicidad').val().toLowerCase() !== "frmpublicidad") {
        datosSerializadosCompletos += "&txtProveedorPublicidad=";
        datosSerializadosCompletos += "&comboAnioPublicidad=" + $('#comboAnioPublicidad').val();
    }
    datosSerializadosCompletos += "&action=" + $('#actionPublicidad').val();
    datosSerializadosCompletos += "&numberPagePublicidad=" + $('#numberPagePublicidad').val();
    datosSerializadosCompletos += "&sizePagePublicidad=" + $('#sizePagePublicidad').val();
    $.ajax({
        url: getContext() + '/gestiontransparente/adquisiciones',
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        success: function (jsonResponse) {
            $('#modalCargandoPublicidad').modal("hide");
            if (jsonResponse.BEAN_PAGINATION !== undefined) {
                listarPublicidad(jsonResponse.BEAN_PAGINATION);
            }
            if (jsonResponse.MESSAGE_SERVER !== undefined) {
                if (jsonResponse.MESSAGE_SERVER.toLowerCase() === "ok") {
                    $("#ventanaManPublicidad").modal("hide");
                    viewAlert('success', getMessageServerTransaction($('#actionPublicidad').val(), 'Publicidad', 'a'));
                    listarPublicidad(jsonResponse.BEAN_PAGINATION);
                } else {
                    viewAlert('warning', jsonResponse.MESSAGE_SERVER);
                }
            }
        },
        error: function () {
            $('#modalCargandoPublicidad').modal("hide");
            $("#ventanaManPublicidad").modal("hide");
            viewAlert('error', 'Error interno en el servidor!');
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
            tr += "<td>" + value.fuente_financiamiento + "</td>";
            tr += "<td>" + contrato + "</td>";
            tr += "<td>" + value.objeto_contrato + "</td>";
            tr += "<td>" + value.ruc + "</td>";
            tr += "<td>" + value.proveedor + "</td>";
            tr += "<td>" + value.penalidad + "</td>";
            tr += "<td>" + value.monto_contrato + "</td>";
            tr += "<td><button id='" + value.id + "' class='eliminar-publicidad btn btn-outline-secondary btn-sm' title='Eliminar Publicidad'><i class='fas fa-trash-alt'></i></button></td>";
            tr += "</tr>";
            $('#tbodyPublicidad').append(tr);
        });
        /*EVENTOS ELIMINAR*/
        $('.eliminar-publicidad').each(function (index, value) {
            $(this).click(function () {
                $('#nameFormPublicidad').val("FrmPublicidadModal");
                $('#txtIdPublicidadER').val($(this).attr("id"));
                viewAlertDelete('Publicidad');
            });
        });
        /*PAGINACION*/
        var defaultOptions = getDefaultOptionsPagination();
        var options = getOptionsPagination(BEAN_PAGINATION.COUNT_FILTER, $('#sizePagePublicidad'),
                $('#numberPagePublicidad'), $('#actionPublicidad'), 'paginarPublicidad',
                $('#nameFormPublicidad'), 'FrmPublicidad', $('#modalCargandoPublicidad'));
        $pagination.twbsPagination('destroy');
        $pagination.twbsPagination($.extend({}, defaultOptions, options));
        $('#txtProveedorPublicidad').focus();
    } else {
        $pagination.twbsPagination('destroy');
        viewAlert('warning', 'No se encontraron resultados');
    }
}

function processAjaxTelefonia() {
    var datosSerializadosCompletos = $('#' + $('#nameFormTelefonia').val()).serialize();
    if ($('#nameFormTelefonia').val().toLowerCase() !== "frmtelefonia") {
        datosSerializadosCompletos += "&txtAreaTelefonia=";
        datosSerializadosCompletos += "&comboAnioTelefonia=" + $('#comboAnioTelefonia').val();
    }
    datosSerializadosCompletos += "&action=" + $('#actionTelefonia').val();
    datosSerializadosCompletos += "&numberPageTelefonia=" + $('#numberPageTelefonia').val();
    datosSerializadosCompletos += "&sizePageTelefonia=" + $('#sizePageTelefonia').val();
    $.ajax({
        url: getContext() + '/gestiontransparente/adquisiciones',
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        success: function (jsonResponse) {
            $('#modalCargandoTelefonia').modal("hide");
            if (jsonResponse.BEAN_PAGINATION !== undefined) {
                listarTelefonia(jsonResponse.BEAN_PAGINATION);
            }
            if (jsonResponse.MESSAGE_SERVER !== undefined) {
                if (jsonResponse.MESSAGE_SERVER.toLowerCase() === "ok") {
                    $("#ventanaManTelefonia").modal("hide");
                    viewAlert('success', getMessageServerTransaction($('#actionTelefonia').val(), 'Telefonia', 'a'));
                    listarTelefonia(jsonResponse.BEAN_PAGINATION);
                } else {
                    viewAlert('warning', jsonResponse.MESSAGE_SERVER);
                }
            }
        },
        error: function () {
            $('#modalCargandoTelefonia').modal("hide");
            $("#ventanaManTelefonia").modal("hide");
            viewAlert('error', 'Error interno en el servidor!');
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
            tr += "<td>" + value.tipo + "</td>";
            tr += "<td>" + value.numero + "</td>";
            tr += "<td>" + value.area_oficina + "</td>";
            tr += "<td>" + value.asignado_a + "</td>";
            tr += "<td>" + value.cargo_actividad + "</td>";
            tr += "<td>" + value.importe + "</td>";
            tr += "<td><button id='" + value.id + "' class='eliminar-telefonia btn btn-outline-secondary btn-sm' title='Eliminar Telefonía'><i class='fas fa-trash-alt'></i></button></td>";
            tr += "</tr>";
            $('#tbodyTelefonia').append(tr);
        });
        /*EVENTOS ELIMINAR*/
        $('.eliminar-telefonia').each(function (index, value) {
            $(this).click(function () {
                $('#nameFormTelefonia').val("FrmTelefoniaModal");
                $('#txtIdTelefoniaER').val($(this).attr("id"));
                viewAlertDelete('Telefonia');
            });
        });
        /*PAGINACION*/
        var defaultOptions = getDefaultOptionsPagination();
        var options = getOptionsPagination(BEAN_PAGINATION.COUNT_FILTER, $('#sizePageTelefonia'),
                $('#numberPageTelefonia'), $('#actionTelefonia'), 'paginarTelefonia',
                $('#nameFormTelefonia'), 'FrmTelefonia', $('#modalCargandoTelefonia'));
        $pagination.twbsPagination('destroy');
        $pagination.twbsPagination($.extend({}, defaultOptions, options));
        $('#txtAreaTelefonia').focus();
    } else {
        $pagination.twbsPagination('destroy');
        viewAlert('warning', 'No se encontraron resultados');
    }
}

function processAjaxVehiculo() {
    var datosSerializadosCompletos = $('#' + $('#nameFormVehiculo').val()).serialize();
    if ($('#nameFormVehiculo').val().toLowerCase() !== "frmvehiculo") {
        datosSerializadosCompletos += "&txtAreaVehiculo=";
        datosSerializadosCompletos += "&comboAnioVehiculo=" + $('#comboAnioVehiculo').val();
    }
    datosSerializadosCompletos += "&action=" + $('#actionVehiculo').val();
    datosSerializadosCompletos += "&numberPageVehiculo=" + $('#numberPageVehiculo').val();
    datosSerializadosCompletos += "&sizePageVehiculo=" + $('#sizePageVehiculo').val();
    $.ajax({
        url: getContext() + '/gestiontransparente/adquisiciones',
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        success: function (jsonResponse) {
            $('#modalCargandoVehiculo').modal("hide");
            if (jsonResponse.BEAN_PAGINATION !== undefined) {
                listarVehiculo(jsonResponse.BEAN_PAGINATION);
            }
            if (jsonResponse.MESSAGE_SERVER !== undefined) {
                if (jsonResponse.MESSAGE_SERVER.toLowerCase() === "ok") {
                    $("#ventanaManVehiculo").modal("hide");
                    viewAlert('success', getMessageServerTransaction($('#actionVehiculo').val(), 'Vehículo', 'o'));
                    listarVehiculo(jsonResponse.BEAN_PAGINATION);
                } else {
                    viewAlert('warning', jsonResponse.MESSAGE_SERVER);
                }
            }
        },
        error: function () {
            $('#modalCargandoVehiculo').modal("hide");
            $("#ventanaManVehiculo").modal("hide");
            viewAlert('error', 'Error interno en el servidor!');
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
            tr += "<td class='text-medium-table'>" + value.tipo_clase + "</td>";
            tr += "<td class='text-medium-table'>" + value.clase_vehiculo + "</td>";
            tr += "<td class='text-medium-table'>" + value.placa + "</td>";
            tr += "<td class='text-medium-table'>" + soat + "</td>";
            tr += "<td class='text-medium-table'>" + value.asignado_a + "</td>";
            tr += "<td class='text-medium-table'>" + value.recorrido_km + "</td>";
            tr += "<td class='text-medium-table'>" + value.tipo_combustible + "</td>";
            tr += "<td class='text-medium-table'>" + value.costo_combustible + "</td>";
            tr += "<td ><button id='" + value.id + "' class='eliminar-vehiculo btn btn-outline-secondary btn-sm' title='Eliminar Vehículo'><i class='fas fa-trash-alt'></i></button></td>";
            tr += "</tr>";
            $('#tbodyVehiculo').append(tr);
        });
        /*EVENTOS ELIMINAR*/
        $('.eliminar-vehiculo').each(function (index, value) {
            $(this).click(function () {
                $('#nameFormVehiculo').val("FrmVehiculoModal");
                $('#txtIdVehiculoER').val($(this).attr("id"));
                viewAlertDelete('Vehiculo');
            });
        });
        /*PAGINACION*/
        var defaultOptions = getDefaultOptionsPagination();
        var options = getOptionsPagination(BEAN_PAGINATION.COUNT_FILTER, $('#sizePageVehiculo'),
                $('#numberPageVehiculo'), $('#actionVehiculo'), 'paginarVehiculo',
                $('#nameFormVehiculo'), 'FrmVehiculo', $('#modalCargandoVehiculo'));
        $pagination.twbsPagination('destroy');
        $pagination.twbsPagination($.extend({}, defaultOptions, options));
        $('#txtAreaVehiculo').focus();
    } else {
        $pagination.twbsPagination('destroy');
        viewAlert('warning', 'No se encontraron resultados');
    }
}

function processAjaxProveedor() {
    var datosSerializadosCompletos = $('#' + $('#nameFormProveedor').val()).serialize();
    if ($('#nameFormProveedor').val().toLowerCase() !== "frmproveedor") {
        datosSerializadosCompletos += "&txtProveedor=";
        datosSerializadosCompletos += "&comboAnioProveedor=" + $('#comboAnioProveedor').val();
    }
    datosSerializadosCompletos += "&action=" + $('#actionProveedor').val();
    datosSerializadosCompletos += "&numberPageProveedor=" + $('#numberPageProveedor').val();
    datosSerializadosCompletos += "&sizePageProveedor=" + $('#sizePageProveedor').val();
    $.ajax({
        url: getContext() + '/gestiontransparente/adquisiciones',
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        success: function (jsonResponse) {
            $('#modalCargandoProveedor').modal("hide");
            if (jsonResponse.BEAN_PAGINATION !== undefined) {
                listarProveedor(jsonResponse.BEAN_PAGINATION);
            }
            if (jsonResponse.MESSAGE_SERVER !== undefined) {
                if (jsonResponse.MESSAGE_SERVER.toLowerCase() === "ok") {
                    $("#ventanaManProveedor").modal("hide");
                    viewAlert('success', getMessageServerTransaction($('#actionProveedor').val(), 'Proveedor', 'o'));
                    listarProveedor(jsonResponse.BEAN_PAGINATION);
                } else {
                    viewAlert('warning', jsonResponse.MESSAGE_SERVER);
                }
            }
        },
        error: function () {
            $('#modalCargandoProveedor').modal("hide");
            $("#ventanaManProveedor").modal("hide");
            viewAlert('error', 'Error interno en el servidor!');
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
            tr += "<td class='text-medium-table'>" + value.ruc + "</td>";
            tr += "<td class='text-medium-table'>" + value.proveedor + "</td>";
            tr += "<td class='text-medium-table'>" + value.importe + "</td>";
            tr += "<td ><button id='" + value.id + "' class='eliminar-proveedor btn btn-outline-secondary btn-sm' title='Eliminar Proveedor'><i class='fas fa-trash-alt'></i></button></td>";
            tr += "</tr>";
            $('#tbodyProveedor').append(tr);
        });
        /*EVENTOS ELIMINAR*/
        $('.eliminar-proveedor').each(function (index, value) {
            $(this).click(function () {
                $('#nameFormProveedor').val("FrmProveedorModal");
                $('#txtIdProveedorER').val($(this).attr("id"));
                viewAlertDelete('Proveedor');
            });
        });
        /*PAGINACION*/
        var defaultOptions = getDefaultOptionsPagination();
        var options = getOptionsPagination(BEAN_PAGINATION.COUNT_FILTER, $('#sizePageProveedor'),
                $('#numberPageProveedor'), $('#actionProveedor'), 'paginarProveedor',
                $('#nameFormProveedor'), 'FrmProveedor', $('#modalCargandoProveedor'));
        $pagination.twbsPagination('destroy');
        $pagination.twbsPagination($.extend({}, defaultOptions, options));
        $('#txtProveedor').focus();
    } else {
        $pagination.twbsPagination('destroy');
        viewAlert('warning', 'No se encontraron resultados');
    }
}

function validarFormularioOrdenCompra() {
    if ($('#txtFechaOrdenCompraER').val() === "") {
        $($('#txtFechaOrdenCompraER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtOrdenCompraOrdenCompraER').val() === "") {
        $($('#txtOrdenCompraOrdenCompraER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtFuenteFinanciamientoOrdenCompraER').val() === "") {
        $($('#txtFuenteFinanciamientoOrdenCompraER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtProveedorOrdenCompraER').val() === "") {
        $($('#txtProveedorOrdenCompraER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtMontoOrdenCompraER').val() === "") {
        $($('#txtMontoOrdenCompraER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtFinanciamientoOrdenCompraER').val() === "") {
        $($('#txtFinanciamientoOrdenCompraER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtNSiafOrdenCompraER').val() === "") {
        $($('#txtNSiafOrdenCompraER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    return true;
}

function validarFormularioOrdenServicio() {
    if ($('#txtFechaOrdenServicioER').val() === "") {
        $($('#txtFechaOrdenServicioER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtOrdenServicioOrdenServicioER').val() === "") {
        $($('#txtOrdenServicioOrdenServicioER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtFuenteFinanciamientoOrdenServicioER').val() === "") {
        $($('#txtFuenteFinanciamientoOrdenServicioER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtProveedorOrdenServicioER').val() === "") {
        $($('#txtProveedorOrdenServicioER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtMontoOrdenServicioER').val() === "") {
        $($('#txtMontoOrdenServicioER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtFinanciamientoOrdenServicioER').val() === "") {
        $($('#txtFinanciamientoOrdenServicioER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtNSiafOrdenServicioER').val() === "") {
        $($('#txtNSiafOrdenServicioER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    return true;
}

function validarFormularioPublicidad() {
    if ($('#txtAnhoPublicidadER').val() === "") {
        $($('#txtAnhoPublicidadER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtBienesServiciosPublicidadER').val() === "") {
        $($('#txtBienesServiciosPublicidadER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtProcesoPublicidadER').val() === "") {
        $($('#txtProcesoPublicidadER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtContratoPublicidadER').val() === "") {
        $($('#txtContratoPublicidadER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtFuenteFinanciamientoPublicidadER').val() === "") {
        $($('#txtFuenteFinanciamientoPublicidadER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtObjetoContratoPublicidadER').val() === "") {
        $($('#txtObjetoContratoPublicidadER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtValorReferenciaPublicidadER').val() === "") {
        $($('#txtValorReferenciaPublicidadER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtRucPublicidadER').val() === "") {
        $($('#txtRucPublicidadER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtProveedorPublicidadER').val() === "") {
        $($('#txtProveedorPublicidadER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtNContratoPublicidadER').val() === "") {
        $($('#txtNContratoPublicidadER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtPenalidadPublicidadER').val() === "") {
        $($('#txtPenalidadPublicidadER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtCostoFinalPublicidadER').val() === "") {
        $($('#txtCostoFinalPublicidadER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
//    if ($('#txtObservacionesPublicidadER').val() === "") {
//        $($('#txtObservacionesPublicidadER').parent()).addClass('has-danger');
//        return false;
//    } else {
//        $(this.parentElement).removeClass('has-danger');
//    }
    return true;
}

function validarFormularioTelefonia() {
    if ($('#txtMesTelefoniaER').val() === "-1") {
        $($('#txtMesTelefoniaER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtAnhoTelefoniaER').val() === "") {
        $($('#txtAnhoTelefoniaER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtTipoTelefoniaER').val() === "") {
        $($('#txtTipoTelefoniaER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtNumeroTelefoniaER').val() === "") {
        $($('#txtNumeroTelefoniaER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtAreaOficinaTelefoniaER').val() === "") {
        $($('#txtAreaOficinaTelefoniaER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtAsignadoATelefoniaER').val() === "") {
        $($('#txtAsignadoATelefoniaER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtCargoActividadTelefoniaER').val() === "") {
        $($('#txtCargoActividadTelefoniaER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtImporteTelefoniaER').val() === "") {
        $($('#txtImporteTelefoniaER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    return true;
}

function validarFormularioVehiculo() {
    if ($('#txtMesVehiculoER').val() === "-1") {
        $($('#txtMesVehiculoER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtAnhoVehiculoER').val() === "") {
        $($('#txtAnhoVehiculoER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtTipoClaseVehiculoER').val() === "") {
        $($('#txtTipoClaseVehiculoER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtClaseVehiculoER').val() === "") {
        $($('#txtClaseVehiculoER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtTipoCombustibleVehiculoER').val() === "") {
        $($('#txtTipoCombustibleVehiculoER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtRecorridoKmVehiculoER').val() === "") {
        $($('#txtRecorridoKmVehiculoER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtAsignadoVehiculoER').val() === "") {
        $($('#txtAsignadoVehiculoER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtCargoActividadVehiculoER').val() === "") {
        $($('#txtCargoActividadVehiculoER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtCostoCombustibleVehiculoER').val() === "") {
        $($('#txtCostoCombustibleVehiculoER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtSoatFechaVencimientoVehiculoER').val() === "") {
        $($('#txtSoatFechaVencimientoVehiculoER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtPlacaVehiculoER').val() === "") {
        $($('#txtPlacaVehiculoER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    return true;
}

function validarFormularioProveedor() {
    if ($('#txtAnhoProveedorER').val() === "") {
        $($('#txtAnhoProveedorER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtTrimestreProveedorER').val() === "") {
        $($('#txtTrimestreProveedorER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtRucProveedorER').val() === "") {
        $($('#txtRucProveedorER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtProveedorER').val() === "") {
        $($('#txtProveedorER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtImporteProveedorER').val() === "") {
        $($('#txtImporteProveedorER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    return true;
}