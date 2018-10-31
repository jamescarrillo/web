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
        $('#txtTituloModalManAnuncio').html("REGISTRAR ANUNCIO");
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
        datosSerializadosCompletos += "&tipo=" + $('#tipo').val();
        datosSerializadosCompletos += "&estadoAnuncio=" + $('#estadoAnuncio').val();
    }
    datosSerializadosCompletos += "&txtEstadoAnuncioER=" + $('#txtEstadoAnuncioER').val();
    datosSerializadosCompletos += "&numberPageAnuncio=" + $('#numberPageAnuncio').val();
    datosSerializadosCompletos += "&sizePageAnuncio=" + $('#sizePageAnuncio').val();
    datosSerializadosCompletos += "&action=" + $('#actionAnuncio').val();
    console.log(datosSerializadosCompletos);
    $.ajax({
        url: getContext() + '/publicaciones/anuncios',
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
    $('#containerRegistrosAnuncios').empty();
    if (BEAN_PAGINATION.COUNT_FILTER > 0) {
        var atributosAnuncio;
        var card;
        var cadenaContenido;
        var cadenaTitulo;
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
            cadenaContenido = replaceAll(cadenaContenido, '<b>', '\n');
            cadenaContenido = replaceAll(cadenaContenido, '</b>', '\n');
            
            cadenaTitulo = value.titulo;
            cadenaTitulo = replaceAll(cadenaTitulo, '<p>', '');
            cadenaTitulo = replaceAll(cadenaTitulo, '</p>', '\n');
            cadenaTitulo = replaceAll(cadenaTitulo, '<b>', '\n');
            cadenaTitulo = replaceAll(cadenaTitulo, '</b>', '\n');

            atributosAnuncio = "anu_id='" + value.anu_id + "' ";
            atributosAnuncio += "tipo='" + value.tipo + "' ";
            atributosAnuncio += "titulo='" + cadenaTitulo + "' ";
            atributosAnuncio += "contenido='" + cadenaContenido + "' ";
            atributosAnuncio += "anu_fecha_ini='" + value.anu_fecha_ini + "' ";
            atributosAnuncio += "anu_fecha_fin='" + value.anu_fecha_fin + "' ";
            atributosAnuncio += "estado='" + value.estado + "' ";
            cadenaContenido = getResumenContenidoWeb(cadenaContenido, 120) + "...";
            card = "<div class='col-lg-4 col-md-6'>";

            card += "<div class='card blog-widget'>";

            card += "<div class='card-body'>";

            //card += "<div class='blog-image'><img src='" + value.foto + "' alt='img' class='img-responsive'></div>";

            card += "<h3 class='" + textColor + "'>" + cadenaTitulo + "</h3>";

            card += "<label class='label label-rounded label-success'>" + getCadenaAnuncio(value.tipo) + "</label>";

            card += "<p class='m-t-15 m-b-20 " + textColor + "'>" + cadenaContenido + "</p>";

            //card += cadenaContenido;

            card += "<div class='d-flex' " + atributosAnuncio + ">";

            card += "<div class='read'><a class='link font-medium btn-vista-previa-anuncio' style='cursor:pointer'>Vista Previa</a></div>";

            card += "<div class='ml-auto'>";

            card += "<a style='cursor:pointer' class='link mr-2 btn-cambiar-estado-anuncio' data-toggle='tooltip' title='" + opcion_estado + "' data-original-title='' opcion_estado='" + opcion_estado.toLowerCase() + "'>" + icono + "</a>";
            card += "<a style='cursor:pointer' class='link mr-2 btn-editar-anuncio' data-toggle='tooltip' title='Editar' data-original-title='Editar'><i class='fas fa-edit'></i></a>";
            card += "<a style='cursor:pointer' class='link btn-eliminar-anuncio' data-toggle='tooltip' title='Eliminar' data-original-title='Eliminar'><i class='fas fa-trash-alt'></i></a>";

            card += "</div>";

            card += "</div>";

            card += "</div>";

            card += "</div>";

            card += "</div>";

            $('#containerRegistrosAnuncios').append(card);
        });
        var defaultOptions = getDefaultOptionsPagination();
        var options = getOptionsPagination(BEAN_PAGINATION.COUNT_FILTER, $('#sizePageAnuncio'),
                $('#numberPageAnuncio'), $('#actionAnuncio'), 'paginarAnuncio',
                $('#nameForm'), 'FrmAnuncio', $('#modalCargandoAnuncio'));
        $pagination.twbsPagination('destroy');
        $pagination.twbsPagination($.extend({}, defaultOptions, options));
        agregarEventosAnuncio();
        $('#txtTituloAnuncio').focus();
    } else {
        $pagination.twbsPagination('destroy');
        viewAlert('warning', 'No se enconntraron resultados');
    }
}

function agregarEventosAnuncio() {

    $('.btn-vista-previa-anuncio').each(function () {
        $(this).click(function () {
            var titulo = $(this.parentElement.parentElement).attr('titulo');
            var contenido = $(this.parentElement.parentElement).attr('contenido');
            $.toast({
                heading: titulo,
                text: contenido,
                position: 'top-right',
                hideAfter: false
            });
            $('.jq-toast-single').css('border', '3px solid #a20505');
            $('.jq-toast-heading').addClass('text-peam-negrita');
        });
    });

    $('.btn-editar-anuncio').each(function () {
        $(this).click(function () {
            $('#txtIdAnuncioER').val($(this.parentElement.parentElement).attr('anu_id'));
            $('#txtTituloAnuncioER').val($(this.parentElement.parentElement).attr('titulo'));
            $('#txtContenidoAnuncioER').val($(this.parentElement.parentElement).attr('contenido'));
            $('#datePickerFechaInicioER').val($(this.parentElement.parentElement).attr('anu_fecha_ini'));
            $('#datePickerFechaFinER').val($(this.parentElement.parentElement).attr('anu_fecha_fin'));
            $('#actionAnuncio').val('updateAnuncio');
            $('#txtTituloModalManAnuncio').html("EDITAR ANUNCIO");
            $('#ventanaManAnuncio').modal("show");
            document.getElementsByTagName("body")[0].style.paddingRight = "0";
        });
    });

    $('.btn-eliminar-anuncio').each(function () {
        $(this).click(function () {
            $('#txtIdAnuncioER').val($(this.parentElement.parentElement).attr('anu_id'));
            viewAlertDelete("Anuncio");
            document.getElementsByTagName("body")[0].style.paddingRight = "0";
        });
    });

    $('.btn-cambiar-estado-anuncio').each(function () {
        $(this).click(function () {
            $('#txtIdAnuncioER').val($(this.parentElement.parentElement).attr('anu_id'));
            if ($(this).attr('opcion_estado').toLowerCase() !== "publicar") {
                $('#txtEstadoAnuncioER').val("true");
            } else {
                $('#txtEstadoAnuncioER').val("false");
            }
            swal({
                title: 'PEAM',
                text: "¿Está seguro de " + $(this).attr('opcion_estado') + " este Anuncio?",
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
    $('#datePickerFechaInicioER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#datePickerFechaFinER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtTituloAnuncioER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#tipoER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtContenidoAnuncioER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
}

function validarFormularioAnuncio() {
    if ($('#datePickerFechaInicioER').val() === "") {
        $($('#datePickerFechaInicioER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#datePickerFechaFinER').val() === "") {
        $($('#datePickerFechaFinER').parent()).addClass('has-danger');
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
    if ($('#tipoER').val() === "-1") {
        $($('#tipoER').parent()).addClass('has-danger');
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
    return true;
}

function getCadenaAnuncio(tipo) {
    var anuncio = "";
    switch (tipo) {
        case 1:
            anuncio = "COMUNICADO";
            break;
        case 2:
            anuncio = "CONVOCATORIA";
            break;
        case 3:
            anuncio = "SALUDO";
            break;
        case 4:
            anuncio = "OTROS";
            break;
        default :
            anuncio = "";
            break;

    }
    return anuncio;
}
