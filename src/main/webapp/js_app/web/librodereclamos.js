$(document).ready(function () {
    $("#FrmReclamo").submit(function () {
        if (validarCamposReclamoWeb()) {
            $('#action').val("addReclamo");
            $('#loader_reclamo').css('display', 'block');
            procesarAjaxReclamoWeb();
        }
        return false;
    });

});

function procesarAjaxReclamoWeb() {
    var datosSerializadosCompletos = $('#FrmReclamo').serialize();
    $.ajax({
        url: getContext() + '/consultas/libro-de-reclamaciones',
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        success: function (jsonResponse) {
            $('#loader_reclamo').css('display', 'none');
            if (jsonResponse.MESSAGE_SERVER.toLowerCase() === "ok") {
                $('#FrmReclamo input').val("");
                $('#FrmReclamo textarea').val("");
                $('#FrmReclamo select').val("-1");
                viewAlertWeb('success', "Mensaje Enviado");
            }
        },
        error: function () {
            $('#loader_reclamo').css('display', 'none');
            /*MOSTRAMOS MENSAJE ERROR SERVIDOR*/
        }
    });
    return false;
}

function validarCamposReclamoWeb() {
    if ($('#txtInteresado').val() === "") {
        viewAlertWeb('warning', "Falta Nombres y Apellidos");
        return false;
    } else {
        if ($('#txtEmail').val() === "") {
            viewAlertWeb('warning', "Falta Correo Electrónico");
            return false;
        } else {
            if ($('#comboTipoDocumento').val() === "-1") {
                viewAlertWeb('warning', "Falta escoger Tipo de Documento");
                return false;
            } else {
                if ($('#txtNroDocumento').val() === "") {
                    viewAlertWeb('warning', "Falta el Numero de Documento");
                    return false;
                } else {
                    if ($('#txtTelefono').val() === "") {
                        viewAlertWeb('warning', "Falta Telefono");
                        return false;
                    } else {
                        if ($('#txtDomicilio').val() === "") {
                            viewAlertWeb('warning', "Falta Direccion");
                            return false;
                        } else {
                            if ($('#txtMensaje').val() === "") {
                                viewAlertWeb('warning', "Falta Reclamo");
                                return false;
                            } else {
                                return true;
                            }
                        }
                    }
                }
            }
        }
    }
}


