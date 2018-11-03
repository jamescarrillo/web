$(document).ready(function () {

    $('#txtFechaER').datepicker({
        format: 'dd/mm/yyyy',
        todayHighlight: true,
        autoclose: true
    });

    cargarAniosCombo($('#comboAnio'), 2000, "-1", 'AÑO');

    $("#FrmLibroReclamo").submit(function () {
        $("#nameForm").val("FrmLibroReclamo");
        $("#numberPageLibroReclamo").val(1);
        $('#actionLibroReclamo').val("paginarLibroReclamo");
        $('#modalCargandoLibroReclamo').modal("show");
        return false;
    });

    $("#FrmLibroReclamoModal").submit(function () {
        if (validarFormularioLibroReclamo()) {
            $("#numberPageLibroReclamo").val(1);
            $("#nameForm").val("FrmLibroReclamoModal");
            $('#modalCargandoLibroReclamo').modal("show");
        }
        return false;
    });

    $("#modalCargandoLibroReclamo").on('shown.bs.modal', function () {
        //DESPUES DE TERMINAR DE MOSTRAR EL MODAL
        procesarAjaxLibroReclamo();
    });

    $("#ventanaManLibroReclamo").on('hidden.bs.modal', function () {
        $("#actionLibroReclamo").val("paginarLibroReclamo");
    });

    addEventoCombosPaginar();
    valicacionesCamposLibroReclamo();
    $('#modalCargandoLibroReclamo').modal("show");

});

function procesarAjaxLibroReclamo() {
    var datosSerializadosCompletos = $('#' + $('#nameForm').val()).serialize();
    if ($('#nameForm').val().toLowerCase() !== "frmlibroreclamo") {
        //AGREGAMOS LOS PARAMETROS DEL FORMULARIO DE BUSQUEDA
        datosSerializadosCompletos += "&txtLibroReclamo=" + $('#txtLibroReclamo').val();
        datosSerializadosCompletos += "&comboAnio=" + $('#comboAnio').val();
        datosSerializadosCompletos += "&comboTipoListaReclamo=" + $('#comboTipoListaReclamo').val();
    }
    datosSerializadosCompletos += "&txtEstadoER=" + $('#txtEstadoER').val();
    datosSerializadosCompletos += "&numberPageLibroReclamo=" + $('#numberPageLibroReclamo').val();
    datosSerializadosCompletos += "&sizePageLibroReclamo=" + $('#sizePageLibroReclamo').val();
    datosSerializadosCompletos += "&action=" + $('#actionLibroReclamo').val();
    $.ajax({
        url: getContext() + '/participacionciudadana/libroreclamaciones',
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        success: function (jsonResponse) {
            $('#modalCargandoLibroReclamo').modal("hide");
            if ($('#actionLibroReclamo').val().toLowerCase() === "paginarlibroreclamo") {
                listarLibroReclamo(jsonResponse.BEAN_PAGINATION);
            } else {
                if (jsonResponse.MESSAGE_SERVER.toLowerCase() === "ok") {
                    viewAlert('success', getMessageServerTransaction($('#actionLibroReclamo').val(), 'Reclamo', 'o'));
                    listarLibroReclamo(jsonResponse.BEAN_PAGINATION);
                } else {
                    viewAlert('warning', jsonResponse.MESSAGE_SERVER);
                }
            }
            $("#ventanaManLibroReclamo").modal("hide");
        },
        error: function () {
            $('#modalCargandoLibroReclamo').modal("hide");
            $("#ventanaManLibroReclamo").modal("hide");
            /*MOSTRAMOS MENSAJE ERROR SERVIDOR*/
            viewAlert('error', 'Error interno en el servidor!');
        }
    });
    return false;
}

function listarLibroReclamo(BEAN_PAGINATION) {
    /*PAGINATION*/
    var $pagination = $('#paginationLibroReclamo');
    $('#containerComentarios').empty();
    if (BEAN_PAGINATION.COUNT_FILTER > 0) {
        var atributosLibroReclamo;
        var card;
        var textColor;
        var labelColor;
        var icono;
        var opcion_estado;
        var resp;
        $.each(BEAN_PAGINATION.LIST, function (index, value) {
            if (value.detalle_acciones === "") {
                resp = "Aún sin responder";
                labelColor = "label-light-info";
            } else {
                resp = "Ya se respondió";
                labelColor = "label-light-success";
            }
            if (value.estado) {
                textColor = "";
                icono = "<i class='far fa-hand-point-down'></i>";
                opcion_estado = "Ocultar";
            } else {
                textColor = "text-danger";
                opcion_estado = "Publicar";
                icono = "<i class='far fa-hand-point-up'></i>";
            }

            atributosLibroReclamo = "id='" + value.numero + "' ";
            atributosLibroReclamo += "anho='" + value.anho + "' ";
            atributosLibroReclamo += "usuario='" + value.usuario + "' ";
            atributosLibroReclamo += "documento_identidad='" + value.documento_identidad + "' ";
            atributosLibroReclamo += "numero_documento='" + value.numero_documento + "' ";
            atributosLibroReclamo += "direccion='" + value.direccion + "' ";
            atributosLibroReclamo += "telefono='" + value.telefono + "' ";
            atributosLibroReclamo += "e_mail='" + value.e_mail + "' ";
            atributosLibroReclamo += "descripcion_atencion='" + value.descripcion_atencion + "' ";
            atributosLibroReclamo += "fecha='" + value.fecha + "' ";
            atributosLibroReclamo += "detalle_acciones='" + value.detalle_acciones + "' ";
            atributosLibroReclamo += "estado='" + value.estado + "' ";

            card = "<div class='d-flex flex-row comment-row'>";

//            card += "<div class='p-2'>";
//            card += "<span class='round'><img src='../assets/images/users/1.jpg' alt='user' width='50'></span>";
//            card += "</div>";

            card += "<div class='comment-text w-100'>";
            card += "<h5>" + value.usuario + "</h5>";
            card += "<p class='m-b-5'>" + value.descripcion_atencion + "</p>";
            card += "<div class='comment-footer' " + atributosLibroReclamo + ">";
            card += "<span class='text-muted pull-right mr-2'>" + value.fecha + "</span>";
            card += "<span class='label "+labelColor+"'>" + resp + "</span>";
            card += "<span class='action-icons'>";
            card += "<a style='cursor:pointer' class='link mr-2 btn-imprimir-np' data-toggle='tooltip' title='imprimir' data-original-title='Editar'><i class='fas fa-print'></i></a>";
            card += "<a style='cursor:pointer' class='link mr-2 btn-cambiar-estado-np' data-toggle='tooltip' title='" + opcion_estado + "' data-original-title='' opcion_estado='" + opcion_estado.toLowerCase() + "'>" + icono + "</a>";
            card += "<a style='cursor:pointer' class='link mr-2 btn-editar-np' data-toggle='tooltip' title='Responder' data-original-title='Editar'><i class='fas fa-reply'></i></a>";
            card += "<a style='cursor:pointer' class='link btn-eliminar-np' data-toggle='tooltip' title='Eliminar' data-original-title='Eliminar'><i class='fas fa-trash-alt'></i></a>";

            card += "</span>";

            card += "</div>";

            card += "</div>";

            card += "</div>";

            $('#containerComentarios').append(card);
        });
        var defaultOptions = getDefaultOptionsPagination();
        var options = getOptionsPagination(BEAN_PAGINATION.COUNT_FILTER, $('#sizePageLibroReclamo'),
                $('#numberPageLibroReclamo'), $('#actionLibroReclamo'), 'paginarLibroReclamo',
                $('#nameForm'), 'FrmLibroReclamo', $('#modalCargandoLibroReclamo'));
        $pagination.twbsPagination('destroy');
        $pagination.twbsPagination($.extend({}, defaultOptions, options));
        agregarEventosLibroReclamo();
        $('#txtNombreLibroReclamo').focus();
    } else {
        $pagination.twbsPagination('destroy');
        viewAlert('warning', 'No se enconntraron resultados');
    }
}

function agregarEventosLibroReclamo() {

    $('.btn-editar-np').each(function () {
        $(this).click(function () {
            $('#txtNumeroER').val($(this.parentElement.parentElement).attr('id'));
            $('#txtAnhoER').val($(this.parentElement.parentElement).attr('anho'));
            $('#txtFechaER').val($(this.parentElement.parentElement).attr('fecha'));
            $('#txtUsuarioER').val($(this.parentElement.parentElement).attr('usuario'));
            $('#txtCorreoER').val($(this.parentElement.parentElement).attr('e_mail'));
            $('#txtTelefonoER').val($(this.parentElement.parentElement).attr('telefono'));
            $('#txtDomicilioER').val($(this.parentElement.parentElement).attr('direccion'));
            $('#txtDniER').val($(this.parentElement.parentElement).attr('numero_documento'));
            $('#txtRespuestaER').val($(this.parentElement.parentElement).attr('detalle_acciones'));
            $('#txtDescripcionER').val($(this.parentElement.parentElement).attr('descripcion_atencion'));
            $('#txtTipoDocumentoER').val($(this.parentElement.parentElement).attr('documento_identidad'));
            $('#actionLibroReclamo').val('updateLibroReclamo');
            $('#txtTituloModalManLibroReclamo').html("RESPONDER RECLAMO");
            $('#ventanaManLibroReclamo').modal("show");
            document.getElementsByTagName("body")[0].style.paddingRight = "0";
        });
    });

    $('.btn-eliminar-np').each(function () {
        $(this).click(function () {
            $('#txtNumeroER').val($(this.parentElement.parentElement).attr('id'));
            $('#txtAnhoER').val($(this.parentElement.parentElement).attr('anho'));
            viewAlertDelete("LibroReclamo");
            document.getElementsByTagName("body")[0].style.paddingRight = "0";
        });
    });

    $('.btn-cambiar-estado-np').each(function () {
        $(this).click(function () {
            $('#txtNumeroER').val($(this.parentElement.parentElement).attr('id'));
            $('#txtAnhoER').val($(this.parentElement.parentElement).attr('anho'));
            if ($(this).attr('opcion_estado').toLowerCase() !== "publicar") {
                $('#txtEstadoER').val("true");
            } else {
                $('#txtEstadoER').val("false");
            }
            swal({
                title: 'PEAM',
                text: "¿Está seguro de " + $(this).attr('opcion_estado') + " este Reclamo?",
                type: 'warning',
                showCancelButton: true,
                confirmButtonText: 'Sí, continuar!',
                cancelButtonText: 'No, cancelar!',
                confirmButtonClass: 'btn btn-info',
                cancelButtonClass: 'btn btn-danger',
                buttonsStyling: false
            }).then((result) => {
                if (result.value) {
                    $('#actionLibroReclamo').val("activateLibroReclamo");
                    $("#nameForm").val("FrmLibroReclamoModal");
                    $('#modalCargandoLibroReclamo').modal("show");
                }
            });
            $('.swal2-confirm').css("margin-right", "15px");
            document.getElementsByTagName("body")[0].style.paddingRight = "0";
        });
    });
}

function valicacionesCamposLibroReclamo() {
    $('#txtFechaER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtUsuarioER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtCorreoER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtTipoDocumentoER').on('change', function () {
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
    $('#txtDescripcionER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtRespuestaER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
}

function validarFormularioLibroReclamo() {
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
    if ($('#txtCorreoER').val() === "") {
        $($('#txtCorreoER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtTipoDocumentoER').val() === "") {
        $($('#txtTipoDocumentoER').parent()).addClass('has-danger');
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
    if ($('#txtDescripcionER').val() === "") {
        $($('#txtDescripcionER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtRespuestaER').val() === "") {
        $($('#txtRespuestaER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    return true;
}