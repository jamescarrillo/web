$(document).ready(function () {

    cargarAniosCombo($('#comboAnioPersonal'), 2007, "-1", 'AÑO');
    cargarAniosCombo($('#comboAnioPersonalCategoria'), 2007, "-1", 'AÑO');

    $('.input-date').datepicker({
        format: 'dd/mm/yyyy',
        todayHighlight: true,
        autoclose: true
    });
    
    $('#btnAbrirNPersonal').click(function () {
        $('.input-text').val("");
        $('.input-text').parent().removeClass('has-danger');
        $('.input-select').val("-1");
        $('.input-select').parent().removeClass('has-danger');
        $('#actionPersonal').val("addPersonal");
        $('#titleModalPersonal').html("REGISTRAR PERSONAL");
        $('#ventanaManPersonal').modal('show');
    });

    $('#btnAbrirNPersonalCategoria').click(function () {
        $('.input-text').val("");
        $('.input-text').parent().removeClass('has-danger');
        $('.input-select').val("-1");
        $('.input-select').parent().removeClass('has-danger');
        $('#actionPersonalCategoria').val("addPersonalCategoria");
        $('#titlePersonalCategoria').html("REGISTRAR PERSONAL POR CATEGORIA");
        $('#ventanaManPersonalCategoria').modal('show');
    });

    $("#FrmPersonal").submit(function () {
        $("#nameFormPersonal").val("FrmPersonal");
        $("#numberPagePersonal").val(1);
        $('#actionPersonal').val("paginarPersonal");
        $('#modalCargandoPersonal').modal("show");
        return false;
    });

    $("#FrmPersonalModal").submit(function () {
        if (validarFormularioPersonal()) {
            $("#numberPagePersonal").val(1);
            $("#nameFormPersonal").val("FrmPersonalModal");
            $('#modalCargandoPersonal').modal("show");
        }
        return false;
    });

    $("#FrmPersonalCategoria").submit(function () {
        $("#nameFormPersonalCategoria").val("FrmPersonalCategoria");
        $("#numberPagePersonalCategoria").val(1);
        $('#actionPersonalCategoria').val("paginarPersonalCategoria");
        $('#modalCargandoPersonalCategoria').modal("show");
        return false;
    });

    $("#FrmPersonalCategoriaModal").submit(function () {
        if (validarFormularioPersonalCategoria()) {
            $("#numberPagePersonalCategoria").val(1);
            $("#nameFormPersonalCategoria").val("FrmPersonalCategoriaModal");
            $('#modalCargandoPersonalCategoria').modal("show");
        }
        return false;
    });

    $("#modalCargandoPersonal").on('shown.bs.modal', function () {
        procesarAjaxPersonal();
    });

    $("#modalCargandoPersonalCategoria").on('shown.bs.modal', function () {

    });

    $('.input-text').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });

    $('.input-select').on('change', function () {
        $(this).val() === "-1" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });

    addEventoCombosPaginar();
    $("#modalCargandoPersonal").modal("show");

});

function procesarAjaxPersonal() {
    var datosSerializadosCompletos = $('#' + $('#nameFormPersonal').val()).serialize();
    if ($('#nameFormPersonal').val().toLowerCase() !== "frmpersonal") {
        datosSerializadosCompletos += "&txtPersonal=";
        datosSerializadosCompletos += "&comboAnioPersonal=" + $('#comboAnioPersonal').val();
        datosSerializadosCompletos += "&cboTipoPersonal=" + $('#cboTipoPersonal').val();
    }
    datosSerializadosCompletos += "&numberPagePersonal=" + $('#numberPagePersonal').val();
    datosSerializadosCompletos += "&sizePagePersonal=" + $('#sizePagePersonal').val();
    datosSerializadosCompletos += "&action=" + $('#actionPersonal').val();
    console.log(datosSerializadosCompletos);
    $.ajax({
        url: getContext() + '/gestiontransparente/personal',
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        success: function (jsonResponse) {
            $('#modalCargandoPersonal').modal("hide");
            if ($('#actionPersonal').val().toLowerCase() === "paginarpersonal") {
                listarPersonal(jsonResponse.BEAN_PAGINATION);
            } else {
                if (jsonResponse.MESSAGE_SERVER.toLowerCase() === "ok") {
                    $("#ventanaManPersonal").modal("hide");
                    viewAlert('success', getMessageServerTransaction($('#actionPersonal').val(), 'Personal', 'o'));
                    listarPersonal(jsonResponse.BEAN_PAGINATION);
                } else {
                    viewAlert('warning', jsonResponse.MESSAGE_SERVER);
                }
            }
        },
        error: function () {
            $('#modalCargandoPersonal').modal("hide");
            $("#ventanaManPersonal").modal("hide");
            viewAlert('error', 'Error interno en el servidor!');
        }
    });
    return false;
}

function listarPersonal(BEAN_PAGINATION) {
    /*PAGINATION*/
    var $pagination = $('#paginationPersonal');
    $('#tbodyPersonal').empty();
    if (BEAN_PAGINATION.COUNT_FILTER > 0) {
        var fila;
        var dni;
        var cargo;
        $.each(BEAN_PAGINATION.LIST, function (index, value) {
            fila = "<tr ";
            fila += "id='" + value.id + "' ";
            fila += ">";
            if (value.numero_dni !== undefined) {
                dni = value.numero_dni;
            } else {
                dni = "";
            }
            if (value.cargo !== undefined) {
                cargo = value.cargo;
            } else {
                cargo = "";
            }
            fila += "<td class='text-middle'>" + dni + "</td>";
            fila += "<td class='text-middle'>" + value.apellidos_nombres + "</td>";
            fila += "<td class='text-middle'>" + value.categoria + "</td>";
            fila += "<td class='text-middle'>" + cargo + "</td>";
            fila += "<td class='text-middle'>" + value.codigo_civil + "</td>";
            fila += "<td class='text-middle'>" + value.ingreso_total + "</td>";
            fila += "<td class='align-middle'><button class='btn btn-secondary btn-sm eliminar-personal'><i class='fas fa-trash-alt'></i></button></td>";
            fila += "</tr>";
            $('#tbodyPersonal').append(fila);
        });
        $('.eliminar-personal').each(function (index, value) {
            $(this).click(function () {
                $('#nameFormPersonal').val("FrmPersonalModal");
                $('#txtIdPersonalER').val($(this).attr("id"));
                viewAlertDelete('Personal');
            });
        });
        var defaultOptions = getDefaultOptionsPagination();
        var options = getOptionsPagination(BEAN_PAGINATION.COUNT_FILTER, $('#sizePagePersonal'),
                $('#numberPagePersonal'), $('#actionPersonal'), 'paginarPersonal',
                $('#nameFormPersonal'), 'FrmPersonal', $('#modalCargandoPersonal'));
        $pagination.twbsPagination('destroy');
        $pagination.twbsPagination($.extend({}, defaultOptions, options));
        $('#txtPersonal').focus();
    } else {
        $pagination.twbsPagination('destroy');
        viewAlert('warning', 'No se enconntraron resultados');
    }
}

function validarFormularioPersonal() {
    if ($('#cboTipoPersonalER').val() === "-1") {
        $($('#cboTipoPersonalER').parent()).addClass('has-danger');
        return false;
    } else {
        $($('#cboTipoPersonalER').parent()).removeClass('has-danger');
    }
    if ($('#txtAnhoPersonalER').val() === "") {
        $($('#txtAnhoPersonalER').parent()).addClass('has-danger');
        return false;
    } else {
        $($('#txtAnhoPersonalER').parent()).removeClass('has-danger');
    }
    if ($('#txtTrimestrePersonalER').val() === "") {
        $($('#txtTrimestrePersonalER').parent()).addClass('has-danger');
        return false;
    } else {
        $($('#txtTrimestrePersonalER').parent()).removeClass('has-danger');
    }
    if ($('#txtFechaIngresoPersonalER').val() === "") {
        $($('#txtFechaIngresoPersonalER').parent()).addClass('has-danger');
        return false;
    } else {
        $($('#txtFechaIngresoPersonalER').parent()).removeClass('has-danger');
    }
    if ($('#txtFechaSesePersonalER').val() === "") {
        $($('#txtFechaSesePersonalER').parent()).addClass('has-danger');
        return false;
    } else {
        $($('#txtFechaSesePersonalER').parent()).removeClass('has-danger');
    }
    if ($('#txtDniPersonal').val() === "") {
        $($('#txtDniPersonal').parent()).addClass('has-danger');
        return false;
    } else {
        $($('#txtDniPersonal').parent()).removeClass('has-danger');
    }
    if ($('#txtApellidosNombresPersonalER').val() === "") {
        $($('#txtApellidosNombresPersonalER').parent()).addClass('has-danger');
        return false;
    } else {
        $($('#txtApellidosNombresPersonalER').parent()).removeClass('has-danger');
    }
    if ($('#txtAreaDependenciaPersonalER').val() === "") {
        $($('#txtAreaDependenciaPersonalER').parent()).addClass('has-danger');
        return false;
    } else {
        $($('#txtAreaDependenciaPersonalER').parent()).removeClass('has-danger');
    }
    if ($('#txtCargoDependenciaPersonalER').val() === "") {
        $($('#txtCargoDependenciaPersonalER').parent()).addClass('has-danger');
        return false;
    } else {
        $($('#txtCargoDependenciaPersonalER').parent()).removeClass('has-danger');
    }
    if ($('#txtCategoriaPersonalER').val() === "") {
        $($('#txtCategoriaPersonalER').parent()).addClass('has-danger');
        return false;
    } else {
        $($('#txtCategoriaPersonalER').parent()).removeClass('has-danger');
    }
    if ($('#txtRegimenLaboralPersonalER').val() === "") {
        $($('#txtRegimenLaboralPersonalER').parent()).addClass('has-danger');
        return false;
    } else {
        $($('#txtRegimenLaboralPersonalER').parent()).removeClass('has-danger');
    }
    if ($('#txtPensionPersonalER').val() === "") {
        $($('#txtPensionPersonalER').parent()).addClass('has-danger');
        return false;
    } else {
        $($('#txtPensionPersonalER').parent()).removeClass('has-danger');
    }
    if ($('#txtRemuneracionHonorarioPersonalER').val() === "") {
        $($('#txtRemuneracionHonorarioPersonalER').parent()).addClass('has-danger');
        return false;
    } else {
        $($('#txtRemuneracionHonorarioPersonalER').parent()).removeClass('has-danger');
    }
    if ($('#txtOtrosIngresosER').val() === "") {
        $($('#txtOtrosIngresosER').parent()).addClass('has-danger');
        return false;
    } else {
        $($('#txtOtrosIngresosER').parent()).removeClass('has-danger');
    }
    if ($('#txtEscolaridadER').val() === "") {
        $($('#txtEscolaridadER').parent()).addClass('has-danger');
        return false;
    } else {
        $($('#txtEscolaridadER').parent()).removeClass('has-danger');
    }
    if ($('#txtIngresoTotalER').val() === "") {
        $($('#txtIngresoTotalER').parent()).addClass('has-danger');
        return false;
    } else {
        $($('#txtIngresoTotalER').parent()).removeClass('has-danger');
    }
    return true;
}

function validarFormularioPersonalCategoria() {
    if ($('#txtAnhoPersonalCategoriaER').val() === "") {
        $($('#txtAnhoPersonalCategoriaER').parent()).addClass('has-danger');
        return false;
    } else {
        $($('#txtAnhoPersonalCategoriaER').parent()).removeClass('has-danger');
    }
    if ($('#txtTrimestrePersonalCategoriaER').val() === "") {
        $($('#txtTrimestrePersonalCategoriaER').parent()).addClass('has-danger');
        return false;
    } else {
        $($('#txtTrimestrePersonalCategoriaER').parent()).removeClass('has-danger');
    }
    if ($('#txtCodigoPersonalCategoriaER').val() === "") {
        $($('#txtCodigoPersonalCategoriaER').parent()).addClass('has-danger');
        return false;
    } else {
        $($('#txtCodigoPersonalCategoriaER').parent()).removeClass('has-danger');
    }
    if ($('#txtCategoriaPersonalCategoriaER').val() === "") {
        $($('#txtCategoriaPersonalCategoriaER').parent()).addClass('has-danger');
        return false;
    } else {
        $($('#txtCategoriaPersonalCategoriaER').parent()).removeClass('has-danger');
    }
    if ($('#txtRMinimaPersonalCategoriaER').val() === "") {
        $($('#txtRMinimaPersonalCategoriaER').parent()).addClass('has-danger');
        return false;
    } else {
        $($('#txtRMinimaPersonalCategoriaER').parent()).removeClass('has-danger');
    }
    if ($('#txtRMaximaPersonalCategoriaER').val() === "") {
        $($('#txtRMaximaPersonalCategoriaER').parent()).addClass('has-danger');
        return false;
    } else {
        $($('#txtRMaximaPersonalCategoriaER').parent()).removeClass('has-danger');
    }
    if ($('#txtNTrabajadoresPersonalCategoriaER').val() === "") {
        $($('#txtNTrabajadoresPersonalCategoriaER').parent()).addClass('has-danger');
        return false;
    } else {
        $($('#txtNTrabajadoresPersonalCategoriaER').parent()).removeClass('has-danger');
    }
    return true;
}