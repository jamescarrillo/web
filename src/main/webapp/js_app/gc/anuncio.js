$(document).ready(function () {

    $('#editorWebContenido').summernote({
        toolbar: [
            ['style', ['style']],
            ['fontname', ['fontname']],
            ['font', ['bold', 'italic', 'underline', 'clear', 'strikethrough']],
            ['fontsize', ['fontsize']],
            ['color', ['color']],
            ['para', ['ul', 'ol', 'paragraph']],
            ['height', ['height']],
            ['table', ['table']],
            ['link', ['link']],
            ['picture', ['picture']],
            ['video', ['video']],
            ['hr', ['hr']],
            ['codeview', ['codeview']]
        ],
        lang: 'es-ES',
        placeholder: 'Ingrese texto...',
        height: 300,
        dialogsInBody: true,
        dialogsFade: true
    });

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
        $('#txtContenidoAnuncioER').val($('#editorWebContenido').summernote('code'));
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
        $('#txtContenidoAnuncioER').val("");
        $('#editorWebContenido').summernote('code', "");
        $('#txtEstadoAnuncioER').val("false");
        $('#actionManAnuncio').val("addAnuncio");
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
        datosSerializadosCompletos += "&action=" + $('#actionManAnuncio').val();
    } else {
        datosSerializadosCompletos += "&action=" + $('#actionAnuncio').val();
    }
    datosSerializadosCompletos += "&txtEstadoAnuncioER=" + $('#txtEstadoAnuncioER').val();
    datosSerializadosCompletos += "&numberPageAnuncio=" + $('#numberPageAnuncio').val();
    datosSerializadosCompletos += "&sizePageAnuncio=" + $('#sizePageAnuncio').val();
    $.ajax({
        url: getContext() + '/publicaciones/anuncios',
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        success: function (jsonResponse) {
            $('#modalCargandoAnuncio').modal("hide");
            if (jsonResponse.BEAN_PAGINATION !== undefined) {
                listarAnuncio(jsonResponse.BEAN_PAGINATION);
            }
            if (jsonResponse.MESSAGE_SERVER !== undefined) {
                if (jsonResponse.MESSAGE_SERVER.toLowerCase() === "ok") {
                    viewAlert('success', getMessageServerTransaction($('#actionManAnuncio').val(), 'Anuncio', 'o'));
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
            cadenaContenido = removeTagHTML(cadenaContenido);

            cadenaTitulo = value.titulo;
            cadenaTitulo = removeTagHTML(cadenaTitulo);

            atributosAnuncio = "anu_id='" + value.anu_id + "' ";
            atributosAnuncio += "tipo='" + value.tipo + "' ";
            atributosAnuncio += "titulo='" + cadenaTitulo + "' ";
            atributosAnuncio += "contenido='" + value.contenido + "' ";
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
            $('#txtContenidoAnuncioER').val("");
            //$('#txtContenidoAnuncioER').val($(this.parentElement.parentElement).attr('contenido'));
            $('#editorWebContenido').summernote('code', $(this.parentElement.parentElement).attr('contenido'));
            $('#datePickerFechaInicioER').datepicker('setDate', getDateJS($(this.parentElement.parentElement).attr('anu_fecha_ini')));
            $('#datePickerFechaFinER').datepicker('setDate', getDateJS($(this.parentElement.parentElement).attr('anu_fecha_fin')));
            $('#tipoER').val($(this.parentElement.parentElement).attr('tipo'));
            $('#actionManAnuncio').val('updateAnuncio');
            $('#txtTituloModalManAnuncio').html("EDITAR ANUNCIO");
            $('#ventanaManAnuncio').modal("show");
            document.getElementsByTagName("body")[0].style.paddingRight = "0";
        });
    });

    $('.btn-eliminar-anuncio').each(function () {
        $(this).click(function () {
            $('#txtIdAnuncioER').val($(this.parentElement.parentElement).attr('anu_id'));
            swal({
                title: 'PEAM',
                text: "¿Desea eliminar este registro?",
                type: 'warning',
                showCancelButton: true,
                confirmButtonText: 'Sí, continuar!',
                cancelButtonText: 'No, cancelar!',
                confirmButtonClass: 'btn btn-info',
                cancelButtonClass: 'btn btn-danger',
                buttonsStyling: false
            }).then((result) => {
                if (result.value) {
                    $('#actionManAnuncio').val("deleteAnuncio");
                    $("#nameForm").val("FrmAnuncioModal");
                    $('#modalCargandoAnuncio').modal("show");
                }
            });
            $('.swal2-confirm').css("margin-right", "15px");
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
                    $('#actionManAnuncio').val("activateAnuncio");
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
    if ($('#editorWebContenido').summernote('isEmpty')) {
        viewAlert('warning', 'Por favor ingrese contenido');
        return false;
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
