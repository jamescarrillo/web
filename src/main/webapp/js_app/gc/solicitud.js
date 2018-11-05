$(document).ready(function () {

    $('#txtFechaER').datepicker({
        format: 'dd/mm/yyyy',
        todayHighlight: true,
        autoclose: true
    });

    cargarAniosCombo($('#comboAnio'), 2000, "-1", 'AÑO');

    $("#FrmSolicitud").submit(function () {
        $("#nameForm").val("FrmSolicitud");
        $("#numberPageSolicitud").val(1);
        $('#actionSolicitud').val("paginarSolicitud");
        $('#modalCargandoSolicitud').modal("show");
        return false;
    });

    $("#FrmSolicitudModal").submit(function () {
        if (validarFormularioSolicitud()) {
            $("#numberPageSolicitud").val(1);
            $("#nameForm").val("FrmSolicitudModal");
            $('#modalCargandoSolicitud').modal("show");
        }
        return false;
    });

    $("#modalCargandoSolicitud").on('shown.bs.modal', function () {
        //DESPUES DE TERMINAR DE MOSTRAR EL MODAL
        procesarAjaxSolicitud();
    });

    $("#ventanaManSolicitud").on('hidden.bs.modal', function () {
        $("#actionSolicitud").val("paginarSolicitud");
    });

    addEventoCombosPaginar();
    valicacionesCamposSolicitud();
    $('#modalCargandoSolicitud').modal("show");

});

function procesarAjaxSolicitud() {
    var datosSerializadosCompletos = $('#' + $('#nameForm').val()).serialize();
    if ($('#nameForm').val().toLowerCase() !== "frmsolicitud") {
        //AGREGAMOS LOS PARAMETROS DEL FORMULARIO DE BUSQUEDA
        datosSerializadosCompletos += "&txtSolicitud=" + $('#txtSolicitud').val();
        datosSerializadosCompletos += "&comboAnio=" + $('#comboAnio').val();
        datosSerializadosCompletos += "&comboTipoListaSolicitud=" + $('#comboTipoListaSolicitud').val();
    }
    datosSerializadosCompletos += "&numberPageSolicitud=" + $('#numberPageSolicitud').val();
    datosSerializadosCompletos += "&sizePageSolicitud=" + $('#sizePageSolicitud').val();
    datosSerializadosCompletos += "&action=" + $('#actionSolicitud').val();
    $.ajax({
        url: getContext() + '/participacionciudadana/solicitudes',
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        success: function (jsonResponse) {
            $('#modalCargandoSolicitud').modal("hide");
            if ($('#actionSolicitud').val().toLowerCase() === "paginarsolicitud") {
                listarSolicitud(jsonResponse.BEAN_PAGINATION);
            } else {
                if (jsonResponse.MESSAGE_SERVER.toLowerCase() === "ok") {
                    if ($('#actionSolicitud').val().toLowerCase()==="revisarsolicitud") {
                        viewAlert('success',"Solicitud Atendida Correctamente");
                    }else{
                        viewAlert('success', getMessageServerTransaction($('#actionSolicitud').val(), 'Solicitud', 'a'));
                    }
                    listarSolicitud(jsonResponse.BEAN_PAGINATION);
                } else {
                    viewAlert('warning', jsonResponse.MESSAGE_SERVER);
                }
            }
            $("#ventanaManSolicitud").modal("hide");
        },
        error: function () {
            $('#modalCargandoSolicitud').modal("hide");
            $("#ventanaManSolicitud").modal("hide");
            /*MOSTRAMOS MENSAJE ERROR SERVIDOR*/
            viewAlert('error', 'Error interno en el servidor!');
        }
    });
    return false;
}

function listarSolicitud(BEAN_PAGINATION) {
    /*PAGINATION*/
    var $pagination = $('#paginationSolicitud');
    $('#containerComentarios').empty();
    if (BEAN_PAGINATION.COUNT_FILTER > 0) {
        var atributosSolicitud;
        var card;
        var textColor;
        var labelColor;
        var resp;
        var formato;
        $.each(BEAN_PAGINATION.LIST, function (index, value) {
            if (value.fecha_atendido === "") {
                resp = "Aún sin atender";
                labelColor = "label-light-info";
                textColor = "text-danger";
            } else {
                resp = "Ya se atendió. El "+value.fecha_atendido+". ";
                labelColor = "label-light-success";
                textColor = "";
            }
            switch (value.forma) {
                case 1:
                    formato="COPIA SIMPLE";
                    break;
                case 2:
                    formato="COPIA FEDATEADA";
                    break;
                case 3:
                    formato="CD";
                    break;
                case 4:
                    formato="E_MAIL";
                    break;
                case 5:
                    formato="OTRO";
                    break;
                case null:
                    formato="OTRO";
                    break;
            }
            atributosSolicitud = "id='" + value.soli_id + "' ";
            atributosSolicitud += "anho='" + value.anho + "' ";
            atributosSolicitud += "usuario='" + value.usuario + "' ";
            atributosSolicitud += "dni='" + value.dni + "' ";
            atributosSolicitud += "dependencia='" + value.dependencia + "' ";
            atributosSolicitud += "direccion='" + value.domicilio + "' ";
            atributosSolicitud += "telefono='" + value.telefono + "' ";
            atributosSolicitud += "e_mail='" + value.correo + "' ";
            atributosSolicitud += "descripcion='" + value.descripcion + "' ";
            atributosSolicitud += "fecha_registro='" + value.fecha_registro + "' ";
            atributosSolicitud += "fecha_atendido='" + value.fecha_atendido + "' ";
            atributosSolicitud += "forma='" + formato + "' ";
            atributosSolicitud += "estado='" + value.estado + "' ";

            card = "<div class='d-flex flex-row comment-row'>";

            card += "<div class='comment-text w-100'>";
            card += "<h5>" + value.usuario + "</h5>";
            card += "<p class='m-b-5'>" + value.descripcion + "</p>";
            card += "<div class='comment-footer' " + atributosSolicitud + ">";
            card += "<span class='text-muted pull-right mr-2'>" + value.fecha_registro + "</span>";
            card += "<span class='label " + labelColor + "'>" + resp + "</span>";
            card += "<span class='action-icons'>";
            card += "<a style='cursor:pointer' class='link mr-2 btn-imprimir-np' data-toggle='tooltip' title='imprimir' data-original-title='Editar'><i class='fas fa-print'></i></a>";
            card += "<a style='cursor:pointer' class='link mr-2 btn-editar-np' data-toggle='tooltip' title='Atender' data-original-title='Editar'><i class='fas fa-reply'></i></a>";
            card += "<a style='cursor:pointer' class='link btn-eliminar-np' data-toggle='tooltip' title='Eliminar' data-original-title='Eliminar'><i class='fas fa-trash-alt'></i></a>";

            card += "</span>";

            card += "</div>";

            card += "</div>";

            card += "</div>";

            $('#containerComentarios').append(card);
        });
        var defaultOptions = getDefaultOptionsPagination();
        var options = getOptionsPagination(BEAN_PAGINATION.COUNT_FILTER, $('#sizePageSolicitud'),
                $('#numberPageSolicitud'), $('#actionSolicitud'), 'paginarSolicitud',
                $('#nameForm'), 'FrmSolicitud', $('#modalCargandoSolicitud'));
        $pagination.twbsPagination('destroy');
        $pagination.twbsPagination($.extend({}, defaultOptions, options));
        agregarEventosSolicitud();
        $('#txtNombreSolicitud').focus();
    } else {
        $pagination.twbsPagination('destroy');
        viewAlert('warning', 'No se enconntraron resultados');
    }
}

function agregarEventosSolicitud() {

    $('.btn-editar-np').each(function () {
        $(this).click(function () {
            $('#txtSoli_IdER').val($(this.parentElement.parentElement).attr('id'));
            $('#txtFechaER').val($(this.parentElement.parentElement).attr('fecha_registro'));
            $('#txtUsuarioER').val($(this.parentElement.parentElement).attr('usuario'));
            $('#txtEmailER').val($(this.parentElement.parentElement).attr('e_mail'));
            $('#txtTelefonoER').val($(this.parentElement.parentElement).attr('telefono'));
            $('#txtDomicilioER').val($(this.parentElement.parentElement).attr('direccion'));
            $('#txtDniER').val($(this.parentElement.parentElement).attr('dni'));
            $('#txtDependenciaER').val($(this.parentElement.parentElement).attr('dependencia'));
            $('#txtInfo_SoliER').val($(this.parentElement.parentElement).attr('descripcion'));
            $('#txtFormaER').val($(this.parentElement.parentElement).attr('forma'));
            $('#actionSolicitud').val('revisarSolicitud');
            $('#txtTituloModalManSolicitud').html("ATENDER SOLICITUD");
            $('#ventanaManSolicitud').modal("show");
            document.getElementsByTagName("body")[0].style.paddingRight = "0";
        });
    });

    $('.btn-eliminar-np').each(function () {
        $(this).click(function () {
            $('#txtSoli_IdER').val($(this.parentElement.parentElement).attr('id'));
            viewAlertDelete("Solicitud");
            document.getElementsByTagName("body")[0].style.paddingRight = "0";
        });
    });
}

function valicacionesCamposSolicitud() {
    $('#txtSoli_IdER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtFechaER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtUsuarioER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtEmailER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtDependenciaER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtDniER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtTelefonoER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtDomicilioER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtInfo_SoliER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtFormaER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
}

function validarFormularioSolicitud() {
    if ($('#txtSoli_IdER').val() === "") {
        $($('#txtSoli_IdER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtFechaER').val() === "") {
        $($('#txtFechaER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtUsuarioER').val() === "") {
        $($('#txtUsuarioER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtEmailER').val() === "") {
        $($('#txtEmailER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtDependenciaER').val() === "") {
        $($('#txtDependenciaER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtDniER').val() === "") {
        $($('#txtDniER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtTelefonoER').val() === "") {
        $($('#txtTelefonoER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtDomicilioER').val() === "") {
        $($('#txtDomicilioER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtInfo_SoliER').val() === "") {
        $($('#txtInfo_SoliER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtFormaER').val() === "") {
        $($('#txtFormaER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    return true;
}
