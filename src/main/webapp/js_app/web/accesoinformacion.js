$(document).ready(function () {
    $("#FrmSolicitud").submit(function () {
        if (validarCamposSolicitudWeb()) {
            $('#action').val("addSolicitud");
            $('#loader_reclamo').css('display', 'block');
            procesarAjaxSolicitudWeb();
        }
        return false;
    });

});

function procesarAjaxSolicitudWeb() {
    var datosSerializadosCompletos = $('#FrmSolicitud').serialize();
    $.ajax({
        url: getContext() + '/consultas/acceso-informacion',
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        success: function (jsonResponse) {
            $('#loader_reclamo').css('display', 'none');
            if (jsonResponse.MESSAGE_SERVER.toLowerCase() === "ok") {
                $('#FrmSolicitud input').val("");
                $('#FrmSolicitud textarea').val("");
                $('#FrmSolicitud select').val("-1");
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

function validarCamposSolicitudWeb() {
    if ($('#txtInteresado').val() === "") {
        viewAlertWeb('warning', "Faltan Datos");
        return false;
    } else {
        if ($('#txtNroDocumento').val() === "") {
            viewAlertWeb('warning', "Falta Numero del Documento");
            return false;
        } else {
            if ($('#txtDomicilio').val() === "") {
                viewAlertWeb('warning', "Falta Dirección");
                return false;
            } else {
                if ($('#txtTelefono').val() === "") {
                    viewAlertWeb('warning', "Falta Teléfono");
                    return false;
                } else {
                    if ($('#txtEmail').val() === "") {
                        viewAlertWeb('warning', "Falta Correo Electrónico");
                        return false;
                    } else {
                        if ($('#comboTipoFormato').val() === "-1") {
                            viewAlertWeb('warning', "Escoge un Tipo de Entrega");
                            return false;
                        } else {
                            if ($('#txtDependencia').val() === "") {
                                viewAlertWeb('warning', "Falta Dependencia de la cual requiere la información");
                                return false;
                            } else {
                                if ($('#txtMensaje').val() === "") {
                                    viewAlertWeb('warning', "Falta Solicitud");
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
}