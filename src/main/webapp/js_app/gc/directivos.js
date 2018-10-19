$(document).ready(function () {

    $('#datePickerFechaDesignacion').datepicker({
        format: 'dd/mm/yyyy',
        todayHighlight: true,
        autoclose: true
    });

    $("#FrmFuncionarios").submit(function () {
        $("#nameForm").val("FrmFuncionarios");
        $("#numberPageFuncionarios").val(1);
        $('#actionFuncionarios').val("paginarFuncionario");
        $('#modalCargandoFuncionarios').modal("show");
        return false;
    });

    $("#FrmFuncionariosModal").submit(function () {
        if (validarFormularioFuncionarios()) {
            $("#numberPageFuncionarios").val(1);
            $("#nameForm").val("FrmFuncionarioModal");
            //$('#modalCargandoFuncionarios').modal("show");
            viewAlert('warning', 'Estamos trabajando!');
        }
        return false;
    });

    $("#modalCargandoFuncionarios").on('shown.bs.modal', function () {
        //DESPUES DE TERMINAR DE MOSTRAR EL MODAL
        procesarAjaxFuncionarios();
    });

    $("#ventanaManFuncionarios").on('hidden.bs.modal', function () {
        $("#actionFuncionarios").val("paginarFuncionario");
        //$("#validarNombre").fadeOut();
    });

    $('#btnAbrirNuevoFuncionario').click(function () {
        $('#FrmFuncionariosModal input').val("");
        $('#FrmFuncionariosModal select').val("-1");
        $('#FrmFuncionariosModal input').parent().removeClass("has-danger");
        $('#FrmFuncionariosModal select').parent().removeClass("has-danger");
        /*
        $('#FrmFuncionariosModal input').each(function (index, value) {
            $(value.parentElement).removeClass('has-danger');
        });
        $('#FrmFuncionariosModal select').each(function (index, value) {
            $(value.parentElement).removeClass('has-danger');
        });
        */
        $('#actionFuncionarios').val("addFuncionario");
        $('#txtTituloModalManFuncionarios').html("REGISTRAR FUNCIONARIO");
        $('#ventanaManFuncionarios').modal("show");
        document.getElementsByTagName("body")[0].style.paddingRight = "0";
    });

    $('#btnSeleccionarCv').click(function () {
        $('#fileCV').trigger('click');
    });

    $("#fileCV").change(function () {
        $('#txtValidacionCv').val('SI');
        readViewNameFile(this, 'txtNombreCv');
    });

    $('#btnSeleccionarFoto').click(function () {
        $('#fileFoto').trigger('click');
    });

    $("#fileFoto").change(function () {
        //CAMPO QUE VALIDARA SI SELECCIONO FILE
        $('#txtValidacionFoto').val('SI');
        readImageSelected(this, 'visorFoto');
    });

    $('#btnEliminarFoto').click(function () {
        $("#fileFoto").val(null);
        $("#txtNombreFoto").val("");
        var urlLogo = getContexApp() + "/peam_resources_app/conf_app/img/default_user.png";
        $('#visorFoto').attr('src', urlLogo);
        $('#txtValidacionFoto').val('DEFECTO');
    });

    addEventoCombosPaginar();
    valicacionesCamposFuncionarios();
    $('#modalCargandoFuncionarios').modal("show");

});

function procesarAjaxFuncionarios() {
    var form = $('#' + $('#nameForm').val())[0];
    var data = new FormData(form);
    data.append('numberPageFuncionarios', $('#numberPageFuncionarios').val());
    data.append('sizePageFuncionarios', $('#sizePageFuncionarios').val());
    data.append('action', $('#actionFuncionarios').val());
    /*
     var datosSerializadosCompletos = $('#' + $('#nameForm').val()).serialize();
     datosSerializadosCompletos += "&numberPageFuncionarios=" + $('#numberPageFuncionarios').val();
     datosSerializadosCompletos += "&sizePageFuncionarios=" + $('#sizePageFuncionarios').val();
     datosSerializadosCompletos += "&action=" + $('#actionFuncionarios').val();
     */
    $.ajax({
        url: getContext() + '/gestiontransparente/directivos',
        type: 'POST',
        data: data,
        dataType: 'json',
        enctype: 'multipart/form-data',
        processData: false,
        contentType: false,
        cache: false,
        timeout: 600000,
        success: function (jsonResponse) {
            console.log(jsonResponse);
            $('#modalCargandoFuncionarios').modal("hide");
            if ($('#actionFuncionarios').val().toLowerCase() === "paginarfuncionario") {
                listarFuncionarios(jsonResponse.BEAN_PAGINATION);
            } else {
                if (jsonResponse.MESSAGE_SERVER.toLowerCase() === "ok") {
                    viewAlert('success', getMessageServerTransaction($('#actionFuncionarios').val(), 'Funcionario'));
                } else {
                    viewAlert('warning', jsonResponse.MESSAGE_SERVER);
                }
            }
        },
        error: function () {
            $('#modalCargandoFuncionarios').modal("hide");
            $("#ventanaManFuncionarios").modal("hide");
            /*MOSTRAMOS MENSAJE ERROR SERVIDOR*/
            viewAlert('error', 'Error interno en el servidor!');
        }
    });
    return false;
}

function listarFuncionarios(BEAN_PAGINATION) {
    /*PAGINATION*/
    var $pagination = $('#paginationFuncionarios');
    $('#tbodyFuncionarios').empty();
    if (BEAN_PAGINATION.COUNT_FILTER > 0) {
        var fila;
        var text_color;
        $.each(BEAN_PAGINATION.LIST, function (index, value) {
            text_color = "";
            if (!value.estado) {
                text_color = " text-danger";
            }
            //text-center align-middle
            fila = "<tr ";
            fila += "id='" + value.id + "' ";
            fila += "organigrama='" + value.organigrama + "' ";
            fila += "tratamiento='" + value.tratamiento + "' ";
            fila += "nombres_apellidos='" + value.nombres_apellidos + "' ";
            fila += "cargo='" + value.cargo + "' ";
            fila += "nivel_remunerativo='" + value.nivel_remunerativo + "' ";
            fila += "numero_dni='" + value.numero_dni + "' ";
            fila += "resolucion='" + value.resolucion + "' ";
            fila += "fecha_designacion='" + value.fecha_designacion + "' ";
            fila += "telefono='" + value.telefono + "' ";
            fila += "fax='" + value.fax + "' ";
            fila += "e_mail='" + value.e_mail + "' ";
            fila += "foto='" + value.foto + "' ";
            fila += "profesion='" + value.profesion + "' ";
            fila += "resumen='" + value.resumen + "' ";
            fila += "regimen_laboral='" + value.regimen_laboral + "' ";
            fila += "retribucion_mensual='" + value.retribucion_mensual + "' ";
            fila += "hoja_vida='" + value.hoja_vida + "' ";
            fila += "estado='" + value.estado + "' ";
            fila += "destacado='" + value.destacado + "' ";
            fila += "fecha_inicio='" + value.fecha_inicio + "' ";
            fila += ">";
            fila += "<td class='text-center align-middle" + text_color + "'>" + value.numero_dni + "</td>";
            fila += "<td class='align-middle " + text_color + "'>" + value.nombres_apellidos + "</td>";
            fila += "<td class='align-middle " + text_color + "'>" + value.cargo + "</td>";
            fila += "<td class='align-middle " + text_color + "'>" + value.telefono + "</td>";
            fila += "<td class='align-middle " + text_color + "'><button class='btn btn-success btn-sm descargar-cv' data-toggle='tooltip' title='Descargar CV'><i class='fa fa-download'></i></button></td>";
            fila += "<td class='align-middle " + text_color + "'><button class='btn btn-secondary btn-sm editar-funcionario'><i class='fas fa-edit'></i></button></td>";
            fila += "<td class='align-middle" + text_color + "'><button class='btn btn-secondary btn-sm eliminar-funcionario'><i class='fas fa-trash-alt'></i></button></td>";
            fila += "</tr>";
            $('#tbodyFuncionarios').append(fila);
        });
        var defaultOptions = getDefaultOptionsPagination();
        var options = getOptionsPagination(BEAN_PAGINATION.COUNT_FILTER, $('#sizePageFuncionarios'),
                $('#numberPageFuncionarios'), $('#actionFuncionarios'), 'paginarFuncionario',
                $('#nameForm'), 'FrmFuncionarios', $('#modalCargandoFuncionarios'));
        $pagination.twbsPagination('destroy');
        $pagination.twbsPagination($.extend({}, defaultOptions, options));
        agregarEventosFuncionarios();
        $('#txtNombreFuncionario').focus();
    } else {
        $pagination.twbsPagination('destroy');
        viewAlert('warning', 'No se enconntraron resultados');
    }
}

function agregarEventosFuncionarios() {
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

function valicacionesCamposFuncionarios() {
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