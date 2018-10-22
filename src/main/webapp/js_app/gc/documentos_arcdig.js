$(document).ready(function () {

    cargarAniosCombo($('#comboAnioDocumentosArcDig'), 2010, "-1", 'Año');
    $('#btnAbrirNuevoDocumento').click(function () {
        $('#txtTituloResumenDocumentosArcDig').val("");
        $('#comboAnioDocumentosArcDig').val("-1");
        $('#sizePageDocumentosArcDig').val("10");
        $('#actionDocumentos').val("addDocumento");
        $('#txtTituloModalDocumentosArcDig').html("GESTIÓN DE DOCUMENTOS");
        $('#ventanaDocumentosArcDig').modal("show");
        document.getElementsByTagName("body")[0].style.paddingRight = "0";
    });


});

function procesarAjaxEtiquetas() {
    var datosSerializadosCompletos = $('#' + $('#nameForm').val()).serialize();
    datosSerializadosCompletos += "&numberPageDocumentos=" + $('#numberPageDocumentos').val();
    datosSerializadosCompletos += "&sizePageDocumentos=" + $('#sizePageDocumentos').val();
    datosSerializadosCompletos += "&action=" + $('#actionDocumentos').val();
    $.ajax({
        url: getContext() + '/documentos/arcdig',
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        success: function (jsonResponse) {
            console.log(jsonResponse);
            $('#modalCargandoDocumentos').modal("hide");
            listarDocumentos(jsonResponse.BEAN_PAGINATION);
        },
        error: function () {
            $('#modalCargandoDocumentos').modal("hide");
            $("#ventanaManDocumento").modal("hide");
            /*MOSTRAMOS MENSAJE ERROR SERVIDOR*/
            viewAlert('error', 'Error interno en el servidor!');
        }
    });
    return false;
}

function procesarAjaxDocumentosArcDig() {
    var datosSerializadosCompletos = $('#' + $('#nameForm').val()).serialize();
    datosSerializadosCompletos += "&numberPageDocumentos=" + $('#numberPageDocumentos').val();
    datosSerializadosCompletos += "&sizePageDocumentos=" + $('#sizePageDocumentos').val();
    datosSerializadosCompletos += "&action=" + $('#actionDocumentos').val();
    $.ajax({
        url: getContext() + '/documentos/arcdig',
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        success: function (jsonResponse) {
            console.log(jsonResponse);
            $('#modalCargandoDocumentos').modal("hide");
            listarDocumentos(jsonResponse.BEAN_PAGINATION);
        },
        error: function () {
            $('#modalCargandoDocumentos').modal("hide");
            $("#ventanaManDocumento").modal("hide");
            /*MOSTRAMOS MENSAJE ERROR SERVIDOR*/
            viewAlert('error', 'Error interno en el servidor!');
        }
    });
    return false;
}
