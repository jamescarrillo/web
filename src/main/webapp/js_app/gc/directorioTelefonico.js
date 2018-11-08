$(document).ready(function () {

    cargarAniosCombo($('#comboAnio'), 2000, "-1", 'TODOS');
    
    $("#FrmDirectorioTelefonico").submit(function () {
        $("#nameForm").val("FrmDirectorioTelefonico");
        $("#numberPageDirectorioTelefonico").val(1);
        $('#actionDirectorioTelefonico').val("paginarDirectorioTelefonico");
        $('#modalCargandoDirectorioTelefonico').modal("show");
        return false;
    });

    $("#FrmDirectorioTelefonicoModal").submit(function () {
        if (validarFormularioDirectorioTelefonico()) {
            $("#numberPageDirectorioTelefonico").val(1);
            $("#nameForm").val("FrmDirectorioTelefonicoModal");
            $('#modalCargandoDirectorioTelefonico').modal("show");
            //viewAlert('warning', 'Estamos trabajando!');
        }
        return false;
    });

    $("#modalCargandoDirectorioTelefonico").on('shown.bs.modal', function () {
        //DESPUES DE TERMINAR DE MOSTRAR EL MODAL
        procesarAjaxDirectorioTelefonico();
    });

    $("#ventanaManDirectorioTelefonico").on('hidden.bs.modal', function () {
        $("#actionDirectorioTelefonico").val("paginarDirectorioTelefonico");
    });

    $('#btnAbrirNuevoDirectorioTelefonico').click(function () {
        $('#FrmDirectorioTelefonicoModal input').val("");
        $('#FrmDirectorioTelefonicoModal textarea').val("");
        $('#FrmDirectorioTelefonicoModal select').val("-1");
        $('#FrmDirectorioTelefonicoModal input').parent().removeClass("has-danger");
        $('#FrmDirectorioTelefonicoModal select').parent().removeClass("has-danger");
        $('#actionDirectorioTelefonico').val("addDirectorioTelefonico");
        $('#txtTituloModalManDirectorioTelefonico').html("REGISTRAR DIRECTORIO TELEFONICO");
        $('#ventanaManDirectorioTelefonico').modal("show");
        document.getElementsByTagName("body")[0].style.paddingRight = "0";
    });

    addEventoCombosPaginar();
    valicacionesCamposDirectorioTelefonico();
    $('#modalCargandoDirectorioTelefonico').modal("show");

});

function procesarAjaxDirectorioTelefonico() {
    var datosSerializadosCompletos = $('#' + $('#nameForm').val()).serialize();
    if ($('#nameForm').val().toLowerCase() !== "frmdirectoriotelefonico") {
        //AGREGAMOS LOS PARAMETROS DEL FORMULARIO DE BUSQUEDA
        datosSerializadosCompletos += "&txtDirectorioTelefonico=" + $('#txtDirectorioTelefonico').val();
        datosSerializadosCompletos += "&comboAnio=" + $('#comboAnio').val();
        datosSerializadosCompletos += "&comboTipoListaDirectorioTelefonico=" + $('#comboTipoListaDirectorioTelefonico').val();
    }
    datosSerializadosCompletos += "&numberPageDirectorioTelefonico=" + $('#numberPageDirectorioTelefonico').val();
    datosSerializadosCompletos += "&sizePageDirectorioTelefonico=" + $('#sizePageDirectorioTelefonico').val();
    datosSerializadosCompletos += "&action=" + $('#actionDirectorioTelefonico').val();
    $.ajax({
        url: getContext() + '/directoriostelefonicos',
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        success: function (jsonResponse) {
            $('#modalCargandoDirectorioTelefonico').modal("hide");
            if ($('#actionDirectorioTelefonico').val().toLowerCase() === "paginardirectoriotelefonico") {
                listarDirectorioTelefonico(jsonResponse.BEAN_PAGINATION);
            } else {
                if (jsonResponse.MESSAGE_SERVER.toLowerCase() === "ok") {
                    viewAlert('success', getMessageServerTransaction($('#actionDirectorioTelefonico').val(), 'Directorio Telefonico', 'o'));
                    listarDirectorioTelefonico(jsonResponse.BEAN_PAGINATION);
                } else {
                    viewAlert('warning', jsonResponse.MESSAGE_SERVER);
                }
            }
            $("#ventanaManDirectorioTelefonico").modal("hide");
        },
        error: function () {
            $('#modalCargandoDirectorioTelefonico').modal("hide");
            $("#ventanaManDirectorioTelefonico").modal("hide");
            /*MOSTRAMOS MENSAJE ERROR SERVIDOR*/
            viewAlert('error', 'Error interno en el servidor!');
        }
    });
    return false;
}

function listarDirectorioTelefonico(BEAN_PAGINATION) {
    /*PAGINATION*/
    var $pagination = $('#paginationDirectorioTelefonico');
    $('#tbodyDirectorioTelefonico').empty();
    if (BEAN_PAGINATION.COUNT_FILTER > 0) {
        var fila;
        $.each(BEAN_PAGINATION.LIST, function (index, value) {

            fila = "<tr ";
            fila += "id='" + value.id + "' ";
            fila += "oficina='" + value.oficina + "' ";
            fila += "seccion='" + value.seccion + "' ";
            fila += "anexo='" + value.anexo + "' ";
            fila += "estado='" + value.estado + "' ";
            fila += ">";
            fila += "<td class='text-middle'>" + value.oficina + "</td>";
            fila += "<td class='align-middle '>" + value.seccion + "</td>";
            fila += "<td class='align-middle '>" + value.anexo + "</td>";
            fila += "<td class='align-middle '><button class='btn btn-secondary btn-sm editar-DirectorioTelefonico'><i class='fas fa-edit'></i></button></td>";
            fila += "<td class='align-middle'><button class='btn btn-secondary btn-sm eliminar-DirectorioTelefonico'><i class='fas fa-trash-alt'></i></button></td>";
            fila += "</tr>";
            $('#tbodyDirectorioTelefonico').append(fila);
        });
        var defaultOptions = getDefaultOptionsPagination();
        var options = getOptionsPagination(BEAN_PAGINATION.COUNT_FILTER, $('#sizePageDirectorioTelefonico'),
                $('#numberPageDirectorioTelefonico'), $('#actionDirectorioTelefonico'), 'paginarDirectorioTelefonico',
                $('#nameForm'), 'FrmDirectorioTelefonico', $('#modalCargandoDirectorioTelefonico'));
        $pagination.twbsPagination('destroy');
        $pagination.twbsPagination($.extend({}, defaultOptions, options));
        agregarEventosDirectorioTelefonico();
        $('#txtNombreDirectorioTelefonico').focus();
    } else {
        $pagination.twbsPagination('destroy');
        viewAlert('warning', 'No se enconntraron resultados');
    }
}

function agregarEventosDirectorioTelefonico() {
    $('.editar-DirectorioTelefonico').each(function () {
        $(this).click(function () {
            $('#txtIdER').val($(this.parentElement.parentElement).attr('id'));
            $('#txtOficinaER').val($(this.parentElement.parentElement).attr('oficina'));
            $('#txtSeccionER').val($(this.parentElement.parentElement).attr('seccion'));
            $('#txtAnexoER').val($(this.parentElement.parentElement).attr('anexo'));
            $('#actionDirectorioTelefonico').val('updateDirectorioTelefonico');
            $('#txtTituloModalManDirectorioTelefonico').html("EDITAR DIRECTORIO TELEFONICO");
            $('#ventanaManDirectorioTelefonico').modal("show");
            document.getElementsByTagName("body")[0].style.paddingRight = "0";
        });
    });
    $('.eliminar-DirectorioTelefonico').each(function () {
        $(this).click(function () {
            $('#txtIdER').val($(this.parentElement.parentElement).attr('id'));
            viewAlertDelete("DirectorioTelefonico");
            document.getElementsByTagName("body")[0].style.paddingRight = "0";
        });
    });
}

function valicacionesCamposDirectorioTelefonico() {
    $('#txtOficinaER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtRucER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtAnexoER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
}

function validarFormularioDirectorioTelefonico() {
    if ($('#txtOficinaER').val() === "") {
        $($('#txtOficinaER').parent()).addClass('has-danger');
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
    if ($('#txtAnexoER').val() === "") {
        $($('#txtAnexoER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    return true;
}