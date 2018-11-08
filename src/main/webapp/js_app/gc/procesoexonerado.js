$(document).ready(function () {

    $('#datePickerFAProcesoExoneradoER').datepicker({
        format: 'dd/mm/yyyy',
        todayHighlight: true,
        autoclose: true
    });

    cargarAniosCombo($('#comboAnio'), 2000, "-1", 'TODOS');

    $("#FrmProcesoExonerado").submit(function () {
        $("#nameForm").val("FrmProcesoExonerado");
        $("#numberPageProcesoExonerado").val(1);
        $('#actionProcesoExonerado').val("paginarProcesoExonerado");
        $('#modalCargandoProcesoExonerado').modal("show");
        return false;
    });

    $("#FrmProcesoExoneradoModal").submit(function () {
        if (validarFormularioProcesoExonerado()) {
            $("#numberPageProcesoExonerado").val(1);
            $("#nameForm").val("FrmProcesoExoneradoModal");
            $('#modalCargandoProcesoExonerado').modal("show");
            //viewAlert('warning', 'Estamos trabajando!');
        }
        return false;
    });

    $("#modalCargandoProcesoExonerado").on('shown.bs.modal', function () {
        //DESPUES DE TERMINAR DE MOSTRAR EL MODAL
        procesarAjaxProcesoExonerado();
    });

    $("#ventanaManProcesoExonerado").on('hidden.bs.modal', function () {
        $("#actionProcesoExonerado").val("paginarProcesoExonerado");
    });

    $('#btnAbrirNuevoProcesoExonerado').click(function () {
        $('#FrmProcesoExoneradoModal input').val("");
        $('#FrmProcesoExoneradoModal textarea').val("");
        $('#FrmProcesoExoneradoModal select').val("-1");
        $('#FrmProcesoExoneradoModal input').parent().removeClass("has-danger");
        $('#FrmProcesoExoneradoModal select').parent().removeClass("has-danger");
        $('#actionProcesoExonerado').val("addProcesoExonerado");
        $('#txtTituloModalManProcesoExonerado').html("REGISTRAR PROCESO EXONERADO");
        $('#ventanaManProcesoExonerado').modal("show");
        document.getElementsByTagName("body")[0].style.paddingRight = "0";
    });

    addEventoCombosPaginar();
    valicacionesCamposProcesoExonerado();
    $('#modalCargandoProcesoExonerado').modal("show");

});

function procesarAjaxProcesoExonerado() {
    var datosSerializadosCompletos = $('#' + $('#nameForm').val()).serialize();
    if ($('#nameForm').val().toLowerCase() !== "frmprocesoexonerado") {
        //AGREGAMOS LOS PARAMETROS DEL FORMULARIO DE BUSQUEDA
        datosSerializadosCompletos += "&txtProcesoExonerado=" + $('#txtProcesoExonerado').val();
        datosSerializadosCompletos += "&comboAnio=" + $('#comboAnio').val();
        datosSerializadosCompletos += "&comboTipoListaProcesoExonerado=" + $('#comboTipoListaProcesoExonerado').val();
    }
    datosSerializadosCompletos += "&numberPageProcesoExonerado=" + $('#numberPageProcesoExonerado').val();
    datosSerializadosCompletos += "&sizePageProcesoExonerado=" + $('#sizePageProcesoExonerado').val();
    datosSerializadosCompletos += "&action=" + $('#actionProcesoExonerado').val();
    $.ajax({
        url: getContext() + '/convocatorias/procesosexonerados',
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        success: function (jsonResponse) {
            $('#modalCargandoProcesoExonerado').modal("hide");
            if ($('#actionProcesoExonerado').val().toLowerCase() === "paginarprocesoexonerado") {
                listarProcesoExonerado(jsonResponse.BEAN_PAGINATION);
            } else {
                if (jsonResponse.MESSAGE_SERVER.toLowerCase() === "ok") {
                    viewAlert('success', getMessageServerTransaction($('#actionProcesoExonerado').val(), 'Proceso Exonerado', 'o'));
                    listarProcesoExonerado(jsonResponse.BEAN_PAGINATION);
                } else {
                    viewAlert('warning', jsonResponse.MESSAGE_SERVER);
                }
            }
            $("#ventanaManProcesoExonerado").modal("hide");
        },
        error: function () {
            $('#modalCargandoProcesoExonerado').modal("hide");
            $("#ventanaManProcesoExonerado").modal("hide");
            /*MOSTRAMOS MENSAJE ERROR SERVIDOR*/
            viewAlert('error', 'Error interno en el servidor!');
        }
    });
    return false;
}

function listarProcesoExonerado(BEAN_PAGINATION) {
    /*PAGINATION*/
    var $pagination = $('#paginationProcesoExonerado');
    $('#tbodyProcesoExonerado').empty();
    if (BEAN_PAGINATION.COUNT_FILTER > 0) {
        var fila;
        $.each(BEAN_PAGINATION.LIST, function (index, value) {

            fila = "<tr ";
            fila += "id='" + value.id + "' ";
            fila += "anho='" + value.anho + "' ";
            fila += "nro_exonerado='" + value.nro_exonerado + "' ";
            fila += "ruc='" + value.ruc + "' ";
            fila += "objeto='" + value.objeto + "' ";
            fila += "fecha='" + value.fecha + "' ";
            fila += "causa='" + value.causa + "' ";
            fila += "descripcion='" + value.descripcion + "' ";
            fila += "monto='" + value.monto + "' ";
            fila += "contratista='" + value.contratista + "' ";
            fila += "url='" + value.url + "' ";
            fila += ">";
            fila += "<td class='text-center align-middle text-medium-table' >" + value.fecha + "</td>";
            fila += "<td class='align-middle text-medium-table' >" + value.descripcion + "</td>";
            fila += "<td class='align-middle text-medium-table' >" + value.monto + "</td>";
            fila += "<td class='align-middle text-medium-table' >" + value.contratista + "</td>";
            fila += "<td class='align-middle text-medium-table' >" + value.ruc + "</td>";
            fila += "<td class='align-middle '><a target='_blank' class='btn btn-secondary btn-sm' href='" + value.url + "'><i class='fab fa-firefox'></i></a></td>";
            fila += "<td class='align-middle '><button class='btn btn-secondary btn-sm editar-ProcesoExonerado'><i class='fas fa-edit'></i></button></td>";
            fila += "<td class='align-middle text-medium-table'><button class='btn btn-secondary btn-sm eliminar-ProcesoExonerado'><i class='fas fa-trash-alt'></i></button></td>";
            fila += "</tr>";
            $('#tbodyProcesoExonerado').append(fila);
        });
        var defaultOptions = getDefaultOptionsPagination();
        var options = getOptionsPagination(BEAN_PAGINATION.COUNT_FILTER, $('#sizePageProcesoExonerado'),
                $('#numberPageProcesoExonerado'), $('#actionProcesoExonerado'), 'paginarProcesoExonerado',
                $('#nameForm'), 'FrmProcesoExonerado', $('#modalCargandoProcesoExonerado'));
        $pagination.twbsPagination('destroy');
        $pagination.twbsPagination($.extend({}, defaultOptions, options));
        agregarEventosProcesoExonerado();
        $('#txtNombreProcesoExonerado').focus();
    } else {
        $pagination.twbsPagination('destroy');
        viewAlert('warning', 'No se enconntraron resultados');
    }
}

function agregarEventosProcesoExonerado() {
    $('.editar-ProcesoExonerado').each(function () {
        $(this).click(function () {
            $('#txtIdER').val($(this.parentElement.parentElement).attr('id'));
            $('#txtCausaER').val($(this.parentElement.parentElement).attr('causa'));
            $('#txtNroExoneracionER').val($(this.parentElement.parentElement).attr('nro_exonerado'));
            $('#txtRucER').val($(this.parentElement.parentElement).attr('ruc'));
            $('#txtUrlER').val($(this.parentElement.parentElement).attr('url'));
            $('#txtObjetoER').val($(this.parentElement.parentElement).attr('objeto'));
            $('#txtDescripcionER').val($(this.parentElement.parentElement).attr('descripcion'));
            $('#txtContratistaER').val($(this.parentElement.parentElement).attr('contratista'));
            $('#datePickerFAProcesoExoneradoER').datepicker('setDate', getDateJS($(this.parentElement.parentElement).attr('fecha')));
            $('#txtMontoER').val($(this.parentElement.parentElement).attr('monto'));
            $('#actionProcesoExonerado').val('updateProcesoExonerado');
            $('#txtTituloModalManProcesoExonerado').html("EDITAR PROCESO EXONERADO");
            $('#ventanaManProcesoExonerado').modal("show");
            document.getElementsByTagName("body")[0].style.paddingRight = "0";
        });
    });
    $('.eliminar-ProcesoExonerado').each(function () {
        $(this).click(function () {
            $('#txtIdER').val($(this.parentElement.parentElement).attr('id'));
            viewAlertDelete("ProcesoExonerado");
            document.getElementsByTagName("body")[0].style.paddingRight = "0";
        });
    });
}

function valicacionesCamposProcesoExonerado() {
    $('#txtNroExoneracionER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtRucER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#datePickerFAProcesoExoneradoER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtCausaER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtObjetoER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtDescripcionER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtContratistaER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtTipoER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtMontoER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtUrlER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
}

function validarFormularioProcesoExonerado() {
    if ($('#txtNroExoneracionER').val() === "") {
        $($('#txtNroExoneracionER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtRucER').val() === "") {
        $($('#txtRucER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#datePickerFAProcesoExoneradoER').val() === "") {
        $($('#datePickerFAProcesoExoneradoER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtCausaER').val() === "") {
        $($('#txtCausaER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtObjetoER').val() === "") {
        $($('#txtObjetoER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtDescripcionER').val() === "") {
        $($('#txtDescripcionER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtContratistaER').val() === "") {
        $($('#txtContratistaER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtTipoER').val() === "") {
        $($('#txtTipoER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtMontoER').val() === "") {
        $($('#txtMontoER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtUrlER').val() === "") {
        $($('#txtUrlER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    return true;
}
