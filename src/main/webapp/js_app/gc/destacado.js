$(document).ready(function () {

    $('#btnAbrirDestacados').click(function () {
        $('#ventanaDestacados').modal("show");
    });

    $('#datePickerFechaDestacadoER').datepicker({
        format: 'dd/mm/yyyy',
        todayHighlight: true,
        autoclose: true
    });

    cargarAniosCombo($('#comboAnioDestacado'), 2005, "-1", 'AÑO');

    $("#FrmDestacado").submit(function () {
        $("#nameFormDestacado").val("FrmDestacado");
        $("#numberPageDestacado").val(1);
        $('#actionDestacado').val("paginarDestacado");
        $('#modalCargandoDestacado').modal("show");
        return false;
    });

    $("#FrmDestacadoModal").submit(function () {
        if (validarFormularioDestacado()) {
            $("#numberPageDestacado").val(1);
            $("#nameFormDestacado").val("FrmDestacadoModal");
            $('#modalCargandoDestacado').modal("show");
        }
        return false;
    });

    $("#modalCargandoDestacado").on('shown.bs.modal', function () {
        procesarAjaxDestacado();
    });

    $("#ventanaDestacados").on('shown.bs.modal', function () {
        $('#modalCargandoDestacado').modal("show");
    });

    $("#ventanaManDestacado").on('hidden.bs.modal', function () {
        $("#actionDestacado").val("paginarDestacado");
    });

    $('#btnAbrirNuevoDestacado').click(function () {
        $('#FrmDestacadoModal input').val("");
        $('#FrmDestacadoModal textarea').val("");
        $('#FrmDestacadoModal select').val("-1");
        $('#FrmDestacadoModal input').parent().removeClass("has-danger");
        $('#FrmDestacadoModal select').parent().removeClass("has-danger");
        $('#txtEstadoDestacadoER').val("false");
        $('#actionDestacado').val("addDestacado");
        $('#txtTituloModalManDestacado').html("REGISTRAR DESTACADO");
        $('#ventanaManDestacado').modal("show");
        document.getElementsByTagName("body")[0].style.paddingRight = "0";
    });

    addEventoCombosPaginar();
    valicacionesCamposDestacado();


});

function procesarAjaxDestacado() {
    var datosSerializadosCompletos = $('#' + $('#nameFormDestacado').val()).serialize();
    if ($('#nameFormDestacado').val().toLowerCase() !== "frmdestacado") {
        //AGREGAMOS LOS PARAMETROS DEL FORMULARIO DE BUSQUEDA
        datosSerializadosCompletos += "&txtTituloDestacado=" + $('#txtTituloDestacado').val();
        datosSerializadosCompletos += "&comboAnioDestacado=" + $('#comboAnioDestacado').val();
        datosSerializadosCompletos += "&estadoDestacado=" + $('#estadoDestacado').val();
    }
    datosSerializadosCompletos += "&action=" + $('#actionDestacado').val();
    datosSerializadosCompletos += "&numberPageDestacado=" + $('#numberPageDestacado').val();
    datosSerializadosCompletos += "&sizePageDestacado=" + $('#sizePageDestacado').val();
    console.log(datosSerializadosCompletos)
    $.ajax({
        url: getContext() + '/publicaciones/notasprensa',
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        success: function (jsonResponse) {
            $('#modalCargandoDestacado').modal("hide");
            if (jsonResponse.BEAN_PAGINATION !== undefined) {
                listarDestacado(jsonResponse.BEAN_PAGINATION);
            }
            if (jsonResponse.MESSAGE_SERVER !== undefined) {
                if (jsonResponse.MESSAGE_SERVER.toLowerCase() === "ok") {
                    $("#ventanaManDestacado").modal("hide");
                    viewAlert('success', getMessageServerTransaction($('#actionDestacado').val(), 'Destacado', 'o'));
                    listarDestacado(jsonResponse.BEAN_PAGINATION);
                } else {
                    viewAlert('warning', jsonResponse.MESSAGE_SERVER);
                }
            }
        },
        error: function () {
            $('#modalCargandoDestacado').modal("hide");
            $("#ventanaManDestacado").modal("hide");
            /*MOSTRAMOS MENSAJE ERROR SERVIDOR*/
            viewAlert('error', 'Error interno en el servidor!');
        }
    });
    return false;
}

function listarDestacado(BEAN_PAGINATION) {
    /*PAGINATION*/
    var $pagination = $('#paginationDestacado');
    $('#containerRegistrosDestacados').empty();
    if (BEAN_PAGINATION.COUNT_FILTER > 0) {
        var atributosDestacado;
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
            atributosDestacado = "id='" + value.id + "' ";
            atributosDestacado += "anho='" + value.anho + "' ";
            atributosDestacado += "titulo='" + value.titulo + "' ";
            atributosDestacado += "contenido='" + cadenaContenido + "' ";
            atributosDestacado += "fecha='" + value.fecha + "' ";
            atributosDestacado += "foto='" + value.foto + "' ";
            atributosDestacado += "estado='" + value.estado + "' ";
            atributosDestacado += "url='" + value.url + "' ";
            atributosDestacado += "creado_por='" + value.creado_por.pers_id + "' ";
            atributosDestacado += "editado_por='" + value.creado_por.pers_id + "' ";
            cadenaContenido = removeTagHTML(cadenaContenido);
//            if (cadenaContenido !== "") {
//                cadenaContenido = getResumenContenidoWeb(cadenaContenido, 120) + "...";
//            }
            card = "<div class='col-md-6'>";

            card += "<div class='card blog-widget'>";

            card += "<div class='card-body'>";

            card += "<div class='blog-image'><img src='" + value.foto + "' alt='img' class='img-responsive'></div>";

            card += "<h3 class='" + textColor + "'>" + value.titulo + "</h3>";

            //card += "<label class='label label-rounded label-success'>" + value.fuente + "</label>";

            card += "<p class='m-t-15 m-b-20 " + textColor + "'>" + cadenaContenido + "</p>";

            //card += cadenaContenido;

            card += "<div class='d-flex' " + atributosDestacado + ">";

            card += "<div class='ml-auto'>";

            card += "<a style='cursor:pointer' class='link mr-2 btn-cambiar-estado-des' data-toggle='tooltip' title='" + opcion_estado + "' data-original-title='' opcion_estado='" + opcion_estado.toLowerCase() + "'>" + icono + "</a>";
            card += "<a style='cursor:pointer' class='link mr-2 btn-editar-des' data-toggle='tooltip' title='Editar' data-original-title='Editar'><i class='fas fa-edit'></i></a>";
            card += "<a style='cursor:pointer' class='link btn-eliminar-des' data-toggle='tooltip' title='Eliminar' data-original-title='Eliminar'><i class='fas fa-trash-alt'></i></a>";

            card += "</div>";

            card += "</div>";

            card += "</div>";

            card += "</div>";

            card += "</div>";

            $('#containerRegistrosDestacados').append(card);
        });
        var defaultOptions = getDefaultOptionsPagination();
        var options = getOptionsPagination(BEAN_PAGINATION.COUNT_FILTER, $('#sizePageDestacado'),
                $('#numberPageDestacado'), $('#actionDestacado'), 'paginarDestacado',
                $('#nameFormDestacado'), 'FrmDestacado', $('#modalCargandoDestacado'));
        $pagination.twbsPagination('destroy');
        $pagination.twbsPagination($.extend({}, defaultOptions, options));
        agregarEventosDestacado();
        $('#txtTituloDestacado').focus();
    } else {
        $pagination.twbsPagination('destroy');
        viewAlert('warning', 'No se enconntraron resultados');
    }
}

function agregarEventosDestacado() {

    $('.btn-vista-previa-des').each(function () {
        var contenido;
        $(this).click(function () {
            $('#tituloDestacadoVP').html($(this.parentElement.parentElement).attr('titulo'));
            contenido = $(this.parentElement.parentElement).attr('contenido');
            contenido = removeTagHTML(contenido);
            $('#resumenDestacadoVP').html(getResumenContenidoWeb(contenido, 80) + "...");
            $('#ventanaVistaPreviaNotaPrensa').modal("show");
            document.getElementsByTagName("body")[0].style.paddingRight = "0";
        });
    });

    $('.btn-editar-des').each(function () {
        $(this).click(function () {
            $('#txtIdDestacadoER').val($(this.parentElement.parentElement).attr('id'));
            $('#txtAnhoDestacadoER').val($(this.parentElement.parentElement).attr('anho'));
            if ($(this.parentElement.parentElement).attr('fecha') !== "" && $(this.parentElement.parentElement).attr('fecha') !== "undefined") {
                $('#datePickerFechaDestacadoER').datepicker('setDate', getDateJS($(this.parentElement.parentElement).attr('fecha')));
            }
            $('#txtTituloDestacadoER').val($(this.parentElement.parentElement).attr('titulo'));
            $('#txtContenidoDestacadoER').val($(this.parentElement.parentElement).attr('contenido'));
            $('#txtEstadoDestacadoER').val($(this.parentElement.parentElement).attr('estado'));
            $('#txtFotoDestacadoER').val($(this.parentElement.parentElement).attr('foto'));
            $('#txtUrlDestacadoER').val($(this.parentElement.parentElement).attr('url'));
            $('#actionDestacado').val('updateDestacado');
            $('#nameFormDestacado').val('FrmDestacadoModal');
            $('#txtTituloModalManDestacado').html("EDITAR DESTACADO");
            $('#ventanaManDestacado').modal("show");
            document.getElementsByTagName("body")[0].style.paddingRight = "0";
        });
    });
    var entidad = "Destacado";
    $('.btn-eliminar-des').each(function () {
        $(this).click(function () {
            $('#txtIdDestacadoER').val($(this.parentElement.parentElement).attr('id'));
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
                    $('#action' + entidad).val("delete" + entidad);
                    $("#nameFormDestacado").val("Frm" + entidad + "Modal");
                    $('#modalCargando' + entidad).modal("show");
                }
            });
            $('.swal2-confirm').css("margin-right", "15px");
            $('.swal2-container').css('z-index', '2000');
            document.getElementsByTagName("body")[0].style.paddingRight = "0";
        });
    });

    $('.btn-cambiar-estado-des').each(function () {
        $(this).click(function () {
            $('#txtIdDestacadoER').val($(this.parentElement.parentElement).attr('id'));
            if ($(this).attr('opcion_estado').toLowerCase() === "publicar") {
                $('#txtEstadoDestacadoER').val("true");
            } else {
                $('#txtEstadoDestacadoER').val("false");
            }
            swal({
                title: 'PEAM',
                text: "¿Está seguro de " + $(this).attr('opcion_estado') + " este Destacado?",
                type: 'warning',
                showCancelButton: true,
                confirmButtonText: 'Sí, continuar!',
                cancelButtonText: 'No, cancelar!',
                confirmButtonClass: 'btn btn-info',
                cancelButtonClass: 'btn btn-danger',
                buttonsStyling: false
            }).then((result) => {
                if (result.value) {
                    $('#actionDestacado').val("activateDestacado");
                    $("#nameFormDestacado").val("FrmDestacadoModal");
                    $('#modalCargandoDestacado').modal("show");
                }
            });
            $('.swal2-confirm').css("margin-right", "15px");
            document.getElementsByTagName("body")[0].style.paddingRight = "0";
        });
    });
}

function valicacionesCamposDestacado() {
    $('#datePickerFechaDestacadoER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtTituloDestacadoER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtContenidoDestacadoER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtUrlDestacadoER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtFotoDestacadoER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
}

function validarFormularioDestacado() {
    if ($('#datePickerFechaDestacadoER').val() === "") {
        $($('#datePickerFechaDestacadoER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtTituloDestacadoER').val() === "") {
        $($('#txtTituloDestacadoER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtUrlDestacadoER').val() === "") {
        $($('#txtUrlDestacadoER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtFotoDestacadoER').val() === "") {
        $($('#txtFotoDestacadoER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    return true;
}

