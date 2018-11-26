$(document).ready(function () {

    $('#txtFechaER').datepicker({
        format: 'dd/mm/yyyy',
        todayHighlight: true,
        autoclose: true
    });

    cargarAniosCombo($('#comboAnio'), 2010, "-1", 'AÑO');

    $("#FrmEstudio").submit(function () {
        $("#nameForm").val("FrmEstudio");
        $("#numberPageEstudio").val(1);
        $('#actionEstudio').val("paginarEstudio");
        $('#modalCargandoEstudio').modal("show");
        return false;
    });

    $("#FrmEstudioModal").submit(function () {
        if (validarFormularioEstudio()) {
            $("#numberPageEstudio").val(1);
            $("#nameForm").val("FrmEstudioModal");
            $('#modalCargandoEstudio').modal("show");
        }
        return false;
    });

    $("#modalCargandoEstudio").on('shown.bs.modal', function () {
        //DESPUES DE TERMINAR DE MOSTRAR EL MODAL
        procesarAjaxEstudio();
    });

    $("#ventanaManEstudio").on('hidden.bs.modal', function () {
        $("#actionEstudio").val("paginarEstudio");
    });

    $('#btnAbrirNuevoEstudio').click(function () {
        $('#FrmEstudioModal input').val("");
        $('#FrmEstudioModal textarea').val("");
        $('#FrmEstudioModal select').val("-1");
        $('#FrmEstudioModal input').parent().removeClass("has-danger");
        $('#FrmEstudioModal select').parent().removeClass("has-danger");
        $('#txtEstadoEstudioER').val("false");
        $('#actionEstudio').val("addEstudio");
        $('#txtTituloModalManEstudio').html("REGISTRAR ESTUDIO");
        $('#ventanaManEstudio').modal("show");
        document.getElementsByTagName("body")[0].style.paddingRight = "0";
    });

    addEventoCombosPaginar();
    valicacionesCamposEstudio();
    $('#modalCargandoEstudio').modal("show");

});

function procesarAjaxEstudio() {
    var datosSerializadosCompletos = $('#' + $('#nameForm').val()).serialize();
    if ($('#nameForm').val().toLowerCase() !== "frmestudio") {
        //AGREGAMOS LOS PARAMETROS DEL FORMULARIO DE BUSQUEDA
        datosSerializadosCompletos += "&txtEstudio=" + $('#txtEstudio').val();
        datosSerializadosCompletos += "&comboAnio=" + $('#comboAnio').val();
    }
    datosSerializadosCompletos += "&txtEstadoEstudioER=" + $('#txtEstadoEstudioER').val();
    datosSerializadosCompletos += "&numberPageEstudio=" + $('#numberPageEstudio').val();
    datosSerializadosCompletos += "&sizePageEstudio=" + $('#sizePageEstudio').val();
    datosSerializadosCompletos += "&action=" + $('#actionEstudio').val();
    $.ajax({
        url: getContext() + '/publicaciones/estudios',
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        success: function (jsonResponse) {
            $('#modalCargandoEstudio').modal("hide");
            if ($('#actionEstudio').val().toLowerCase() === "paginarestudio") {
                listarEstudio(jsonResponse.BEAN_PAGINATION);
            } else {
                if (jsonResponse.MESSAGE_SERVER.toLowerCase() === "ok") {
                    $("#ventanaManEstudio").modal("hide");
                    viewAlert('success', getMessageServerTransaction($('#actionEstudio').val(), 'Estudio', 'o'));
                    listarEstudio(jsonResponse.BEAN_PAGINATION);
                } else {
                    viewAlert('warning', jsonResponse.MESSAGE_SERVER);
                }
            }
        },
        error: function () {
            $('#modalCargandoEstudio').modal("hide");
            $("#ventanaManEstudio").modal("hide");
            /*MOSTRAMOS MENSAJE ERROR SERVIDOR*/
            viewAlert('error', 'Error interno en el servidor!');
        }
    });
    return false;
}

function listarEstudio(BEAN_PAGINATION) {
    /*PAGINATION*/
    var $pagination = $('#paginationEstudio');
    $('#containerRegistrosEstudio').empty();
    if (BEAN_PAGINATION.COUNT_FILTER > 0) {
        var atributosEstudio;
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
            cadenaContenido = value.objetivo;
            cadenaContenido = replaceAll(cadenaContenido, '<p>', '');
            cadenaContenido = replaceAll(cadenaContenido, '</p>', '\n');

            atributosEstudio = "id='" + value.id + "' ";
            atributosEstudio += "anho='" + value.anho + "' ";
            atributosEstudio += "titulo='" + value.titulo + "' ";
            atributosEstudio += "fecha='" + value.fecha + "' ";
            atributosEstudio += "objetivo='" + value.objetivo + "' ";
            atributosEstudio += "foto='" + value.foto + "' ";
            atributosEstudio += "estado='" + value.estado + "' ";
            atributosEstudio += "snip='" + value.snip + "' ";
            atributosEstudio += "cantidad_beneficiarios='" + value.cantidad_beneficiarios + "' ";
            atributosEstudio += "caracteristicas_beneficiarios='" + value.caracteristicas_beneficiarios + "' ";
            atributosEstudio += "creado_por='" + value.creado_por.pers_id + "' ";
            atributosEstudio += "fecha_creacion='" + value.fecha_creacion + "' ";
            atributosEstudio += "fecha_editado='" + value.fecha_editado + "' ";
            atributosEstudio += "lugar='" + value.lugar + "' ";
            atributosEstudio += "mapa='" + value.mapa + "' ";
            atributosEstudio += "seguimiento='" + value.seguimiento + "' ";
            //cadenaContenido = cadenaContenido.substring(0, 120) + "...";
            cadenaContenido = getResumenContenidoWeb(cadenaContenido, 120) + "...";
            card = "<div class='col-lg-4 col-md-6'>";

            card += "<div class='card blog-widget'>";

            card += "<div class='card-body'>";

            card += "<div class='blog-image'><img src='" + value.foto + "' alt='img' class='img-responsive'></div>";

            card += "<h3 class='" + textColor + "'>" + value.titulo + "</h3>";

            card += "<p class='m-t-15 m-b-20 " + textColor + "'>" + value.fecha + "</p>";

            //card += cadenaContenido;

            card += "<div class='d-flex' " + atributosEstudio + ">";

            //card += "<div class='read'><a class='link font-medium btn-vista-previa-np' style='cursor:pointer'>Vista Previa</a></div>";
            card += "<div class='read'></div>";

            card += "<div class='ml-auto'>";

            card += "<a style='cursor:pointer' class='link mr-2 btn-cambiar-estado-estudio' data-toggle='tooltip' title='" + opcion_estado + "' data-original-title='' opcion_estado='" + opcion_estado.toLowerCase() + "'>" + icono + "</a>";
            card += "<a style='cursor:pointer' class='link mr-2 btn-editar-np' data-toggle='tooltip' title='Editar' data-original-title='Editar'><i class='fas fa-edit'></i></a>";
            card += "<a style='cursor:pointer' class='link btn-eliminar-np' data-toggle='tooltip' title='Eliminar' data-original-title='Eliminar'><i class='fas fa-trash-alt'></i></a>";

            card += "</div>";

            card += "</div>";

            card += "</div>";

            card += "</div>";

            card += "</div>";

            $('#containerRegistrosEstudio').append(card);
        });
        var defaultOptions = getDefaultOptionsPagination();
        var options = getOptionsPagination(BEAN_PAGINATION.COUNT_FILTER, $('#sizePageEstudio'),
                $('#numberPageEstudio'), $('#actionEstudio'), 'paginarEstudio',
                $('#nameForm'), 'FrmEstudio', $('#modalCargandoEstudio'));
        $pagination.twbsPagination('destroy');
        $pagination.twbsPagination($.extend({}, defaultOptions, options));
        agregarEventosEstudio();
        $('#txtNombreEstudio').focus();
    } else {
        $pagination.twbsPagination('destroy');
        viewAlert('warning', 'No se enconntraron resultados');
    }
}

function agregarEventosEstudio() {

    $('.btn-vista-previa-np').each(function () {
        $(this).click(function () {
            $('#tituloEstudioVP').html($(this.parentElement.parentElement).attr('titulo'));
            $('#resumenEstudioVP').html(getResumenContenidoWeb($(this.parentElement.parentElement).attr('contenido'), 80) + "...");
            $('#ventanaVistaPreviaEstudio').modal("show");
            document.getElementsByTagName("body")[0].style.paddingRight = "0";
        });
    });

    $('.btn-editar-np').each(function () {
        $(this).click(function () {
            $('#txtIdER').val($(this.parentElement.parentElement).attr('id'));
            $('#txtFechaER').datepicker('setDate', getDateJS($(this.parentElement.parentElement).attr('fecha')));
            $('#txtTituloER').val($(this.parentElement.parentElement).attr('titulo'));
            $('#comboSeguimientoER').val($(this.parentElement.parentElement).attr('seguimiento'));
            $('#txtFotoER').val($(this.parentElement.parentElement).attr('foto'));
            $('#txtSnipER').val($(this.parentElement.parentElement).attr('snip'));
            $('#txtObjetivoER').val($(this.parentElement.parentElement).attr('objetivo'));
            $('#txtCantBeneficiariosER').val($(this.parentElement.parentElement).attr('cantidad_beneficiarios'));
            $('#txtCaracBeneficiariosER').val($(this.parentElement.parentElement).attr('caracteristicas_beneficiarios'));
            $('#txtLugarER').val($(this.parentElement.parentElement).attr('lugar'));
            $('#txtMapaER').val($(this.parentElement.parentElement).attr('mapa'));
            $('#actionEstudio').val('updateEstudio');
            $('#txtTituloModalManEstudio').html("EDITAR ESTUDIO");
            $('#ventanaManEstudio').modal("show");
            document.getElementsByTagName("body")[0].style.paddingRight = "0";
        });
    });

    $('.btn-eliminar-np').each(function () {
        $(this).click(function () {
            $('#txtIdER').val($(this.parentElement.parentElement).attr('id'));
            viewAlertDelete("Estudio");
            document.getElementsByTagName("body")[0].style.paddingRight = "0";
        });
    });

    $('.btn-cambiar-estado-estudio').each(function () {
        $(this).click(function () {
            $('#txtIdER').val($(this.parentElement.parentElement).attr('id'));
            if ($(this).attr('opcion_estado').toLowerCase() !== "publicar") {
                $('#txtEstadoEstudioER').val("true");
            } else {
                $('#txtEstadoEstudioER').val("false");
            }
            swal({
                title: 'PEAM',
                text: "¿Está seguro de " + $(this).attr('opcion_estado') + " este Estudio?",
                type: 'warning',
                showCancelButton: true,
                confirmButtonText: 'Sí, continuar!',
                cancelButtonText: 'No, cancelar!',
                confirmButtonClass: 'btn btn-info',
                cancelButtonClass: 'btn btn-danger',
                buttonsStyling: false
            }).then((result) => {
                if (result.value) {
                    $('#actionEstudio').val("activateEstudio");
                    $("#nameForm").val("FrmEstudioModal");
                    $('#modalCargandoEstudio').modal("show");
                }
            });
            $('.swal2-confirm').css("margin-right", "15px");
            document.getElementsByTagName("body")[0].style.paddingRight = "0";
        });
    });

}

function valicacionesCamposEstudio() {
    $('#txtFechaER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtTituloER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#comboSeguimientoER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtFotoER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtSnipER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtObjetivoER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtCantBeneficiariosER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtCaracBeneficiariosER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtLugarER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtMapaER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
}

function validarFormularioEstudio() {
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
    if ($('#comboSeguimientoER').val() === "-1") {
        $($('#comboSeguimientoER').parent()).addClass('has-danger');
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
    if ($('#txtSnipER').val() === "") {
        $($('#txtSnipER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtObjetivoER').val() === "") {
        $($('#txtObjetivoER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtCantBeneficiariosER').val() === "") {
        $($('#txtCantBeneficiariosER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtCaracBeneficiariosER').val() === "") {
        $($('#txtCaracBeneficiariosER').parent()).addClass('has-danger');
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
    if ($('#txtMapaER').val() === "") {
        $($('#txtMapaER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    return true;
}