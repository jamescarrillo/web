$(document).ready(function () {

    cargarAniosCombo($('#comboAnioDocumento'), 2005, "-1", 'Año');

    $("#FrmDocumentos").submit(function () {
        $('#tbodyDocumentos').empty();
        $('#numberPageDocumentos').val("1");
        $('#actionDocumentos').val("paginarDocumentos");
        $('#loader_contenido').css('display', 'block');
        procesarAjaxDocumentosWeb();
        return false;
    });

    addEventoCombosPaginar();
    procesarAjaxDocumentosWeb();

});

function procesarAjaxDocumentosWeb() {
    var datosSerializadosCompletos = $('#' + $('#nameForm').val()).serialize();
    $.ajax({
        url: getContext() + '/documentos/operacionesweb',
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        success: function (jsonResponse) {
            $('#loader_contenido').css('display', 'none');
            listarDocumentos(jsonResponse.BEAN_PAGINATION);
        },
        error: function () {
            /*MOSTRAMOS MENSAJE ERROR SERVIDOR*/
            $('#loader_contenido').css('display', 'none');
            viewAlertWeb('error', 'Error interno en el servidor!');
        }
    });
    return false;
}

function listarDocumentos(BEAN_PAGINATION) {
    /*PAGINATION*/
    var $pagination = $('#paginationDocumentos');
    $('#tbodyDocumentos').empty();
    if (BEAN_PAGINATION.COUNT_FILTER > 0) {
        var fila;
        var cadenaFecha;
        var color_fila;
        var fecha;
        var a;
        $.each(BEAN_PAGINATION.LIST, function (index, value) {
            if (value.docu_resumen.toLowerCase() !== "encargo interno.") {
                color_fila = "";
                a = "<a href='http://lib.peam.gob.pe:8081/ArcDig/OriArc.pdf?id=" + value.docu_id + "' target='_blank' class='pdf-documento-web' title='Ver PDF'><i class='fa fa-file-pdf-o'></i></a>";
            } else {
                color_fila = "bg-danger";
                a = "<a class='pdf-documento-web' title='PDF Restringido'><i class='fa fa-lock'></i></a>";
            }
            cadenaFecha = value.docu_fecha_docx.split('/');
            if (cadenaFecha.length === 3) {
                fecha = value.docu_fecha_docx;
            }else{
                fecha = "";
            }
            fila = "<tr class='" + color_fila + "' ";
            /*
            fila += "docu_id='" + value.docu_id + "' ";
            fila += "usa_public_id='" + value.usa_public_id + "' ";
            fila += "docu_descripcion='" + value.docu_descripcion + "' ";
            fila += "docu_titulo='" + value.docu_titulo + "' ";
            fila += "docu_resumen='" + value.docu_resumen + "' ";
            fila += "docu_origen_archivo='" + value.docu_origen_archivo + "' ";
            fila += "tipo_id='" + value.tipo_id + "' ";
            fila += "docu_estado='" + value.docu_estado + "' ";
            fila += "docu_activo='" + value.docu_activo + "' ";
            fila += "docu_fecha_docx='" + value.docu_fecha_docx + "' ";
            fila += "cate_id='" + value.cate_id + "' ";
            fila += "docu_metadata='" + value.docu_metadata + "' ";
            */
            fila += ">";
            fila += "<td class='text-center align-middle'>" + fecha + "</td>";
            fila += "<td class='align-middle'>" + value.docu_titulo + "</td>";
            fila += "<td class='align-middle'>" + value.docu_resumen + "</td>";
            fila += "<td class='text-center align-middle'>" + a + "</td>";
            fila += "</tr>";
            $('#tbodyDocumentos').append(fila);
        });
        var defaultOptions = getDefaultOptionsPagination();
        var totalPages = getTotalPages(BEAN_PAGINATION.COUNT_FILTER, parseInt($('#sizePageDocumentos').val()));
        var options =
                {
                    startPage: parseInt($('#numberPageDocumentos').val()),
                    totalPages: totalPages,
                    visiblePages: 5,
                    initiateStartPageClick: false,
                    first: "<i class='fa fa-angle-double-left' aria-hidden='true'></i>",
                    prev: "<i class='fa fa-angle-left' aria-hidden='true'></i>",
                    next: "<i class='fa fa-angle-right' aria-hidden='true'></i>",
                    last: "<i class='fa fa-angle-double-right' aria-hidden='true'></i>",
                    onPageClick: function (evt, page) {
                        $('#actionDocumentos').val('paginarDocumentos');
                        $('#numberPageDocumentos').val(page);
                        $('#nameForm').val('FrmDocumentos');
                        $('#loader_contenido').css('display', 'block');
                        procesarAjaxDocumentosWeb();
                    }
                };
        $pagination.twbsPagination('destroy');
        $pagination.twbsPagination($.extend({}, defaultOptions, options));
        $('#txtTituloDocumento').focus();
    } else {
        $pagination.twbsPagination('destroy');
        viewAlertWeb('warning', 'No se enconntraron resultados');
    }
}