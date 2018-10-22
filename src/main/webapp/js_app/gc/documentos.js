$(document).ready(function () {
    
    cargarAniosCombo($('#comboAnio'), 2000, "-1", 'TODOS');

    $("#FrmDocumentos").submit(function () {
        $("#nameForm").val("FrmDocumentos");
        $("#numberPageDocumentos").val(1);
        $('#actionDocumentos').val("paginarDocumentos");
        $('#modalCargandoDocumentos').modal("show");
        return false;
    });

    $("#FrmDocumentoModal").submit(function () {
        if (validarFormularioFuncionarios()) {
            $("#numberPageDocumentos").val(1);
            $("#nameForm").val("#FrmDocumentoModal");
            //$('#modalCargandoDocumentos').modal("show");
            viewAlert('warning', 'Estamos trabajando!');
        }
        return false;
    });

    $("#modalCargandoDocumentos").on('shown.bs.modal', function () {
        //DESPUES DE TERMINAR DE MOSTRAR EL MODAL
        procesarAjaxDocumentos();
    });

    $("#ventanaManDocumento").on('hidden.bs.modal', function () {
        $("#actionDocumentos").val("paginarDocumentos");
        //$("#validarNombre").fadeOut();
    });

//    $('#btnAbrirNuevoDocumento').click(function () {
//        $('#FrmFuncionariosModal input').val("");
//        $('#FrmFuncionariosModal select').val("-1");
//        $('#FrmFuncionariosModal input').parent().removeClass("has-danger");
//        $('#FrmFuncionariosModal select').parent().removeClass("has-danger");
//        $('#actionDocumentos').val("addDocumento");
//        $('#txtTituloModalManDocumento').html("REGISTRAR DOCUMENTO");
//        $('#ventanaManDocumento').modal("show");
//        document.getElementsByTagName("body")[0].style.paddingRight = "0";
//    });

    addEventoCombosPaginar();
    //valicacionesCamposDocumentos();
    $('#modalCargandoDocumentos').modal("show");

});

function procesarAjaxDocumentos() {
    var datosSerializadosCompletos = $('#' + $('#nameForm').val()).serialize();
    datosSerializadosCompletos += "&numberPageDocumentos=" + $('#numberPageDocumentos').val();
    datosSerializadosCompletos += "&sizePageDocumentos=" + $('#sizePageDocumentos').val();
    datosSerializadosCompletos += "&action=" + $('#actionDocumentos').val();
    $.ajax({
        url: getContext() + '/documentos',
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        success: function (jsonResponse) {
            console.log(jsonResponse);
            $('#modalCargandoDocumentos').modal("hide");
            if ($('#actionDocumentos').val().toLowerCase() === "paginardocumentos") {
                listarDocumentos(jsonResponse.BEAN_PAGINATION);
            } else {
                if (jsonResponse.MESSAGE_SERVER.toLowerCase() === "ok") {
                    viewAlert('success', getMessageServerTransaction($('#actionDocumentos').val(), 'Documento'));
                } else {
                    viewAlert('warning', jsonResponse.MESSAGE_SERVER);
                }
            }
        },
        error: function () {
            $('#modalCargandoDocumentos').modal("hide");
            $("#ventanaManDocumento").modal("hide");
            /*MOSTRAMOS MENSAJE ERROR SERVIDOR*/
            viewAlert('error', 'Error interno en el servidor!');
        }
    });
    return false;
}

function listarDocumentos(BEAN_PAGINATION) {
    /*PAGINATION*/
    var $pagination = $('#paginationDocumentos');
    $('#tbodyDocumentos').empty();
    if (BEAN_PAGINATION.COUNT_FILTER > 0) {
        var fila;
        var text_color;
        $.each(BEAN_PAGINATION.LIST, function (index, value) {
            text_color = "";
            if (!value.docu_estado) {
                text_color = " text-danger";
            }
            fila = "<tr ";
            fila += "docu_id='" + value.docu_id + "' ";
            fila += "usa_public_id='" + value.usa_public_id + "' ";
            fila += "docu_descripcion='" + value.docu_descripcion + "' ";
            fila += "docu_titulo='" + value.docu_titulo + "' ";
            fila += "docu_resumen='" + value.docu_resumen + "' ";
            fila += "docu_origen_archivo='" + value.docu_origen_archivo + "' ";
            fila += "tipo_id='" + value.tipo_id + "' ";
            fila += "docu_estado='" + value.docu_estado + "' ";
            fila += "docu_activo='" + value.docu_activo + "' ";
            fila += "docu_fecha_docx='" + value.docu_fecha_docx + "' ";
            fila += "cate_id='" + value.cate_id + "' ";
            fila += "docu_metadata='" + value.docu_metadata + "' ";
            fila += ">";
            fila += "<td class='text-center align-middle" + text_color + "'>" + value.docu_fecha_docx + "</td>";
            fila += "<td class='align-middle " + text_color + "'>" + value.docu_titulo + "</td>";
            fila += "<td class='align-middle " + text_color + "'>" + value.docu_resumen + "</td>";
            fila += "<td class='align-middle " + text_color + "'><button class='btn btn-success btn-sm descargar-doc' data-toggle='tooltip' title='Descargar Documento'><i class='fa fa-download'></i></button></td>";
            fila += "<td class='align-middle " + text_color + "'><button class='btn btn-secondary btn-sm editar-documento'><i class='fas fa-edit'></i></button></td>";
            fila += "<td class='align-middle" + text_color + "'><button class='btn btn-secondary btn-sm eliminar-documento'><i class='fas fa-trash-alt'></i></button></td>";
            fila += "</tr>";
            $('#tbodyDocumentos').append(fila);
        });
        var defaultOptions = getDefaultOptionsPagination();
        var options = getOptionsPagination(BEAN_PAGINATION.COUNT_FILTER, $('#sizePageDocumentos'),
                $('#numberPageDocumentos'), $('#actionDocumentos'), 'paginarDocumentos',
                $('#nameForm'), 'FrmDocumentos', $('#modalCargandoDocumentos'));
        $pagination.twbsPagination('destroy');
        $pagination.twbsPagination($.extend({}, defaultOptions, options));
        //agregarEventosDocumentos();
        $('#txtTitulo').focus();
    } else {
        $pagination.twbsPagination('destroy');
        viewAlert('warning', 'No se enconntraron resultados');
    }
}

function agregarEventosDocumentos() {
    $('.editar-funcionario').each(function () {
        $(this).click(function () {
            $('#txtIdFuncionarioER').val($(this.parentElement.parentElement).attr('id'));
            if ($(this.parentElement.parentElement).attr('tratamiendo') !== "undefined") {
                $('#txtTratamientoER').val($(this.parentElement.parentElement).attr('tratamiendo'));
            } else {
                $('#txtTratamientoER').val("");
            }
            if ($(this.parentElement.parentElement).attr('resumen') !== "undefined") {
                $('#txtResumenER').val($(this.parentElement.parentElement).attr('resumen'));
            } else {
                $('#txtResumenER').val("");
            }
            if ($(this.parentElement.parentElement).attr('fecha_inicio') !== "undefined") {
                $('#txtFechaInicioER').val($(this.parentElement.parentElement).attr('fecha_inicio'));
            } else {
                $('#txtFechaInicioER').val("");
            }
            $('#txtNombreCompletoER').val($(this.parentElement.parentElement).attr('nombres_apellidos'));
            $('#txtDniER').val($(this.parentElement.parentElement).attr('numero_dni'));
            $('#txtDesignadoPorER').val($(this.parentElement.parentElement).attr('resolucion'));
            if ($(this.parentElement.parentElement).attr('fecha_designacion') !== "" && $(this.parentElement.parentElement).attr('fecha_designacion') !== "undefined") {
                $('#datePickerFechaDesignacion').datepicker('setDate', getDateJS($(this.parentElement.parentElement).attr('fecha_designacion')));
            }
            $('#comboOficinaER').val($(this.parentElement.parentElement).attr('organigrama'));
            $('#txtCargoER').val($(this.parentElement.parentElement).attr('cargo'));
            $('#txtNivelER').val($(this.parentElement.parentElement).attr('nivel_remunerativo'));
            $('#txtRegimenLaboralER').val($(this.parentElement.parentElement).attr('regimen_laboral'));
            $('#txtRetribucionMensualER').val($(this.parentElement.parentElement).attr('retribucion_mensual'));
            $('#txtProfesionER').val($(this.parentElement.parentElement).attr('profesion'));
            $('#txtTelefonoER').val($(this.parentElement.parentElement).attr('telefono'));
            $('#txtFaxER').val($(this.parentElement.parentElement).attr('fax'));
            $('#txtEmailER').val($(this.parentElement.parentElement).attr('e_mail'));
            $('#comboDestacadoER').val($(this.parentElement.parentElement).attr('destacado'));
            $('#txtCv').val($(this.parentElement.parentElement).attr('hoja_vida'));
            $('#comboEstadoER').val($(this.parentElement.parentElement).attr('estado'));
            //MOSTRAMOS LA FOTO DE PERFIL
            $('#idItemDL').trigger('click');
            $('#actionFuncionarios').val('updateFuncionario');
            $('#txtTituloModalManFuncionarios').html("EDITAR FUNCIONARIO");
            $('#ventanaManFuncionarios').modal("show");
            document.getElementsByTagName("body")[0].style.paddingRight = "0";
        });
    });
    $('.eliminar-funcionario').each(function () {
        $(this).click(function () {
            viewAlert('warning', 'Estamos trabajando!');
        });
    });

    $('.descargar-cv').each(function () {
        $(this).click(function () {
            viewAlert('warning', 'No se encontró la hoja de vida!');
        });
    });
    //viewAlert('error', 'Error interno en el servidor!');
    /*
     var botones = document.getElementsByClassName("eliminar");
     for (var i = 0; i < botones.length; i++) {
     botones[i].addEventListener("click", function () {
     $('#txtIdCicloAcademicoER').val($(this.parentElement.parentElement).attr("idciclo_academico"));
     $("#ventanaMan").modal("hide");
     document.getElementsByTagName("body")[0].style.paddingRight = "0";
     swal(
     {
     title: "SisBu!",
     text: "No se permite eliminar un Ciclo Académico",
     type: "warning",
     showCancelButton: false,
     confirmButtonColor: '#3085d6',
     confirmButtonText: "Aceptar",
     confirmButtonClass: 'btn btn-primary',
     buttonsStyling: false
     }
     );
     });
     }
     */
}

function valicacionesCamposDocumentos() {
    $('#txtNombreCompletoER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtDniER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#comboOficinaER').on('change', function () {
        $(this).val() === "-1" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtCargoER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtProfesionER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#comboDestacadoER').on('change', function () {
        $(this).val() === "-1" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#comboEstadoER').on('change', function () {
        $(this).val() === "-1" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
}

function validarFormularioFuncionarios() {
    return false;
    if ($('#txtNombreCompletoER').val() === "") {
        $($('#txtNombreCompletoER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtDniER').val() === "") {
        $($('#txtDniER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#comboOficinaER').val() === "-1") {
        $($('#comboOficinaER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtCargoER').val() === "") {
        $($('#txtCargoER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtProfesionER').val() === "") {
        $($('#txtProfesionER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#comboDestacadoER').val() === "-1") {
        $($('#comboDestacadoER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#comboEstadoER').val() === "-1") {
        $($('#comboEstadoER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    return true;
}