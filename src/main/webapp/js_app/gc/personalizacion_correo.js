$(document).ready(function () {

    $("#FrmCorreo").submit(function () {
        if (validarFormularioCorreo()) {
            $("#nameForm").val("FrmCorreo");
            $('#actionCorreo').val("guardarPersonalizacionCorreo");
            $('#modalCargandoCorreo').modal("show");
        }
        return false;
    });


    $("#modalCargandoCorreo").on('shown.bs.modal', function () {
        //DESPUES DE TERMINAR DE MOSTRAR EL MODAL
        procesarAjaxCorreo();
    });


    valicacionesCamposCorreo();
    $('#modalCargandoCorreo').modal("show");

});

function procesarAjaxCorreo() {
    var datosSerializadosCompletos = $('#FrmCorreo').serialize();
    datosSerializadosCompletos += "&action=" + $('#actionCorreo').val();
    $.ajax({
        url: getContext() + '/personalizacion/correo',
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        success: function (jsonResponse) {
            $('#modalCargandoCorreo').modal("hide");
            if ($('#actionCorreo').val().toLowerCase() === "paginarcorreo") {
                listarCorreo(jsonResponse.BEAN_PAGINATION);
            } else {
                if (jsonResponse.MESSAGE_SERVER.toLowerCase() === "ok") {
                    viewAlert('success', "Correo Guardado Correctamente");
                    listarCorreo(jsonResponse.BEAN_PAGINATION);
                } else {
                    viewAlert('warning', jsonResponse.MESSAGE_SERVER);
                }
            }
        },
        error: function () {
            $('#modalCargandoCorreo').modal("hide");
            /*MOSTRAMOS MENSAJE ERROR SERVIDOR*/
            viewAlert('error', 'Error interno en el servidor!');
        }
    });
    return false;
}

function listarCorreo(BEAN_PAGINATION) {
    $.each(BEAN_PAGINATION.LIST, function (index, value) {
        $('#txtIdER').val(value.id);
        $('#txtParaER').val(value.para_correo);
        $('#txtCC_CorreoER').val(value.cc_correo);
        $('#txtDeParteER').val(value.parte_correo);
        $('#txtMensajeER').val(value.mensaje_correo);
        var est=value.estado;
        $('#comboEstadoER').val(est.toLocaleString());
    });
}

function valicacionesCamposCorreo() {
    $('#txtParaER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtCC_CorreoER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtDeParteER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtMensajeER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#comboEstadoER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
}

function validarFormularioCorreo() {
    if ($('#txtParaER').val() === "") {
        $($('#txtParaER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtCC_CorreoER').val() === "") {
        $($('#txtCC_CorreoER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtDeParteER').val() === "") {
        $($('#txtDeParteER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtMensajeER').val() === "") {
        $($('#txtMensajeER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#comboEstadoER').val() === "-1") {
        $($('#comboEstadoER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    return true;
}
