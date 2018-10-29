$(document).ready(function () {

    $('#datePickerFechaInicioER').datepicker({
        format: 'dd/mm/yyyy',
        todayHighlight: true,
        autoclose: true
    });

    $('#datePickerFechaFinER').datepicker({
        format: 'dd/mm/yyyy',
        todayHighlight: true,
        autoclose: true
    });

    $("#FrmAnuncio").submit(function () {
        $("#nameForm").val("FrmAnuncio");
        $("#numberPageAnuncio").val(1);
        $('#actionAnuncio').val("paginarAnuncio");
        $('#modalCargandoAnuncio').modal("show");
        return false;
    });

    $("#FrmAnuncioModal").submit(function () {
        if (validarFormularioAnuncio()) {
            $("#numberPageAnuncio").val(1);
            $("#nameForm").val("FrmAnuncioModal");
            $('#modalCargandoAnuncio').modal("show");
        }
        return false;
    });

    $("#modalCargandoAnuncio").on('shown.bs.modal', function () {
        //DESPUES DE TERMINAR DE MOSTRAR EL MODAL
        procesarAjaxAnuncio();
    });

    $("#ventanaManAnuncio").on('hidden.bs.modal', function () {
        $("#actionAnuncio").val("paginarAnuncio");
    });

    $('#btnAbrirNuevoAnuncio').click(function () {
        $('#FrmAnuncioModal input').val("");
        $('#FrmAnuncioModal textarea').val("");
        $('#FrmAnuncioModal select').val("-1");
        $('#FrmAnuncioModal input').parent().removeClass("has-danger");
        $('#FrmAnuncioModal select').parent().removeClass("has-danger");
        $('#txtEstadoAnuncioER').val("false");
        $('#actionAnuncio').val("addAnuncio");
        $('#txtTituloModalManAnuncio').html("REGISTRAR NOTA PRENSA");
        $('#ventanaManAnuncio').modal("show");
        document.getElementsByTagName("body")[0].style.paddingRight = "0";
    });

    addEventoCombosPaginar();
    valicacionesCamposAnuncio();
    $('#modalCargandoAnuncio').modal("show");

});

function procesarAjaxAnuncio() {
    var datosSerializadosCompletos = $('#' + $('#nameForm').val()).serialize();
    if ($('#nameForm').val().toLowerCase() !== "frmanuncio") {
        //AGREGAMOS LOS PARAMETROS DEL FORMULARIO DE BUSQUEDA
        datosSerializadosCompletos += "&txtTituloAnuncio=" + $('#txtTituloAnuncio').val();
    }
    datosSerializadosCompletos += "&numberPageAnuncio=" + $('#numberPageAnuncio').val();
    datosSerializadosCompletos += "&sizePageAnuncio=" + $('#sizePageAnuncio').val();
    datosSerializadosCompletos += "&action=" + $('#actionAnuncio').val();
    console.log(datosSerializadosCompletos);
    $.ajax({
        url: getContext() + '/publicaciones/anunciosadmin',
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        success: function (jsonResponse) {
            console.log(jsonResponse);
            $('#modalCargandoAnuncio').modal("hide");
            if ($('#actionAnuncio').val().toLowerCase() === "paginaranuncio") {
                listarAnuncio(jsonResponse.BEAN_PAGINATION);
            } else {
                if (jsonResponse.MESSAGE_SERVER.toLowerCase() === "ok") {
                    viewAlert('success', getMessageServerTransaction($('#actionAnuncio').val(), 'Anuncio', 'o'));
                    listarAnuncio(jsonResponse.BEAN_PAGINATION);
                } else {
                    viewAlert('warning', jsonResponse.MESSAGE_SERVER);
                }
            }
            $("#ventanaManAnuncio").modal("hide");
        },
        error: function () {
            $('#modalCargandoAnuncio').modal("hide");
            $("#ventanaManAnuncio").modal("hide");
            /*MOSTRAMOS MENSAJE ERROR SERVIDOR*/
            viewAlert('error', 'Error interno en el servidor!');
        }
    });
    return false;
}

function listarAnuncio(BEAN_PAGINATION) {
    /*PAGINATION*/
    var $pagination = $('#paginationAnuncio');
    $('#containerRegistrosNotasPrensa').empty();
    if (BEAN_PAGINATION.COUNT_FILTER > 0) {
        var atributosAnuncio;
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
            cadenaContenido = value.contenido;
            cadenaContenido = replaceAll(cadenaContenido, '<p>', '');
            cadenaContenido = replaceAll(cadenaContenido, '</p>', '\n');

            atributosAnuncio = "id='" + value.id + "' ";
            atributosAnuncio += "anho='" + value.anho + "' ";
            atributosAnuncio += "titulo='" + value.titulo + "' ";
            atributosAnuncio += "contenido='" + cadenaContenido + "' ";
            atributosAnuncio += "fuente='" + value.fuente + "' ";
            atributosAnuncio += "fecha='" + value.fecha + "' ";
            atributosAnuncio += "foto='" + value.foto + "' ";
            atributosAnuncio += "estado='" + value.estado + "' ";
            atributosAnuncio += "subido_por='" + value.subido_por.pers_id + "' ";
            atributosAnuncio += "fecha_creacion='" + value.fecha_creacion + "' ";
            atributosAnuncio += "fecha_actualizacion='" + value.fecha_actualizacion + "' ";

            //cadenaContenido = cadenaContenido.substring(0, 120) + "...";
            cadenaContenido = getResumenContenidoWeb(cadenaContenido, 120) + "...";
            card = "<div class='col-lg-4 col-md-6'>";

            card += "<div class='card blog-widget'>";

            card += "<div class='card-body'>";

            card += "<div class='blog-image'><img src='" + value.foto + "' alt='img' class='img-responsive'></div>";

            card += "<h3 class='" + textColor + "'>" + value.titulo + "</h3>";

            card += "<label class='label label-rounded label-success'>" + value.fuente + "</label>";

            card += "<p class='m-t-15 m-b-20 " + textColor + "'>" + cadenaContenido + "</p>";

            //card += cadenaContenido;

            card += "<div class='d-flex' " + atributosAnuncio + ">";

            card += "<div class='read'><a class='link font-medium btn-vista-previa-np' style='cursor:pointer'>Vista Previa</a></div>";

            card += "<div class='ml-auto'>";

            card += "<a style='cursor:pointer' class='link mr-2 btn-cambiar-estado-np' data-toggle='tooltip' title='" + opcion_estado + "' data-original-title='' opcion_estado='" + opcion_estado.toLowerCase() + "'>" + icono + "</a>";
            card += "<a style='cursor:pointer' class='link mr-2 btn-editar-np' data-toggle='tooltip' title='Editar' data-original-title='Editar'><i class='fas fa-edit'></i></a>";
            card += "<a style='cursor:pointer' class='link btn-eliminar-np' data-toggle='tooltip' title='Eliminar' data-original-title='Eliminar'><i class='fas fa-trash-alt'></i></a>";

            card += "</div>";

            card += "</div>";

            card += "</div>";

            card += "</div>";

            card += "</div>";

            $('#containerRegistrosNotasPrensa').append(card);
        });
        var defaultOptions = getDefaultOptionsPagination();
        var options = getOptionsPagination(BEAN_PAGINATION.COUNT_FILTER, $('#sizePageAnuncio'),
                $('#numberPageAnuncio'), $('#actionAnuncio'), 'paginarAnuncio',
                $('#nameForm'), 'FrmAnuncio', $('#modalCargandoAnuncio'));
        $pagination.twbsPagination('destroy');
        $pagination.twbsPagination($.extend({}, defaultOptions, options));
        agregarEventosAnuncio();
        $('#txtNombreAnuncio').focus();
    } else {
        $pagination.twbsPagination('destroy');
        viewAlert('warning', 'No se enconntraron resultados');
    }
}

function agregarEventosAnuncio() {

    $('.btn-vista-previa-np').each(function () {
        $(this).click(function () {
            $('#tituloAnuncioVP').html($(this.parentElement.parentElement).attr('titulo'));
            $('#resumenAnuncioVP').html(getResumenContenidoWeb($(this.parentElement.parentElement).attr('contenido'), 80) + "...");
            $('#ventanaVistaPreviaAnuncio').modal("show");
            document.getElementsByTagName("body")[0].style.paddingRight = "0";
        });
    });

    $('.btn-editar-np').each(function () {
        $(this).click(function () {
            $('#txtIdAnuncioER').val($(this.parentElement.parentElement).attr('id'));
            $('#txtAnhoAnuncioER').val($(this.parentElement.parentElement).attr('anho'));
            if ($(this.parentElement.parentElement).attr('fecha') !== "" && $(this.parentElement.parentElement).attr('fecha') !== "undefined") {
                $('#datePickerFechaER').datepicker('setDate', getDateJS($(this.parentElement.parentElement).attr('fecha')));
            }
            $('#txtTituloAnuncioER').val($(this.parentElement.parentElement).attr('titulo'));
            $('#txtContenidoAnuncioER').val($(this.parentElement.parentElement).attr('contenido'));
            $('#txtFuenteAnuncioER').val($(this.parentElement.parentElement).attr('fuente'));
            $('#txtEstadoAnuncioER').val($(this.parentElement.parentElement).attr('estado'));
            $('#txtFechaCreacionER').val($(this.parentElement.parentElement).attr('fecha_creacion'));
            $('#txtFechaActualizacionER').val($(this.parentElement.parentElement).attr('fecha_actualizacion'));
            $('#txtFotoAnuncioER').val($(this.parentElement.parentElement).attr('foto'));
            $('#actionAnuncio').val('updateAnuncio');
            $('#txtTituloModalManAnuncio').html("EDITAR NOTA DE PRENSA");
            $('#ventanaManAnuncio').modal("show");
            document.getElementsByTagName("body")[0].style.paddingRight = "0";
        });
    });

    $('.btn-eliminar-np').each(function () {
        $(this).click(function () {
            $('#txtIdAnuncioER').val($(this.parentElement.parentElement).attr('id'));
            viewAlertDelete("Anuncio");
            document.getElementsByTagName("body")[0].style.paddingRight = "0";
        });
    });

    $('.btn-cambiar-estado-np').each(function () {
        $(this).click(function () {
            $('#txtIdAnuncioER').val($(this.parentElement.parentElement).attr('id'));
            if ($(this).attr('opcion_estado').toLowerCase() === "publicar") {
                $('#txtEstadoAnuncioER').val("true");
            } else {
                $('#txtEstadoAnuncioER').val("false");
            }
            swal({
                title: 'PEAM',
                text: "¿Está seguro de " + $(this).attr('opcion_estado') + " esta Nota de Prensa?",
                type: 'warning',
                showCancelButton: true,
                confirmButtonText: 'Sí, continuar!',
                cancelButtonText: 'No, cancelar!',
                confirmButtonClass: 'btn btn-info',
                cancelButtonClass: 'btn btn-danger',
                buttonsStyling: false
            }).then((result) => {
                if (result.value) {
                    $('#actionAnuncio').val("activateAnuncio");
                    $("#nameForm").val("FrmAnuncioModal");
                    $('#modalCargandoAnuncio').modal("show");
                }
            });
            $('.swal2-confirm').css("margin-right", "15px");
            document.getElementsByTagName("body")[0].style.paddingRight = "0";
        });
    });
}

function valicacionesCamposAnuncio() {
    $('#datePickerFechaER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtTituloAnuncioER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtContenidoAnuncioER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtFuenteAnuncioER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtFotoAnuncioER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
}

function validarFormularioAnuncio() {
    if ($('#datePickerFechaER').val() === "") {
        $($('#datePickerFechaER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtTituloAnuncioER').val() === "") {
        $($('#txtTituloAnuncioER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtContenidoAnuncioER').val() === "") {
        $($('#txtContenidoAnuncioER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtFuenteAnuncioER').val() === "") {
        $($('#txtFuenteAnuncioER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtFotoAnuncioER').val() === "") {
        $($('#txtFotoAnuncioER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    return true;
}

