$(document).ready(function () {

    cargarAniosCombo($('#comboAnio'), "-1");

    $("#FrmConvocatoriaPers").submit(function () {
        $("#nameForm").val("FrmConvocatoriaPers");
        $("#numberPageConvocatoriaPers").val(1);
        $('#actionConvocatoriaPers').val("paginarConvocatoriaPers");
        $('#modalCargandoConvocatoriaPers').modal("show");
        return false;
    });

    $("#FrmConvocatoriaPersModal").submit(function () {
        if (validarFormularioConvocatoriaPers()) {
            $("#numberPageConvocatoriaPers").val(1);
            $("#nameForm").val("FrmConvocatoriaPersModal");
            $('#modalCargandoConvocatoriaPers').modal("show");
            //viewAlert('warning', 'Estamos trabajando!');
        }
        return false;
    });

    $("#modalCargandoConvocatoriaPers").on('shown.bs.modal', function () {
        //DESPUES DE TERMINAR DE MOSTRAR EL MODAL
        procesarAjaxConvocatoriaPers();
    });

    $("#ventanaManConvocatoriaPers").on('hidden.bs.modal', function () {
        $("#actionConvocatoriaPers").val("paginarConvocatoriaPers");
    });

    $('#btnAbrirNuevoConvocatoriaPers').click(function () {
        $('#FrmConvocatoriaPersModal input').val("");
        $('#FrmConvocatoriaPersModal textarea').val("");
        $('#FrmConvocatoriaPersModal select').val("-1");
        $('#FrmConvocatoriaPersModal input').parent().removeClass("has-danger");
        $('#FrmConvocatoriaPersModal select').parent().removeClass("has-danger");
        $('#actionConvocatoriaPers').val("addConvocatoriaPers");
        $('#txtTituloModalManConvocatoriaPers').html("REGISTRAR CONVOCATORIA PERSONAL");
        $('#ventanaManConvocatoriaPers').modal("show");
        document.getElementsByTagName("body")[0].style.paddingRight = "0";
    });

    addEventoCombosPaginar();
    valicacionesCamposConvocatoriaPers();
    $('#modalCargandoConvocatoriaPers').modal("show");

});

function procesarAjaxConvocatoriaPers() {
    var datosSerializadosCompletos = $('#' + $('#nameForm').val()).serialize();
    if ($('#nameForm').val() !== "FrmConvocatoriaPers") {
        datosSerializadosCompletos += "&" + $('#FrmConvocatoriaPers').serialize();
    }
    datosSerializadosCompletos += "&numberPageConvocatoriaPers=" + $('#numberPageConvocatoriaPers').val();
    datosSerializadosCompletos += "&sizePageConvocatoriaPers=" + $('#sizePageConvocatoriaPers').val();
    datosSerializadosCompletos += "&action=" + $('#actionConvocatoriaPers').val();
    console.log(datosSerializadosCompletos);
    $.ajax({
        url: getContext() + '/convocatoriapersonal',
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        success: function (jsonResponse) {
            console.log(jsonResponse);
            $('#modalCargandoConvocatoriaPers').modal("hide");
            if ($('#actionConvocatoriaPers').val().toLowerCase() === "paginarconvocatoriapers") {
                listarConvocatoriaPers(jsonResponse.BEAN_PAGINATION);
            } else {
                if (jsonResponse.MESSAGE_SERVER.toLowerCase() === "registered" ||
                        jsonResponse.MESSAGE_SERVER.toLowerCase() === "modified" ||
                        jsonResponse.MESSAGE_SERVER.toLowerCase() === "deleted") {
                    listarConvocatoriaPers(jsonResponse.BEAN_PAGINATION);
                    viewAlert('success', getMessageServerTransaction($('#actionConvocatoriaPers').val(), jsonResponse.MESSAGE_SERVER));
                } else {
                    viewAlert('warning', jsonResponse.MESSAGE_SERVER);
                }
            }
            $("#ventanaManConvocatoriaPers").modal("hide");
        },
        error: function () {
            $('#modalCargandoConvocatoriaPers').modal("hide");
            $("#ventanaManConvocatoriaPers").modal("hide");
            /*MOSTRAMOS MENSAJE ERROR SERVIDOR*/
            viewAlert('error', 'Error interno en el servidor!');
        }
    });
    return false;
}

function listarConvocatoriaPers(BEAN_PAGINATION) {
    /*PAGINATION*/
    var $pagination = $('#paginationConvocatoriaPers');
    $('#tbodyConvocatoriaPers').empty();
    if (BEAN_PAGINATION.COUNT_FILTER > 0) {
        var fila;
        var text_color;
        $.each(BEAN_PAGINATION.LIST, function (index, value) {
            text_color = "";
            if (!value.estado) {
                text_color = " text-danger";
            }
            //text-center align-middle
            fila = "<tr ";
            fila += "coper_id='" + value.coper_id + "' ";
            fila += "descripcion='" + value.descripcion + "' ";
            fila += "convocatoria='" + value.convocatoria + "' ";
            fila += "estado='" + value.estado + "' ";
            fila += "fecha='" + value.fecha + "' ";
            fila += "anio='" + value.anho + "' ";
            fila += ">";
            fila += "<td class='text-center align-middle" + text_color + "'>" + value.fecha + "</td>";
            fila += "<td class='align-middle " + text_color + "'>" + value.convocatoria + "</td>";
            fila += "<td class='align-middle " + text_color + "'>" + value.descripcion + "</td>";
            fila += "<td class='align-middle " + text_color + "'><button class='btn btn-secondary btn-sm editar-ConvocatoriaPers'><i class='fas fa-edit'></i></button></td>";
            fila += "<td class='align-middle" + text_color + "'><button class='btn btn-secondary btn-sm eliminar-ConvocatoriaPers'><i class='fas fa-trash-alt'></i></button></td>";
            fila += "<td class='align-middle " + text_color + "'><button class='btn btn-success btn-sm descargar-cv' data-toggle='tooltip' title='Descargar CV'><i class='fa fa-download'></i></button></td>";
            fila += "<td class='align-middle " + text_color + "'><button class='btn btn-success btn-sm actividades' data-toggle='tooltip' title='Actividades'><i class='fa fa-download'></i> ACTIVIDADES</button></td>";
            fila += "<td class='align-middle " + text_color + "'><button class='btn btn-success btn-sm plazas' data-toggle='tooltip' title='Plazas'><i class='fa fa-download'></i> PLAZAS</button></td>";
            fila += "</tr>";
            $('#tbodyConvocatoriaPers').append(fila);
        });
        var defaultOptions = getDefaultOptionsPagination();
        var options = getOptionsPagination(BEAN_PAGINATION.COUNT_FILTER, $('#sizePageConvocatoriaPers'),
                $('#numberPageConvocatoriaPers'), $('#actionConvocatoriaPers'), 'paginarConvocatoriaPers',
                $('#nameForm'), 'FrmConvocatoriaPers', $('#modalCargandoConvocatoriaPers'));
        $pagination.twbsPagination('destroy');
        $pagination.twbsPagination($.extend({}, defaultOptions, options));
        agregarEventosConvocatoriaPers();
        $('#txtNombreConvocatoriaPers').focus();
    } else {
        $pagination.twbsPagination('destroy');
        viewAlert('warning', 'No se enconntraron resultados');
    }
}

function agregarEventosConvocatoriaPers() {
    $('.editar-ConvocatoriaPers').each(function () {
        $(this).click(function () {
            $('#txtCoperIdER').val($(this.parentElement.parentElement).attr('coper_id'));
            $('#txtConvocatoriaER').val($(this.parentElement.parentElement).attr('convocatoria'));
            $('#txtSintesisER').val($(this.parentElement.parentElement).attr('descripcion'));
            $('#actionConvocatoriaPers').val('updateConvocatoriaPers');
            $('#txtTituloModalManConvocatoriaPers').html("EDITAR CONVOCATORIA PERSONAL");
            $('#ventanaManConvocatoriaPers').modal("show");
            document.getElementsByTagName("body")[0].style.paddingRight = "0";
        });
    });
    $('.eliminar-ConvocatoriaPers').each(function () {
        $(this).click(function () {
            $('#txtCoperIdER').val($(this.parentElement.parentElement).attr('coper_id'));
            viewAlertDelete("Convocatoria Personal", "ConvocatoriaPers");
            document.getElementsByTagName("body")[0].style.paddingRight = "0";
        });
    });

    $('.descargar-cv').each(function () {
        $(this).click(function () {
            viewAlert('warning', 'No se encontró la hoja de vida!');
        });
    });
}

function valicacionesCamposConvocatoriaPers() {
    $('#txtConvocatoriaER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtSintesisER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
}

function validarFormularioConvocatoriaPers() {
    if ($('#txtConvocatoriaER').val() === "") {
        $($('#txtConvocatoriaER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtSintesisER').val() === "") {
        $($('#txtSintesisER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    return true;
}

