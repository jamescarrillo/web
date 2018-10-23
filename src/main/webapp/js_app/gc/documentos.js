$(document).ready(function () {

    cargarAniosCombo($('#comboAnioDocumento'), 2005, "-1", 'AÑO');

    $("#FrmDocumentos").submit(function () {
        $("#nameForm").val("FrmDocumentos");
        $("#numberPageDocumentos").val(1);
        $('#actionDocumentos').val("paginarDocumentos");
        $('#modalCargandoDocumentos').modal("show");
        return false;
    });

    $("#FrmDocumentoModal").submit(function () {
        if (validarFormularioDocumentos()) {
            $("#numberPageDocumentos").val(1);
            $("#nameForm").val("FrmDocumentoModal");
            $('#modalCargandoDocumentos').modal("show");
        }
        return false;
    });

    $("#modalCargandoDocumentos").on('shown.bs.modal', function () {
        //DESPUES DE TERMINAR DE MOSTRAR EL MODAL
        procesarAjaxDocumentos();
    });

    $("#ventanaManDocumento").on('hidden.bs.modal', function () {
        $("#actionDocumentos").val("paginarDocumentos");
        $('#txtTituloDocumentoER').parent().removeClass("has-danger");
        $('#txtResumenDocumentoER').parent().removeClass("has-danger");
    });

    addEventoCombosPaginar();
    valicacionesCamposDocumentos();
    $('#modalCargandoDocumentos').modal("show");

});

function procesarAjaxDocumentos() {
    var pathname = window.location.pathname;
    pathname = pathname.substring(getContext().length, pathname.length);
    var datosSerializadosCompletos = $('#' + $('#nameForm').val()).serialize();
    if ($('#nameForm').val().toLowerCase() !== "frmdocumentos") {
        datosSerializadosCompletos += "&txtTituloDocumento=" + $('#txtTituloDocumento').val();
        datosSerializadosCompletos += "&comboAnioDocumento=" + $('#comboAnioDocumento').val();
        datosSerializadosCompletos += "&comboTipoListaDocumentos=" + $('#comboTipoListaDocumentos').val();
    }
    datosSerializadosCompletos += "&numberPageDocumentos=" + $('#numberPageDocumentos').val();
    datosSerializadosCompletos += "&sizePageDocumentos=" + $('#sizePageDocumentos').val();
    datosSerializadosCompletos += "&action=" + $('#actionDocumentos').val();
    datosSerializadosCompletos += "&urlDocumentos=" + pathname;
    $.ajax({
        url: getContext() + '/documentos/operaciones',
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        success: function (jsonResponse) {
            $('#modalCargandoDocumentos').modal("hide");
            $('#ventanaManDocumento').modal("hide");
            if ($('#actionDocumentos').val().toLowerCase() === "paginardocumentos") {
                listarDocumentos(jsonResponse.BEAN_PAGINATION);
            } else {
                if (jsonResponse.MESSAGE_SERVER.toLowerCase() === "ok") {
                    listarDocumentos(jsonResponse.BEAN_PAGINATION);
                    viewAlert('success', getMessageServerTransaction($('#actionDocumentos').val(), 'Documento', 'o'));
                } else {
                    viewAlert('warning', jsonResponse.MESSAGE_SERVER);
                }
            }
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

function listarDocumentos(BEAN_PAGINATION) {
    /*PAGINATION*/
    var $pagination = $('#paginationDocumentos');
    $('#tbodyDocumentos').empty();
    if (BEAN_PAGINATION.COUNT_FILTER > 0) {
        var fila;
        var text_color;
        var icono;
        var tooltip;
        $.each(BEAN_PAGINATION.LIST, function (index, value) {
            text_color = "";
            if (!value.docu_estado) {
                text_color = " text-danger";
                icono = "<i class='far fa-hand-point-up'></i>";
                tooltip = "Activar";
            } else {
                icono = "<i class='far fa-hand-point-down'></i>";
                tooltip = "Desactivar";
            }
            fila = "<tr ";
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
            fila += ">";
            fila += "<td class='text-center align-middle text-medium-table " + text_color + "'>" + value.docu_fecha_docx + "</td>";
            fila += "<td class='align-middle text-medium-table " + text_color + "'>" + value.docu_titulo + "</td>";
            fila += "<td class='align-middle text-medium-table " + text_color + "'>" + value.docu_resumen + "</td>";
            fila += "<td class='align-middle text-medium-table " + text_color + "'><a href='http://lib.peam.gob.pe:8081/ArcDig/OriArc.pdf?id=" + value.docu_id + "' target='_blank' class='btn btn-success btn-sm descargar-doc' data-toggle='tooltip' title='Descargar Documento'><i class='fa fa-download'></i></a></td>";
            fila += "<td class='align-middle text-medium-table " + text_color + "'><button class='btn btn-secondary btn-sm activar-desactivar-documento' title='" + tooltip + " Documento' opcion='" + tooltip.toLowerCase() + "'>" + icono + "</button></td>";
            fila += "<td class='align-middle text-medium-table " + text_color + "'><button class='btn btn-secondary btn-sm editar-documento' title='Editar Documento'><i class='fas fa-edit'></i></button></td>";
            fila += "<td class='align-middle text-medium-table " + text_color + "'><button class='btn btn-secondary btn-sm eliminar-documento' title='Eliminar Documento'><i class='fas fa-trash-alt'></i></button></td>";
            fila += "</tr>";
            $('#tbodyDocumentos').append(fila);
        });
        var defaultOptions = getDefaultOptionsPagination();
        var options = getOptionsPagination(BEAN_PAGINATION.COUNT_FILTER, $('#sizePageDocumentos'),
                $('#numberPageDocumentos'), $('#actionDocumentos'), 'paginarDocumentos',
                $('#nameForm'), 'FrmDocumentos', $('#modalCargandoDocumentos'));
        $pagination.twbsPagination('destroy');
        $pagination.twbsPagination($.extend({}, defaultOptions, options));
        agregarEventosDocumentos();
        $('#txtTituloDocumento').focus();
    } else {
        $pagination.twbsPagination('destroy');
        viewAlert('warning', 'No se enconntraron resultados');
    }
}

function agregarEventosDocumentos() {
    $('.editar-documento').each(function () {
        $(this).click(function () {
            $('#txtIdDocumentoER').val($(this.parentElement.parentElement).attr('docu_id'));
            $('#txtTituloDocumentoER').val($(this.parentElement.parentElement).attr('docu_titulo'));
            $('#txtResumenDocumentoER').val($(this.parentElement.parentElement).attr('docu_resumen'));
            $('#actionDocumentos').val('updateDocumento');
            $('#txtTituloModalManDocumento').html("EDITAR DOCUMENTO");
            $('#ventanaManDocumento').modal("show");
            document.getElementsByTagName("body")[0].style.paddingRight = "0";
        });
    });
    $('.eliminar-documento').each(function () {
        $(this).click(function () {
            $('#txtIdDocumentoER').val($(this.parentElement.parentElement).attr('docu_id'));
            swal({
                title: 'PEAM',
                text: "¿Está seguro de eliminar este Documento?",
                type: 'warning',
                showCancelButton: true,
                confirmButtonText: 'Sí, continuar!',
                cancelButtonText: 'No, cancelar!',
                confirmButtonClass: 'btn btn-info',
                cancelButtonClass: 'btn btn-danger',
                buttonsStyling: false
            }).then((result) => {
                if (result.value) {
                    $('#actionDocumentos').val("deleteDocumento");
                    $("#nameForm").val("FrmDocumentoModal");
                    $('#modalCargandoDocumentos').modal("show");
                }
            });
            $('.swal2-confirm').css("margin-right", "15px");
            document.getElementsByTagName("body")[0].style.paddingRight = "0";
        });
    });

    $('.activar-desactivar-documento').each(function () {
        $(this).click(function () {
            $('#txtIdDocumentoER').val($(this.parentElement.parentElement).attr('docu_id'));
            if ($(this).attr('opcion').toLowerCase() === "activar") {
                $('#txtEstadoDocumentoER').val("true");
            } else {
                $('#txtEstadoDocumentoER').val("false");
            }
            swal({
                title: 'PEAM',
                text: "¿Está seguro de " + $(this).attr('opcion') + " este Documento?",
                type: 'warning',
                showCancelButton: true,
                confirmButtonText: 'Sí, continuar!',
                cancelButtonText: 'No, cancelar!',
                confirmButtonClass: 'btn btn-info',
                cancelButtonClass: 'btn btn-danger',
                buttonsStyling: false
            }).then((result) => {
                if (result.value) {
                    $('#actionDocumentos').val("activateDocumento");
                    $("#nameForm").val("FrmDocumentoModal");
                    $('#modalCargandoDocumentos').modal("show");
                }
            });
            $('.swal2-confirm').css("margin-right", "15px");
            document.getElementsByTagName("body")[0].style.paddingRight = "0";
        });
    });



}

function valicacionesCamposDocumentos() {
    $('#txtTituloDocumentoER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtResumenDocumentoER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
}

function validarFormularioDocumentos() {
    if ($('#txtTituloDocumentoER').val() === "") {
        $($('#txtTituloDocumentoER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtResumenDocumentoER').val() === "") {
        $($('#txtResumenDocumentoER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    return true;
}