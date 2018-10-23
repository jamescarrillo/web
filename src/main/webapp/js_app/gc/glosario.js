$(document).ready(function () {

    cargarAniosCombo($('#comboAnio'), 2000, "-1", 'TODOS');
    
    $("#FrmGlosario").submit(function () {
        $("#nameForm").val("FrmGlosario");
        $("#numberPageGlosario").val(1);
        $('#actionGlosario').val("paginarGlosario");
        $('#modalCargandoGlosario').modal("show");
        return false;
    });

    $("#FrmGlosarioModal").submit(function () {
        if (validarFormularioGlosario()) {
            $("#numberPageGlosario").val(1);
            $("#nameForm").val("FrmGlosarioModal");
            $('#modalCargandoGlosario').modal("show");
            //viewAlert('warning', 'Estamos trabajando!');
        }
        return false;
    });

    $("#modalCargandoGlosario").on('shown.bs.modal', function () {
        //DESPUES DE TERMINAR DE MOSTRAR EL MODAL
        procesarAjaxGlosario();
    });

    $("#ventanaManGlosario").on('hidden.bs.modal', function () {
        $("#actionGlosario").val("paginarGlosario");
    });

    $('#btnAbrirNuevoGlosario').click(function () {
        $('#FrmGlosarioModal input').val("");
        $('#FrmGlosarioModal textarea').val("");
        $('#FrmGlosarioModal select').val("-1");
        $('#FrmGlosarioModal input').parent().removeClass("has-danger");
        $('#FrmGlosarioModal select').parent().removeClass("has-danger");
        $('#actionGlosario').val("addGlosario");
        $('#txtTituloModalManGlosario').html("REGISTRAR GLOSARIO DE TERMINOS");
        $('#ventanaManGlosario').modal("show");
        document.getElementsByTagName("body")[0].style.paddingRight = "0";
    });

    addEventoCombosPaginar();
    valicacionesCamposGlosario();
    $('#modalCargandoGlosario').modal("show");

});

function procesarAjaxGlosario() {
    var datosSerializadosCompletos = $('#' + $('#nameForm').val()).serialize();
    if ($('#nameForm').val().toLowerCase() !== "frmdglosario") {
        //AGREGAMOS LOS PARAMETROS DEL FORMULARIO DE BUSQUEDA
        datosSerializadosCompletos += "&txtGlosario=" + $('#txtGlosario').val();
        datosSerializadosCompletos += "&comboAnio=" + $('#comboAnio').val();
        datosSerializadosCompletos += "&comboTipoListaGlosario=" + $('#comboTipoListaGlosario').val();
    }
    datosSerializadosCompletos += "&numberPageGlosario=" + $('#numberPageGlosario').val();
    datosSerializadosCompletos += "&sizePageGlosario=" + $('#sizePageGlosario').val();
    datosSerializadosCompletos += "&action=" + $('#actionGlosario').val();
    console.log(datosSerializadosCompletos);
    $.ajax({
        url: getContext() + '/glosarios',
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        success: function (jsonResponse) {
            console.log(jsonResponse);
            $('#modalCargandoGlosario').modal("hide");
            if ($('#actionGlosario').val().toLowerCase() === "paginarglosario") {
                listarGlosario(jsonResponse.BEAN_PAGINATION);
            } else {
                if (jsonResponse.MESSAGE_SERVER.toLowerCase() === "ok") {
                    viewAlert('success', getMessageServerTransaction($('#actionGlosario').val(), 'Glosario de Términos', 'o'));
                    listarGlosario(jsonResponse.BEAN_PAGINATION);
                } else {
                    viewAlert('warning', jsonResponse.MESSAGE_SERVER);
                }
            }
            $("#ventanaManGlosario").modal("hide");
        },
        error: function () {
            $('#modalCargandoGlosario').modal("hide");
            $("#ventanaManGlosario").modal("hide");
            /*MOSTRAMOS MENSAJE ERROR SERVIDOR*/
            viewAlert('error', 'Error interno en el servidor!');
        }
    });
    return false;
}

function listarGlosario(BEAN_PAGINATION) {
    /*PAGINATION*/
    var $pagination = $('#paginationGlosario');
    $('#tbodyGlosario').empty();
    if (BEAN_PAGINATION.COUNT_FILTER > 0) {
        var fila;
        $.each(BEAN_PAGINATION.LIST, function (index, value) {

            fila = "<tr ";
            fila += "id='" + value.id + "' ";
            fila += "titulo='" + value.titulo + "' ";
            fila += "descripcion='" + value.descripcion + "' ";
            fila += "fecha_hora='" + value.fecha_hora + "' ";
            fila += ">";
            fila += "<td class='text-middle'>" + value.titulo + "</td>";
            fila += "<td class='align-middle '>" + value.descripcion + "</td>";
            fila += "<td class='align-middle '><button class='btn btn-secondary btn-sm editar-Glosario'><i class='fas fa-edit'></i></button></td>";
            fila += "<td class='align-middle'><button class='btn btn-secondary btn-sm eliminar-Glosario'><i class='fas fa-trash-alt'></i></button></td>";
            fila += "</tr>";
            $('#tbodyGlosario').append(fila);
        });
        var defaultOptions = getDefaultOptionsPagination();
        var options = getOptionsPagination(BEAN_PAGINATION.COUNT_FILTER, $('#sizePageGlosario'),
                $('#numberPageGlosario'), $('#actionGlosario'), 'paginarGlosario',
                $('#nameForm'), 'FrmGlosario', $('#modalCargandoGlosario'));
        $pagination.twbsPagination('destroy');
        $pagination.twbsPagination($.extend({}, defaultOptions, options));
        agregarEventosGlosario();
        $('#txtNombreGlosario').focus();
    } else {
        $pagination.twbsPagination('destroy');
        viewAlert('warning', 'No se enconntraron resultados');
    }
}

function agregarEventosGlosario() {
    $('.editar-Glosario').each(function () {
        $(this).click(function () {
            $('#txtIdER').val($(this.parentElement.parentElement).attr('id'));
            $('#txtTituloER').val($(this.parentElement.parentElement).attr('titulo'));
            $('#txtDescripcionER').val($(this.parentElement.parentElement).attr('descripcion'));
            $('#actionGlosario').val('updateGlosario');
            $('#txtTituloModalManGlosario').html("EDITAR GLOSARIO DE TERMINOS");
            $('#ventanaManGlosario').modal("show");
            document.getElementsByTagName("body")[0].style.paddingRight = "0";
        });
    });
    $('.eliminar-Glosario').each(function () {
        $(this).click(function () {
            $('#txtIdER').val($(this.parentElement.parentElement).attr('id'));
            viewAlertDelete("Glosario");
            document.getElementsByTagName("body")[0].style.paddingRight = "0";
        });
    });
}

function valicacionesCamposGlosario() {
    $('#txtTituloER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtDescripcionER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
}

function validarFormularioGlosario() {
    if ($('#txtTituloER').val() === "") {
        $($('#txtTituloER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtDescripcionER').val() === "") {
        $($('#txtDescripcionER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    return true;
}


