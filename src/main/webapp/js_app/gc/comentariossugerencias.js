$(document).ready(function () {

    $('#txtFechaER').datepicker({
        format: 'dd/mm/yyyy',
        todayHighlight: true,
        autoclose: true
    });

    cargarAniosCombo($('#comboAnio'), 2000, "-1", 'AÑO');

    $("#FrmComentSuggest").submit(function () {
        $("#nameForm").val("FrmComentSuggest");
        $("#numberPageComentSuggest").val(1);
        $('#actionComentSuggest').val("paginarComentSuggest");
        $('#modalCargandoComentSuggest').modal("show");
        return false;
    });

    $("#FrmComentSuggestModal").submit(function () {
        if (validarFormularioComentSuggest()) {
            $("#numberPageComentSuggest").val(1);
            $("#nameForm").val("FrmComentSuggestModal");
            $('#modalCargandoComentSuggest').modal("show");
        }
        return false;
    });

    $("#modalCargandoComentSuggest").on('shown.bs.modal', function () {
        //DESPUES DE TERMINAR DE MOSTRAR EL MODAL
        procesarAjaxComentSuggest();
    });

    $("#ventanaManComentSuggest").on('hidden.bs.modal', function () {
        $("#actionComentSuggest").val("paginarComentSuggest");
    });

    addEventoCombosPaginar();
    valicacionesCamposComentSuggest();
    $('#modalCargandoComentSuggest').modal("show");

});

function procesarAjaxComentSuggest() {
    var datosSerializadosCompletos = $('#' + $('#nameForm').val()).serialize();
    if ($('#nameForm').val().toLowerCase() !== "frmcomentsuggest") {
        //AGREGAMOS LOS PARAMETROS DEL FORMULARIO DE BUSQUEDA
        datosSerializadosCompletos += "&txtComentSuggest=" + $('#txtComentSuggest').val();
        datosSerializadosCompletos += "&comboAnio=" + $('#comboAnio').val();
    }
    datosSerializadosCompletos += "&numberPageComentSuggest=" + $('#numberPageComentSuggest').val();
    datosSerializadosCompletos += "&sizePageComentSuggest=" + $('#sizePageComentSuggest').val();
    datosSerializadosCompletos += "&action=" + $('#actionComentSuggest').val();
    $.ajax({
        url: getContext() + '/participacionciudadana/comentariossugerencias',
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        success: function (jsonResponse) {
            $('#modalCargandoComentSuggest').modal("hide");
            if ($('#actionComentSuggest').val().toLowerCase() === "paginarcomentsuggest") {
                listarComentSuggest(jsonResponse.BEAN_PAGINATION);
            } else {
                if (jsonResponse.MESSAGE_SERVER.toLowerCase() === "ok") {
                    viewAlert('success', getMessageServerTransaction($('#actionComentSuggest').val(), 'Comentario/Sugerencia', 'o(a)'));
                    listarComentSuggest(jsonResponse.BEAN_PAGINATION);
                } else {
                    viewAlert('warning', jsonResponse.MESSAGE_SERVER);
                }
            }
            $("#ventanaManComentSuggest").modal("hide");
        },
        error: function () {
            $('#modalCargandoComentSuggest').modal("hide");
            $("#ventanaManComentSuggest").modal("hide");
            /*MOSTRAMOS MENSAJE ERROR SERVIDOR*/
            viewAlert('error', 'Error interno en el servidor!');
        }
    });
    return false;
}

function listarComentSuggest(BEAN_PAGINATION) {
    /*PAGINATION*/
    var $pagination = $('#paginationComentSuggest');
    $('#containerComentarios').empty();
    if (BEAN_PAGINATION.COUNT_FILTER > 0) {
        var atributosComentSuggest;
        var card;
        $.each(BEAN_PAGINATION.LIST, function (index, value) {

            atributosComentSuggest = "id='" + value.numero + "' ";
            atributosComentSuggest += "anho='" + value.anho + "' ";
            atributosComentSuggest += "usuario='" + value.usuario + "' ";
            atributosComentSuggest += "fecha='" + value.fecha + "' ";
            atributosComentSuggest += "correo='" + value.correo + "' ";
            atributosComentSuggest += "tema='" + value.tema + "' ";
            atributosComentSuggest += "descripcion='" + value.descripcion + "' ";
            card = "<div class='d-flex flex-row comment-row'>";

//            card += "<div class='p-2'>";
//            card += "<span class='round'><img src='../assets/images/users/1.jpg' alt='user' width='50'></span>";
//            card += "</div>";

            card += "<div class='comment-text w-100'>";
            card += "<h5>" + value.usuario + "</h5>";
            card += "<p class='m-b-5'>" + value.descripcion + "</p>";
            card += "<div class='comment-footer' " + atributosComentSuggest + ">";
            card += "<span class='text-muted pull-right mr-2'>" + value.fecha + "</span>";
            card += "<span class='label label-light-info'>" + value.correo + "</span>";
            card += "<span class='action-icons'>";
            card += "<a style='cursor:pointer' class='link mr-2 btn-editar-np' data-toggle='tooltip' title='Editar' data-original-title='Editar'><i class='fas fa-edit'></i></a>";
            card += "<a style='cursor:pointer' class='link btn-eliminar-np' data-toggle='tooltip' title='Eliminar' data-original-title='Eliminar'><i class='fas fa-trash-alt'></i></a>";

            card += "</span>";

            card += "</div>";

            card += "</div>";

            card += "</div>";


            $('#containerComentarios').append(card);
        });
        var defaultOptions = getDefaultOptionsPagination();
        var options = getOptionsPagination(BEAN_PAGINATION.COUNT_FILTER, $('#sizePageComentSuggest'),
                $('#numberPageComentSuggest'), $('#actionComentSuggest'), 'paginarComentSuggest',
                $('#nameForm'), 'FrmComentSuggest', $('#modalCargandoComentSuggest'));
        $pagination.twbsPagination('destroy');
        $pagination.twbsPagination($.extend({}, defaultOptions, options));
        agregarEventosComentSuggest();
        $('#txtNombreComentSuggest').focus();
    } else {
        $pagination.twbsPagination('destroy');
        viewAlert('warning', 'No se enconntraron resultados');
    }
}

function agregarEventosComentSuggest() {

    $('.btn-editar-np').each(function () {
        $(this).click(function () {
            $('#txtNumeroER').val($(this.parentElement.parentElement).attr('id'));
            $('#txtFechaER').val($(this.parentElement.parentElement).attr('fecha'));
            $('#txtUsuarioER').val($(this.parentElement.parentElement).attr('usuario'));
            $('#txtCorreoER').val($(this.parentElement.parentElement).attr('correo'));
            $('#txtTemaER').val($(this.parentElement.parentElement).attr('tema'));
            $('#txtContenidoER').val($(this.parentElement.parentElement).attr('descripcion'));
            $('#actionComentSuggest').val('updateComentSuggest');
            $('#txtTituloModalManComentSuggest').html("EDITAR COMENTARIO");
            $('#ventanaManComentSuggest').modal("show");
            document.getElementsByTagName("body")[0].style.paddingRight = "0";
        });
    });

    $('.btn-eliminar-np').each(function () {
        $(this).click(function () {
            $('#txtNumeroER').val($(this.parentElement.parentElement).attr('id'));
            viewAlertDelete("ComentSuggest");
            document.getElementsByTagName("body")[0].style.paddingRight = "0";
        });
    });
}

function valicacionesCamposComentSuggest() {
    $('#txtFechaER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtUsuarioER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtCorreoER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtTemaER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtContenidoER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
}

function validarFormularioComentSuggest() {
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
    if ($('#txtTemaER').val() === "") {
        $($('#txtTemaER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtContenidoER').val() === "") {
        $($('#txtContenidoER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    return true;
}