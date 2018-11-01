$(document).ready(function () {
    $("#FrmConsulta").submit(function () {
        if (validarCamposConsultaWeb()) {
            $('#action').val("addConsulta");
            $('#loader_consulta').css('display', 'block');
            procesarAjaxConsultaWeb();
        }
        return false;
    });

});

function procesarAjaxConsultaWeb() {
    var datosSerializadosCompletos = $('#FrmConsulta').serialize();
    $.ajax({
        url: getContext() + '/consultas/consultas-y-sugerencias',
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        success: function (jsonResponse) {
            $('#loader_consulta').css('display', 'none');
            if (jsonResponse.MESSAGE_SERVER.toLowerCase() === "ok") {
                $('#FrmConsulta input').val("");
                $('#FrmConsulta textarea').val("");
                $('#FrmConsulta select').val("-1");
                viewAlertWeb('success', "Mensaje Enviado");
            }
        },
        error: function () {
            $('#loader_consulta').css('display', 'none');
            /*MOSTRAMOS MENSAJE ERROR SERVIDOR*/
        }
    });
    return false;
}

function validarCamposConsultaWeb() {
    if ($('#txtInteresado').val() === "") {
        viewAlertWeb('warning', "Falta Nombres y Apellidos");
        return false;
    } else {
        if ($('#txtEmail').val() === "") {
            viewAlertWeb('warning', "Falta Correo Electrónico");
            return false;
        } else {
            if ($('#txtTema').val() === "") {
                viewAlertWeb('warning', "Falta Tema");
                return false;
            } else {
                if ($('#txtMensaje').val() === "") {
                    viewAlertWeb('warning', "Falta Mensaje");
                    return false;
                } else {
                    return true;
                }
            }
        }
    }
}