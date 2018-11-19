$(document).ready(function () {

    cargarAniosCombo($('#comboAnioViatico'), 2005, "-1", 'AÑO');

    $('#txtFechaSalidaER').datepicker({
        format: 'dd/mm/yyyy',
        todayHighlight: true,
        autoclose: true
    });

    $('#txtFechaRetornoER').datepicker({
        format: 'dd/mm/yyyy',
        todayHighlight: true,
        autoclose: true
    });

    $("#FrmViatico").submit(function () {
        $("#nameForm").val("FrmViatico");
        $("#numberPageViatico").val(1);
        $('#actionViatico').val("paginarViatico");
        $('#modalCargandoViatico').modal("show");
        return false;
    });

    $("#FrmViaticoModal").submit(function () {
        if (validarFormularioViatico()) {
            $("#numberPageViatico").val(1);
            $("#nameForm").val("FrmViaticoModal");
            $('#modalCargandoViatico').modal("show");
        }
        return false;
    });

    $('#btnAbrirNuevoViatico').click(function () {
        $('#FrmViaticoModal input').val("");
        $('#FrmViaticoModal textarea').val("");
        $('#FrmViaticoModal select').val("-1");
        $('#FrmViaticoModal input').parent().removeClass("has-danger");
        $('#FrmViaticoModal select').parent().removeClass("has-danger");
        $('#actionViatico').val("addViatico");
        $('#txtTituloModalManViatico').html("REGISTRAR OTPU");
        $('#ventanaManViatico').modal("show");
        document.getElementsByTagName("body")[0].style.paddingRight = "0";
    });

    $("#modalCargandoViatico").on('shown.bs.modal', function () {
        //DESPUES DE TERMINAR DE MOSTRAR EL MODAL
        procesarAjaxViatico();
    });

    $("#ventanaManViatico").on('hidden.bs.modal', function () {
        $("#actionViatico").val("paginarViatico");
        $('#txtFechaAprobacionER').parent().removeClass("has-danger");
        $('#txtDescripcionER').parent().removeClass("has-danger");
        $('#txtResolucionAprobacionER').parent().removeClass("has-danger");
        $('#txtEstadoER').parent().removeClass("has-danger");
    });

    addEventoCombosPaginar();
    valicacionesCamposViatico();
    $('#modalCargandoViatico').modal("show");

});



function procesarAjaxViatico() {
    var datosSerializadosCompletos = $('#' + $('#nameForm').val()).serialize();
    if ($('#nameForm').val().toLowerCase() !== "frmviatico") {
        datosSerializadosCompletos += "&txtTituloViatico=" + $('#txtTituloViatico').val();
        datosSerializadosCompletos += "&comboAnioViatico=" + $('#comboAnioViatico').val();
    }
    datosSerializadosCompletos += "&numberPageViatico=" + $('#numberPageViatico').val();
    datosSerializadosCompletos += "&sizePageViatico=" + $('#sizePageViatico').val();
    datosSerializadosCompletos += "&action=" + $('#actionViatico').val();
    $.ajax({
        url: getContext() + '/gestiontransparente/viaticos',
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        success: function (jsonResponse) {
            $('#modalCargandoViatico').modal("hide");
            $('#ventanaManViatico').modal("hide");
            if ($('#actionViatico').val().toLowerCase() === "paginarviatico") {
                listarViatico(jsonResponse.BEAN_PAGINATION);
            } else {
                if (jsonResponse.MESSAGE_SERVER.toLowerCase() === "ok") {
                    listarViatico(jsonResponse.BEAN_PAGINATION);
                    viewAlert('success', getMessageServerTransaction($('#actionViatico').val(), 'Viatico', 'o'));
                } else {
                    viewAlert('warning', jsonResponse.MESSAGE_SERVER);
                }
            }
        },
        error: function () {
            $('#modalCargandoViatico').modal("hide");
            $("#ventanaManViatico").modal("hide");
            /*MOSTRAMOS MENSAJE ERROR SERVIDOR*/
            viewAlert('error', 'Error interno en el servidor!');
        }
    });
    return false;
}

function listarViatico(BEAN_PAGINATION) {
    /*PAGINATION*/
    var $pagination = $('#paginationViatico');
    $('#tbodyViatico').empty();
    if (BEAN_PAGINATION.COUNT_FILTER > 0) {
        var fila;
        $.each(BEAN_PAGINATION.LIST, function (index, value) {
            fila = "<tr ";
            fila += "id='" + value.id + "' ";
            fila += "anho='" + value.anho + "' ";
            fila += "mes='" + value.mes + "' ";
            fila += "tipo_viatico='" + value.tipo_viatico + "' ";
            fila += "modalidad='" + value.modalidad + "' ";
            fila += "area_oficina='" + value.area_oficina + "' ";
            fila += "usuarios='" + value.usuarios + "' ";
            fila += "fuente_financiamiento='" + value.fuente_financiamiento + "' ";
            fila += "fecha_salida='" + value.fecha_salida + "' ";
            fila += "fecha_retorno='" + value.fecha_retorno + "' ";
            fila += "ruta='" + value.ruta + "' ";
            fila += "autorizacion_viaje='" + value.autorizacion_viaje + "' ";
            fila += "costo_pasajes='" + value.costo_pasajes + "' ";
            fila += "viaticos='" + value.viaticos + "' ";
            fila += "estado='" + value.estado + "' ";
            fila += ">";
            fila += "<td class='align-middle text-medium-table '>" + value.area_oficina + "</td>";
            fila += "<td class='align-middle text-medium-table '>" + value.usuarios + "</td>";
            fila += "<td class='align-middle text-medium-table '>" + value.fecha_salida + "</td>";
            fila += "<td class='align-middle text-medium-table '>" + value.fecha_retorno + "</td>";
            fila += "<td class='align-middle text-medium-table '>" + value.ruta + "</td>";
            fila += "<td class='align-middle text-medium-table '>" + value.costo_pasajes + "</td>";
            fila += "<td class='align-middle text-medium-table '>" + value.viaticos + "</td>";
            fila += "<td class='align-middle text-medium-table '><button class='btn btn-secondary btn-sm editar-viatico' title='Editar Viatico'><i class='fas fa-edit'></i></button></td>";
            fila += "<td class='align-middle text-medium-table '><button class='btn btn-secondary btn-sm eliminar-viatico' title='Eliminar Viatico'><i class='fas fa-trash-alt'></i></button></td>";
            fila += "</tr>";
            $('#tbodyViatico').append(fila);
        });
        var defaultOptions = getDefaultOptionsPagination();
        var options = getOptionsPagination(BEAN_PAGINATION.COUNT_FILTER, $('#sizePageViatico'),
                $('#numberPageViatico'), $('#actionViatico'), 'paginarViatico',
                $('#nameForm'), 'FrmViatico', $('#modalCargandoViatico'));
        $pagination.twbsPagination('destroy');
        $pagination.twbsPagination($.extend({}, defaultOptions, options));
        agregarEventosViatico();
        $('#txtTituloViatico').focus();
    } else {
        $pagination.twbsPagination('destroy');
        viewAlert('warning', 'No se encontraron resultados');
    }
}

function agregarEventosViatico() {
    $('.editar-viatico').each(function () {
        $(this).click(function () {
            $('#txtIdER').val($(this.parentElement.parentElement).attr('id'));
            $('#txtFechaSalidaER').datepicker('setDate', getDateJS($(this.parentElement.parentElement).attr('fecha_salida')));
            $('#txtFechaRetornoER').datepicker('setDate', getDateJS($(this.parentElement.parentElement).attr('fecha_retorno')));
            $('#comboTipoViaticoER').val($(this.parentElement.parentElement).attr('tipo_viatico'));
            $('#comboModalidadER').val($(this.parentElement.parentElement).attr('modalidad'));
            $('#txtAreaOficinaER').val($(this.parentElement.parentElement).attr('area_oficina'));
            $('#txtUsuariosER').val($(this.parentElement.parentElement).attr('usuarios'));
            $('#txtFuenteFinanciamientoER').val($(this.parentElement.parentElement).attr('fuente_financiamiento'));
            $('#txtAutorizacionViajeER').val($(this.parentElement.parentElement).attr('autorizacion_viaje'));
            $('#txtRutaER').val($(this.parentElement.parentElement).attr('ruta'));
            $('#txtCostoPasajesER').val($(this.parentElement.parentElement).attr('costo_pasajes'));
            $('#txtViaticosER').val($(this.parentElement.parentElement).attr('viaticos'));
            $('#actionViatico').val('updateViatico');
            $('#txtTituloModalManViatico').html("EDITAR VIATICO");
            $('#ventanaManViatico').modal("show");
            document.getElementsByTagName("body")[0].style.paddingRight = "0";
        });
    });
    $('.eliminar-viatico').each(function () {
        $(this).click(function () {
            $('#txtIdER').val($(this.parentElement.parentElement).attr('id'));
            swal({
                title: 'PEAM',
                text: "¿Está seguro de eliminar este Viatico?",
                type: 'warning',
                showCancelButton: true,
                confirmButtonText: 'Sí, continuar!',
                cancelButtonText: 'No, cancelar!',
                confirmButtonClass: 'btn btn-info',
                cancelButtonClass: 'btn btn-danger',
                buttonsStyling: false
            }).then((result) => {
                if (result.value) {
                    $('#actionViatico').val("deleteViatico");
                    $("#nameForm").val("FrmViaticoModal");
                    $('#modalCargandoViatico').modal("show");
                }
            });
            $('.swal2-confirm').css("margin-right", "15px");
            document.getElementsByTagName("body")[0].style.paddingRight = "0";
        });
    });


}

function valicacionesCamposViatico() {
    $('#txtFechaSalidaER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtFechaRetornoER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#comboTipoViaticoER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#comboModalidadER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtAreaOficinaER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtUsuariosER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtFuenteFinanciamientoER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtAutorizacionViajeER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtRutaER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtCostoPasajesER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtViaticosER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
}

function validarFormularioViatico() {

    if ($('#txtFechaSalidaER').val() === "") {
        $($('#txtFechaSalidaER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtFechaRetornoER').val() === "") {
        $($('#txtFechaRetornoER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#comboTipoViaticoER').val() === "-1") {
        $($('#comboTipoViaticoER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#comboModalidadER').val() === "") {
        $($('#comboModalidadER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtAreaOficinaER').val() === "") {
        $($('#txtAreaOficinaER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtUsuariosER').val() === "-1") {
        $($('#txtUsuariosER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtFuenteFinanciamientoER').val() === "") {
        $($('#txtFuenteFinanciamientoER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtAutorizacionViajeER').val() === "") {
        $($('#txtAutorizacionViajeER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtRutaER').val() === "-1") {
        $($('#txtRutaER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtCostoPasajesER').val() === "") {
        $($('#txtCostoPasajesER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtViaticosER').val() === "") {
        $($('#txtViaticosER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    return true;
}


