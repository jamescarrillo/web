$(document).ready(function () {

    $('#txtFechaER').datepicker({
        format: 'dd/mm/yyyy',
        todayHighlight: true,
        autoclose: true
    });

    cargarAniosCombo($('#comboAnio'), 2010, "-1", 'AÑO');

    $("#FrmEvento").submit(function () {
        $("#nameForm").val("FrmEvento");
        $("#numberPageEvento").val(1);
        $('#actionEvento').val("paginarEvento");
        $('#modalCargandoEvento').modal("show");
        return false;
    });

    $("#FrmEventoModal").submit(function () {
        if (validarFormularioEvento()) {
            $("#numberPageEvento").val(1);
            $("#nameForm").val("FrmEventoModal");
            $('#modalCargandoEvento').modal("show");
        }
        return false;
    });

    $("#modalCargandoEvento").on('shown.bs.modal', function () {
        //DESPUES DE TERMINAR DE MOSTRAR EL MODAL
        procesarAjaxEvento();
    });

    $("#ventanaManEvento").on('hidden.bs.modal', function () {
        $("#actionEvento").val("paginarEvento");
    });

    $('#btnAbrirNuevoEvento').click(function () {
        $('#FrmEventoModal input').val("");
        $('#FrmEventoModal textarea').val("");
        $('#FrmEventoModal select').val("-1");
        $('#FrmEventoModal input').parent().removeClass("has-danger");
        $('#FrmEventoModal select').parent().removeClass("has-danger");
        $('#txtEstadoEventoER').val("false");
        $('#actionEvento').val("addEvento");
        $('#txtTituloModalManEvento').html("REGISTRAR EVENTO");
        $('#ventanaManEvento').modal("show");
        document.getElementsByTagName("body")[0].style.paddingRight = "0";
    });

    addEventoCombosPaginar();
    valicacionesCamposEvento();
    $('#modalCargandoEvento').modal("show");

});

function procesarAjaxEvento() {
    var datosSerializadosCompletos = $('#' + $('#nameForm').val()).serialize();
    if ($('#nameForm').val().toLowerCase() !== "frmevento") {
        //AGREGAMOS LOS PARAMETROS DEL FORMULARIO DE BUSQUEDA
        datosSerializadosCompletos += "&txtEvento=" + $('#txtEvento').val();
        datosSerializadosCompletos += "&comboAnio=" + $('#comboAnio').val();
    }
    datosSerializadosCompletos += "&txtEstadoEventoER=" + $('#txtEstadoEventoER').val();
    datosSerializadosCompletos += "&numberPageEvento=" + $('#numberPageEvento').val();
    datosSerializadosCompletos += "&sizePageEvento=" + $('#sizePageEvento').val();
    datosSerializadosCompletos += "&action=" + $('#actionEvento').val();
    $.ajax({
        url: getContext() + '/publicaciones/eventos',
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        success: function (jsonResponse) {
            $('#modalCargandoEvento').modal("hide");
            if ($('#actionEvento').val().toLowerCase() === "paginarevento") {
                listarEvento(jsonResponse.BEAN_PAGINATION);
            } else {
                if (jsonResponse.MESSAGE_SERVER.toLowerCase() === "ok") {
                    viewAlert('success', getMessageServerTransaction($('#actionEvento').val(), 'Evento', 'o'));
                    listarEvento(jsonResponse.BEAN_PAGINATION);
                } else {
                    viewAlert('warning', jsonResponse.MESSAGE_SERVER);
                }
            }
            $("#ventanaManEvento").modal("hide");
        },
        error: function () {
            $('#modalCargandoEvento').modal("hide");
            $("#ventanaManEvento").modal("hide");
            /*MOSTRAMOS MENSAJE ERROR SERVIDOR*/
            viewAlert('error', 'Error interno en el servidor!');
        }
    });
    return false;
}

function listarEvento(BEAN_PAGINATION) {
    /*PAGINATION*/
    var $pagination = $('#paginationEvento');
    $('#containerRegistrosEvento').empty();
    if (BEAN_PAGINATION.COUNT_FILTER > 0) {
        var atributosEvento;
        var card;
        var cadenaContenido;
        var textColor;
        var icono;
        var opcion_estado;
        $.each(BEAN_PAGINATION.LIST, function (index, value) {
            if (value.estado) {
                textColor = "";
                icono = "<i class='far fa-hand-point-down'></i>";
                opcion_estado = "Ocultar";
            } else {
                textColor = "text-danger";
                opcion_estado = "Publicar";
                icono = "<i class='far fa-hand-point-up'></i>";
            }
            cadenaContenido = value.titulo;
            cadenaContenido = replaceAll(cadenaContenido, '<p>', '');
            cadenaContenido = replaceAll(cadenaContenido, '</p>', '\n');

            atributosEvento = "id='" + value.id + "' ";
            atributosEvento += "anho='" + value.anho + "' ";
            atributosEvento += "titulo='" + value.titulo + "' ";
            atributosEvento += "fecha='" + value.fecha + "' ";
            atributosEvento += "contenido='Publicado el " + value.fecha + "' ";
            atributosEvento += "foto='" + value.foto + "' ";
            atributosEvento += "estado='" + value.estado + "' ";
            atributosEvento += "area='" + value.area.id + "' ";
            atributosEvento += "link='" + value.link + "' ";
            atributosEvento += "creado_por='" + value.creado_por.pers_id + "' ";
            atributosEvento += "fecha_creacion='" + value.fecha_creacion + "' ";
            atributosEvento += "fecha_editado='" + value.fecha_editado + "' ";

            //cadenaContenido = cadenaContenido.substring(0, 120) + "...";
            cadenaContenido = getResumenContenidoWeb(cadenaContenido, 120) + "...";
            card = "<div class='col-lg-4 col-md-6'>";

            card += "<div class='card blog-widget'>";

            card += "<div class='card-body'>";

            card += "<div class='blog-image'><img src='" + value.foto + "' alt='img' class='img-responsive'></div>";

            card += "<h3 class='" + textColor + "'>" + value.titulo + "</h3>";

            card += "<p class='m-t-15 m-b-20 " + textColor + "'>" + value.fecha + "</p>";

            card += "<p class='m-t-15 m-b-20 " + textColor + "'><a href='" + value.link + "' aria-hidden='true'>Ver</a></p>";

            //card += cadenaContenido;

            card += "<div class='d-flex' " + atributosEvento + ">";

            card += "<div class='read'><a class='link font-medium btn-vista-previa-np' style='cursor:pointer'>Vista Previa</a></div>";

            card += "<div class='ml-auto'>";

            card += "<a style='cursor:pointer' class='link mr-2 btn-cambiar-estado-evento' data-toggle='tooltip' title='" + opcion_estado + "' data-original-title='' opcion_estado='" + opcion_estado.toLowerCase() + "'>" + icono + "</a>";
            card += "<a style='cursor:pointer' class='link mr-2 btn-editar-np' data-toggle='tooltip' title='Editar' data-original-title='Editar'><i class='fas fa-edit'></i></a>";
            card += "<a style='cursor:pointer' class='link btn-eliminar-np' data-toggle='tooltip' title='Eliminar' data-original-title='Eliminar'><i class='fas fa-trash-alt'></i></a>";

            card += "</div>";

            card += "</div>";

            card += "</div>";

            card += "</div>";

            card += "</div>";

            $('#containerRegistrosEvento').append(card);
        });
        var defaultOptions = getDefaultOptionsPagination();
        var options = getOptionsPagination(BEAN_PAGINATION.COUNT_FILTER, $('#sizePageEvento'),
                $('#numberPageEvento'), $('#actionEvento'), 'paginarEvento',
                $('#nameForm'), 'FrmEvento', $('#modalCargandoEvento'));
        $pagination.twbsPagination('destroy');
        $pagination.twbsPagination($.extend({}, defaultOptions, options));
        agregarEventosEvento();
        $('#txtNombreEvento').focus();
    } else {
        $pagination.twbsPagination('destroy');
        viewAlert('warning', 'No se enconntraron resultados');
    }
}

function agregarEventosEvento() {

    $('.btn-vista-previa-np').each(function () {
        $(this).click(function () {
            $('#tituloEventoVP').html($(this.parentElement.parentElement).attr('titulo'));
            $('#resumenEventoVP').html(getResumenContenidoWeb($(this.parentElement.parentElement).attr('contenido'), 80) + "...");
            $('#ventanaVistaPreviaEvento').modal("show");
            document.getElementsByTagName("body")[0].style.paddingRight = "0";
        });
    });

    $('.btn-editar-np').each(function () {
        $(this).click(function () {
            $('#txtIdER').val($(this.parentElement.parentElement).attr('id'));
            $('#txtFechaER').datepicker('setDate', getDateJS($(this.parentElement.parentElement).attr('fecha')));
            $('#txtTituloER').val($(this.parentElement.parentElement).attr('titulo'));
            $('#txtAreaER').val($(this.parentElement.parentElement).attr('area'));
            $('#txtFotoER').val($(this.parentElement.parentElement).attr('foto'));
            $('#txtLinkER').val($(this.parentElement.parentElement).attr('link'));
            $('#actionEvento').val('updateEvento');
            $('#txtTituloModalManEvento').html("EDITAR EVENTO");
            $('#ventanaManEvento').modal("show");
            document.getElementsByTagName("body")[0].style.paddingRight = "0";
        });
    });

    $('.btn-eliminar-np').each(function () {
        $(this).click(function () {
            $('#txtIdER').val($(this.parentElement.parentElement).attr('id'));
            viewAlertDelete("Evento");
            document.getElementsByTagName("body")[0].style.paddingRight = "0";
        });
    });

    $('.btn-cambiar-estado-evento').each(function () {
        $(this).click(function () {
            $('#txtIdER').val($(this.parentElement.parentElement).attr('id'));
            if ($(this).attr('opcion_estado').toLowerCase() !== "publicar") {
                $('#txtEstadoEventoER').val("true");
            } else {
                $('#txtEstadoEventoER').val("false");
            }
            swal({
                title: 'PEAM',
                text: "¿Está seguro de " + $(this).attr('opcion_estado') + " este Evento?",
                type: 'warning',
                showCancelButton: true,
                confirmButtonText: 'Sí, continuar!',
                cancelButtonText: 'No, cancelar!',
                confirmButtonClass: 'btn btn-info',
                cancelButtonClass: 'btn btn-danger',
                buttonsStyling: false
            }).then((result) => {
                if (result.value) {
                    $('#actionEvento').val("activateEvento");
                    $("#nameForm").val("FrmEventoModal");
                    $('#modalCargandoEvento').modal("show");
                }
            });
            $('.swal2-confirm').css("margin-right", "15px");
            document.getElementsByTagName("body")[0].style.paddingRight = "0";
        });
    });

}

function valicacionesCamposEvento() {
    $('#txtFechaER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtTituloER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtAreaER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtFotoER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtLinkER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
}

function validarFormularioEvento() {
    if ($('#txtFechaER').val() === "") {
        $($('#txtFechaER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtTituloER').val() === "") {
        $($('#txtTituloER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtAreaER').val() === "-1") {
        $($('#txtAreaER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtFotoER').val() === "") {
        $($('#txtFotoER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtLinkER').val() === "") {
        $($('#txtLinkER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    return true;
}