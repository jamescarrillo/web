$(document).ready(function () {

    $('#txtFechaER').datepicker({
        format: 'dd/mm/yyyy',
        todayHighlight: true,
        autoclose: true
    });

    $('#txtFechaInicioERCC').datepicker({
        format: 'dd/mm/yyyy',
        todayHighlight: true,
        autoclose: true
    });

    $('#txtFechaFinERCC').datepicker({
        format: 'dd/mm/yyyy',
        todayHighlight: true,
        autoclose: true
    });

    cargarAniosCombo($('#comboAnio'), 2000, "-1", 'TODOS');

    $("#FrmCalendarioConv").submit(function () {
        $("#nameFormCC").val("FrmCalendarioConv");
        $("#numberPageCalendarioConv").val(1);
        $('#actionCalendarioConv').val("paginarCalendarioConv");
        $('#modalCargandoCalendarioConv').modal("show");
        return false;
    });

    $("#FrmCalendarioConvModal").submit(function () {
        if (validarFormularioCalendarioConv()) {
            $("#numberPageCalendarioConv").val(1);
            $("#nameFormCC").val("FrmCalendarioConvModal");
            $('#modalCargandoCalendarioConv').modal("show");
            //viewAlert('warning', 'Estamos trabajando!');
        }
        return false;
    });

    $("#FrmActividadModal").submit(function () {
        if (validarFormularioActividad()) {
            $("#nameFormAC").val("FrmActividadModal");
            $('#modalCargandoActividad').modal("show");
        }
        return false;
    });

    $("#modalCargandoCalendarioConv").on('shown.bs.modal', function () {
        //DESPUES DE TERMINAR DE MOSTRAR EL MODAL
        procesarAjaxCalendarioConv();
    });

    $("#modalCargandoActividad").on('shown.bs.modal', function () {
        //DESPUES DE TERMINAR DE MOSTRAR EL MODAL
        procesarAjaxActividad();
    });

    $("#ventanaManCalendarioConv").on('hidden.bs.modal', function () {
        $("#actionCalendarioConv").val("paginarCalendarioConv");
    });

    $("#ventanaManActividad").on('hidden.bs.modal', function () {
        $("#actionActividad").val("paginarActividad");
    });

    $('#btnAbrirNuevoCalendarioConv').click(function () {
        $('#FrmCalendarioConvModal input').val("");
        $('#FrmCalendarioConvModal select').val("-1");
        $('#FrmCalendarioConvModal input').parent().removeClass("has-danger");
        $('#FrmCalendarioConvModal select').parent().removeClass("has-danger");
        $('#actionCalendarioConv').val("addCalendarioConv");
        procesarAjaxActividad();
        $('#txtTituloModalManCalendarioConv').html("SELECIONAR ACTIVIDAD");
        $('#ventanaManCalendarioConv').modal("show");
        document.getElementsByTagName("body")[0].style.paddingRight = "0";
    });

    $('#comboActividadCC').change(function () {
        $('#txtActividadERAC').val($('#comboActividadCC option:selected').text());
        $('#txtActiIdERAC').val($('#comboActividadCC').val());
    });

    $('#btnAbrirNuevoActividad').click(function () {
        $('#FrmActividadModal input').val("");
        $('#FrmActividadModal input').parent().removeClass("has-danger");
        $('#actionActividad').val("addActividad");
        $('#txtTituloModalManActividad').html("REGISTRAR ACTIVIDAD");
        $('#ventanaManActividad').modal("show");
        document.getElementsByTagName("body")[0].style.paddingRight = "0";
    });

    $('#btnEditarActividad').click(function () {
        $('#actionActividad').val("updateActividad");
        $('#FrmActividadModal input').parent().removeClass("has-danger");
        $('#txtTituloModalManActividad').html("ACTUALIZAR ACTIVIDAD");
        $('#ventanaManActividad').modal("show");
        document.getElementsByTagName("body")[0].style.paddingRight = "0";
    });

    $('#btnEliminarActividad').click(function () {
        viewAlertDelete("Actividad");
        $('.swal2-container').css('z-index', '2000');
        document.getElementsByTagName("body")[0].style.paddingRight = "0";
    });

    $("#FrmConvocatoriaBien").submit(function () {
        $("#nameForm").val("FrmConvocatoriaBien");
        $("#numberPageConvocatoriaBien").val(1);
        $('#actionConvocatoriaBien').val("paginarConvocatoriaBien");
        $('#modalCargandoConvocatoriaBien').modal("show");
        return false;
    });

    $("#FrmConvocatoriaBienModal").submit(function () {
        if (validarFormularioConvocatoriaBien()) {
            $("#numberPageConvocatoriaBien").val(1);
            $("#nameForm").val("FrmConvocatoriaBienModal");
            $('#modalCargandoConvocatoriaBien').modal("show");
            //viewAlert('warning', 'Estamos trabajando!');
        }
        return false;
    });

    $("#FrmArchivosModal").submit(function () {
        if (validarUploadArchivos() !== 14) {
            $("#numberPageConvocatoriaBien").val(1);
            $("#nameForm").val("FrmArchivosModal");
            $('#modalCargandoArchivos').modal("show");
            //viewAlert('warning', 'Estamos trabajando!');
        }else{
            viewAlert('warning', 'No puede guardar, no ha subido archivos');
        }
        return false;
    });

    $("#modalCargandoConvocatoriaBien").on('shown.bs.modal', function () {
        //DESPUES DE TERMINAR DE MOSTRAR EL MODAL
        procesarAjaxConvocatoriaBien();
    });
    $("#modalCargandoArchivos").on('shown.bs.modal', function () {
        //DESPUES DE TERMINAR DE MOSTRAR EL MODAL
        procesarAjaxArchivos(cadena, acum);
    });

    $("#ventanaManConvocatoriaBien").on('hidden.bs.modal', function () {
        $("#actionConvocatoriaBien").val("paginarConvocatoriaBien");
    });

    $("#ventanaArchivos").on('hidden.bs.modal', function () {
        acum = "";
        cadena = "";
    });

    $('#btnAbrirNuevoConvocatoriaBien').click(function () {
        $('#FrmConvocatoriaBienModal input').val("");
        $('#FrmConvocatoriaBienModal textarea').val("");
        $('#FrmConvocatoriaBienModal select').val("-1");
        $('#FrmConvocatoriaBienModal input').parent().removeClass("has-danger");
        $('#FrmConvocatoriaBienModal select').parent().removeClass("has-danger");
        $('#actionConvocatoriaBien').val("addConvocatoriaBien");
        $('#txtTituloModalManConvocatoriaBien').html("REGISTRAR CONVOCATORIA");
        $('#ventanaManConvocatoriaBien').modal("show");
        document.getElementsByTagName("body")[0].style.paddingRight = "0";
    });
    var acum = "";
    var cadena = "";

    $('#btnSeleccionarArchivoCB1').click(function () {
        $('#fileArchivoCB1').trigger('click');
    });

    $("#fileArchivoCB1").change(function () {
        //CAMPO QUE VALIDARA SI SELECCIONO FILE
        $('#txtValidacionArchivoCB1').val('SI');
        readViewNameFile(this, 'txtNombreArchivoCB1');
        $('#txtNombreFileResultadoActualCB1').val($('#txtNombreArchivoCB1').val());
        cadena += ", bases_file = 'C_" + $('#txtNombreFileResultadoActualCB1').val() + "'";
        acum += ",1";
    });

    $('#btnSeleccionarArchivoCB2').click(function () {
        $('#fileArchivoCB2').trigger('click');
    });

    $("#fileArchivoCB2").change(function () {
        //CAMPO QUE VALIDARA SI SELECCIONO FILE
        $('#txtValidacionArchivoCB2').val('SI');
        readViewNameFile(this, 'txtNombreArchivoCB2');
        $('#txtNombreFileResultadoActualCB2').val($('#txtNombreArchivoCB2').val());
        cadena += ", res_eject_file ='C_" + $('#txtNombreFileResultadoActualCB2').val() + "'";
        acum += ",2";
    });
    $('#btnSeleccionarArchivoCB3').click(function () {
        $('#fileArchivoCB3').trigger('click');
    });

    $("#fileArchivoCB3").change(function () {
        //CAMPO QUE VALIDARA SI SELECCIONO FILE
        $('#txtValidacionArchivoCB3').val('SI');
        readViewNameFile(this, 'txtNombreArchivoCB3');
        $('#txtNombreFileResultadoActualCB3').val($('#txtNombreArchivoCB3').val());
        cadena += ", abs_con_obser_file = 'C_" + $('#txtNombreFileResultadoActualCB3').val() + "'";
        acum += ",3";
    });
    $('#btnSeleccionarArchivoCB4').click(function () {
        $('#fileArchivoCB4').trigger('click');
    });

    $("#fileArchivoCB4").change(function () {
        //CAMPO QUE VALIDARA SI SELECCIONO FILE
        $('#txtValidacionArchivoCB4').val('SI');
        readViewNameFile(this, 'txtNombreArchivoCB4');
        $('#txtNombreFileResultadoActualCB4').val($('#txtNombreArchivoCB4').val());
        cadena += ", abs_consult_file = 'C_" + $('#txtNombreFileResultadoActualCB4').val() + "'";
        acum += ",4";
        ;
    });
    $('#btnSeleccionarArchivoCB5').click(function () {
        $('#fileArchivoCB5').trigger('click');
    });

    $("#fileArchivoCB5").change(function () {
        //CAMPO QUE VALIDARA SI SELECCIONO FILE
        $('#txtValidacionArchivoCB5').val('SI');
        readViewNameFile(this, 'txtNombreArchivoCB5');
        $('#txtNombreFileResultadoActualCB5').val($('#txtNombreArchivoCB5').val());
        cadena += ", abs_observa_file = 'C_" + $('#txtNombreFileResultadoActualCB5').val() + "'";
        acum += ",5";
    });
    $('#btnSeleccionarArchivoCB6').click(function () {
        $('#fileArchivoCB6').trigger('click');
    });

    $("#fileArchivoCB6").change(function () {
        //CAMPO QUE VALIDARA SI SELECCIONO FILE
        $('#txtValidacionArchivoCB6').val('SI');
        readViewNameFile(this, 'txtNombreArchivoCB6');
        $('#txtNombreFileResultadoActualCB6').val($('#txtNombreArchivoCB6').val());
        cadena += ", pro_enti_file = 'C_" + $('#txtNombreFileResultadoActualCB6').val() + "'";
        acum += ",6";
    });
    $('#btnSeleccionarArchivoCB7').click(function () {
        $('#fileArchivoCB7').trigger('click');
    });

    $("#fileArchivoCB7").change(function () {
        //CAMPO QUE VALIDARA SI SELECCIONO FILE
        $('#txtValidacionArchivoCB7').val('SI');
        readViewNameFile(this, 'txtNombreArchivoCB7');
        $('#txtNombreFileResultadoActualCB7').val($('#txtNombreArchivoCB7').val());
        cadena += ", pro_osce_file = 'C_" + $('#txtNombreFileResultadoActualCB7').val() + "'";
        acum += ",7";
    });
    $('#btnSeleccionarArchivoCB8').click(function () {
        $('#fileArchivoCB8').trigger('click');
    });

    $("#fileArchivoCB8").change(function () {
        //CAMPO QUE VALIDARA SI SELECCIONO FILE
        $('#txtValidacionArchivoCB8').val('SI');
        readViewNameFile(this, 'txtNombreArchivoCB8');
        $('#txtNombreFileResultadoActualCB8').val($('#txtNombreArchivoCB8').val());
        cadena += ", bas_inte_file = 'C_" + $('#txtNombreFileResultadoActualCB8').val() + "'";
        acum += ",8";
    });
    $('#btnSeleccionarArchivoCB9').click(function () {
        $('#fileArchivoCB9').trigger('click');
    });

    $("#fileArchivoCB9").change(function () {
        //CAMPO QUE VALIDARA SI SELECCIONO FILE
        $('#txtValidacionArchivoCB9').val('SI');
        readViewNameFile(this, 'txtNombreArchivoCB9');
        $('#txtNombreFileResultadoActualCB9').val($('#txtNombreArchivoCB9').val());
        cadena += ", act_eval_tec_file = 'C_" + $('#txtNombreFileResultadoActualCB9').val() + "'";
        acum += ",9";
    });
    $('#btnSeleccionarArchivoCB10').click(function () {
        $('#fileArchivoCB10').trigger('click');
    });

    $("#fileArchivoCB10").change(function () {
        //CAMPO QUE VALIDARA SI SELECCIONO FILE
        $('#txtValidacionArchivoCB10').val('SI');
        readViewNameFile(this, 'txtNombreArchivoCB10');
        $('#txtNombreFileResultadoActualCB10').val($('#txtNombreArchivoCB10').val());
        cadena += ", cua_compa_file = 'C_" + $('#txtNombreFileResultadoActualCB10').val() + "'";
        acum += ",10";
    });
    $('#btnSeleccionarArchivoCB11').click(function () {
        $('#fileArchivoCB11').trigger('click');
    });

    $("#fileArchivoCB11").change(function () {
        //CAMPO QUE VALIDARA SI SELECCIONO FILE
        $('#txtValidacionArchivoCB11').val('SI');
        readViewNameFile(this, 'txtNombreArchivoCB11');
        $('#txtNombreFileResultadoActualCB11').val($('#txtNombreArchivoCB11').val());
        cadena += ", acta_buena_pro_file = 'C_" + $('#txtNombreFileResultadoActualCB11').val() + "'";
        acum += ",11";
    });
    $('#btnSeleccionarArchivoCB12').click(function () {
        $('#fileArchivoCB12').trigger('click');
    });

    $("#fileArchivoCB12").change(function () {
        //CAMPO QUE VALIDARA SI SELECCIONO FILE
        $('#txtValidacionArchivoCB12').val('SI');
        readViewNameFile(this, 'txtNombreArchivoCB12');
        $('#txtNombreFileResultadoActualCB12').val($('#txtNombreArchivoCB12').val());
        cadena += ", noti_sus_file = 'C_" + $('#txtNombreFileResultadoActualCB12').val() + "'";
        acum += ",12";
    });
    $('#btnSeleccionarArchivoCB13').click(function () {
        $('#fileArchivoCB13').trigger('click');
    });

    $("#fileArchivoCB13").change(function () {
        //CAMPO QUE VALIDARA SI SELECCIONO FILE
        $('#txtValidacionArchivoCB13').val('SI');
        readViewNameFile(this, 'txtNombreArchivoCB13');
        $('#txtNombreFileResultadoActualCB13').val($('#txtNombreArchivoCB13').val());
        cadena += ", res_rec_enti_file = 'C_" + $('#txtNombreFileResultadoActualCB13').val() + "'";
        acum += ",13";
    });
    $('#btnSeleccionarArchivoCB14').click(function () {
        $('#fileArchivoCB14').trigger('click');
    });

    $("#fileArchivoCB14").change(function () {
        //CAMPO QUE VALIDARA SI SELECCIONO FILE
        $('#txtValidacionArchivoCB14').val('SI');
        readViewNameFile(this, 'txtNombreArchivoCB14');
        $('#txtNombreFileResultadoActualCB14').val($('#txtNombreArchivoCB14').val());
        cadena += ", res_rec_trib_file = 'C_" + $('#txtNombreFileResultadoActualCB14').val() + "'";
        acum += ",14";
    });
    addEventoCombosPaginar();
    valicacionesCamposConvocatoriaBien();
    valicacionesCamposCalendarioConv();
    valicacionesCamposActividad();
    $('#modalCargandoConvocatoriaBien').modal("show");

});

function procesarAjaxConvocatoriaBien() {
    var datosSerializadosCompletos = $('#' + $('#nameForm').val()).serialize();
    if ($('#nameForm').val().toLowerCase() !== "frmconvocatoriabien") {
        //AGREGAMOS LOS PARAMETROS DEL FORMULARIO DE BUSQUEDA
        datosSerializadosCompletos += "&txtConvocatoriaBien=" + $('#txtConvocatoriaBien').val();
        datosSerializadosCompletos += "&comboAnio=" + $('#comboAnio').val();
        datosSerializadosCompletos += "&txtEstadoER=" + $('#txtEstadoER').val();
        datosSerializadosCompletos += "&comboTipoListaConvocatoriaBien=" + $('#comboTipoListaConvocatoriaBien').val();
    }
    datosSerializadosCompletos += "&numberPageConvocatoriaBien=" + $('#numberPageConvocatoriaBien').val();
    datosSerializadosCompletos += "&sizePageConvocatoriaBien=" + $('#sizePageConvocatoriaBien').val();
    datosSerializadosCompletos += "&action=" + $('#actionConvocatoriaBien').val();
    $.ajax({
        url: getContext() + '/convocatorias/bsc',
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        success: function (jsonResponse) {
            $('#modalCargandoConvocatoriaBien').modal("hide");
            if ($('#actionConvocatoriaBien').val().toLowerCase() === "paginarconvocatoriabien") {
                listarConvocatoriaBien(jsonResponse.BEAN_PAGINATION);
            } else {
                if (jsonResponse.MESSAGE_SERVER.toLowerCase() === "ok") {
                    $("#ventanaManConvocatoriaBien").modal("hide");
                    viewAlert('success', getMessageServerTransaction($('#actionConvocatoriaBien').val(), 'Convocatoria', 'a'));
                    listarConvocatoriaBien(jsonResponse.BEAN_PAGINATION);
                } else {
                    viewAlert('warning', jsonResponse.MESSAGE_SERVER);
                }
            }
        },
        error: function () {
            $('#modalCargandoConvocatoriaBien').modal("hide");
            $("#ventanaManConvocatoriaBien").modal("hide");
            /*MOSTRAMOS MENSAJE ERROR SERVIDOR*/
            viewAlert('error', 'Error interno en el servidor!');
        }
    });
    return false;
}

function listarConvocatoriaBien(BEAN_PAGINATION) {
    /*PAGINATION*/
    var $pagination = $('#paginationConvocatoriaBien');
    $('#tbodyConvocatoriaBien').empty();
    if (BEAN_PAGINATION.COUNT_FILTER > 0) {
        var fila;
        var text_color;
        var icon;
        var tooltip;
        var ttipo;
        var pproceso;
        var archivos;
        $.each(BEAN_PAGINATION.LIST, function (index, value) {
            if (!value.estado) {
                text_color = "text-danger";
                icon = "far fa-hand-point-up";
                tooltip = "Activar";
            } else {
                text_color = "";
                icon = "far fa-hand-point-down";
                tooltip = "Desactivar";
            }
            switch (value.tipo.toString()) {
                case "1":
                    ttipo = "BIENES";
                    break;
                case "2":
                    ttipo = "SERVICIOS";
                    break;
                case "3":
                    ttipo = "OBRAS";
                    break;
                case "4":
                    ttipo = "CONCESION";
                    break;
            }
            switch (value.proceso.toString()) {
                case "1":
                    pproceso = "VIGENTE";
                    break;
                case "2":
                    pproceso = "ANULADO";
                    break;
                case "3":
                    pproceso = "FINALIZADO";
                    break;
                case "4":
                    pproceso = "DESIERTO";
                    break;
            }

            archivos = "file1='" + value.base_file + "' ";
            archivos += "file2='" + value.res_eject_file + "' ";
            archivos += "file4='" + value.abs_consult_file + "' ";
            archivos += "file5='" + value.abs_observa_file + "' ";
            archivos += "file6='" + value.pro_enti_file + "' ";
            archivos += "file7='" + value.pro_osce_file + "' ";
            archivos += "file8='" + value.bas_inte_file + "' ";
            archivos += "file9='" + value.act_eval_tec_file + "' ";
            archivos += "file10='" + value.cua_compa_file + "' ";
            archivos += "file11='" + value.acta_buena_pro_file + "' ";
            archivos += "file12='" + value.noti_sus_file + "' ";
            archivos += "file13='" + value.res_rec_enti_file + "' ";
            archivos += "file14='" + value.res_res_trib_file + "' ";
            archivos += "file3='" + value.abs_con_obser_file + "' ";


            fila = "<tr ";
            fila += "convo_id='" + value.convo_id + "' ";
            fila += "titulo='" + value.titulo + "' ";
            fila += "referencia='" + value.referencia + "' ";
            fila += "fecha='" + value.fecha + "' ";
            fila += "tipo='" + value.tipo + "' ";
            fila += "val_referencial='" + value.val_referencial + "' ";
            fila += "lug_reg_participante='" + value.lug_reg_participante + "' ";
            fila += "cost_participacion='" + value.cost_participacion + "' ";
            fila += "proceso='" + value.proceso + "' ";
            fila += "estado='" + value.estado + "' ";
            fila += archivos + " + >";
            fila += "<td class='text-center align-middle text-medium-table " + text_color + "'>" + value.fecha + "</td>";
            fila += "<td class='align-middle text-medium-table " + text_color + "'>" + value.referencia + "</td>";
            fila += "<td class='align-middle text-medium-table " + text_color + "'>" + ttipo + "</td>";
            fila += "<td class='align-middle text-medium-table " + text_color + "'>" + pproceso + "</td>";
            fila += "<td class='align-middle text-medium-table " + text_color + "'><button class='btn btn-secondary btn-sm finalizar-activar' data-toggle='tooltip' title='" + tooltip + "' opcion='" + tooltip.toLowerCase() + "'><i class='" + icon + "'></i></button></td>";
            fila += "<td class='align-middle text-medium-table " + text_color + "'><button class='btn btn-secondary btn-sm editar-Convocatoria'><i class='fas fa-edit'></i></button></td>";
            fila += "<td class='align-middle text-medium-table " + text_color + "'><button class='btn btn-secondary btn-sm eliminar-Convocatoria'><i class='fas fa-trash-alt'></i></button></td>";
            fila += "<td class='align-middle text-medium-table " + text_color + "'><button class='btn btn-success btn-sm Documentos' data-toggle='tooltip' title='Subir Documentos'><i class='fas fa-upload'></i> DOCUMENTOS</button></td>";
            fila += "<td class='align-middle text-medium-table " + text_color + "'><button class='btn btn-success btn-sm actividades' data-toggle='tooltip' title='Actividades'><i class='fas fa-calendar-alt'></i> ACTIVIDADES</button></td>";
            fila += "</tr>";
            $('#tbodyConvocatoriaBien').append(fila);
        });
        var defaultOptions = getDefaultOptionsPagination();
        var options = getOptionsPagination(BEAN_PAGINATION.COUNT_FILTER, $('#sizePageConvocatoriaBien'),
                $('#numberPageConvocatoriaBien'), $('#actionConvocatoriaBien'), 'paginarConvocatoriaBien',
                $('#nameForm'), 'FrmConvocatoriaBien', $('#modalCargandoConvocatoriaBien'));
        $pagination.twbsPagination('destroy');
        $pagination.twbsPagination($.extend({}, defaultOptions, options));
        agregarEventosConvocatoriaBien();
        $('#txtNombreConvocatoriaBien').focus();
    } else {
        $pagination.twbsPagination('destroy');
        viewAlert('warning', 'No se encontraron resultados');
    }
}

function agregarEventosConvocatoriaBien() {
    $('.editar-Convocatoria').each(function () {
        $(this).click(function () {
            $('#txtConvoIdER').val($(this.parentElement.parentElement).attr('convo_id'));
            $('#txtTituloER').val($(this.parentElement.parentElement).attr('titulo'));
            $('#txtReferenciaER').val($(this.parentElement.parentElement).attr('referencia'));
            $('#txtFechaER').datepicker('setDate', getDateJS($(this.parentElement.parentElement).attr('fecha')));
            $('#txtTipoER').val($(this.parentElement.parentElement).attr('tipo'));
            $('#txtValorReferencialER').val($(this.parentElement.parentElement).attr('val_referencial'));
            $('#txtCostoParticipacionER').val($(this.parentElement.parentElement).attr('cost_participacion'));
            $('#txtLugarRegistroER').val($(this.parentElement.parentElement).attr('lug_reg_participante'));
            $('#txtProcesoER').val($(this.parentElement.parentElement).attr('proceso'));
            $('#txtEstadoER').val($(this.parentElement.parentElement).attr('estado'));
            $('#actionConvocatoriaBien').val('updateConvocatoriaBien');
            $('#txtTituloModalManConvocatoriaBien').html("EDITAR CONVOCATORIA");
            $('#ventanaManConvocatoriaBien').modal("show");
            document.getElementsByTagName("body")[0].style.paddingRight = "0";
        });
    });
    $('.eliminar-Convocatoria').each(function () {
        $(this).click(function () {
            $('#txtConvoIdER').val($(this.parentElement.parentElement).attr('convo_id'));
            viewAlertDelete("ConvocatoriaBien");
            document.getElementsByTagName("body")[0].style.paddingRight = "0";
        });
    });
    $('.actividades').each(function () {
        $(this).click(function () {
            $('#txtConvoPersIdER').val($(this.parentElement.parentElement).attr('convo_id'));
            $('#modalCargandoCalendarioConv').modal("show");
            $('#ventanaCalendarioConv').modal("show");
            $('#actionCalendarioConv').val("paginarCalendarioConv");
        });
    });
    $('.Documentos').each(function () {
        $(this).click(function () {
            $('#txtConvoIdER').val($(this.parentElement.parentElement).attr('convo_id'));
            for (var i = 1; i < 15; i++) {
                cargardocumentos($(this.parentElement.parentElement).attr('file' + i), i);
            }
            $('#ventanaArchivos').modal("show");

            document.getElementsByTagName("body")[0].style.paddingRight = "0";
        });
    });

    $('.finalizar-activar').each(function () {
        $(this).click(function () {
            $('#txtConvoIdER').val($(this.parentElement.parentElement).attr('convo_id'));
            $('#txtEstadoER').val($(this.parentElement.parentElement).attr('estado'));
            swal({
                title: 'PEAM',
                text: "¿Está seguro de " + $(this).attr('opcion') + " esta Convocatoria?",
                type: 'warning',
                showCancelButton: true,
                confirmButtonText: 'Sí, continuar!',
                cancelButtonText: 'No, cancelar!',
                confirmButtonClass: 'btn btn-info',
                cancelButtonClass: 'btn btn-danger',
                buttonsStyling: false
            }).then((result) => {
                if (result.value) {
                    $('#actionConvocatoriaBien').val("activateConvocatoriaBien");
                    $("#nameForm").val("FrmConvocatoriaBienModal");
                    $('#modalCargandoConvocatoriaBien').modal("show");
                }
            });
            $('.swal2-confirm').css("margin-right", "15px");
        });
    });
}

function cargardocumentos(nombre, orden) {
    var dato;
    if (nombre !== 'undefined') {
        dato = nombre.toString().substr(2);
        $('#txtNombreArchivoCB' + orden).val(dato);
    } else {
        $('#txtNombreArchivoCB' + orden).val("");
    }
}

function validarUploadArchivos() {
    var total = 0;
    for (var orden = 0; orden < 15; orden++) {
        if ($('#txtNombreFileResultadoActualCB' + orden).val() === "") {
            total++;
        }
    }
    return total;
}

function valicacionesCamposConvocatoriaBien() {
    $('#txtTituloER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtReferenciaER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtFechaER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtTipoER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtValorReferencialER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtCostoParticipacionER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtLugarRegistroER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtProcesoER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
}

function validarFormularioConvocatoriaBien() {
    if ($('#txtTituloER').val() === "") {
        $($('#txtTituloER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtReferenciaER').val() === "") {
        $($('#txtReferenciaER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtFechaER').val() === "") {
        $($('#txtFechaER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtTipoER').val() === "-1") {
        $($('#txtTipoER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtValorReferencialER').val() === "") {
        $($('#txtValorReferencialER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtCostoParticipacionER').val() === "") {
        $($('#txtCostoParticipacionER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtLugarRegistroER').val() === "") {
        $($('#txtLugarRegistroER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtProcesoER').val() === "-1") {
        $($('#txtProcesoER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }

    return true;
}

function procesarAjaxArchivos(cadena, acum) {
    var form = $('#FrmArchivosModal')[0];
    var data1 = new FormData(form);
    data1.append('txtCadena', cadena);
    data1.append('txtCantidad', acum);
    data1.append('txtConvoIdER', $('#txtConvoIdER').val());
    data1.append('txtConvocatoriaBien', $('#txtConvocatoriaBien').val());
    data1.append('comboAnio', $('#comboAnio').val());
    data1.append('txtEstadoER', $('#txtEstadoER').val());
    data1.append('comboTipoListaConvocatoriaBien', $('#comboTipoListaConvocatoriaBien').val());
    data1.append('numberPageConvocatoriaBien',  $('#numberPageConvocatoriaBien').val());
    data1.append('sizePageConvocatoriaBien', $('#sizePageConvocatoriaBien').val());
    data1.append('action', "uploadConvocatoriaBien");
    $.ajax({
        url: getContext() + '/convocatorias/bsc',
        type: 'POST',
        data: data1,
        dataType: 'json',
        enctype: 'multipart/form-data',
        processData: false,
        contentType: false,
        cache: false,
        timeout: 600000,
        success: function (jsonResponse) {
            $('#modalCargandoArchivos').modal("hide");
            if (jsonResponse.MESSAGE_SERVER.toLowerCase() === "ok") {
                viewAlert('success', 'Documentos correctamente subidos');
                listarConvocatoriaBien(jsonResponse.BEAN_PAGINATION);
            } else {
                viewAlert('warning', jsonResponse.MESSAGE_SERVER);
            }

            $("#ventanaArchivos").modal("hide");
            data1 = new FormData();
            data1 = null;
        },
        error: function () {
            $('#modalCargandoArchivos').modal("hide");
            $("#ventanaArchivos").modal("hide");
            /*MOSTRAMOS MENSAJE ERROR SERVIDOR*/
            viewAlert('error', 'Error interno en el servidor!');
        }
    });
    return false;
}

//// CALENDARIO DE CONVOCATORIAS

function procesarAjaxCalendarioConv() {
    var datosSerializadosCompletos = $('#' + $('#nameFormCC').val()).serialize();
    if ($('#nameForm').val().toLowerCase() === "frmcalendarioconvmodal") {
        datosSerializadosCompletos += "&txtIdERCC=" + $('#txtIdERCC').val();
    }
    if ($('#nameFormCC').val().toLowerCase() !== "frmcalendarioconv") {
        //AGREGAMOS LOS PARAMETROS DEL FORMULARIO DE BUSQUEDA
        datosSerializadosCompletos += "&txtCalendarioConv=" + $('#txtCalendarioConv').val();
        datosSerializadosCompletos += "&comboAnio=" + $('#comboAnio').val();
        datosSerializadosCompletos += "&txtEstadoER=" + $('#txtEstadoER').val();
    }
    datosSerializadosCompletos += "&numberPageCalendarioConv=" + $('#numberPageCalendarioConv').val();
    datosSerializadosCompletos += "&sizePageCalendarioConv=" + $('#sizePageCalendarioConv').val();
    datosSerializadosCompletos += "&txtConvoPersIdER=" + $('#txtConvoPersIdER').val();
    datosSerializadosCompletos += "&action=" + $('#actionCalendarioConv').val();
    $.ajax({
        url: getContext() + '/convocatorias/bsc',
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        success: function (jsonResponse) {
            $('#modalCargandoCalendarioConv').modal("hide");
            if ($('#actionCalendarioConv').val().toLowerCase() === "paginarcalendarioconv") {
                listarCalendarioConv(jsonResponse.BEAN_PAGINATION);
            } else {
                if (jsonResponse.MESSAGE_SERVER.toLowerCase() === "ok") {
                    viewAlert('success', getMessageServerTransaction($('#actionCalendarioConv').val(), 'Actividad', 'a'));
                    listarCalendarioConv(jsonResponse.BEAN_PAGINATION.BEAN_PAGINATION);
                } else {
                    viewAlert('warning', jsonResponse.MESSAGE_SERVER);
                }
            }
            $("#ventanaManCalendarioConv").modal("hide");
        },
        error: function () {
            $('#modalCargandoCalendarioConv').modal("hide");
            $("#ventanaManCalendarioConv").modal("hide");
            /*MOSTRAMOS MENSAJE ERROR SERVIDOR*/
            viewAlert('error', 'Error interno en el servidor!');
        }
    });
    return false;
}

function listarCalendarioConv(BEAN_PAGINATION) {
    /*PAGINATION*/
    var $pagination = $('#paginationCalendarioConv');
    $('#tbodyCalendarioConv').empty();
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
            fila += "descripcion='" + value.acti_id.descripcion + "' ";
            fila += "acti_id='" + value.acti_id.acti_id + "' ";
            fila += "fecha_inicio='" + value.fecha_inicio + "' ";
            fila += "fecha_fin='" + value.fecha_fin + "' ";
            fila += "estado='" + value.estado + "' ";
            fila += "convo_id='" + value.convo_id + "' ";
            fila += "tipo='" + value.tipo + "' ";
            fila += ">";
            fila += "<td class='align-middle " + text_color + "'>" + value.acti_id.descripcion + "</td>";
            fila += "<td class='align-middle " + text_color + "'>" + value.fecha_inicio + "</td>";
            fila += "<td class='align-middle " + text_color + "'>" + value.fecha_fin + "</td>";
            fila += "<td class='align-middle " + text_color + "'><button class='btn btn-success btn-sm editar-Calendario' data-toggle='tooltip' title='Editar Actividad'><i class='fas fa-edit'></i></button></td>";
            fila += "<td class='align-middle " + text_color + "'><button class='btn btn-success btn-sm eliminar-Calendario' data-toggle='tooltip' title='Eliminar Actividad'><i class='fas fa-trash-alt'></i></button></td>";
            fila += "</tr>";
            $('#tbodyCalendarioConv').append(fila);
        });
        var defaultOptions = getDefaultOptionsPagination();
        var options = getOptionsPagination(BEAN_PAGINATION.COUNT_FILTER, $('#sizePageCalendarioConv'),
                $('#numberPageCalendarioConv'), $('#actionCalendarioConv'), 'paginarCalendarioConv',
                $('#nameFormCC'), 'FrmCalendarioConv', $('#modalCargandoCalendarioConv'));
        $pagination.twbsPagination('destroy');
        $pagination.twbsPagination($.extend({}, defaultOptions, options));
        agregarEventosCalendarioConv();
        $('#txtNombreCalendarioConv').focus();
    } else {
        $pagination.twbsPagination('destroy');
        viewAlert('warning', 'No se encontraron resultados');
        $('#tbodyCalendarioConv').empty();
    }
}

function agregarEventosCalendarioConv() {

    $('.editar-Calendario').each(function () {
        $(this).click(function () {
            $('#txtIdERCC').val($(this.parentElement.parentElement).attr('id'));
            $('#txtFechaInicioERCC').datepicker('setDate', getDateJS($(this.parentElement.parentElement).attr('fecha_inicio')));
            $('#txtFechaFinERCC').datepicker('setDate', getDateJS($(this.parentElement.parentElement).attr('fecha_fin')));
            $('#nameFormAC').val("FrmActividadCalendario");
            $('#actionActividad').val("paginarActividad");
            procesarAjaxActividad();
            $('#actionCalendarioConv').val('updateCalendarioConv');
            $('#txtTituloModalManCalendarioConv').html("EDITAR ACTIVIDAD");
            $('#FrmCalendarioConvModal input').parent().removeClass("has-danger");
            $('#FrmCalendarioConvModal select').parent().removeClass("has-danger");
            $('#comboActividadCC').val($(this.parentElement.parentElement).attr('descripcion'));
            $('#ventanaManCalendarioConv').modal("show");
            document.getElementsByTagName("body")[0].style.paddingRight = "0";
        });
    });

    $('.eliminar-Calendario').each(function () {
        $(this).click(function () {
            $('#txtIdERCC').val($(this.parentElement.parentElement).attr('id'));
            viewAlertDelete("CalendarioConv");
            document.getElementsByTagName("body")[0].style.paddingRight = "0";
        });
    });
}

function valicacionesCamposCalendarioConv() {
    $('#txtFechaInicioERCC').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtFechaFinERCC').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#comboActividadCC').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
}

function validarFormularioCalendarioConv() {
    if ($('#txtFechaInicioERCC').val() === "") {
        $($('#txtFechaInicioERCC').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtFechaFinERCC').val() === "") {
        $($('#txtFechaFinERCC').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#comboActividadCC').val() === "-1") {
        $($('#comboActividadCC').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    return true;
}

/// ACTIVIDADES

function procesarAjaxActividad() {
    var datosSerializadosCompletos = $('#' + $('#nameFormAC').val()).serialize();
    datosSerializadosCompletos += "&txtConvoPersIdER=" + $('#txtConvoPersIdER').val();
    if ($('#nameFormAC').val().toLowerCase() === "frmactividadcalendario") {
        datosSerializadosCompletos += "&txtEditar=true";
    } else {
        datosSerializadosCompletos += "&txtEditar=false";
    }
    if ($('#nameForm').val().toLowerCase() === "frmactividadmodal") {
        datosSerializadosCompletos += "&txtActiIdERAC=" + $('#txtActiIdERAC').val();
    }
    datosSerializadosCompletos += "&action=" + $('#actionActividad').val();
    $.ajax({
        url: getContext() + '/convocatorias/bsc',
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        success: function (jsonResponse) {
            $('#modalCargandoActividad').modal("hide");
            if ($('#actionActividad').val().toLowerCase() === "paginaractividad") {
                $('#comboActividadCC').empty();
                listarActividad(jsonResponse.BEAN_PAGINATION);
            } else {
                if (jsonResponse.MESSAGE_SERVER.toLowerCase() === "ok") {
                    $('#comboActividadCC').empty();
                    listarActividad(jsonResponse.BEAN_PAGINATION);
                    viewAlert('success', getMessageServerTransaction($('#actionActividad').val(), 'Actividad', 'a'));
                    $('.swal2-container').css('z-index', '2000');
                } else {
                    viewAlert('warning', jsonResponse.MESSAGE_SERVER);
                    $('.swal2-container').css('z-index', '2000');
                }
            }
            $("#ventanaManActividad").modal("hide");
            $('#nameFormAC').val("FrmActividadModal");
        },
        error: function () {
            $('#modalCargandoActividad').modal("hide");
            $("#ventanaManActividad").modal("hide");
            /*MOSTRAMOS MENSAJE ERROR SERVIDOR*/
            viewAlert('error', 'Error interno en el servidor!');
        }
    });
    return false;
}

function listarActividad(BEAN_PAGINATION) {
    $('#tbodyActividad').empty();
    if (BEAN_PAGINATION.COUNT_FILTER > 0) {
        var fila;
        $('#comboActividadCC').append("<option value='-1'>Seleccione ...</option>");
        $.each(BEAN_PAGINATION.LIST, function (index, value) {
            //text-center align-middle
            fila = "<option value='" + value.acti_id + "'>" + value.descripcion + "</option>";
            $('#comboActividadCC').append(fila);
        });
        $('#txtNombreActividad').focus();
    } else {
        viewAlert('warning', 'No se encontraron resultados');
        $('#comboActividadCC').empty();
    }
}

function valicacionesCamposActividad() {
    $('#txtActividadERAC').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
}

function validarFormularioActividad() {
    if ($('#txtActividadERAC').val() === "") {
        $($('#txtActividadERAC').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    return true;
}
