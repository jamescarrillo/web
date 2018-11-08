$(document).ready(function () {

    $('#datePickerFechaDesignacionDIR').datepicker({
        format: 'dd/mm/yyyy',
        todayHighlight: true,
        autoclose: true
    });

    $("#FrmDirectivo").submit(function () {
        $("#nameFormDirectivo").val("FrmDirectivo");
        $("#numberPageDirectivo").val(1);
        $('#actionDirectivos').val("paginarDirectivo");
        $('#modalCargandoDirectivo').modal("show");
        return false;
    });

    $("#FrmDirectivoModal").submit(function () {
        if (validarFormularioDirectivo()) {
            $("#numberPageDirectivo").val(1);
            $("#nameFormDirectivo").val("FrmDirectivoModal");
            $('#modalCargandoDirectivo').modal("show");
        }
        return false;
    });

    $("#modalCargandoDirectivo").on('shown.bs.modal', function () {
        //DESPUES DE TERMINAR DE MOSTRAR EL MODAL
        procesarAjaxDirectivo();
    });

    $("#ventanaManDirectivo").on('hidden.bs.modal', function () {
        $("#actionDirectivos").val("paginarDirectivo");
        //$("#validarNombre").fadeOut();
    });

    $('#btnAbrirNuevoDirectivo').click(function () {
        $('#FrmDirectivoModal input').val("");
        $('#FrmDirectivoModal select').val("-1");
        $('#FrmDirectivoModal input').parent().removeClass("has-danger");
        $('#FrmDirectivoModal select').parent().removeClass("has-danger");
        $('#actionDirectivos').val("addDirectivo");
        $('#txtTituloModalManDirectivo').html("REGISTRAR DIRECTIVO");
        $('#ventanaManDirectivo').modal("show");
        document.getElementsByTagName("body")[0].style.paddingRight = "0";
    });

    $('#btnSeleccionarCvDIR').click(function () {
        $('#fileCVDIR').trigger('click');
    });

    $("#fileCVDIR").change(function () {
        $('#txtValidacionCvDIR').val('SI');
        readViewNameFile(this, 'txtNombreCvDIR');
        $('#txtNombreFileResultadoActualDIR').val($('#txtNombreCvDIR').val());
        alert($('#txtNombreFileResultadoActualDIR').val());
    });

    $('#btnSeleccionarFotoDIR').click(function () {
        $('#fileFotoDIR').trigger('click');
    });

    $("#fileFotoDIR").change(function () {
        //CAMPO QUE VALIDARA SI SELECCIONO FILE
        $('#txtValidacionFotoDIR').val('SI');
        readImageSelected(this, 'visorFotoDIR');
    });

    $('#btnEliminarFotoDIR').click(function () {
        $("#fileFotoDIR").val(null);
        $("#txtNombreFotoDIR").val("");
        var urlLogo = getContexApp() + "/peam_resources_app/conf_app/img/default_user.png";
        $('#visorFotoDIR').attr('src', urlLogo);
        $('#txtValidacionFotoDIR').val('DEFECTO');
    });

    valicacionesCamposDirectivo();
    
    $('#datePickerFechaDesignacion').datepicker({
        format: 'dd/mm/yyyy',
        todayHighlight: true,
        autoclose: true
    });

    $("#FrmFuncionario").submit(function () {
        $("#nameFormFuncionario").val("FrmFuncionario");
        $("#numberPageFuncionario").val(1);
        $('#actionFuncionario').val("paginarFuncionario");
        $('#modalCargandoFuncionario').modal("show");
        return false;
    });

    $("#FrmFuncionarioModal").submit(function () {
        if (validarFormularioFuncionario()) {
            $("#numberPageFuncionario").val(1);
            $("#nameFormFuncionario").val("FrmFuncionarioModal");
            $('#modalCargandoFuncionario').modal("show");
        }
        return false;
    });

    $("#modalCargandoFuncionario").on('shown.bs.modal', function () {
        //DESPUES DE TERMINAR DE MOSTRAR EL MODAL
        procesarAjaxFuncionario();
    });

    $("#ventanaManFuncionario").on('hidden.bs.modal', function () {
        $("#actionFuncionario").val("paginarFuncionario");
        //$("#validarNombre").fadeOut();
    });

    $('#btnAbrirNuevoFuncionario').click(function () {
        $('#FrmFuncionarioModal input').val("");
        $('#FrmFuncionarioModal select').val("-1");
        $('#FrmFuncionarioModal input').parent().removeClass("has-danger");
        $('#FrmFuncionarioModal select').parent().removeClass("has-danger");
        $('#actionFuncionario').val("addFuncionario");
        $('#txtTituloModalManFuncionario').html("REGISTRAR FUNCIONARIO");
        $('#ventanaManFuncionario').modal("show");
        document.getElementsByTagName("body")[0].style.paddingRight = "0";
    });

    $('#btnSeleccionarCv').click(function () {
        $('#fileCV').trigger('click');
    });

    $("#fileCV").change(function () {
        $('#txtValidacionCv').val('SI');
        readViewNameFile(this, 'txtNombreCv');
        $('#txtNombreFileResultadoActual').val($('#txtNombreCv').val());
        alert($('#txtNombreFileResultadoActual').val());
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
    valicacionesCamposFuncionario();
    $('#modalCargandoFuncionario').modal("show");
    procesarAjaxDirectivo();

});

function procesarAjaxFuncionario() {
    var form = $('#' + $('#nameFormFuncionario').val())[0];
    var datosSerializadosCompletos = new FormData(form);
    if ($('#nameFormFuncionario').val().toLowerCase() !== "frmfuncionario") {
        //AGREGAMOS LOS PARAMETROS DEL FORMULARIO DE BUSQUEDA
        datosSerializadosCompletos.append('txtNombreFuncionario', $('#txtNombreFuncionario').val());
        datosSerializadosCompletos.append('comboTipoListaFuncionario', $('#comboTipoListaFuncionario').val());
        datosSerializadosCompletos.append('txtEstadoER', $('#txtEstadoER').val());
    }
    datosSerializadosCompletos.append('numberPageFuncionario', $('#numberPageFuncionario').val());
    datosSerializadosCompletos.append('sizePageFuncionario', $('#sizePageFuncionario').val());
    datosSerializadosCompletos.append('action', $('#actionFuncionario').val());
    datosSerializadosCompletos.append('editorWebContenido', $('#txtContenidoNotaPrensaER').val());
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
            $('#modalCargandoFuncionario').modal("hide");
            if ($('#actionFuncionario').val().toLowerCase() === "paginarfuncionario") {
                listarFuncionario(jsonResponse.BEAN_PAGINATION);
            } else {
                if (jsonResponse.MESSAGE_SERVER.toLowerCase() === "ok") {
                    listarFuncionario(jsonResponse.BEAN_PAGINATION);
                    viewAlert('success', getMessageServerTransaction($('#actionFuncionario').val(), 'Funcionario', 'o'));
                } else {
                    viewAlert('warning', jsonResponse.MESSAGE_SERVER);
                }
            }
            $("#ventanaManFuncionario").modal("hide");
        },
        error: function () {
            $('#modalCargandoFuncionario').modal("hide");
            $("#ventanaManFuncionario").modal("hide");
            /*MOSTRAMOS MENSAJE ERROR SERVIDOR*/
            viewAlert('error', 'Error interno en el servidor!');
        }
    });
    return false;
}

function listarFuncionario(BEAN_PAGINATION) {
    /*PAGINATION*/
    var $pagination = $('#paginationFuncionario');
    $('#tbodyFuncionario').empty();
    if (BEAN_PAGINATION.COUNT_FILTER > 0) {
        var fila;
        var text_color;
        var icon;
        var tooltip;
        $.each(BEAN_PAGINATION.LIST, function (index, value) {
            if (!value.estado) {
                text_color = "text-danger";
                icon = "far fa-hand-point-up";
                tooltip = "Activar";
            } else {
                text_color = "";
                icon = "far fa-hand-point-down";
                tooltip = "Finalizar";
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
            fila += "<td class='align-middle " + text_color + "'>" + value.numero_dni + "</td>";
            fila += "<td class='align-middle " + text_color + "'>" + value.nombres_apellidos + "</td>";
            fila += "<td class='align-middle " + text_color + "'>" + value.cargo + "</td>";
            fila += "<td class='align-middle " + text_color + "'>" + value.telefono + "</td>";
            fila += "<td class='align-middle " + text_color + "'><a href='"+getContext() + "/downloadfile?type_file=downloadCV&full_file=n&file=" + value.hoja_vida + "' class='btn btn-secondary btn-sm' title='Descargar'><i class='fa fa-download' aria-hidden='true'></i></a></td>";
            fila += "<td class='align-middle " + text_color + "'><button class='btn btn-secondary btn-sm finalizar-activar' data-toggle='tooltip' title='" + tooltip + "' opcion='" + tooltip.toLowerCase() + "'><i class='" + icon + "'></i></button></td>";
            fila += "<td class='align-middle " + text_color + "'><button class='btn btn-secondary btn-sm editar-funcionario'><i class='fas fa-edit'></i></button></td>";
            fila += "<td class='align-middle " + text_color + "'><button class='btn btn-secondary btn-sm eliminar-funcionario'><i class='fas fa-trash-alt'></i></button></td>";
            fila += "</tr>";
            $('#tbodyFuncionario').append(fila);
        });
        var defaultOptions = getDefaultOptionsPagination();
        var options = getOptionsPagination(BEAN_PAGINATION.COUNT_FILTER, $('#sizePageFuncionario'),
                $('#numberPageFuncionario'), $('#actionFuncionario'), 'paginarFuncionario',
                $('#nameFormFuncionario'), 'FrmFuncionario', $('#modalCargandoFuncionario'));
        $pagination.twbsPagination('destroy');
        $pagination.twbsPagination($.extend({}, defaultOptions, options));
        agregarEventosFuncionario();
        $('#txtNombreFuncionario').focus();
    } else {
        $pagination.twbsPagination('destroy');
        viewAlert('warning', 'No se enconntraron resultados');
    }
}

function agregarEventosFuncionario() {
    $('.editar-funcionario').each(function () {
        var foto, name;
        $(this).click(function () {
            $('#txtIdFuncionarioER').val($(this.parentElement.parentElement).attr('id'));
            if ($(this.parentElement.parentElement).attr('tratamiento') !== "undefined") {
                $('#txtTratamientoER').val($(this.parentElement.parentElement).attr('tratamiento'));
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
            if ($(this.parentElement.parentElement).attr('foto') !== "undefined") {
                $('#txtNombreFoto').val($(this.parentElement.parentElement).attr('foto'));
            } else {
                $('#txtNombreFoto').val("");
            }
            if ($(this.parentElement.parentElement).attr('hoja_vida') !== "undefined") {
                $('#txtNombreCv').val($(this.parentElement.parentElement).attr('hoja_vida'));
            } else {
                $('#txtNombreCv').val("");
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
            $('#actionFuncionario').val('updateFuncionario');
            $('#txtTituloModalManFuncionario').html("EDITAR FUNCIONARIO");
            $('#ventanaManFuncionario').modal("show");
            document.getElementsByTagName("body")[0].style.paddingRight = "0";
        });
    });
    
        $('.eliminar-funcionario').each(function () {
        $(this).click(function () {
            $('#txtIdFuncionarioER').val($(this.parentElement.parentElement).attr('id'));
            viewAlertDelete("Funcionario");
            document.getElementsByTagName("body")[0].style.paddingRight = "0";
        });
    });

    $('.finalizar-activar').each(function () {
        $(this).click(function () {
            $('#txtIdFuncionarioER').val($(this.parentElement.parentElement).attr('id'));
            $('#txtEstadoER').val($(this.parentElement.parentElement).attr('estado'));
            swal({
                title: 'PEAM',
                text: "¿Está seguro de " + $(this).attr('opcion') + " este Funcionario?",
                type: 'warning',
                showCancelButton: true,
                confirmButtonText: 'Sí, continuar!',
                cancelButtonText: 'No, cancelar!',
                confirmButtonClass: 'btn btn-info',
                cancelButtonClass: 'btn btn-danger',
                buttonsStyling: false
            }).then((result) => {
                if (result.value) {
                    $('#actionFuncionario').val("activateFuncionario");
                    $("#nameFormFuncionario").val("FrmFuncionarioModal");
                    $('#modalCargandoFuncionario').modal("show");
                }
            });
            $('.swal2-confirm').css("margin-right", "15px");
        });
    });
}

function valicacionesCamposFuncionario() {
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

function validarFormularioFuncionario() {
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

function procesarAjaxDirectivo() {
    var form = $('#' + $('#nameFormDirectivo').val())[0];
    var datosSerializadosCompletos = new FormData(form);
    if ($('#nameFormDirectivo').val().toLowerCase() !== "frmdirectivo") {
        //AGREGAMOS LOS PARAMETROS DEL FORMULARIO DE BUSQUEDA
        datosSerializadosCompletos.append('txtNombreDirectivo', $('#txtNombreDirectivo').val());
        datosSerializadosCompletos.append('comboTipoListaDirectivo', $('#comboTipoListaDirectivo').val());
        datosSerializadosCompletos.append('txtEstadoERDIR', $('#txtEstadoERDIR').val());
    }
    datosSerializadosCompletos.append('numberPageDirectivo', $('#numberPageDirectivo').val());
    datosSerializadosCompletos.append('sizePageDirectivo', $('#sizePageDirectivo').val());
    datosSerializadosCompletos.append('action', $('#actionDirectivos').val());
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
            $('#modalCargandoDirectivo').modal("hide");
            if ($('#actionDirectivos').val().toLowerCase() === "paginardirectivo") {
                listarDirectivo(jsonResponse.BEAN_PAGINATION);
            } else {
                if (jsonResponse.MESSAGE_SERVER.toLowerCase() === "ok") {
                    listarDirectivo(jsonResponse.BEAN_PAGINATION);
                    viewAlert('success', getMessageServerTransaction($('#actionDirectivos').val(), 'Directivo', 'o'));
                } else {
                    viewAlert('warning', jsonResponse.MESSAGE_SERVER);
                }
            }
            $("#ventanaManDirectivo").modal("hide");
        },
        error: function () {
            $('#modalCargandoDirectivo').modal("hide");
            $("#ventanaManDirectivo").modal("hide");
            /*MOSTRAMOS MENSAJE ERROR SERVIDOR*/
            viewAlert('error', 'Error interno en el servidor!');
        }
    });
    return false;
}

function listarDirectivo(BEAN_PAGINATION) {
    /*PAGINATION*/
    var $pagination = $('#paginationDirectivo');
    $('#tbodyDirectivo').empty();
    if (BEAN_PAGINATION.COUNT_FILTER > 0) {
        var fila;
        var text_color;
        var icon;
        var tooltip;
        $.each(BEAN_PAGINATION.LIST, function (index, value) {
            if (!value.estado) {
                text_color = "text-danger";
                icon = "far fa-hand-point-up";
                tooltip = "Activar";
            } else {
                text_color = "";
                icon = "far fa-hand-point-down";
                tooltip = "Finalizar";
            }
            //text-center align-middle
            fila = "<tr ";
            fila += "id='" + value.id + "' ";
            fila += "institucion='" + value.institucion + "' ";
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
            fila += "fecha_inicio='" + value.fecha_inicio + "' ";
            fila += ">";
            fila += "<td class='align-middle " + text_color + "'>" + value.numero_dni + "</td>";
            fila += "<td class='align-middle " + text_color + "'>" + value.nombres_apellidos + "</td>";
            fila += "<td class='align-middle " + text_color + "'>" + value.cargo + "</td>";
            fila += "<td class='align-middle " + text_color + "'>" + value.telefono + "</td>";
            fila += "<td class='align-middle " + text_color + "'><a href='"+getContext() + "/downloadfile?type_file=downloadCV&full_file=n&file=" + value.hoja_vida + "' class='btn btn-secondary btn-sm' title='Descargar'><i class='fa fa-download' aria-hidden='true'></i></a></td>";
            fila += "<td class='align-middle " + text_color + "'><button class='btn btn-secondary btn-sm finalizarD-activarD' data-toggle='tooltip' title='" + tooltip + "' opcion='" + tooltip.toLowerCase() + "'><i class='" + icon + "'></i></button></td>";
            fila += "<td class='align-middle " + text_color + "'><button class='btn btn-secondary btn-sm editar-directivo'><i class='fas fa-edit'></i></button></td>";
            fila += "<td class='align-middle " + text_color + "'><button class='btn btn-secondary btn-sm eliminar-directivo'><i class='fas fa-trash-alt'></i></button></td>";
            fila += "</tr>";
            $('#tbodyDirectivo').append(fila);
        });
        var defaultOptions = getDefaultOptionsPagination();
        var options = getOptionsPagination(BEAN_PAGINATION.COUNT_FILTER, $('#sizePageDirectivo'),
                $('#numberPageDirectivo'), $('#actionDirectivos'), 'paginarDirectivo',
                $('#nameFormDirectivo'), 'FrmDirectivo', $('#modalCargandoDirectivo'));
        $pagination.twbsPagination('destroy');
        $pagination.twbsPagination($.extend({}, defaultOptions, options));
        agregarEventosDirectivo();
        $('#txtNombreDirectivo').focus();
    } else {
        $pagination.twbsPagination('destroy');
        viewAlert('warning', 'No se enconntraron resultados');
    }
}

function agregarEventosDirectivo() {
    $('.editar-directivo').each(function () {
        $(this).click(function () {
            $('#txtIdDirectivoERDIR').val($(this.parentElement.parentElement).attr('id'));
            if ($(this.parentElement.parentElement).attr('tratamiento') !== "undefined") {
                $('#txtTratamientoERDIR').val($(this.parentElement.parentElement).attr('tratamiento'));
            } else {
                $('#txtTratamientoERDIR').val("");
            }
            if ($(this.parentElement.parentElement).attr('resumen') !== "undefined") {
                $('#txtResumenERDIR').val($(this.parentElement.parentElement).attr('resumen'));
            } else {
                $('#txtResumenERDIR').val("");
            }
            if ($(this.parentElement.parentElement).attr('fecha_inicio') !== "undefined") {
                $('#txtFechaInicioERDIR').val($(this.parentElement.parentElement).attr('fecha_inicio'));
            } else {
                $('#txtFechaInicioERDIR').val("");
            }
            if ($(this.parentElement.parentElement).attr('foto') !== "undefined") {
                $('#txtNombreFotoDIR').val($(this.parentElement.parentElement).attr('foto'));
            } else {
                $('#txtNombreFotoDIR').val("");
            }
            if ($(this.parentElement.parentElement).attr('hoja_vida') !== "undefined") {
                $('#txtNombreCvDIR').val($(this.parentElement.parentElement).attr('hoja_vida'));
            } else {
                $('#txtNombreCvDIR').val("");
            }
            $('#txtNombreCompletoERDIR').val($(this.parentElement.parentElement).attr('nombres_apellidos'));
            $('#txtDniERDIR').val($(this.parentElement.parentElement).attr('numero_dni'));
            $('#txtDesignadoPorERDIR').val($(this.parentElement.parentElement).attr('resolucion'));
            if ($(this.parentElement.parentElement).attr('fecha_designacion') !== "" && $(this.parentElement.parentElement).attr('fecha_designacion') !== "undefined") {
                $('#datePickerFechaDesignacion').datepicker('setDate', getDateJS($(this.parentElement.parentElement).attr('fecha_designacion')));
            }
            $('#comboInstitucionERDIR').val($(this.parentElement.parentElement).attr('institucion'));
            $('#txtCargoERDIR').val($(this.parentElement.parentElement).attr('cargo'));
            $('#txtNivelERDIR').val($(this.parentElement.parentElement).attr('nivel_remunerativo'));
            $('#txtRegimenLaboralERDIR').val($(this.parentElement.parentElement).attr('regimen_laboral'));
            $('#txtRetribucionMensualERDIR').val($(this.parentElement.parentElement).attr('retribucion_mensual'));
            $('#txtProfesionERDIR').val($(this.parentElement.parentElement).attr('profesion'));
            $('#txtTelefonoERDIR').val($(this.parentElement.parentElement).attr('telefono'));
            $('#txtFaxERDIR').val($(this.parentElement.parentElement).attr('fax'));
            $('#txtEmailERDIR').val($(this.parentElement.parentElement).attr('e_mail'));
            $('#txtCvDIR').val($(this.parentElement.parentElement).attr('hoja_vida'));
            $('#comboEstadoERDIR').val($(this.parentElement.parentElement).attr('estado'));
            //MOSTRAMOS LA FOTO DE PERFIL
            $('#idItemDLDIR').trigger('click');
            $('#actionDirectivos').val('updateDirectivo');
            $('#txtTituloModalManDirectivo').html("EDITAR DIRECTIVO");
            $('#ventanaManDirectivo').modal("show");
            document.getElementsByTagName("body")[0].style.paddingRight = "0";
        });
    });
    
        $('.eliminar-directivo').each(function () {
        $(this).click(function () {
            $('#txtIdDirectivoERDIR').val($(this.parentElement.parentElement).attr('id'));
            viewAlertDelete("Directivo");
            document.getElementsByTagName("body")[0].style.paddingRight = "0";
        });
    });

    $('.finalizarD-activarD').each(function () {
        $(this).click(function () {
            $('#txtIdDirectivoERDIR').val($(this.parentElement.parentElement).attr('id'));
            $('#txtEstadoERDIR').val($(this.parentElement.parentElement).attr('estado'));
            swal({
                title: 'PEAM',
                text: "¿Está seguro de " + $(this).attr('opcion') + " este Directivo?",
                type: 'warning',
                showCancelButton: true,
                confirmButtonText: 'Sí, continuar!',
                cancelButtonText: 'No, cancelar!',
                confirmButtonClass: 'btn btn-info',
                cancelButtonClass: 'btn btn-danger',
                buttonsStyling: false
            }).then((result) => {
                if (result.value) {
                    $('#actionDirectivos').val("activateDirectivo");
                    $("#nameFormDirectivo").val("FrmDirectivoModal");
                    $('#modalCargandoDirectivo').modal("show");
                }
            });
            $('.swal2-confirm').css("margin-right", "15px");
        });
    });
}

function valicacionesCamposDirectivo() {
    $('#txtNombreCompletoERDIR').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtDniERDIR').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#comboInstitucionERDIR').on('change', function () {
        $(this).val() === "-1" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtCargoERDIR').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtProfesionERDIR').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#comboEstadoERDIR').on('change', function () {
        $(this).val() === "-1" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
}

function validarFormularioDirectivo() {
    if ($('#txtNombreCompletoERDIR').val() === "") {
        $($('#txtNombreCompletoERDIR').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtDniERDIR').val() === "") {
        $($('#txtDniERDIR').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#comboInstitucionERDIR').val() === "-1") {
        $($('#comboInstitucionERDIR').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtCargoERDIR').val() === "") {
        $($('#txtCargoERDIR').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtProfesionERDIR').val() === "") {
        $($('#txtProfesionERDIR').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#comboEstadoERDIR').val() === "-1") {
        $($('#comboEstadoERDIR').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    return true;
}