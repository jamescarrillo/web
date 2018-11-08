$(document).ready(function () {

    $('#txtFechaFinanzaER').datepicker({
        format: 'dd/mm/yyyy',
        todayHighlight: true,
        autoclose: true
    });

    cargarAniosCombo($('#comboAnioFinanza'), 2011, "-1", 'AÑO');

    $("#FrmFinanza").submit(function () {
        $("#nameForm").val("FrmFinanza");
        $("#numberPageFinanza").val(1);
        $('#actionFinanza').val("paginarFinanza");
        $('#modalCargandoFinanza').modal("show");
        return false;
    });

    $("#FrmFinanzaModal").submit(function () {
        if (validarFormularioFinanza()) {
            $("#numberPageFinanza").val(1);
            $("#nameForm").val("FrmFinanzaModal");
            $('#modalCargandoFinanza').modal("show");
        }
        return false;
    });

    $("#modalCargandoFinanza").on('shown.bs.modal', function () {
        //DESPUES DE TERMINAR DE MOSTRAR EL MODAL
        procesarAjaxFinanza();
    });

    $("#ventanaManFinanza").on('hidden.bs.modal', function () {
        $("#actionFinanza").val("paginarFinanza");
        $('#txtDescripcionFinanza').parent().removeClass("has-danger");
    });

    addEventoCombosPaginar();
    valicacionesCamposFinanza();
    $('#modalCargandoFinanza').modal("show");

});

function procesarAjaxFinanza() {
    var pathname = window.location.pathname;
    pathname = pathname.substring(getContext().length, pathname.length);
    var datosSerializadosCompletos = $('#' + $('#nameForm').val()).serialize();
    if ($('#nameForm').val().toLowerCase() !== "frmdocumentos") {
        datosSerializadosCompletos += "&txtDescripcionFinanza=" + $('#txtDescripcionFinanza').val();
        datosSerializadosCompletos += "&comboAnioFinanza=" + $('#comboAnioFinanza').val();
        datosSerializadosCompletos += "&comboTipoListaFinanza=" + $('#comboTipoListaFinanza').val();
    }
    datosSerializadosCompletos += "&numberPageFinanza=" + $('#numberPageFinanza').val();
    datosSerializadosCompletos += "&sizePageFinanza=" + $('#sizePageFinanza').val();
    datosSerializadosCompletos += "&action=" + $('#actionFinanza').val();
    datosSerializadosCompletos += "&url_finanzas=" + pathname;
    $.ajax({
        url: getContext() + '/finanzas/operaciones',
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        success: function (jsonResponse) {
            $('#modalCargandoFinanza').modal("hide");
            $('#ventanaManFinanza').modal("hide");
            if ($('#actionFinanza').val().toLowerCase() === "paginarfinanza") {
                listarFinanza(jsonResponse.BEAN_PAGINATION);
            } else {
                if (jsonResponse.MESSAGE_SERVER.toLowerCase() === "ok") {
                    listarFinanza(jsonResponse.BEAN_PAGINATION);
                    viewAlert('success', getMessageServerTransaction($('#actionFinanza').val(), 'Documento', 'o'));
                } else {
                    viewAlert('warning', jsonResponse.MESSAGE_SERVER);
                }
            }
        },
        error: function () {
            $('#modalCargandoFinanza').modal("hide");
            $("#ventanaManFinanza").modal("hide");
            /*MOSTRAMOS MENSAJE ERROR SERVIDOR*/
            viewAlert('error', 'Error interno en el servidor!');
        }
    });
    return false;
}

function listarFinanza(BEAN_PAGINATION) {
    /*PAGINATION*/
    var $pagination = $('#paginationFinanza');
    $('#tbodyFinanza').empty();
    if (BEAN_PAGINATION.COUNT_FILTER > 0) {
        var fila;
        var text_color;
        var icono;
        var tooltip;
        $.each(BEAN_PAGINATION.LIST, function (index, value) {
            text_color = "";
            if (!value.estado) {
                text_color = " text-danger";
                icono = "<i class='far fa-hand-point-up'></i>";
                tooltip = "Activar";
            } else {
                icono = "<i class='far fa-hand-point-down'></i>";
                tooltip = "Desactivar";
            }
            fila = "<tr ";
            fila += "id='" + value.id + "' ";
            fila += "tipo='" + value.tipo + "' ";
            fila += "anho='" + value.anho + "' ";
            fila += "mes='" + value.mes + "' ";
            fila += "titulo_formato='" + value.titulo_formato + "' ";
            fila += "documento='" + value.documento + "' ";
            fila += "descripcion='" + value.descripcion + "' ";
            fila += "ubicacion='" + value.ubicacion + "' ";
            fila += "estado='" + value.estado + "' ";
            fila += "docu_id='" + value.docu_id + "' ";
            fila += "fecha='" + value.fecha + "' ";
            fila += ">";
            fila += "<td class='text-center align-middle text-medium-table " + text_color + "'>" + value.fecha + "</td>";
            fila += "<td class='align-middle text-medium-table " + text_color + "'>" + value.descripcion + "</td>";
            fila += "<td class='align-middle text-medium-table " + text_color + "'><a href='http://lib.peam.gob.pe:8081/ArcDig/OriArc.pdf?id=" + value.docu_id + "' target='_blank' class='btn btn-success btn-sm descargar-doc' data-toggle='tooltip' title='Descargar Finanza'><i class='fa fa-download'></i></a></td>";
            fila += "<td class='align-middle text-medium-table " + text_color + "'><button class='btn btn-secondary btn-sm activar-desactivar-finanza' title='" + tooltip + " Finanza' opcion='" + tooltip.toLowerCase() + "'>" + icono + "</button></td>";
            fila += "<td class='align-middle text-medium-table " + text_color + "'><button class='btn btn-secondary btn-sm editar-finanza' title='Editar Finanza'><i class='fas fa-edit'></i></button></td>";
            fila += "<td class='align-middle text-medium-table " + text_color + "'><button class='btn btn-secondary btn-sm eliminar-finanza' title='Eliminar Finanza'><i class='fas fa-trash-alt'></i></button></td>";
            fila += "</tr>";
            $('#tbodyFinanza').append(fila);
        });
        var defaultOptions = getDefaultOptionsPagination();
        var options = getOptionsPagination(BEAN_PAGINATION.COUNT_FILTER, $('#sizePageFinanza'),
                $('#numberPageFinanza'), $('#actionFinanza'), 'paginarFinanza',
                $('#nameForm'), 'FrmFinanza', $('#modalCargandoFinanza'));
        $pagination.twbsPagination('destroy');
        $pagination.twbsPagination($.extend({}, defaultOptions, options));
        agregarEventosFinanza();
        $('#txtDescripcionFinanza').focus();
    } else {
        $pagination.twbsPagination('destroy');
        viewAlert('warning', 'No se encontraron resultados');
    }
}

function agregarEventosFinanza() {
    $('.editar-finanza').each(function () {
        $(this).click(function () {
            $('#txtIdFinanzaER').val($(this.parentElement.parentElement).attr('id'));
            $('#txtDescripcionFinanzaER').val($(this.parentElement.parentElement).attr('descripcion'));
            if ($(this.parentElement.parentElement).attr('fecha') !== "undefined") {
                $('#txtFechaFinanzaER').datepicker('setDate', getDateJS($(this.parentElement.parentElement).attr('fecha')));
            }
            $('#actionFinanza').val('updateFinanza');
            $('#txtTituloModalManFinanza').html("EDITAR DOCUMENTO");
            $('#ventanaManFinanza').modal("show");
            document.getElementsByTagName("body")[0].style.paddingRight = "0";
        });
    });
    $('.eliminar-finanza').each(function () {
        $(this).click(function () {
            $('#txtIdFinanzaER').val($(this.parentElement.parentElement).attr('id'));
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
                    $('#actionFinanza').val("deleteFinanza");
                    $("#nameForm").val("FrmFinanzaModal");
                    $('#modalCargandoFinanza').modal("show");
                }
            });
            $('.swal2-confirm').css("margin-right", "15px");
            document.getElementsByTagName("body")[0].style.paddingRight = "0";
        });
    });

    $('.activar-desactivar-finanza').each(function () {
        $(this).click(function () {
            $('#txtIdFinanzaER').val($(this.parentElement.parentElement).attr('id'));
            if ($(this).attr('opcion').toLowerCase() === "activar") {
                $('#txtEstadoFinanzaER').val("true");
            } else {
                $('#txtEstadoFinanzaER').val("false");
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
                    $('#actionFinanza').val("activateFinanza");
                    $("#nameForm").val("FrmFinanzaModal");
                    $('#modalCargandoFinanza').modal("show");
                }
            });
            $('.swal2-confirm').css("margin-right", "15px");
            document.getElementsByTagName("body")[0].style.paddingRight = "0";
        });
    });



}

function valicacionesCamposFinanza() {
    $('#txtFechaFinanzaER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtDescripcionFinanzaER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
}

function validarFormularioFinanza() {
    if ($('#txtFechaFinanzaER').val() === "") {
        $($('#txtFechaFinanzaER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtDescripcionFinanzaER').val() === "") {
        $($('#txtDescripcionFinanzaER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    return true;
}