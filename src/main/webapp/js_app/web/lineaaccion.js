$(document).ready(function () {

    $("#FrmDirectorio").submit(function () {
        $('#tbodyDirectorio').empty();
        $('#numberPageDirectorio').val("1");
        $('#actionDirectorio').val("paginarDirectorio");
        $('#loader_contenido_Directorio').css('display', 'block');
        procesarAjaxDirectorioWeb();
        return false;
    });

    $("#FrmFuncionario").submit(function () {
        $('#tbodyFuncionario').empty();
        $('#numberPageFuncionario').val("1");
        $('#actionFuncionario').val("paginarFuncionario");
        $('#loader_contenido_Funcionario').css('display', 'block');
        procesarAjaxDirectorioWeb();
        return false;
    });

    addEventoCombosPaginar();
    procesarAjaxDirectorioWeb();

});

function procesarAjaxObrasWeb() {
    var datosSerializadosCompletos = $('#' + $('#nameFormDirectorio').val()).serialize();
    $.ajax({
        url: getContext() + '/lineas-de-accion/operaciones',
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        success: function (jsonResponse) {
            $('#loader_contenido_Directorio').css('display', 'none');
        },
        error: function () {
            $('#loader_contenido_Directorio').css('display', 'none');
        }
    });
    return false;
}