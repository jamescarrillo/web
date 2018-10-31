$(document).ready(function () {

    $('#txtFechaER').datepicker({
        format: 'dd/mm/yyyy',
        todayHighlight: true,
        autoclose: true
    });

    cargarAniosCombo($('#comboAnio'), 2005, "-1", 'AÑO');

    $("#FrmMultimedia").submit(function () {
        $("#nameForm").val("FrmMultimedia");
        $("#numberPageMultimedia").val(1);
        $('#actionMultimedia').val("paginarMultimedia");
        $('#modalCargandoMultimedia').modal("show");
        return false;
    });

    $("#FrmMultimediaModal").submit(function () {
        if (validarFormularioMultimedia()) {
            $("#numberPageMultimedia").val(1);
            $("#nameForm").val("FrmMultimediaModal");
            $('#modalCargandoMultimedia').modal("show");
        }
        return false;
    });

    $("#modalCargandoMultimedia").on('shown.bs.modal', function () {
        //DESPUES DE TERMINAR DE MOSTRAR EL MODAL
        procesarAjaxMultimedia();
    });

    $("#ventanaManMultimedia").on('hidden.bs.modal', function () {
        $("#actionMultimedia").val("paginarMultimedia");
    });

    $('#btnAbrirNuevoMultimedia').click(function () {
        $('#FrmMultimediaModal input').val("");
        $('#FrmMultimediaModal textarea').val("");
        $('#FrmMultimediaModal select').val("-1");
        $('#FrmMultimediaModal input').parent().removeClass("has-danger");
        $('#FrmMultimediaModal select').parent().removeClass("has-danger");
        $('#txtEstadoMultimediaER').val("false");
        $('#actionMultimedia').val("addMultimedia");
        $('#txtTituloModalManMultimedia').html("REGISTRAR NOTICIA MULTIMEDIA");
        $('#ventanaManMultimedia').modal("show");
        document.getElementsByTagName("body")[0].style.paddingRight = "0";
    });

    addEventoCombosPaginar();
    valicacionesCamposMultimedia();
    $('#modalCargandoMultimedia').modal("show");

});

function procesarAjaxMultimedia() {
    var datosSerializadosCompletos = $('#' + $('#nameForm').val()).serialize();
    if ($('#nameForm').val().toLowerCase() !== "frmmultimedia") {
        //AGREGAMOS LOS PARAMETROS DEL FORMULARIO DE BUSQUEDA
        datosSerializadosCompletos += "&txtMultimedia=" + $('#txtMultimedia').val();
        datosSerializadosCompletos += "&comboAnio=" + $('#comboAnio').val();
    }
    datosSerializadosCompletos += "&txtEstadoER=" + $('#txtEstadoER').val();
    datosSerializadosCompletos += "&txtDefectoER=" + $('#txtDefectoER').val();
    datosSerializadosCompletos += "&numberPageMultimedia=" + $('#numberPageMultimedia').val();
    datosSerializadosCompletos += "&sizePageMultimedia=" + $('#sizePageMultimedia').val();
    datosSerializadosCompletos += "&action=" + $('#actionMultimedia').val();
    console.log(datosSerializadosCompletos);
    $.ajax({
        url: getContext() + '/publicaciones/noticiasmultimedia',
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        success: function (jsonResponse) {
            console.log(jsonResponse);
            $('#modalCargandoMultimedia').modal("hide");
            if ($('#actionMultimedia').val().toLowerCase() === "paginarmultimedia") {
                listarMultimedia(jsonResponse.BEAN_PAGINATION);
            } else {
                if (jsonResponse.MESSAGE_SERVER.toLowerCase() === "ok") {
                    viewAlert('success', getMessageServerTransaction($('#actionMultimedia').val(), 'Noticia Multimedia', 'a'));
                    listarMultimedia(jsonResponse.BEAN_PAGINATION);
                } else {
                    viewAlert('warning', jsonResponse.MESSAGE_SERVER);
                }
            }
            $("#ventanaManMultimedia").modal("hide");
        },
        error: function () {
            $('#modalCargandoMultimedia').modal("hide");
            $("#ventanaManMultimedia").modal("hide");
            /*MOSTRAMOS MENSAJE ERROR SERVIDOR*/
            viewAlert('error', 'Error interno en el servidor!');
        }
    });
    return false;
}

function listarMultimedia(BEAN_PAGINATION) {
    /*PAGINATION*/
    var $pagination = $('#paginationMultimedia');
    $('#containerRegistrosNotasPrensa').empty();
    if (BEAN_PAGINATION.COUNT_FILTER > 0) {
        var atributosMultimedia;
        var card;
        var cadenaContenido;
        var textColor;
        var icono;
        var opcion_estado;
        var icono1;
        var opcion_estado1;
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
            if (!value.defecto) {
                icono1 = "<i class='far fa-star'></i>";
                opcion_estado1 = "Destacar";
            } else {
                opcion_estado1 = "Quitar de Favoritos";
                icono1 = "<i class='fas fa-star'></i>";
            }
            cadenaContenido = value.titulo;
            cadenaContenido = replaceAll(cadenaContenido, '<p>', '');
            cadenaContenido = replaceAll(cadenaContenido, '</p>', '\n');

            atributosMultimedia = "id='" + value.id + "' ";
            atributosMultimedia += "titulo='" + value.titulo + "' ";
            atributosMultimedia += "contenido='Publicado el " + value.fecha + "' ";
            atributosMultimedia += "fuente='" + value.fuente + "' ";
            atributosMultimedia += "fecha='" + value.fecha + "' ";
            atributosMultimedia += "estado='" + value.estado + "' ";
            atributosMultimedia += "usuario='" + value.usuario.pers_id + "' ";
            atributosMultimedia += "defecto='" + value.defecto + "' ";


            //cadenaContenido = cadenaContenido.substring(0, 120) + "...";
            cadenaContenido = getResumenContenidoWeb(cadenaContenido, 120) + "...";
            card = "<div class='col-lg-4 col-md-6'>";

            card += "<div class='card blog-widget'>";

            card += "<div class='card-body'>";

            card += "<div class='blog-image'></div>";

            card += "<h3 class='" + textColor + "'>" + value.titulo + "</h3>";

            card += "<label class='label label-success'><object style='width:100%;height:100%;width: 230px; height: 120.25px; float: none; clear: both; margin: 2px auto;' data='"+value.fuente+"'></object></label>";

            card += "<p class='m-t-15 m-b-20 " + textColor + "'>" + value.fecha + "</p>";

            //card += cadenaContenido;

            card += "<div class='d-flex' " + atributosMultimedia + ">";

            card += "<div class='read'><a class='link font-medium btn-vista-previa-np' style='cursor:pointer'>Vista Previa</a></div>";

            card += "<div class='ml-auto'>";

            card += "<a style='cursor:pointer' class='link mr-2 btn-cambiar-estado-np' data-toggle='tooltip' title='" + opcion_estado + "' data-original-title='' opcion_estado='" + opcion_estado.toLowerCase() + "'>" + icono + "</a>";
            card += "<a style='cursor:pointer' class='link mr-2 btn-volver-favorito-np' data-toggle='tooltip' title='" + opcion_estado1 + "' data-original-title='' opcion_estado1='" + opcion_estado1.toLowerCase() + "'>" + icono1 + "</a>";
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
        var options = getOptionsPagination(BEAN_PAGINATION.COUNT_FILTER, $('#sizePageMultimedia'),
                $('#numberPageMultimedia'), $('#actionMultimedia'), 'paginarMultimedia',
                $('#nameForm'), 'FrmMultimedia', $('#modalCargandoMultimedia'));
        $pagination.twbsPagination('destroy');
        $pagination.twbsPagination($.extend({}, defaultOptions, options));
        agregarEventosMultimedia();
        $('#txtNombreMultimedia').focus();
    } else {
        $pagination.twbsPagination('destroy');
        viewAlert('warning', 'No se enconntraron resultados');
    }
}

function agregarEventosMultimedia() {

    $('.btn-vista-previa-np').each(function () {
        $(this).click(function () {
            $('#tituloMultimediaVP').html($(this.parentElement.parentElement).attr('titulo'));
            $('#resumenMultimediaVP').html(getResumenContenidoWeb($(this.parentElement.parentElement).attr('contenido'), 80) + "...");
            $('#ventanaVistaPreviaMultimedia').modal("show");
            document.getElementsByTagName("body")[0].style.paddingRight = "0";
        });
    });

    $('.btn-editar-np').each(function () {
        $(this).click(function () {
            $('#txtIdER').val($(this.parentElement.parentElement).attr('id'));
            $('#txtFechaER').val($(this.parentElement.parentElement).attr('fecha'));
            $('#txtTituloER').val($(this.parentElement.parentElement).attr('titulo'));
            $('#txtFuenteER').val($(this.parentElement.parentElement).attr('fuente'));
            $('#actionMultimedia').val('updateMultimedia');
            $('#txtTituloModalManMultimedia').html("EDITAR NOTICIA MULTIMEDIA");
            $('#ventanaManMultimedia').modal("show");
            document.getElementsByTagName("body")[0].style.paddingRight = "0";
        });
    });

    $('.btn-eliminar-np').each(function () {
        $(this).click(function () {
            $('#txtIdER').val($(this.parentElement.parentElement).attr('id'));
            viewAlertDelete("Multimedia");
            document.getElementsByTagName("body")[0].style.paddingRight = "0";
        });
    });

    $('.btn-cambiar-estado-np').each(function () {
        $(this).click(function () {
            $('#txtIdER').val($(this.parentElement.parentElement).attr('id'));
            if ($(this).attr('opcion_estado').toLowerCase() === "ocultar") {
                $('#txtEstadoER').val("true");
            } else {
                $('#txtEstadoER').val("false");
            }
            swal({
                title: 'PEAM',
                text: "¿Está seguro de " + $(this).attr('opcion_estado') + " esta Noticia Multimedia?",
                type: 'warning',
                showCancelButton: true,
                confirmButtonText: 'Sí, continuar!',
                cancelButtonText: 'No, cancelar!',
                confirmButtonClass: 'btn btn-info',
                cancelButtonClass: 'btn btn-danger',
                buttonsStyling: false
            }).then((result) => {
                if (result.value) {
                    $('#actionMultimedia').val("activateMultimedia");
                    $("#nameForm").val("FrmMultimediaModal");
                    $('#modalCargandoMultimedia').modal("show");
                }
            });
            $('.swal2-confirm').css("margin-right", "15px");
            document.getElementsByTagName("body")[0].style.paddingRight = "0";
        });
    });

    $('.btn-volver-favorito-np').each(function () {
        $(this).click(function () {
            $('#txtIdER').val($(this.parentElement.parentElement).attr('id'));
            $('#txtFechaER').val($(this.parentElement.parentElement).attr('fecha'));
            $('#txtTituloER').val($(this.parentElement.parentElement).attr('titulo'));
            $('#txtFuenteER').val($(this.parentElement.parentElement).attr('fuente'));
            if ($(this).attr('opcion_estado1').toLowerCase() !== "destacar") {
                $('#txtDefectoER').val("true");
            } else {
                $('#txtDefectoER').val("false");
            }
            swal({
                title: 'PEAM',
                text: "¿Está seguro de " + $(this).attr('opcion_estado1') + " esta Noticia Multimedia?",
                type: 'warning',
                showCancelButton: true,
                confirmButtonText: 'Sí, continuar!',
                cancelButtonText: 'No, cancelar!',
                confirmButtonClass: 'btn btn-info',
                cancelButtonClass: 'btn btn-danger',
                buttonsStyling: false
            }).then((result) => {
                if (result.value) {
                    $('#actionMultimedia').val("favoriteMultimedia");
                    $("#nameForm").val("FrmMultimediaModal");
                    $('#modalCargandoMultimedia').modal("show");
                }
            });
            $('.swal2-confirm').css("margin-right", "15px");
            document.getElementsByTagName("body")[0].style.paddingRight = "0";
        });
    });
}

function valicacionesCamposMultimedia() {
    $('#txtFechaER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtTituloER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtFuenteER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
}

function validarFormularioMultimedia() {
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
    if ($('#txtFuenteER').val() === "") {
        $($('#txtFuenteER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }

    return true;
}