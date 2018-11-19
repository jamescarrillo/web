$(document).ready(function () {

    cargarAniosCombo($('#comboAnio'), 2000, "-1", 'Todos');

    $('#txtFechaInicioERCC').datepicker({
        format: 'dd/mm/yyyy',
        todayHighlight: true,
        autoclose: true
    });

    $('#txtFechaFinERCC').datepicker({
        format: 'dd/mm/yyyy',
        todayHighlight: true,
        autoclose: true
    });

    $("#FrmConvocatoriaPers").submit(function () {
        $("#nameForm").val("FrmConvocatoriaPers");
        $("#numberPageConvocatoriaPers").val(1);
        $('#actionConvocatoriaPers').val("paginarConvocatoriaPers");
        $('#modalCargandoConvocatoriaPers').modal("show");
        return false;
    });

    $("#FrmPuestoConv").submit(function () {
        $("#nameFormPC").val("FrmPuestoConv");
        $("#numberPagePuestoConv").val(1);
        $('#actionPuestoConv').val("paginarPuestoConv");
        $('#modalCargandoPuestoConv').modal("show");
        return false;
    });

    $("#FrmCalendarioConv").submit(function () {
        $("#nameFormCC").val("FrmCalendarioConv");
        $("#numberPageCalendarioConv").val(1);
        $('#actionCalendarioConv').val("paginarCalendarioConv");
        $('#modalCargandoCalendarioConv').modal("show");
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

    $("#FrmPuestoConvModal").submit(function () {
        if (validarFormularioPuestoConv()) {
            $("#numberPagePuestoConv").val(1);
            $("#nameFormPC").val("FrmPuestoConvModal");
            $('#modalCargandoPuestoConv').modal("show");
            //viewAlert('warning', 'Estamos trabajando!');
        }
        return false;
    });

    $("#FrmCalendarioConvModal").submit(function () {
        if (validarFormularioCalendarioConv()) {
            $("#numberPageCalendarioConv").val(1);
            $("#nameFormCC").val("FrmCalendarioConvModal");
            $('#modalCargandoCalendarioConv').modal("show");
            //viewAlert('warning', 'Estamos trabajando!');
        }
        return false;
    });

    $("#FrmDocumentCalModal").submit(function () {
        if (validarFormularioDocumentCal()) {
            $("#numberPageDocumentCal").val(1);
            $("#nameFormDC").val("FrmDocumentCalModal");
            $('#modalCargandoDocumentCal').modal("show");
            //viewAlert('warning', 'Estamos trabajando!');
        }
        return false;
    });

    $("#FrmActividadModal").submit(function () {
        if (validarFormularioActividad()) {
            $("#nameFormAC").val("FrmActividadModal");
            $('#modalCargandoActividad').modal("show");
        }
        return false;
    });

    $("#modalCargandoConvocatoriaPers").on('shown.bs.modal', function () {
        //DESPUES DE TERMINAR DE MOSTRAR EL MODAL
        procesarAjaxConvocatoriaPers();
    });

    $("#modalCargandoCalendarioConv").on('shown.bs.modal', function () {
        //DESPUES DE TERMINAR DE MOSTRAR EL MODAL
        procesarAjaxCalendarioConv();
    });

    $("#modalCargandoActividad").on('shown.bs.modal', function () {
        //DESPUES DE TERMINAR DE MOSTRAR EL MODAL
        procesarAjaxActividad();
    });

    $("#modalCargandoPuestoConv").on('shown.bs.modal', function () {
        //DESPUES DE TERMINAR DE MOSTRAR EL MODAL
        procesarAjaxPuestoConv();
    });

    $("#modalCargandoDocumentCal").on('shown.bs.modal', function () {
        //DESPUES DE TERMINAR DE MOSTRAR EL MODAL
        procesarAjaxDocumentCal();
    });

    $("#ventanaManConvocatoriaPers").on('hidden.bs.modal', function () {
        $("#actionConvocatoriaPers").val("paginarConvocatoriaPers");
    });

    $("#ventanaManCalendarioConv").on('hidden.bs.modal', function () {
        $("#actionCalendarioConv").val("paginarCalendarioConv");
    });

    $("#ventanaManActividad").on('hidden.bs.modal', function () {
        $("#actionActividad").val("paginarActividad");
    });

    $("#ventanaManPuestoConv").on('hidden.bs.modal', function () {
        $("#actionPuestoConv").val("paginarPuestoConv");
    });

    $("#ventanaManDocumentCal").on('hidden.bs.modal', function () {
        $("#actionDocumentCal").val("paginarDocumentCal");
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

    $('#btnAbrirNuevoPuestoConv').click(function () {
        $('#FrmPuestoConvModal input').val("");
        $('#FrmConvocatoriaPersModal input').parent().removeClass("has-danger");
        $('#actionPuestoConv').val("addPuestoConv");
        $('#txtTituloModalManPuestoConv').html("REGISTRAR PLAZA");
        $('#ventanaManPuestoConv').modal("show");
        document.getElementsByTagName("body")[0].style.paddingRight = "0";
    });

    $('#btnAbrirNuevoCalendarioConv').click(function () {
        $('#FrmCalendarioConvModal input').val("");
        $('#FrmCalendarioConvModal select').val("-1");
        $('#FrmCalendarioConvModal input').parent().removeClass("has-danger");
        $('#FrmCalendarioConvModal select').parent().removeClass("has-danger");
        $('#actionCalendarioConv').val("addCalendarioConv");
        procesarAjaxActividad();
        $('#txtTituloModalManCalendarioConv').html("SELECIONAR ACTIVIDAD");
        $('#ventanaManCalendarioConv').modal("show");
        document.getElementsByTagName("body")[0].style.paddingRight = "0";
    });

    $('#comboActividadCC').change(function () {
        $('#txtActividadERAC').val($('#comboActividadCC option:selected').text());
        $('#txtActiIdERAC').val($('#comboActividadCC').val());
    });

    $('#btnAbrirNuevoActividad').click(function () {
        $('#FrmActividadModal input').val("");
        $('#FrmActividadModal input').parent().removeClass("has-danger");
        $('#actionActividad').val("addActividad");
        $('#txtTituloModalManActividad').html("REGISTRAR ACTIVIDAD");
        $('#ventanaManActividad').modal("show");
        document.getElementsByTagName("body")[0].style.paddingRight = "0";
    });

    $('#btnAbrirNuevoDocumentCal').click(function () {
        $('#FrmDocumentCalModal input').val("");
        $('#FrmDocumentCalModal input').parent().removeClass("has-danger");
        $('#actionDocumentCal').val("addDocumentCal");
        $('#txtTituloModalManDocumentCal').html("GUARDAR ARCHIVO");
        $('#ventanaManDocumentCal').modal("show");
        document.getElementsByTagName("body")[0].style.paddingRight = "0";
    });

    $('#btnEditarActividad').click(function () {
        $('#actionActividad').val("updateActividad");
        $('#FrmActividadModal input').parent().removeClass("has-danger");
        $('#txtTituloModalManActividad').html("ACTUALIZAR ACTIVIDAD");
        $('#ventanaManActividad').modal("show");
        document.getElementsByTagName("body")[0].style.paddingRight = "0";
    });

    $('#btnEliminarActividad').click(function () {
        viewAlertDelete("Actividad");
        $('.swal2-container').css('z-index', '2000');
        document.getElementsByTagName("body")[0].style.paddingRight = "0";
    });

    $('#btnSeleccionarArchivo').click(function () {
        $('#fileArchivo').trigger('click');
    });

    $("#fileArchivo").change(function () {
        //CAMPO QUE VALIDARA SI SELECCIONO FILE
        $('#txtValidacionArchivo').val('SI');
        readViewNameFile(this, 'txtNombreArchivoERDC');
        $('#txtNombreFileResultadoActual').val($('#txtNombreArchivoERDC').val());
    });

    addEventoCombosPaginar();
    valicacionesCamposConvocatoriaPers();
    valicacionesCamposCalendarioConv();
    valicacionesCamposActividad();
    valicacionesCamposPuestoConv();
    valicacionesCamposDocumentCal();
    $('#modalCargandoConvocatoriaPers').modal("show");

});

/// CONVOCATORIAS DE PERSONAL

function procesarAjaxConvocatoriaPers() {
    var datosSerializadosCompletos = $('#' + $('#nameForm').val()).serialize();
    if ($('#nameForm').val().toLowerCase() !== "frmconvocatoriapers") {
        //AGREGAMOS LOS PARAMETROS DEL FORMULARIO DE BUSQUEDA
        datosSerializadosCompletos += "&txtConvocatoriaPers=" + $('#txtConvocatoriaPers').val();
        datosSerializadosCompletos += "&comboAnio=" + $('#comboAnio').val();
        datosSerializadosCompletos += "&txtEstadoER=" + $('#txtEstadoER').val();
        datosSerializadosCompletos += "&comboTipoListaConvocatoriaPers=" + $('#comboTipoListaConvocatoriaPers').val();
    }
    datosSerializadosCompletos += "&numberPageConvocatoriaPers=" + $('#numberPageConvocatoriaPers').val();
    datosSerializadosCompletos += "&sizePageConvocatoriaPers=" + $('#sizePageConvocatoriaPers').val();
    datosSerializadosCompletos += "&action=" + $('#actionConvocatoriaPers').val();
    $.ajax({
        url: getContext() + '/convocatorias/personal',
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        success: function (jsonResponse) {
            $('#modalCargandoConvocatoriaPers').modal("hide");
            if ($('#actionConvocatoriaPers').val().toLowerCase() === "paginarconvocatoriapers") {
                listarConvocatoriaPers(jsonResponse.BEAN_PAGINATION);
            } else {
                if (jsonResponse.MESSAGE_SERVER.toLowerCase() === "ok") {
                    viewAlert('success', getMessageServerTransaction($('#actionConvocatoriaPers').val(), 'Convocatoria de Personal', 'o'));
                    listarConvocatoriaPers(jsonResponse.BEAN_PAGINATION);
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
            //text-center align-middle
            fila = "<tr ";
            fila += "coper_id='" + value.coper_id + "' ";
            fila += "descripcion='" + value.descripcion + "' ";
            fila += "convocatoria='" + value.convocatoria + "' ";
            fila += "estado='" + value.estado + "' ";
            fila += "fecha='" + value.fecha + "' ";
            fila += "anio='" + value.anho + "' ";
            fila += ">";
            fila += "<td class='text-center align-middle text-medium-table " + text_color + "'>" + value.fecha + "</td>";
            fila += "<td class='align-middle text-medium-table " + text_color + "'>" + value.convocatoria + "</td>";
            fila += "<td class='align-middle text-medium-table " + text_color + "'>" + value.descripcion + "</td>";
            fila += "<td class='align-middle text-medium-table " + text_color + "'><button class='btn btn-secondary btn-sm finalizar-activar' data-toggle='tooltip' title='" + tooltip + "' opcion='" + tooltip.toLowerCase() + "'><i class='" + icon + "'></i></button></td>";
            fila += "<td class='align-middle text-medium-table " + text_color + "'><button class='btn btn-secondary btn-sm editar-ConvocatoriaPers'><i class='fas fa-edit'></i></button></td>";
            fila += "<td class='align-middle text-medium-table " + text_color + "'><button class='btn btn-secondary btn-sm eliminar-ConvocatoriaPers'><i class='fas fa-trash-alt'></i></button></td>";
            fila += "<td class='align-middle text-medium-table " + text_color + "'><button class='btn btn-success btn-sm actividades' data-toggle='tooltip' title='Actividades'><i class='fas fa-calendar-alt'></i> ACTIVIDADES</button></td>";
            fila += "<td class='align-middle text-medium-table " + text_color + "'><button class='btn btn-success btn-sm plazas' data-toggle='tooltip' title='Plazas'><i class='fas fa-briefcase'></i> PLAZAS</button></td>";
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
        viewAlert('warning', 'No se encontraron resultados');
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
            viewAlertDelete("ConvocatoriaPers");
            document.getElementsByTagName("body")[0].style.paddingRight = "0";
        });
    });

    $('.actividades').each(function () {
        $(this).click(function () {
            $('#txtConvoPersIdER').val($(this.parentElement.parentElement).attr('coper_id'));
            $('#modalCargandoCalendarioConv').modal("show");
            $('#ventanaCalendarioConv').modal("show");
            $('#actionCalendarioConv').val("paginarCalendarioConv");
        });
    });

    $('.plazas').each(function () {
        $(this).click(function () {
            $('#txtCoperIdERPC').val($(this.parentElement.parentElement).attr('coper_id'));
            $('#modalCargandoPuestoConv').modal("show");
            $('#ventanaPuestoConv').modal("show");
            $('#actionPuestoConv').val("paginarPuestoConv");
        });
    });

    $('.finalizar-activar').each(function () {
        $(this).click(function () {
            $('#txtCoperIdER').val($(this.parentElement.parentElement).attr('coper_id'));
            $('#txtEstadoER').val($(this.parentElement.parentElement).attr('estado'));
            swal({
                title: 'PEAM',
                text: "¿Está seguro de " + $(this).attr('opcion') + " esta Convocatoria Personal?",
                type: 'warning',
                showCancelButton: true,
                confirmButtonText: 'Sí, continuar!',
                cancelButtonText: 'No, cancelar!',
                confirmButtonClass: 'btn btn-info',
                cancelButtonClass: 'btn btn-danger',
                buttonsStyling: false
            }).then((result) => {
                if (result.value) {
                    $('#actionConvocatoriaPers').val("activateConvocatoriaPers");
                    $("#nameForm").val("FrmConvocatoriaPersModal");
                    $('#modalCargandoConvocatoriaPers').modal("show");
                }
            });
            $('.swal2-confirm').css("margin-right", "15px");
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

//// CALENDARIO DE CONVOCATORIAS

function procesarAjaxCalendarioConv() {
    var datosSerializadosCompletos = $('#' + $('#nameFormCC').val()).serialize();
    if ($('#nameForm').val().toLowerCase() === "frmcalendarioconvmodal") {
        datosSerializadosCompletos += "&txtIdERCC=" + $('#txtIdERCC').val();
    }
    if ($('#nameFormCC').val().toLowerCase() !== "frmcalendarioconv") {
        //AGREGAMOS LOS PARAMETROS DEL FORMULARIO DE BUSQUEDA
        datosSerializadosCompletos += "&txtCalendarioConv=" + $('#txtCalendarioConv').val();
        datosSerializadosCompletos += "&comboAnio=" + $('#comboAnio').val();
        datosSerializadosCompletos += "&txtEstadoER=" + $('#txtEstadoER').val();
    }
    datosSerializadosCompletos += "&numberPageCalendarioConv=" + $('#numberPageCalendarioConv').val();
    datosSerializadosCompletos += "&sizePageCalendarioConv=" + $('#sizePageCalendarioConv').val();
    datosSerializadosCompletos += "&txtConvoPersIdER=" + $('#txtConvoPersIdER').val();
    datosSerializadosCompletos += "&action=" + $('#actionCalendarioConv').val();
    $.ajax({
        url: getContext() + '/convocatorias/personal',
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        success: function (jsonResponse) {
            $('#modalCargandoCalendarioConv').modal("hide");
            if ($('#actionCalendarioConv').val().toLowerCase() === "paginarcalendarioconv") {
                listarCalendarioConv(jsonResponse.BEAN_PAGINATION);
            } else {
                if (jsonResponse.MESSAGE_SERVER.toLowerCase() === "ok") {
                    viewAlert('success', getMessageServerTransaction($('#actionCalendarioConv').val(), 'Actividad', 'a'));
                    listarCalendarioConv(jsonResponse.BEAN_PAGINATION);
                } else {
                    viewAlert('warning', jsonResponse.MESSAGE_SERVER);
                }
            }
            $("#ventanaManCalendarioConv").modal("hide");
        },
        error: function () {
            $('#modalCargandoCalendarioConv').modal("hide");
            $("#ventanaManCalendarioConv").modal("hide");
            /*MOSTRAMOS MENSAJE ERROR SERVIDOR*/
            viewAlert('error', 'Error interno en el servidor!');
        }
    });
    return false;
}

function listarCalendarioConv(BEAN_PAGINATION) {
    /*PAGINATION*/
    var $pagination = $('#paginationCalendarioConv');
    $('#tbodyCalendarioConv').empty();
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
            //text-center align-middle
            fila = "<tr ";
            fila += "id='" + value.id + "' ";
            fila += "descripcion='" + value.acti_id.descripcion + "' ";
            fila += "acti_id='" + value.acti_id.acti_id + "' ";
            fila += "fecha_inicio='" + value.fecha_inicio + "' ";
            fila += "fecha_fin='" + value.fecha_fin + "' ";
            fila += "estado='" + value.estado + "' ";
            fila += "convo_id='" + value.convo_id + "' ";
            fila += "tipo='" + value.tipo + "' ";
            fila += ">";
            fila += "<td class='align-middle text-small-table" + text_color + "'>" + value.acti_id.descripcion + "</td>";
            fila += "<td class='align-middle text-small-table" + text_color + "'>" + value.fecha_inicio + "</td>";
            fila += "<td class='align-middle text-small-table" + text_color + "'>" + value.fecha_fin + "</td>";
            fila += "<td class='align-middle text-small-table" + text_color + "'><button class='btn btn-success btn-sm editar-Calendario' data-toggle='tooltip' title='Editar Actividad'><i class='fas fa-edit'></i></button></td>";
            fila += "<td class='align-middle text-small-table" + text_color + "'><button class='btn btn-success btn-sm eliminar-Calendario' data-toggle='tooltip' title='Eliminar Actividad'><i class='fas fa-trash-alt'></i></button></td>";
            fila += "<td class='align-middle text-small-table" + text_color + "'><button class='btn btn-success btn-sm archivos' data-toggle='tooltip' title='Adminstra archivos'><i class='fa fa-download'></i>ARCHIVOS</button></td>";
            fila += "</tr>";
            $('#tbodyCalendarioConv').append(fila);
        });
        var defaultOptions = getDefaultOptionsPagination();
        var options = getOptionsPagination(BEAN_PAGINATION.COUNT_FILTER, $('#sizePageCalendarioConv'),
                $('#numberPageCalendarioConv'), $('#actionCalendarioConv'), 'paginarCalendarioConv',
                $('#nameFormCC'), 'FrmCalendarioConv', $('#modalCargandoCalendarioConv'));
        $pagination.twbsPagination('destroy');
        $pagination.twbsPagination($.extend({}, defaultOptions, options));
        agregarEventosCalendarioConv();
        $('#txtNombreCalendarioConv').focus();
    } else {
        $pagination.twbsPagination('destroy');
        viewAlert('warning', 'No se encontraron resultados');
        $('#tbodyCalendarioConv').empty();
    }
}

function agregarEventosCalendarioConv() {
    $('.archivos').each(function () {
        $(this).click(function () {
            $('#txtCalendarioId').val($(this.parentElement.parentElement).attr('id'));
            $('#titulosArchivos').html($(this.parentElement.parentElement).attr('descripcion'));
            $('#modalCargandoDocumentCal').modal("show");
            $('#ventanaDocumentCal').modal("show");
            $('#actionDocumentCal').val("paginarDocumentCal");

            document.getElementsByTagName("body")[0].style.paddingRight = "0";
        });
    });

    $('.editar-Calendario').each(function () {
        $(this).click(function () {
            $('#txtIdERCC').val($(this.parentElement.parentElement).attr('id'));
            $('#txtFechaInicioERCC').datepicker('setDate', getDateJS($(this.parentElement.parentElement).attr('fecha_inicio')));
            $('#txtFechaFinERCC').datepicker('setDate', getDateJS($(this.parentElement.parentElement).attr('fecha_fin')));
            $('#nameFormAC').val("FrmActividadCalendario");
            $('#actionActividad').val("paginarActividad");
            procesarAjaxActividad();
            $('#actionCalendarioConv').val('updateCalendarioConv');
            $('#txtTituloModalManCalendarioConv').html("EDITAR ACTIVIDAD");
            $('#FrmCalendarioConvModal input').parent().removeClass("has-danger");
            $('#FrmCalendarioConvModal select').parent().removeClass("has-danger");
            $('#ventanaManCalendarioConv').modal("show");
            $('#comboActividadCC').val($(this.parentElement.parentElement).attr('acti_id'));
            document.getElementsByTagName("body")[0].style.paddingRight = "0";
        });
    });

    $('.eliminar-Calendario').each(function () {
        $(this).click(function () {
            $('#txtIdERCC').val($(this.parentElement.parentElement).attr('id'));
            viewAlertDelete("CalendarioConv");
            document.getElementsByTagName("body")[0].style.paddingRight = "0";
        });
    });
}

function valicacionesCamposCalendarioConv() {
    $('#txtFechaInicioERCC').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtFechaFinERCC').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#comboActividadCC').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
}

function validarFormularioCalendarioConv() {
    if ($('#txtFechaInicioERCC').val() === "") {
        $($('#txtFechaInicioERCC').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtFechaFinERCC').val() === "") {
        $($('#txtFechaFinERCC').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#comboActividadCC').val() === "-1") {
        $($('#comboActividadCC').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    return true;
}

/// ACTIVIDADES

function procesarAjaxActividad() {
    var datosSerializadosCompletos = $('#' + $('#nameFormAC').val()).serialize();
    datosSerializadosCompletos += "&txtConvoPersIdER=" + $('#txtConvoPersIdER').val();
    if ($('#nameFormAC').val().toLowerCase() === "frmactividadcalendario") {
        datosSerializadosCompletos += "&txtEditar=true";
    } else {
        datosSerializadosCompletos += "&txtEditar=false";
    }
    if ($('#nameForm').val().toLowerCase() === "frmactividadmodal") {
        datosSerializadosCompletos += "&txtActiIdERAC=" + $('#txtActiIdERAC').val();
    }
    datosSerializadosCompletos += "&action=" + $('#actionActividad').val();
    $.ajax({
        url: getContext() + '/convocatorias/personal',
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        success: function (jsonResponse) {
            $('#modalCargandoActividad').modal("hide");
            if ($('#actionActividad').val().toLowerCase() === "paginaractividad") {
                $('#comboActividadCC').empty();
                listarActividad(jsonResponse.BEAN_PAGINATION);
            } else {
                if (jsonResponse.MESSAGE_SERVER.toLowerCase() === "ok") {
                    $('#comboActividadCC').empty();
                    listarActividad(jsonResponse.BEAN_PAGINATION);
                    viewAlert('success', getMessageServerTransaction($('#actionActividad').val(), 'Actividad', 'a'));
                    $('.swal2-container').css('z-index', '2000');
                } else {
                    viewAlert('warning', jsonResponse.MESSAGE_SERVER);
                    $('.swal2-container').css('z-index', '2000');
                }
            }
            $("#ventanaManActividad").modal("hide");
            $('#nameFormAC').val("FrmActividadModal");
        },
        error: function () {
            $('#modalCargandoActividad').modal("hide");
            $("#ventanaManActividad").modal("hide");
            /*MOSTRAMOS MENSAJE ERROR SERVIDOR*/
            viewAlert('error', 'Error interno en el servidor!');
        }
    });
    return false;
}

function listarActividad(BEAN_PAGINATION) {
    $('#tbodyActividad').empty();
    if (BEAN_PAGINATION.COUNT_FILTER > 0) {
        var fila;
        $('#comboActividadCC').append("<option value='-1'>Seleccione ...</option>");
        $.each(BEAN_PAGINATION.LIST, function (index, value) {
            //text-center align-middle
            fila = "<option value='" + value.acti_id + "'>" + value.descripcion + "</option>";
            $('#comboActividadCC').append(fila);
        });
        $('#txtNombreActividad').focus();
    } else {
        viewAlert('warning', 'No se encontraron resultados');
        $('#comboActividadCC').empty();
    }
}

function valicacionesCamposActividad() {
    $('#txtActividadERAC').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
}

function validarFormularioActividad() {
    if ($('#txtActividadERAC').val() === "") {
        $($('#txtActividadERAC').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    return true;
}

/// PUESTO DE CONVOCATORIAS

function procesarAjaxPuestoConv() {
    var datosSerializadosCompletos = $('#' + $('#nameFormPC').val()).serialize();
    if ($('#nameForm').val().toLowerCase() === "frmpuestoconvmodal") {
        datosSerializadosCompletos += "&txtPues_IdER=" + $('#txtPues_IdER').val();
    }
    if ($('#nameFormPC').val().toLowerCase() !== "frmpuestoconv") {
        //AGREGAMOS LOS PARAMETROS DEL FORMULARIO DE BUSQUEDA
        datosSerializadosCompletos += "&txtPuestoConv=" + $('#txtPuestoConv').val();
    }
    datosSerializadosCompletos += "&txtCoperIdERPC=" + $('#txtCoperIdERPC').val();
    datosSerializadosCompletos += "&action=" + $('#actionPuestoConv').val();
    $.ajax({
        url: getContext() + '/convocatorias/personal',
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        success: function (jsonResponse) {
            $('#modalCargandoPuestoConv').modal("hide");
            if ($('#actionPuestoConv').val().toLowerCase() === "paginarpuestoconv") {
                listarPuestoConv(jsonResponse.BEAN_PAGINATION);
            } else {
                if (jsonResponse.MESSAGE_SERVER.toLowerCase() === "ok") {
                    viewAlert('success', getMessageServerTransaction($('#actionPuestoConv').val(), 'Plaza', 'a'));
                    listarPuestoConv(jsonResponse.BEAN_PAGINATION);
                } else {
                    viewAlert('warning', jsonResponse.MESSAGE_SERVER);
                }
            }
            $("#ventanaManPuestoConv").modal("hide");
        },
        error: function () {
            $('#modalCargandoPuestoConv').modal("hide");
            $("#ventanaManPuestoConv").modal("hide");
            /*MOSTRAMOS MENSAJE ERROR SERVIDOR*/
            viewAlert('error', 'Error interno en el servidor!');
        }
    });
    return false;
}

function listarPuestoConv(BEAN_PAGINATION) {
    $('#tbodyPuestoConv').empty();
    if (BEAN_PAGINATION.COUNT_FILTER > 0) {
        var fila;
        $.each(BEAN_PAGINATION.LIST, function (index, value) {
            //text-center align-middle
            fila = "<tr ";
            fila += "pues_id='" + value.pues_id + "' ";
            fila += "cargo='" + value.cargo + "' ";
            fila += "entidad='" + value.entidad + "' ";
            fila += "modalidad='" + value.modaidad + "' ";
            fila += "nroplaza='" + value.nroplaza + "' ";
            fila += "ingre_mensual='" + value.ingre_mensual + "' ";
            fila += "estado='" + value.estado + "' ";
            fila += "coper_id='" + value.coper_id.coper_id + "' ";
            fila += ">";
            fila += "<td class='align-middle text-medium-table' >" + value.cargo + "</td>";
            fila += "<td class='text-center align-middle text-medium-table' >" + value.ingre_mensual + "</td>";
            fila += "<td class='text-center align-middle text-medium-table' >" + value.modaidad + "</td>";
            fila += "<td class='text-center align-middle text-medium-table' >" + value.nroplaza + "</td>";
            fila += "<td class='align-middle'><button class='btn btn-success btn-sm editar-Plaza' data-toggle='tooltip' title='Editar Plaza'><i class='fas fa-edit'></i></button></td>";
            fila += "<td class='align-middle'><button class='btn btn-success btn-sm eliminar-Plaza' data-toggle='tooltip' title='Eliminar Plaza'><i class='fas fa-trash-alt'></i></button></td>";
            fila += "</tr>";
            $('#tbodyPuestoConv').append(fila);
        });

        agregarEventosPuestoConv();
        $('#txtNombrePuestoConv').focus();
    } else {

        viewAlert('warning', 'No se encontraron resultados');
        $('#tbodyPuestoConv').empty();
    }
}

function agregarEventosPuestoConv() {
    $('.editar-Plaza').each(function () {
        $(this).click(function () {
            $('#txtPues_IdER').val($(this.parentElement.parentElement).attr('pues_id'));
            $('#txtCargoERPC').val($(this.parentElement.parentElement).attr('cargo'));
            $('#txtIngreMensualERPC').val($(this.parentElement.parentElement).attr('ingre_mensual'));
            $('#txtModalidadERPC').val($(this.parentElement.parentElement).attr('modalidad'));
            $('#txtNroPlazaERPC').val($(this.parentElement.parentElement).attr('nroplaza'));
            $('#txtCoperIdERPC').val($(this.parentElement.parentElement).attr('coper_id'));
            $('#actionPuestoConv').val('updatePuestoConv');
            $('#txtTituloModalManPuestoConv').html("EDITAR PLAZA");
            $('#ventanaManPuestoConv').modal("show");
            document.getElementsByTagName("body")[0].style.paddingRight = "0";
        });
    });

    $('.eliminar-Plaza').each(function () {
        $(this).click(function () {
            $('#txtPues_IdER').val($(this.parentElement.parentElement).attr('pues_id'));
            viewAlertDelete("PuestoConv");
            document.getElementsByTagName("body")[0].style.paddingRight = "0";
        });
    });
}

function valicacionesCamposPuestoConv() {
    $('#txtCargoERPC').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtIngreMensualERPC').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtModalidadERPC').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtNroPlazaERPC').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
}

function validarFormularioPuestoConv() {
    if ($('#txtCargoERPC').val() === "") {
        $($('#txtCargoERPC').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtIngreMensualERPC').val() === "") {
        $($('#txtIngreMensualERPC').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtModalidadERPC').val() === "") {
        $($('#txtModalidadERPC').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtNroPlazaERPC').val() === "") {
        $($('#txtNroPlazaERPC').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    return true;
}

/// ARCHIVOS 


function procesarAjaxDocumentCal() {
    var form = $('#' + $('#nameFormDC').val())[0];
    var data = new FormData(form);
    data.append('txtCalendarioId', $('#txtCalendarioId').val());
    data.append('action', $('#actionDocumentCal').val());
    $.ajax({
        url: getContext() + '/convocatorias/personal',
        type: 'POST',
        data: data,
        dataType: 'json',
        enctype: 'multipart/form-data',
        processData: false,
        contentType: false,
        cache: false,
        timeout: 600000,
        success: function (jsonResponse) {
            $('#modalCargandoDocumentCal').modal("hide");
            if ($('#actionDocumentCal').val().toLowerCase() === "paginardocumentcal") {
                listarDocumentCal(jsonResponse.BEAN_PAGINATION);
            } else {
                if (jsonResponse.MESSAGE_SERVER.toLowerCase() === "ok") {
                    listarDocumentCal(jsonResponse.BEAN_PAGINATION);
                    viewAlert('success', getMessageServerTransaction($('#actionDocumentCal').val(), 'Archivo', 'o'));
                } else {
                    viewAlert('warning', jsonResponse.MESSAGE_SERVER);
                }
            }
            $("#ventanaManDocumentCal").modal("hide");
        },
        error: function () {
            $('#modalCargandoDocumentCal').modal("hide");
            $("#ventanaManDocumentCal").modal("hide");
            /*MOSTRAMOS MENSAJE ERROR SERVIDOR*/
            viewAlert('error', 'Error interno en el servidor!');
        }
    });
    return false;
}

function listarDocumentCal(BEAN_PAGINATION) {
    $('#tbodyDocumentCal').empty();
    if (BEAN_PAGINATION.COUNT_FILTER > 0) {
        var fila;
        $.each(BEAN_PAGINATION.LIST, function (index, value) {
            //text-center align-middle
            fila = "<tr ";
            fila += "doco_id='" + value.doco_id + "' ";
            fila += "nombre='" + value.nombre + "' ";
            fila += "url_file='" + value.url_file + "' ";
            fila += "estado='" + value.estado + "' ";
            fila += "id='" + value.id.id + "' ";
            fila += ">";
            fila += "<td class='align-middle text-medium-table' >" + value.nombre + "</td>";
            fila += "<td class='text-center align-middle text-medium-table' >" + value.url_file + "</td>";
            fila += "<td class='text-center align-middle'><button class='btn btn-success btn-sm eliminar-Archivo' data-toggle='tooltip' title='Eliminar Archivo'><i class='fas fa-trash-alt'></i></button></td>";
            fila += "</tr>";
            $('#tbodyDocumentCal').append(fila);
        });

        agregarEventosDocumentCal();
        $('#txtNombreDocumentCal').focus();
    } else {

        viewAlert('warning', 'No se encontraron resultados');
        $('#tbodyDocumentCal').empty();
    }
}

function agregarEventosDocumentCal() {
    $('.eliminar-Archivo').each(function () {
        $(this).click(function () {
            $('#txtDoco_IdER').val($(this.parentElement.parentElement).attr('doco_id'));
            viewAlertDelete("DocumentCal");
            document.getElementsByTagName("body")[0].style.paddingRight = "0";
        });
    });
}

function valicacionesCamposDocumentCal() {
    $('#txtNombreERDC').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtNombreFileResultadoActual').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
}

function validarFormularioDocumentCal() {
    if ($('#txtNombreERDC').val() === "") {
        $($('#txtNombreERDC').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtNombreFileResultadoActual').val() === "") {
        $($('#txtNombreFileResultadoActual').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }

    return true;
}
