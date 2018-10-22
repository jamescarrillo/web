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


