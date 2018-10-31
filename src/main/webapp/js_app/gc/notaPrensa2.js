$(document).ready(function () {

    $('#summernote').summernote({
        toolbar: [
            ['fontname', ['fontname']],
            ['style', ['bold', 'italic', 'underline', 'clear']],
            ['font', ['strikethrough', 'superscript', 'subscript']],
            ['fontsize', ['fontsize']],
            ['color', ['color']],
            ['para', ['ul', 'ol', 'paragraph']],
            ['height', ['height']],
            ['picture', ['picture']],
            ['link', ['link']],
            ['video', ['video']],
            ['table', ['table']],
            ['hr', ['hr']]
        ],
        dialogsInBody: false,
        lang: 'es-ES',
        placeholder: 'Hello bootstrap 4',
        tabsize: 2,
        height: 300
    });


    $('#datePickerFechaER').datepicker({
        format: 'dd/mm/yyyy',
        todayHighlight: true,
        autoclose: true
    });

    cargarAniosCombo($('#comboAnio'), 2005, "-1", 'AÑO');

    $("#FrmNotaPrensa").submit(function () {
        $("#nameForm").val("FrmNotaPrensa");
        $("#numberPageNotaPrensa").val(1);
        $('#actionNotaPrensa').val("paginarNotaPrensa");
        $('#modalCargandoNotaPrensa').modal("show");
        return false;
    });

    $("#FrmNotaPrensaModal").submit(function () {
        if (validarFormularioNotaPrensa()) {
            $("#numberPageNotaPrensa").val(1);
            $("#nameForm").val("FrmNotaPrensaModal");
            $('#modalCargandoNotaPrensa').modal("show");
        }
        return false;
    });

    $("#modalCargandoNotaPrensa").on('shown.bs.modal', function () {
        //DESPUES DE TERMINAR DE MOSTRAR EL MODAL
        procesarAjaxNotaPrensa();
    });

    $("#ventanaManNotaPrensa").on('hidden.bs.modal', function () {
        $("#actionNotaPrensa").val("paginarNotaPrensa");
    });

    $('#btnAbrirNuevoNotaPrensa').click(function () {
        $('#FrmNotaPrensaModal input').val("");
        $('#FrmNotaPrensaModal textarea').val("");
        $('#FrmNotaPrensaModal select').val("-1");
        $('#FrmNotaPrensaModal input').parent().removeClass("has-danger");
        $('#FrmNotaPrensaModal select').parent().removeClass("has-danger");
        $('#txtEstadoNotaPrensaER').val("false");
        $('#actionNotaPrensa').val("addNotaPrensa");
        $('#txtTituloModalManNotaPrensa').html("REGISTRAR NOTA PRENSA");
        $('#ventanaManNotaPrensa').modal("show");
        document.getElementsByTagName("body")[0].style.paddingRight = "0";
    });

    addEventoCombosPaginar();
    valicacionesCamposNotaPrensa();
    $('#modalCargandoNotaPrensa').modal("show");

});

function procesarAjaxNotaPrensa() {
    var datosSerializadosCompletos = $('#' + $('#nameForm').val()).serialize();
    if ($('#nameForm').val().toLowerCase() !== "frmnotaprensa") {
        //AGREGAMOS LOS PARAMETROS DEL FORMULARIO DE BUSQUEDA
        datosSerializadosCompletos += "&txtTituloNotaPrensa=" + $('#txtTituloNotaPrensa').val();
        datosSerializadosCompletos += "&comboAnio=" + $('#comboAnio').val();
        datosSerializadosCompletos += "&estadoNotaPrensa=" + $('#estadoNotaPrensa').val();
    }
    datosSerializadosCompletos += "&numberPageNotaPrensa=" + $('#numberPageNotaPrensa').val();
    datosSerializadosCompletos += "&sizePageNotaPrensa=" + $('#sizePageNotaPrensa').val();
    datosSerializadosCompletos += "&action=" + $('#actionNotaPrensa').val();
    $.ajax({
        url: getContext() + '/publicaciones/notasprensa',
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        success: function (jsonResponse) {
            console.log(jsonResponse);
            $('#modalCargandoNotaPrensa').modal("hide");
            if ($('#actionNotaPrensa').val().toLowerCase() === "paginarnotaprensa") {
                listarNotaPrensa(jsonResponse.BEAN_PAGINATION);
            } else {
                if (jsonResponse.MESSAGE_SERVER.toLowerCase() === "ok") {
                    viewAlert('success', getMessageServerTransaction($('#actionNotaPrensa').val(), 'Nota Prensa', 'a'));
                    listarNotaPrensa(jsonResponse.BEAN_PAGINATION);
                } else {
                    viewAlert('warning', jsonResponse.MESSAGE_SERVER);
                }
            }
            $("#ventanaManNotaPrensa").modal("hide");
        },
        error: function () {
            $('#modalCargandoNotaPrensa').modal("hide");
            $("#ventanaManNotaPrensa").modal("hide");
            /*MOSTRAMOS MENSAJE ERROR SERVIDOR*/
            viewAlert('error', 'Error interno en el servidor!');
        }
    });
    return false;
}

function listarNotaPrensa(BEAN_PAGINATION) {
    /*PAGINATION*/
    var $pagination = $('#paginationNotaPrensa');
    $('#containerRegistrosNotasPrensa').empty();
    if (BEAN_PAGINATION.COUNT_FILTER > 0) {
        var atributosNotaPrensa;
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

            atributosNotaPrensa = "id='" + value.id + "' ";
            atributosNotaPrensa += "anho='" + value.anho + "' ";
            atributosNotaPrensa += "titulo='" + value.titulo + "' ";
            atributosNotaPrensa += "contenido='" + cadenaContenido + "' ";
            atributosNotaPrensa += "fuente='" + value.fuente + "' ";
            atributosNotaPrensa += "fecha='" + value.fecha + "' ";
            atributosNotaPrensa += "foto='" + value.foto + "' ";
            atributosNotaPrensa += "estado='" + value.estado + "' ";
            atributosNotaPrensa += "subido_por='" + value.subido_por.pers_id + "' ";
            atributosNotaPrensa += "fecha_creacion='" + value.fecha_creacion + "' ";
            atributosNotaPrensa += "fecha_actualizacion='" + value.fecha_actualizacion + "' ";

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

            card += "<div class='d-flex' " + atributosNotaPrensa + ">";

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
        var options = getOptionsPagination(BEAN_PAGINATION.COUNT_FILTER, $('#sizePageNotaPrensa'),
                $('#numberPageNotaPrensa'), $('#actionNotaPrensa'), 'paginarNotaPrensa',
                $('#nameForm'), 'FrmNotaPrensa', $('#modalCargandoNotaPrensa'));
        $pagination.twbsPagination('destroy');
        $pagination.twbsPagination($.extend({}, defaultOptions, options));
        agregarEventosNotaPrensa();
        $('#txtNombreNotaPrensa').focus();
    } else {
        $pagination.twbsPagination('destroy');
        viewAlert('warning', 'No se enconntraron resultados');
    }
}

function agregarEventosNotaPrensa() {

    $('.btn-vista-previa-np').each(function () {
        $(this).click(function () {
            $('#tituloNotaPrensaVP').html($(this.parentElement.parentElement).attr('titulo'));
            $('#resumenNotaPrensaVP').html(getResumenContenidoWeb($(this.parentElement.parentElement).attr('contenido'), 80) + "...");
            $('#ventanaVistaPreviaNotaPrensa').modal("show");
            document.getElementsByTagName("body")[0].style.paddingRight = "0";
        });
    });

    $('.btn-editar-np').each(function () {
        $(this).click(function () {
            $('#txtIdNotaPrensaER').val($(this.parentElement.parentElement).attr('id'));
            $('#txtAnhoNotaPrensaER').val($(this.parentElement.parentElement).attr('anho'));
            if ($(this.parentElement.parentElement).attr('fecha') !== "" && $(this.parentElement.parentElement).attr('fecha') !== "undefined") {
                $('#datePickerFechaER').datepicker('setDate', getDateJS($(this.parentElement.parentElement).attr('fecha')));
            }
            $('#txtTituloNotaPrensaER').val($(this.parentElement.parentElement).attr('titulo'));
            $('#txtContenidoNotaPrensaER').val($(this.parentElement.parentElement).attr('contenido'));
            $('#txtFuenteNotaPrensaER').val($(this.parentElement.parentElement).attr('fuente'));
            $('#txtEstadoNotaPrensaER').val($(this.parentElement.parentElement).attr('estado'));
            $('#txtFechaCreacionER').val($(this.parentElement.parentElement).attr('fecha_creacion'));
            $('#txtFechaActualizacionER').val($(this.parentElement.parentElement).attr('fecha_actualizacion'));
            $('#txtFotoNotaPrensaER').val($(this.parentElement.parentElement).attr('foto'));
            $('#actionNotaPrensa').val('updateNotaPrensa');
            $('#txtTituloModalManNotaPrensa').html("EDITAR NOTA DE PRENSA");
            $('#ventanaManNotaPrensa').modal("show");
            document.getElementsByTagName("body")[0].style.paddingRight = "0";
        });
    });

    $('.btn-eliminar-np').each(function () {
        $(this).click(function () {
            $('#txtIdNotaPrensaER').val($(this.parentElement.parentElement).attr('id'));
            viewAlertDelete("NotaPrensa");
            document.getElementsByTagName("body")[0].style.paddingRight = "0";
        });
    });

    $('.btn-cambiar-estado-np').each(function () {
        $(this).click(function () {
            $('#txtIdNotaPrensaER').val($(this.parentElement.parentElement).attr('id'));
            if ($(this).attr('opcion_estado').toLowerCase() === "publicar") {
                $('#txtEstadoNotaPrensaER').val("true");
            } else {
                $('#txtEstadoNotaPrensaER').val("false");
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
                    $('#actionNotaPrensa').val("activateNotaPrensa");
                    $("#nameForm").val("FrmNotaPrensaModal");
                    $('#modalCargandoNotaPrensa').modal("show");
                }
            });
            $('.swal2-confirm').css("margin-right", "15px");
            document.getElementsByTagName("body")[0].style.paddingRight = "0";
        });
    });
}

function valicacionesCamposNotaPrensa() {
    $('#datePickerFechaER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtTituloNotaPrensaER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtContenidoNotaPrensaER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtFuenteNotaPrensaER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtFotoNotaPrensaER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
}

function validarFormularioNotaPrensa() {
    if ($('#datePickerFechaER').val() === "") {
        $($('#datePickerFechaER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtTituloNotaPrensaER').val() === "") {
        $($('#txtTituloNotaPrensaER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtContenidoNotaPrensaER').val() === "") {
        $($('#txtContenidoNotaPrensaER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtFuenteNotaPrensaER').val() === "") {
        $($('#txtFuenteNotaPrensaER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtFotoNotaPrensaER').val() === "") {
        $($('#txtFotoNotaPrensaER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    return true;
}
