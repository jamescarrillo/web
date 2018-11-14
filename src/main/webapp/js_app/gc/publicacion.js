$(document).ready(function () {

    cargarAniosCombo($('#comboAnioPublicacion'), 2005, "-1", 'AÑO');

    $('#txtFechaPublicacionER').datepicker({
        format: 'dd/mm/yyyy',
        todayHighlight: true,
        autoclose: true
    });

    $("#FrmPublicacion").submit(function () {
        $("#nameForm").val("FrmPublicacion");
        $("#numberPagePublicacion").val(1);
        $('#actionPublicacion').val("paginarPublicacion");
        $('#modalCargandoPublicacion').modal("show");
        return false;
    });

    $("#FrmPublicacionModal").submit(function () {
        if (validarFormularioPublicacion()) {
            $("#numberPagePublicacion").val(1);
            $("#nameForm").val("FrmPublicacionModal");
            $('#modalCargandoPublicacion').modal("show");
        }
        return false;
    });

    $('#btnAbrirNuevoPublicacion').click(function () {
        $('#FrmPublicacionModal input').val("");
        $('#FrmPublicacionModal textarea').val("");
        $('#FrmPublicacionModal select').val("-1");
        $('#FrmPublicacionModal input').parent().removeClass("has-danger");
        $('#FrmPublicacionModal select').parent().removeClass("has-danger");
        $('#actionPublicacion').val("addPublicacion");
        $('#txtTituloModalManPublicacion').html("REGISTRAR OTPU");
        $('#ventanaManPublicacion').modal("show");
        document.getElementsByTagName("body")[0].style.paddingRight = "0";
    });

    $("#modalCargandoPublicacion").on('shown.bs.modal', function () {
        //DESPUES DE TERMINAR DE MOSTRAR EL MODAL
        procesarAjaxPublicacion();
    });

    $("#ventanaManPublicacion").on('hidden.bs.modal', function () {
        $("#actionPublicacion").val("paginarPublicacion");
        $('#txtFechaAprobacionER').parent().removeClass("has-danger");
        $('#txtDescripcionER').parent().removeClass("has-danger");
        $('#txtResolucionAprobacionER').parent().removeClass("has-danger");
        $('#txtEstadoER').parent().removeClass("has-danger");
    });

    addEventoCombosPaginar();
    valicacionesCamposPublicacion();
    $('#modalCargandoPublicacion').modal("show");

});



function procesarAjaxPublicacion() {
    var pathname = window.location.pathname;
    pathname = pathname.substring(getContext().length, pathname.length);
    var datosSerializadosCompletos = $('#' + $('#nameForm').val()).serialize();
    if ($('#nameForm').val().toLowerCase() !== "frmpublicacion") {
        datosSerializadosCompletos += "&txtTituloPublicacion=" + $('#txtTituloPublicacion').val();
        datosSerializadosCompletos += "&comboAnioPublicacion=" + $('#comboAnioPublicacion').val();
        datosSerializadosCompletos += "&comboTipoListaPublicacion=" + $('#comboTipoListaPublicacion').val();
    }
    datosSerializadosCompletos += "&numberPagePublicacion=" + $('#numberPagePublicacion').val();
    datosSerializadosCompletos += "&sizePagePublicacion=" + $('#sizePagePublicacion').val();
    datosSerializadosCompletos += "&action=" + $('#actionPublicacion').val();
    datosSerializadosCompletos += "&url_publicacion=" + pathname;
    console.log($('#txtFechaPublicacionER').val());
    $.ajax({
        url: getContext() + '/publicaciones/otraspublicaciones',
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        success: function (jsonResponse) {
            $('#modalCargandoPublicacion').modal("hide");
            $('#ventanaManPublicacion').modal("hide");
            if ($('#actionPublicacion').val().toLowerCase() === "paginarpublicacion") {
                listarPublicacion(jsonResponse.BEAN_PAGINATION);
            } else {
                if (jsonResponse.MESSAGE_SERVER.toLowerCase() === "ok") {
                    listarPublicacion(jsonResponse.BEAN_PAGINATION);
                    viewAlert('success', getMessageServerTransaction($('#actionPublicacion').val(), 'Publicacion', 'o'));
                } else {
                    viewAlert('warning', jsonResponse.MESSAGE_SERVER);
                }
            }
        },
        error: function () {
            $('#modalCargandoPublicacion').modal("hide");
            $("#ventanaManPublicacion").modal("hide");
            /*MOSTRAMOS MENSAJE ERROR SERVIDOR*/
            viewAlert('error', 'Error interno en el servidor!');
        }
    });
    return false;
}

function listarPublicacion(BEAN_PAGINATION) {
    /*PAGINATION*/
    var $pagination = $('#paginationPublicacion');
    $('#tbodyPublicacion').empty();
    if (BEAN_PAGINATION.COUNT_FILTER > 0) {
        var fila;
        var text_color;
        var icono;
        var tooltip;
        $.each(BEAN_PAGINATION.LIST, function (index, value) {
            text_color = "";
            if (!value.estado) {
                text_color = " text-danger";
                icono = "<i class='far fa-hand-point-up'></i>";
                tooltip = "Publicar";
            } else {
                icono = "<i class='far fa-hand-point-down'></i>";
                tooltip = "Ocultar";
            }
            fila = "<tr ";
            fila += "id='" + value.id + "' ";
            fila += "anho='" + value.anho + "' ";
            fila += "titulo='" + value.titulo + "' ";
            fila += "descripcion='" + value.descripcion + "' ";
            fila += "tipo='" + value.tipo + "' ";
            fila += "estado='" + value.estado + "' ";
            fila += "docu_id='" + value.docu_id + "' ";
            fila += ">";
            fila += "<td class='align-middle text-medium-table " + text_color + "'>" + value.anho + "</td>";
            fila += "<td class='align-middle text-medium-table " + text_color + "'>" + value.titulo + "</td>";
            fila += "<td class='align-middle text-medium-table " + text_color + "'>" + value.descripcion + "</td>";
            fila += "<td class='align-middle text-medium-table " + text_color + "'><a href='http://lib.peam.gob.pe:8081/ArcDig/OriArc.pdf?id=" + value.docu_id + "' target='_blank' class='btn btn-success btn-sm descargar-doc' data-toggle='tooltip' title='Descargar Publicacion'><i class='fa fa-download'></i></a></td>";
            fila += "<td class='align-middle text-medium-table " + text_color + "'><button class='btn btn-secondary btn-sm activar-desactivar-publicacion' title='" + tooltip + " Publicacion' opcion='" + tooltip.toLowerCase() + "'>"+icono + "</button></td>";
            fila += "<td class='align-middle text-medium-table " + text_color + "'><button class='btn btn-secondary btn-sm editar-publicacion' title='Editar Publicacion'><i class='fas fa-edit'></i></button></td>";
            fila += "<td class='align-middle text-medium-table " + text_color + "'><button class='btn btn-secondary btn-sm eliminar-publicacion' title='Eliminar Publicacion'><i class='fas fa-trash-alt'></i></button></td>";
            fila += "</tr>";
            $('#tbodyPublicacion').append(fila);
        });
        var defaultOptions = getDefaultOptionsPagination();
        var options = getOptionsPagination(BEAN_PAGINATION.COUNT_FILTER, $('#sizePagePublicacion'),
                $('#numberPagePublicacion'), $('#actionPublicacion'), 'paginarPublicacion',
                $('#nameForm'), 'FrmPublicacion', $('#modalCargandoPublicacion'));
        $pagination.twbsPagination('destroy');
        $pagination.twbsPagination($.extend({}, defaultOptions, options));
        agregarEventosPublicacion();
        $('#txtTituloPublicacion').focus();
    } else {
        $pagination.twbsPagination('destroy');
        viewAlert('warning', 'No se encontraron resultados');
    }
}

function agregarEventosPublicacion() {
    $('.editar-publicacion').each(function () {
        $(this).click(function () {
            $('#txtIdPublicacionER').val($(this.parentElement.parentElement).attr('id'));
            $('#txtAnhoER').val($(this.parentElement.parentElement).attr('anho'));
            $('#txtTituloER').val($(this.parentElement.parentElement).attr('titulo'));
            $('#txtDescripcionER').val($(this.parentElement.parentElement).attr('descripcion'));
            $('#txtEstadoPublicacionER').val($(this.parentElement.parentElement).attr('estado'));
            $('#txtDocu_idPublicacionER').val($(this.parentElement.parentElement).attr('docu_id'));
            $('#actionPublicacion').val('updatePublicacion');
            $('#txtTituloModalManPublicacion').html("EDITAR PUBLICACION");
            $('#ventanaManPublicacion').modal("show");
            document.getElementsByTagName("body")[0].style.paddingRight = "0";
        });
    });
    $('.eliminar-publicacion').each(function () {
        $(this).click(function () {
            $('#txtIdPublicacionER').val($(this.parentElement.parentElement).attr('id'));
            $('#txtEstadoPublicacionER').val($(this.parentElement.parentElement).attr('tipo'));
            swal({
                title: 'PEAM',
                text: "¿Está seguro de eliminar este Publicacion?",
                type: 'warning',
                showCancelButton: true,
                confirmButtonText: 'Sí, continuar!',
                cancelButtonText: 'No, cancelar!',
                confirmButtonClass: 'btn btn-info',
                cancelButtonClass: 'btn btn-danger',
                buttonsStyling: false
            }).then((result) => {
                if (result.value) {
                    $('#actionPublicacion').val("deletePublicacion");
                    $("#nameForm").val("FrmPublicacionModal");
                    $('#modalCargandoPublicacion').modal("show");
                }
            });
            $('.swal2-confirm').css("margin-right", "15px");
            document.getElementsByTagName("body")[0].style.paddingRight = "0";
        });
    });

    $('.activar-desactivar-publicacion').each(function () {
        $(this).click(function () {
            $('#txtIdPublicacionER').val($(this.parentElement.parentElement).attr('id'));
            if ($(this).attr('opcion').toLowerCase() === "publicar") {
                $('#txtEstadoPublicacionER').val("true");
            } else {
                $('#txtEstadoPublicacionER').val("false");
            }
            swal({
                title: 'PEAM',
                text: "¿Está seguro de " + $(this).attr('opcion') + " este Publicacion?",
                type: 'warning',
                showCancelButton: true,
                confirmButtonText: 'Sí, continuar!',
                cancelButtonText: 'No, cancelar!',
                confirmButtonClass: 'btn btn-info',
                cancelButtonClass: 'btn btn-danger',
                buttonsStyling: false
            }).then((result) => {
                if (result.value) {
                    $('#actionPublicacion').val("activatePublicacion");
                    $("#nameForm").val("FrmPublicacionModal");
                    $('#modalCargandoPublicacion').modal("show");
                }
            });
            $('.swal2-confirm').css("margin-right", "15px");
            document.getElementsByTagName("body")[0].style.paddingRight = "0";
        });
    });



}

function valicacionesCamposPublicacion() {
    $('#txtFechaPublicacionER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtDescripcionER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtTituloER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtEstadoPublicacionER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
}

function validarFormularioPublicacion() {

    if ($('#txtDescripcionER').val() === "") {
        $($('#txtDescripcionER').parent()).addClass('has-danger');
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
    if ($('#txtEstadoPublicacionER').val() === "-1") {
        $($('#txtEstadoPublicacionER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    return true;
}

