$(document).ready(function () {

    $('#txtCalendario').datepicker({
        format: 'dd/mm/yyyy',
        todayHighlight: true,
        autoclose: true
    });

    $('#datePickerFechaER').datepicker({
        format: 'dd/mm/yyyy',
        todayHighlight: true,
        autoclose: true
    });
    
    iniciar();
    $('#comboFecha').on('change', function () {
        var date = new Date();
        switch ($('#comboFecha').val()) {
            case "dia":
                $('#tFecha').val(date.getDay());
                break;
            case "mes":
                $('#tFecha').val(date.getMonth() + 1);
                break;
            case "anho":
                $('#tFecha').val(date.getFullYear());
                break;
        }
    });

    $("#FrmAgenda").submit(function () {
        $("#nameForm").val("FrmAgenda");
        $("#numberPageAgenda").val(1);
        $('#actionAgenda').val("paginarAgenda");
        $('#modalCargandoAgenda').modal("show");
        return false;
    });

    $("#FrmAgendaModal").submit(function () {
        if (validarFormularioAgenda()) {
            $("#numberPageAgenda").val(1);
            $("#nameForm").val("FrmAgendaModal");
            $('#modalCargandoAgenda').modal("show");
            //viewAlert('warning', 'Estamos trabajando!');
        }
        return false;
    });

    $("#modalCargandoAgenda").on('shown.bs.modal', function () {
        //DESPUES DE TERMINAR DE MOSTRAR EL MODAL
        procesarAjaxAgenda();
    });

    $("#ventanaManAgenda").on('hidden.bs.modal', function () {
        $("#actionAgenda").val("paginarAgenda");
    });

    $('#btnAbrirNuevoAgenda').click(function () {
        $('#FrmAgendaModal input').val("");
        $('#FrmAgendaModal textarea').val("");
        $('#FrmAgendaModal select').val("-1");
        $('#FrmAgendaModal input').parent().removeClass("has-danger");
        $('#FrmAgendaModal select').parent().removeClass("has-danger");
        $('#actionAgenda').val("addAgenda");
        $('#txtTituloModalManAgenda').html("REGISTRAR ACTIVIDAD");
        $('#ventanaManAgenda').modal("show");
        document.getElementsByTagName("body")[0].style.paddingRight = "0";
    });

    addEventoCombosPaginar();
    valicacionesCamposAgenda();
    $('#modalCargandoAgenda').modal("show");

});

function iniciar(){
    var date = new Date();
        switch ($('#comboFecha').val()) {
            case "dia":
                $('#tFecha').val(date.getDay());
                break;
            case "mes":
                $('#tFecha').val(date.getMonth() + 1);
                break;
            case "anho":
                $('#tFecha').val(date.getFullYear());
                break;
        }
}

function procesarAjaxAgenda() {
    var pathname = window.location.pathname;
    pathname = pathname.substring(getContext().length, pathname.length);
    var datosSerializadosCompletos = $('#' + $('#nameForm').val()).serialize();
    if ($('#nameForm').val().toLowerCase() !== "frmagenda") {
        //AGREGAMOS LOS PARAMETROS DEL FORMULARIO DE BUSQUEDA
        datosSerializadosCompletos += "&txtActividad=" + $('#txtActividad').val();
        datosSerializadosCompletos += "&comboFecha=" + $('#comboFecha').val();
        datosSerializadosCompletos += "&txtEstadoER=" + $('#txtEstadoER').val();
        datosSerializadosCompletos += "&txtCalendario=" + $('#txtCalendario').val();
        datosSerializadosCompletos += "&tFecha=" + $('#tFecha').val();
        datosSerializadosCompletos += "&comboTipoListaAgenda=" + $('#comboTipoListaAgenda').val();
    }
    datosSerializadosCompletos += "&numberPageAgenda=" + $('#numberPageAgenda').val();
    datosSerializadosCompletos += "&sizePageAgenda=" + $('#sizePageAgenda').val();
    datosSerializadosCompletos += "&action=" + $('#actionAgenda').val();
    datosSerializadosCompletos += "&urlAgenda=" + pathname;
    $.ajax({
        url: getContext() + '/agendainstitucional/operaciones',
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        success: function (jsonResponse) {
            $('#modalCargandoAgenda').modal("hide");
            if ($('#actionAgenda').val().toLowerCase() === "paginaragenda") {
                listarAgenda(jsonResponse.BEAN_PAGINATION);
            } else {
                if (jsonResponse.MESSAGE_SERVER.toLowerCase() === "ok") {
                    viewAlert('success', getMessageServerTransaction($('#actionAgenda').val(), 'Agenda', 'a'));
                    listarAgenda(jsonResponse.BEAN_PAGINATION);
                } else {
                    viewAlert('warning', jsonResponse.MESSAGE_SERVER);
                }
            }
            $("#ventanaManAgenda").modal("hide");
        },
        error: function () {
            $('#modalCargandoAgenda').modal("hide");
            $("#ventanaManAgenda").modal("hide");
            /*MOSTRAMOS MENSAJE ERROR SERVIDOR*/
            viewAlert('error', 'Error interno en el servidor!');
        }
    });
    return false;
}

function listarAgenda(BEAN_PAGINATION) {
    /*PAGINATION*/
    var $pagination = $('#paginationAgenda');
    $('#tbodyAgenda').empty();
    if (BEAN_PAGINATION.COUNT_FILTER > 0) {
        var fila;
        var text_color;
        var icon;
        var tooltip;
        $.each(BEAN_PAGINATION.LIST, function (index, value) {
            if (!value.estado) {
                text_color = "text-danger";
                icon = "far fa-hand-point-up";
                tooltip = "Activar";
            } else {
                text_color = "";
                icon = "far fa-hand-point-down";
                tooltip = "Finalizar";
            }
            fila = "<tr ";
            fila += "id='" + value.id + "' ";
            fila += "fecha_inicio='" + value.fecha_inicio + "' ";
            fila += "hora_inicio='" + value.hora_inicio + "' ";
            fila += "hora_final='" + value.hora_final + "' ";
            fila += "actividad='" + value.actividad + "' ";
            fila += "ciudad='" + value.ciudad + "' ";
            fila += "lugar='" + value.lugar + "' ";
            fila += "tipo='" + value.tipo + "' ";
            fila += "estado='" + value.estado + "' ";
            fila += ">";
            fila += "<td class='text-center align-middle " + text_color + "'>" + value.hora_inicio + "</td>";
            fila += "<td class='align-middle " + text_color + "'>" + value.fecha_inicio + "</td>";
            fila += "<td class='align-middle " + text_color + "'>" + value.actividad + "</td>";
            fila += "<td class='align-middle " + text_color + "'>" + value.ciudad + "</td>";
            fila += "<td class='align-middle " + text_color + "'>" + value.lugar + "</td>";
            fila += "<td class='align-middle " + text_color + "'><button class='btn btn-secondary btn-sm finalizar-activar' data-toggle='tooltip' title='" + tooltip + "' opcion='" + tooltip.toLowerCase() + "'><i class='" + icon + "'></i></button></td>";
            fila += "<td class='align-middle " + text_color + "'><button class='btn btn-secondary btn-sm editar-Agenda'><i class='fas fa-edit'></i></button></td>";
            fila += "<td class='align-middle " + text_color + "'><button class='btn btn-secondary btn-sm eliminar-Agenda'><i class='fas fa-trash-alt'></i></button></td>";
            fila += "</tr>";
            $('#tbodyAgenda').append(fila);
        });
        var defaultOptions = getDefaultOptionsPagination();
        var options = getOptionsPagination(BEAN_PAGINATION.COUNT_FILTER, $('#sizePageAgenda'),
                $('#numberPageAgenda'), $('#actionAgenda'), 'paginarAgenda',
                $('#nameForm'), 'FrmAgenda', $('#modalCargandoAgenda'));
        $pagination.twbsPagination('destroy');
        $pagination.twbsPagination($.extend({}, defaultOptions, options));
        agregarEventosAgenda();
        $('#txtNombreAgenda').focus();
    } else {
        $pagination.twbsPagination('destroy');
        viewAlert('warning', 'No se enconntraron resultados');
    }
}

function agregarEventosAgenda() {
    $('.editar-Agenda').each(function () {
        $(this).click(function () {
            $('#txtIdER').val($(this.parentElement.parentElement).attr('id'));
            $('#datePickerFechaER').datepicker('setDate', getDateJS($(this.parentElement.parentElement).attr('fecha_inicio')));
            $('#txtHoraInicioER').val($(this.parentElement.parentElement).attr('hora_inicio'));
            $('#txtHoraFinER').val($(this.parentElement.parentElement).attr('hora_final'));
            $('#txtActividadER').val($(this.parentElement.parentElement).attr('actividad'));
            $('#txtCiudadER').val($(this.parentElement.parentElement).attr('ciudad'));
            $('#txtLugarER').val($(this.parentElement.parentElement).attr('lugar'));
            $('#actionAgenda').val('updateAgenda');
            $('#txtTituloModalManAgenda').html("EDITAR ACTIVIDAD");
            $('#ventanaManAgenda').modal("show");
            document.getElementsByTagName("body")[0].style.paddingRight = "0";
        });
    });
    $('.eliminar-Agenda').each(function () {
        $(this).click(function () {
            $('#txtIdER').val($(this.parentElement.parentElement).attr('id'));
            viewAlertDelete("Agenda");
            document.getElementsByTagName("body")[0].style.paddingRight = "0";
        });
    });
    $('.finalizar-activar').each(function () {
        $(this).click(function () {
            $('#txtIdER').val($(this.parentElement.parentElement).attr('id'));
            $('#txtEstadoER').val($(this.parentElement.parentElement).attr('estado'));
            swal({
                title: 'PEAM',
                text: "¿Está seguro de " + $(this).attr('opcion') + " esta Actividad?",
                type: 'warning',
                showCancelButton: true,
                confirmButtonText: 'Sí, continuar!',
                cancelButtonText: 'No, cancelar!',
                confirmButtonClass: 'btn btn-info',
                cancelButtonClass: 'btn btn-danger',
                buttonsStyling: false
            }).then((result) => {
                if (result.value) {
                    $('#actionAgenda').val("activateAgenda");
                    $("#nameForm").val("FrmAgendaModal");
                    $('#modalCargandoAgenda').modal("show");
                }
            });
            $('.swal2-confirm').css("margin-right", "15px");
        });
    });
}

function valicacionesCamposAgenda() {
    $('#datePickerFechaER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtHoraInicioER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtHoraFinER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtActividadER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtCiudadER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtLugarER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
}

function validarFormularioAgenda() {
    if ($('#datePickerFechaER').val() === "") {
        $($('#datePickerFechaER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtHoraInicioER').val() === "") {
        $($('#txtHoraInicioER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtHoraFinER').val() === "") {
        $($('#txtHoraFinER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtActividadER').val() === "") {
        $($('#txtActividadER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtCiudadER').val() === "") {
        $($('#txtCiudadER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtLugarER').val() === "") {
        $($('#txtLugarER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    return true;
}


