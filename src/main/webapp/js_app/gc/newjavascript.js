
function procesarAjaxDocumentCal() {
    var form = $('#' + $('#nameFormDC').val())[0];
    var datosSerializadosCompletos = new FormData(form);
    datosSerializadosCompletos.append('txtCalendarioId', $('#txtCalendarioId').val());
    datosSerializadosCompletos.append('action', $('#actionDocumentCal').val());
    $.ajax({
        url: getContext() + '/gestiontransparente/directivos',
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        enctype: 'multipart/form-data',
        processData: false,
        contentType: false,
        cache: false,
        timeout: 600000,
        success: function (jsonResponse) {
            $('#modalCargandoDocumentCal').modal("hide");
            if ($('#actionDocumentCal').val().toLowerCase() === "paginardocumentcal") {
                listarDocumentCal(jsonResponse.BEAN_PAGINATION);
            } else {
                if (jsonResponse.MESSAGE_SERVER.toLowerCase() === "ok") {
                    listarDocumentCal(jsonResponse.BEAN_PAGINATION);
                    viewAlert('success', getMessageServerTransaction($('#actionDocumentCal').val(), 'Archivo', 'o'));
                } else {
                    viewAlert('warning', jsonResponse.MESSAGE_SERVER);
                }
            }
            $("#ventanaManDocumentCal").modal("hide");
        },
        error: function () {
            $('#modalCargandoDocumentCal').modal("hide");
            $("#ventanaManDocumentCal").modal("hide");
            /*MOSTRAMOS MENSAJE ERROR SERVIDOR*/
            viewAlert('error', 'Error interno en el servidor!');
        }
    });
    return false;
}

function listarDocumentCal(BEAN_PAGINATION) {
    $('#tbodyDocumentCal').empty();
    if (BEAN_PAGINATION.COUNT_FILTER > 0) {
        var fila;
        $.each(BEAN_PAGINATION.LIST, function (index, value) {
            //text-center align-middle
            fila = "<tr ";
            fila += "doco_id='" + value.doco_id + "' ";
            fila += "nombre='" + value.nombre + "' ";
            fila += "url_file='" + value.url_file + "' ";
            fila += "estado='" + value.estado + "' ";
            fila += "id='" + value.id.id + "' ";
            fila += ">";
            fila += "<td class='align-middle text-medium-table' >" + value.nombre + "</td>";
            fila += "<td class='text-center align-middle text-medium-table' >" + value.url_file + "</td>";
            fila += "<td class='align-middle'><button class='btn btn-success btn-sm eliminar-Archivo' data-toggle='tooltip' title='Eliminar Archivo'><i class='fas fa-trash-alt'></i></button></td>";
            fila += "</tr>";
            $('#tbodyDocumentCal').append(fila);
        });

        agregarEventosDocumentCal();
        $('#txtNombreDocumentCal').focus();
    } else {

        viewAlert('warning', 'No se encontraron resultados');
        $('#tbodyDocumentCal').empty();
    }
}

function agregarEventosDocumentCal() {
    $('.eliminar-Archivo').each(function () {
        $(this).click(function () {
            $('#txtDoco_IdER').val($(this.parentElement.parentElement).attr('doco_id'));
            viewAlertDelete("DocumentCal");
            document.getElementsByTagName("body")[0].style.paddingRight = "0";
        });
    });
}

function valicacionesCamposDocumentCal() {
    $('#txtNombreERDC').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtNombreArchivoERDC').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
}

function validarFormularioDocumentCal() {
    if ($('#txtNombreERDC').val() === "") {
        $($('#txtNombreERDC').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtNombreArchivoERDC').val() === "") {
        $($('#txtNombreArchivoERDC').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }

    return true;
}

