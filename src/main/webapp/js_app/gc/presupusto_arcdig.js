$(document).ready(function () {

    cargarAniosCombo($('#comboAnioDocumentosArcDig'), 2005, "-1", 'AÑO');

    $("#FrmDocumentosArcDig").submit(function () {
        $("#nameFormArcDig").val("FrmDocumentosArcDig");
        $("#numberPageDocumentosArcDig").val(1);
        $('#actionDocumentosArcDig').val("paginarDocumentosArcDig");
        $('#modalCargandoDocumentosArcDig').modal("show");
        return false;
    });

    $('#btnAbrirVerArcdig').click(function () {
        $('#tbodyDocumentosArcDig').empty();
        $('#txtTituloResumenDocumentosArcDig').val("");
        $('#comboAnioDocumentosArcDig').val("-1");
        $('#sizePageDocumentosArcDig').val("5");
        if ($('#txtTipoER').val() === "1") {
            $('#txtTido').val("13");
        } else {
            $('#txtTido').val("14");
        }
        $('#nameFormArcDig').val("FrmDocumentosArcDig");
        $('#actionDocumentosArcDig').val("paginarDocumentosArcDig");
        $('#numberPageDocumentosArcDig').val("1");
        $('#txtTituloModalDocumentosArcDig').html("GESTIÓN DE DOCUMENTOS [ARCDIG]");
        $('#ventanaDocumentosArcDig').modal("show");
        $('#modalCargandoDocumentosArcDig').modal("show");
        document.getElementsByTagName("body")[0].style.paddingRight = "0";
    });

    $('#btnAbrirVerArcdigFinanza').click(function () {
        $('#tbodyDocumentosArcDig').empty();
        $('#txtTituloResumenDocumentosArcDig').val("");
        $('#comboAnioDocumentosArcDig').val("-1");
        $('#sizePageDocumentosArcDig').val("5");
        switch ($('#txtTipoFinanzaER').val()) {
            case "1":
                $('#txtTido').val("19");
                break;
            case "2":
                $('#txtTido').val("15");
                break;
            case "3":
                $('#txtTido').val("16");
                break;
            case "4":
                $('#txtTido').val("17");
                break;
        }
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

    //procesarAjaxEtiquetas();

});


function procesarAjaxDocumentosArcDig() {
    var datosSerializadosCompletos = $('#' + $('#nameFormArcDig').val()).serialize();
    datosSerializadosCompletos += "&numberPageDocumentosArcDig=" + $('#numberPageDocumentosArcDig').val();
    datosSerializadosCompletos += "&sizePageDocumentosArcDig=" + $('#sizePageDocumentosArcDig').val();
    datosSerializadosCompletos += "&action=" + $('#actionDocumentosArcDig').val();
    datosSerializadosCompletos += "&txtTido=" + $('#txtTido').val();
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
        if ($('#txtTido').val()==="13" || $('#txtTido').val()==="14") {
            agregarEventosSeleccionarDocumentos1();
        }else{
            agregarEventosSeleccionarDocumentos2();
        }
        
    } else {
        $pagination.twbsPagination('destroy');
        viewAlert('warning', 'No se enconntraron resultados');
    }
}

function agregarEventosSeleccionarDocumentos1() {
    var tr;
    var valores;
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
                    $('#txtDocuIdER').val($(tr).attr('docu_id'));
                    $('#txtFechaAprobacionER').datepicker('setDate', getDateJS($(tr).attr('docu_fecha_docx')));
                    $('#txtDescripcionER').val($(tr).attr('docu_resumen'));
                    $('#txtEstadoER').val("true");
                    $('#ventanaDocumentosArcDig').modal("hide");

                }
            });
            $('.swal2-confirm').css("margin-right", "15px");
        });
    });
}

function agregarEventosSeleccionarDocumentos2() {
    var tr;
    var valores;
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
                    $('#txtDocu_idFinanzaER').val($(tr).attr('docu_id'));
                    $('#txtTituloFinanzaER').val($(tr).attr('docu_titulo'));
                    $('#txtDescripcionFinanzaER').val($(tr).attr('docu_resumen'));
                    $('#txtDocumentoFinanzaER').val("");
                    $('#txtUbicacionFinanzaER').val("");
                    $('#txtEstadoFinanzaER').val("false");
                    $('#txtFechaFinanzaER').val($(tr).attr('docu_fecha_docx')); // dd/MM/yyyy
                    if ($(tr).attr('docu_fecha_docx') !== "undefined") {
                        valores = $(tr).attr('docu_fecha_docx').split("/");
                        $('#txtAnhoFinanzaER').val(valores[2]);
                        $('#txtMesFinanzaER').val(valores[1]);
                    } else {
                        $('#txtAnhoFinanzaER').val("");
                        $('#txtMesFinanzaER').val("");
                    }
                    $('#txtEstadoFinanzaER').val("true");
                    $('#ventanaDocumentosArcDig').modal("hide");
                }
            });
            $('.swal2-confirm').css("margin-right", "15px");
        });
    });
}