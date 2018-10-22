$(document).ready(function () {

    cargarAniosCombo($('#comboAnio'), 2000, "-1", 'TODOS');
    
    $("#FrmPenalidad").submit(function () {
        $("#nameForm").val("FrmPenalidad");
        $("#numberPagePenalidad").val(1);
        $('#actionPenalidad').val("paginarPenalidad");
        $('#modalCargandoPenalidad').modal("show");
        return false;
    });

    $("#FrmPenalidadModal").submit(function () {
        if (validarFormularioPenalidad()) {
            $("#numberPagePenalidad").val(1);
            $("#nameForm").val("FrmPenalidadModal");
            $('#modalCargandoPenalidad').modal("show");
            //viewAlert('warning', 'Estamos trabajando!');
        }
        return false;
    });

    $("#modalCargandoPenalidad").on('shown.bs.modal', function () {
        //DESPUES DE TERMINAR DE MOSTRAR EL MODAL
        procesarAjaxPenalidad();
    });

    $("#ventanaManPenalidad").on('hidden.bs.modal', function () {
        $("#actionPenalidad").val("paginarPenalidad");
    });

    $('#btnAbrirNuevoPenalidad').click(function () {
        $('#FrmPenalidadModal input').val("");
        $('#FrmPenalidadModal textarea').val("");
        $('#FrmPenalidadModal select').val("-1");
        $('#FrmPenalidadModal input').parent().removeClass("has-danger");
        $('#FrmPenalidadModal select').parent().removeClass("has-danger");
        $('#actionPenalidad').val("addPenalidad");
        $('#txtTituloModalManPenalidad').html("REGISTRAR PENALIDAD");
        $('#ventanaManPenalidad').modal("show");
        document.getElementsByTagName("body")[0].style.paddingRight = "0";
    });

    addEventoCombosPaginar();
    valicacionesCamposPenalidad();
    $('#modalCargandoPenalidad').modal("show");

});

function procesarAjaxPenalidad() {
    var datosSerializadosCompletos = $('#' + $('#nameForm').val()).serialize();
    if ($('#nameForm').val().toLowerCase() !== "frmpenalidad") {
        //AGREGAMOS LOS PARAMETROS DEL FORMULARIO DE BUSQUEDA
        datosSerializadosCompletos += "&txtPenalidad=" + $('#txtPenalidad').val();
        datosSerializadosCompletos += "&comboAnio=" + $('#comboAnio').val();
        datosSerializadosCompletos += "&comboTipoListaPenalidad=" + $('#comboTipoListaPenalidad').val();
    }
    datosSerializadosCompletos += "&numberPagePenalidad=" + $('#numberPagePenalidad').val();
    datosSerializadosCompletos += "&sizePagePenalidad=" + $('#sizePagePenalidad').val();
    datosSerializadosCompletos += "&action=" + $('#actionPenalidad').val();
    console.log(datosSerializadosCompletos);
    $.ajax({
        url: getContext() + '/convocatorias/penalidades',
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        success: function (jsonResponse) {
            console.log(jsonResponse);
            $('#modalCargandoPenalidad').modal("hide");
            if ($('#actionPenalidad').val().toLowerCase() === "paginarpenalidad") {
                listarPenalidad(jsonResponse.BEAN_PAGINATION);
            } else {
                if (jsonResponse.MESSAGE_SERVER.toLowerCase() === "ok") {
                    viewAlert('success', getMessageServerTransaction($('#actionPenalidad').val(), 'Penalidad', 'a'));
                    listarPenalidad(jsonResponse.BEAN_PAGINATION);
                } else {
                    viewAlert('warning', jsonResponse.MESSAGE_SERVER);
                }
            }
            $("#ventanaManPenalidad").modal("hide");
        },
        error: function () {
            $('#modalCargandoPenalidad').modal("hide");
            $("#ventanaManPenalidad").modal("hide");
            /*MOSTRAMOS MENSAJE ERROR SERVIDOR*/
            viewAlert('error', 'Error interno en el servidor!');
        }
    });
    return false;
}

function listarPenalidad(BEAN_PAGINATION) {
    /*PAGINATION*/
    var $pagination = $('#paginationPenalidad');
    $('#tbodyPenalidad').empty();
    if (BEAN_PAGINATION.COUNT_FILTER > 0) {
        var fila;
        $.each(BEAN_PAGINATION.LIST, function (index, value) {

            fila = "<tr ";
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
            fila += ">";
            fila += "<td class='text-center align-middle' class='text-small-table'>" + value.monto_contrato + "</td>";
            fila += "<td class='align-middle' class='text-small-table'>" + value.contratista + "</td>";
            fila += "<td class='align-middle' class='text-small-table'>" + value.ruc + "</td>";
            //fila += "<td class='align-middle' class='text-small-table'>" + value.objeto + "</td>";
            fila += "<td class='align-middle' class='text-small-table'>" + value.tipo + "</td>";
            fila += "<td class='align-middle' class='text-small-table'>" + value.monto_penalidad + "</td>";
            fila += "<td class='align-middle '><button class='btn btn-secondary btn-sm editar-Penalidad'><i class='fas fa-edit'></i></button></td>";
            fila += "<td class='align-middle'><button class='btn btn-secondary btn-sm eliminar-Penalidad'><i class='fas fa-trash-alt'></i></button></td>";
            fila += "</tr>";
            $('#tbodyPenalidad').append(fila);
        });
        var defaultOptions = getDefaultOptionsPagination();
        var options = getOptionsPagination(BEAN_PAGINATION.COUNT_FILTER, $('#sizePagePenalidad'),
                $('#numberPagePenalidad'), $('#actionPenalidad'), 'paginarPenalidad',
                $('#nameForm'), 'FrmPenalidad', $('#modalCargandoPenalidad'));
        $pagination.twbsPagination('destroy');
        $pagination.twbsPagination($.extend({}, defaultOptions, options));
        agregarEventosPenalidad();
        $('#txtNombrePenalidad').focus();
    } else {
        $pagination.twbsPagination('destroy');
        viewAlert('warning', 'No se enconntraron resultados');
    }
}

function agregarEventosPenalidad() {
    $('.editar-Penalidad').each(function () {
        $(this).click(function () {
            $('#txtIdER').val($(this.parentElement.parentElement).attr('id'));
            $('#txtAnhoER').val($(this.parentElement.parentElement).attr('anho'));
            $('#txtContratistaER').val($(this.parentElement.parentElement).attr('contratista'));
            $('#txtRucER').val($(this.parentElement.parentElement).attr('ruc'));
            $('#txtObjetoER').val($(this.parentElement.parentElement).attr('objeto'));
            $('#txtNumeroProcesoER').val($(this.parentElement.parentElement).attr('nro_proceso'));
            $('#txtNumeroContratoER').val($(this.parentElement.parentElement).attr('nro_contrato'));
            $('#txtTipoER').val($(this.parentElement.parentElement).attr('tipo'));
            $('#txtMontoContratoER').val($(this.parentElement.parentElement).attr('monto_contrato'));
            $('#txtMontoPenalidadER').val($(this.parentElement.parentElement).attr('monto_penalidad'));
            $('#actionPenalidad').val('updatePenalidad');
            $('#txtTituloModalManPenalidad').html("EDITAR PENALIDAD");
            $('#ventanaManPenalidad').modal("show");
            document.getElementsByTagName("body")[0].style.paddingRight = "0";
        });
    });
    $('.eliminar-Penalidad').each(function () {
        $(this).click(function () {
            $('#txtIdER').val($(this.parentElement.parentElement).attr('id'));
            viewAlertDelete("Penalidad");
            document.getElementsByTagName("body")[0].style.paddingRight = "0";
        });
    });
}

function valicacionesCamposPenalidad() {
    $('#txtContratistaER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtRucER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtMontoContratoER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtAnhoER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtObjetoER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtNumeroProcesoER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtNumeroContratoER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtTipoER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtMontoPenalidadER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
}

function validarFormularioPenalidad() {
    if ($('#txtContratistaER').val() === "") {
        $($('#txtContratistaER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtRucER').val() === "") {
        $($('#txtRucER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtMontoContratoER').val() === "") {
        $($('#txtMontoContratoER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtAnhoER').val() === "") {
        $($('#txtAnhoER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtObjetoER').val() === "") {
        $($('#txtObjetoER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtNumeroProcesoER').val() === "") {
        $($('#txtNumeroProcesoER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtNumeroContratoER').val() === "") {
        $($('#txtNumeroContratoER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtTipoER').val() === "") {
        $($('#txtTipoER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtMontoPenalidadER').val() === "") {
        $($('#txtMontoPenalidadER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    return true;
}


