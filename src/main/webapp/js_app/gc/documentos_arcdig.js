$(document).ready(function () {
   
    cargarAniosCombo($('#comboAnioDocumentosArcDig'), 2005, "-1", 'AÑO');

    $("#FrmDocumentosArcDig").submit(function () {
        $("#nameFormArcDig").val("FrmDocumentosArcDig");
        $("#numberPageDocumentosArcDig").val(1);
        $('#actionDocumentosArcDig').val("paginarDocumentosArcDig");
        $('#modalCargandoDocumentosArcDig').modal("show");
        return false;
    });

    $('#btnAbrirNuevoDocumento').click(function () {
        $('#tbodyDocumentosArcDig').empty();
        $('#txtTituloResumenDocumentosArcDig').val("");
        $('#comboAnioDocumentosArcDig').val("-1");
        $('#sizePageDocumentosArcDig').val("5");
        $('#nameFormArcDig').val("FrmDocumentosArcDig");
        $('#actionDocumentosArcDig').val("paginarDocumentosArcDig");
        $('#numberPageDocumentosArcDig').val("1");
        $('#txtTituloModalDocumentosArcDig').html("GESTIÓN DE DOCUMENTOS [ARCDIG]");
        $('#ventanaDocumentosArcDig').modal("show");
        $('#modalCargandoDocumentosArcDig').modal("show");
        document.getElementsByTagName("body")[0].style.paddingRight = "0";
    });

    $("#modalCargandoDocumentosArcDig").on('shown.bs.modal', function () {
        procesarAjaxDocumentosArcDig();
    });

    $("#modalCargandoDocumentos2").on('shown.bs.modal', function () {
        procesarAjaxDocumentosADD();
    });

    procesarAjaxEtiquetas();

    addEventoCombosPaginar();

});

function procesarAjaxEtiquetas() {
    var datosSerializadosCompletos = "action=paginarEtiquetas";
    $.ajax({
        url: getContext() + '/documentos/arcdig',
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        success: function (jsonResponse) {
            $('#modalCargandoDocumentosArcDig').modal("hide");
            $('#comboEtiquetasDocumentosArcDig').append("<option value='-1'>ETIQUETA</option>");
            $.each(jsonResponse.BEAN_PAGINATION.LIST, function (index, value) {
                $('#comboEtiquetasDocumentosArcDig').append("<option value='" + value.etiq_id + "'>" + value.etiq_nombre + "</option>");
            });
        },
        error: function () {
            $('#modalCargandoDocumentosArcDig').modal("hide");
            /*MOSTRAMOS MENSAJE ERROR SERVIDOR*/
            viewAlert('error', 'Error interno en el servidor!');
        }
    });
    return false;
}

function procesarAjaxDocumentosArcDig() {
    var datosSerializadosCompletos = $('#' + $('#nameFormArcDig').val()).serialize();
    datosSerializadosCompletos += "&numberPageDocumentosArcDig=" + $('#numberPageDocumentosArcDig').val();
    datosSerializadosCompletos += "&sizePageDocumentosArcDig=" + $('#sizePageDocumentosArcDig').val();
    datosSerializadosCompletos += "&txtTido=-1";
    datosSerializadosCompletos += "&action=" + $('#actionDocumentosArcDig').val();
    $.ajax({
        url: getContext() + '/documentos/arcdig',
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        success: function (jsonResponse) {
            $('#modalCargandoDocumentosArcDig').modal("hide");
            listarDocumentosArcDig(jsonResponse.BEAN_PAGINATION);
        },
        error: function () {
            $('#modalCargandoDocumentosArcDig').modal("hide");
            /*MOSTRAMOS MENSAJE ERROR SERVIDOR*/
            viewAlert('error', 'Error interno en el servidor/Puede que este documento ya exista y esta causando un error de clave primaria!');
        }
    });
    return false;
}

function listarDocumentosArcDig(BEAN_PAGINATION) {
    /*PAGINATION*/
    var $pagination = $('#paginationDocumentosArcDig');
    $('#tbodyDocumentosArcDig').empty();
    if (BEAN_PAGINATION.COUNT_FILTER > 0) {
        var fila;
        var text_color;
        $.each(BEAN_PAGINATION.LIST, function (index, value) {
            text_color = "";
            fila = "<tr ";
            fila += "docu_id='" + value.docu_id + "' ";
            fila += "usua_id='" + value.usua_id + "' ";
            fila += "docu_titulo='" + value.docu_titulo + "' ";
            fila += "docu_resumen='" + value.docu_resumen + "' ";
            fila += "docu_origen_archivo='" + value.docu_origen_archivo + "' ";
            fila += "docu_fecha_docx='" + value.docu_fecha_docx + "' ";
            fila += "tido_id='" + value.tido_id + "' ";
            fila += "cate_id='" + value.cate_id + "' ";
            fila += "docu_metadata='" + value.docu_metadata + "' ";
            fila += ">";
            fila += "<td class='align-middle text-small-table " + text_color + "'>" + value.docu_titulo + "</td>";
            fila += "<td class='align-middle text-small-table " + text_color + "'>" + value.docu_resumen + "</td>";
            fila += "<td class='align-middle text-small-table " + text_color + "'><button class='btn btn-secondary btn-sm seleccionar-documento' title='Seleccionar Documento'><i class='far fa-hand-point-up'></i></button></td>";
            fila += "</tr>";
            $('#tbodyDocumentosArcDig').append(fila);
        });
        var defaultOptions = getDefaultOptionsPagination();
        var options = getOptionsPagination(BEAN_PAGINATION.COUNT_FILTER, $('#sizePageDocumentosArcDig'),
                $('#numberPageDocumentosArcDig'), $('#actionDocumentosArcDig'), 'paginarDocumentosArcDig',
                $('#nameFormArcDig'), 'FrmDocumentosArcDig', $('#modalCargandoDocumentosArcDig'));
        $pagination.twbsPagination('destroy');
        $pagination.twbsPagination($.extend({}, defaultOptions, options));
        $('#txtTituloResumenDocumentosArcDig').focus();
        agregarEventosSeleccionarDocumentos();
    } else {
        $pagination.twbsPagination('destroy');
        viewAlert('warning', 'No se enconntraron resultados');
    }
}

function agregarEventosSeleccionarDocumentos() {
    var tr;
    $('.seleccionar-documento').each(function (index, value) {
        $(this).click(function () {
            tr = $(this.parentElement.parentElement);
            swal({
                title: 'PEAM',
                text: "¿Desea agregar este Documento?",
                type: 'warning',
                showCancelButton: true,
                confirmButtonText: 'Sí, continuar!',
                cancelButtonText: 'No, cancelar!',
                confirmButtonClass: 'btn btn-info',
                cancelButtonClass: 'btn btn-danger',
                buttonsStyling: false
            }).then((result) => {
                if (result.value) {
                    $('#txtIdDocumentoER').val($(tr).attr('docu_id'));
                    $('#txtUsuaPublicIdDocumentoER').val($(tr).attr('usua_id'));
                    $('#txtTituloDocumentoER').val($(tr).attr('docu_titulo'));
                    $('#txtResumenDocumentoER').val($(tr).attr('docu_resumen'));
                    $('#txtOrigenDocumentoER').val($(tr).attr('docu_origen_archivo'));
                    $('#txtTidoDocumentoER').val($(tr).attr('tido_id'));
                    $('#txtFechaDoxDocumentoER').val($(tr).attr('docu_fecha_docx'));
                    if ($(tr).attr('docu_metadata').toLowerCase() !== "undefined") {
                        $('#txtMetaDataDocumentoER').val($(tr).attr('docu_metadata'));
                    }
                    $('#actionDocumentos').val("addDocumento");
                    $("#nameForm").val("FrmDocumentoModal");
                    $('#modalCargandoDocumentos2').modal("show");
                }
            });
            $('.swal2-confirm').css("margin-right", "15px");
        });
    });
}

function procesarAjaxDocumentosADD() {
    var pathname = window.location.pathname;
    pathname = pathname.substring(getContext().length, pathname.length);
    var datosSerializadosCompletos = $('#' + $('#nameForm').val()).serialize();
    if ($('#nameForm').val().toLowerCase() !== "frmdocumentos") {
        datosSerializadosCompletos += "&txtTituloDocumento=" + $('#txtTituloDocumentoER').val();
        datosSerializadosCompletos += "&comboAnioDocumento=" + $('#comboAnioDocumento').val();
        datosSerializadosCompletos += "&comboTipoListaDocumentos=FALSE";
        datosSerializadosCompletos += "&numberPageDocumentos=" + $('#numberPageDocumentos').val();
        datosSerializadosCompletos += "&sizePageDocumentos=" + $('#sizePageDocumentos').val();
    }
    datosSerializadosCompletos += "&action=" + $('#actionDocumentos').val();
    datosSerializadosCompletos += "&urlDocumentos=" + pathname;
    $.ajax({
        url: getContext() + '/documentos/operaciones',
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        success: function (jsonResponse) {
            $('#modalCargandoDocumentos2').modal("hide");
            if (jsonResponse.MESSAGE_SERVER.toLowerCase() === "ok") {
                $('#ventanaDocumentosArcDig').modal("hide");
                viewAlert('success', getMessageServerTransaction($('#actionDocumentos').val(), 'Documento', 'o'));
                listarDocumentos(jsonResponse.BEAN_PAGINATION);
            } else {
                viewAlert('warning', jsonResponse.MESSAGE_SERVER);
            }
        },
        error: function () {
            $('#modalCargandoDocumentos2').modal("hide");
            /*MOSTRAMOS MENSAJE ERROR SERVIDOR*/
            viewAlert('error', 'Error interno en el servidor!');
        }
    });
    return false;
}