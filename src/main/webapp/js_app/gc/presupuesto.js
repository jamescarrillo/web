$(document).ready(function () {

    cargarAniosCombo($('#comboAnioPresupuesto1'), 2005, "-1", 'AÑO');
    cargarAniosCombo($('#comboAnioPresupuesto2'), 2005, "-1", 'AÑO');

    cargarAniosCombo($('#comboAnioFinanza1'), 2011, "-1", 'AÑO');
    cargarAniosCombo($('#comboAnioFinanza2'), 2011, "-1", 'AÑO');
    cargarAniosCombo($('#comboAnioFinanza3'), 2011, "-1", 'AÑO');
    cargarAniosCombo($('#comboAnioFinanza4'), 2011, "-1", 'AÑO');

    $('#txtFechaAprobacionER').datepicker({
        format: 'dd/mm/yyyy',
        todayHighlight: true,
        autoclose: true
    });
    
    $('#txtFechaFinanzaER').datepicker({
        format: 'dd/mm/yyyy',
        todayHighlight: true,
        autoclose: true
    });

    $("#FrmFinanza1").submit(function () {
        $("#nameFormFinanza1").val("FrmFinanza1");
        $("#numberPageFinanza1").val(1);
        $('#actionFinanza1').val("paginarFinanza");
        $('#modalCargandoFinanza1').modal("show");
        return false;
    });

    $("#FrmFinanza2").submit(function () {
        $("#nameFormFinanza2").val("FrmFinanza2");
        $("#numberPageFinanza2").val(1);
        $('#actionFinanza2').val("paginarFinanza");
        $('#modalCargandoFinanza2').modal("show");
        return false;
    });

    $("#FrmFinanza3").submit(function () {
        $("#nameFormFinanza3").val("FrmFinanza3");
        $("#numberPageFinanza3").val(1);
        $('#actionFinanza3').val("paginarFinanza");
        $('#modalCargandoFinanza3').modal("show");
        return false;
    });

    $("#FrmFinanza4").submit(function () {
        $("#nameFormFinanza4").val("FrmFinanza4");
        $("#numberPageFinanza4").val(1);
        $('#actionFinanza4').val("paginarFinanza");
        $('#modalCargandoFinanza4').modal("show");
        return false;
    });

    $("#FrmPresupuesto1").submit(function () {
        $("#nameForm1").val("FrmPresupuesto1");
        $("#numberPagePresupuesto1").val(1);
        $('#actionPresupuesto1').val("paginarPresupuesto");
        $('#modalCargandoPresupuesto1').modal("show");
        return false;
    });

    $("#FrmPresupuesto2").submit(function () {
        $("#nameForm2").val("FrmPresupuesto2");
        $("#numberPagePresupuesto2").val(1);
        $('#actionPresupuesto2').val("paginarPresupuesto");
        $('#modalCargandoPresupuesto2').modal("show");
        return false;
    });

    $("#FrmPresupuestoModal").submit(function () {
        if (validarFormularioPresupuesto()) {
            if ($('#txtTipoER').val() === "1") {
                $("#numberPagePresupuesto1").val(1);
                $("#nameForm1").val("FrmPresupuestoModal");
                $('#modalCargandoPresupuesto1').modal("show");
            } else {
                $("#numberPagePresupuesto2").val(1);
                $("#nameForm2").val("FrmPresupuestoModal");
                $('#modalCargandoPresupuesto2').modal("show");
            }

        }
        return false;
    });

    $("#FrmFinanzaModal").submit(function () {
        if (validarFormularioFinanza()) {
            switch ($('#txtTipoFinanzaER').val()) {
                case "1":
                    $("#numberPageFinanza1").val(1);
                    $("#nameFormFinanza1").val("FrmFinanzaModal");
                    $('#modalCargandoFinanza1').modal("show");
                    break;
                case "2":
                    $("#numberPageFinanza2").val(1);
                    $("#nameFormFinanza2").val("FrmFinanzaModal");
                    $('#modalCargandoFinanza2').modal("show");
                    break;
                case "3":
                    $("#numberPageFinanza3").val(1);
                    $("#nameFormFinanza3").val("FrmFinanzaModal");
                    $('#modalCargandoFinanza3').modal("show");
                    break;
                case "4":
                    $("#numberPageFinanza4").val(1);
                    $("#nameFormFinanza4").val("FrmFinanzaModal");
                    $('#modalCargandoFinanza4').modal("show");
                    break;
            }
        }
        return false;
    });

    $('#btnAbrirNuevoPresupuesto1').click(function () {
        $('#FrmPresupuestoModal input').val("");
        $('#FrmPresupuestoModal textarea').val("");
        $('#FrmPresupuestoModal select').val("-1");
        $('#FrmPresupuestoModal input').parent().removeClass("has-danger");
        $('#FrmPresupuestoModal select').parent().removeClass("has-danger");
        $('#txtTipoER').val("1");
        $('#actionPresupuesto1').val("addPresupuesto");
        $('#txtTituloModalManPresupuesto').html("REGISTRAR PIA");
        $('#ventanaManPresupuesto').modal("show");
        document.getElementsByTagName("body")[0].style.paddingRight = "0";
    });

    $('#btnAbrirNuevoPresupuesto2').click(function () {
        $('#FrmPresupuestoModal input').val("");
        $('#FrmPresupuestoModal textarea').val("");
        $('#FrmPresupuestoModal select').val("-1");
        $('#FrmPresupuestoModal input').parent().removeClass("has-danger");
        $('#FrmPresupuestoModal select').parent().removeClass("has-danger");
        $('#txtTipoER').val("2");
        $('#actionPresupuesto2').val("addPresupuesto");
        $('#txtTituloModalManPresupuesto').html("REGISTRAR PIM");
        $('#ventanaManPresupuesto').modal("show");
        document.getElementsByTagName("body")[0].style.paddingRight = "0";
    });

    $('#btnAbrirNuevoFinanza1').click(function () {
        $('#FrmFinanzaModal input').val("");
        $('#FrmFinanzaModal textarea').val("");
        $('#FrmFinanzaModal select').val("-1");
        $('#FrmFinanzaModal input').parent().removeClass("has-danger");
        $('#FrmFinanzaModal select').parent().removeClass("has-danger");
        $('#txtTipoFinanzaER').val("1");
        $('#actionFinanza1').val("addFinanza");
        $('#txtTituloModalManFinanza').html("REGISTRAR NUEVA EFF");
        $('#ventanaManFinanza').modal("show");
        document.getElementsByTagName("body")[0].style.paddingRight = "0";
    });

    $('#btnAbrirNuevoFinanza2').click(function () {
        $('#FrmFinanzaModal input').val("");
        $('#FrmFinanzaModal textarea').val("");
        $('#FrmFinanzaModal select').val("-1");
        $('#FrmFinanzaModal input').parent().removeClass("has-danger");
        $('#FrmFinanzaModal select').parent().removeClass("has-danger");
        $('#txtTipoFinanzaER').val("2");
        $('#actionFinanza2').val("addFinanza");
        $('#txtTituloModalManFinanza').html("REGISTRAR NUEVA ESF");
        $('#ventanaManFinanza').modal("show");
        document.getElementsByTagName("body")[0].style.paddingRight = "0";
    });

    $('#btnAbrirNuevoFinanza3').click(function () {
        $('#FrmFinanzaModal input').val("");
        $('#FrmFinanzaModal textarea').val("");
        $('#FrmFinanzaModal select').val("-1");
        $('#FrmFinanzaModal input').parent().removeClass("has-danger");
        $('#FrmFinanzaModal select').parent().removeClass("has-danger");
        $('#txtTipoFinanzaER').val("3");
        $('#actionFinanza3').val("addFinanza");
        $('#txtTituloModalManFinanza').html("REGISTRAR NUEVA EI");
        $('#ventanaManFinanza').modal("show");
        document.getElementsByTagName("body")[0].style.paddingRight = "0";
    });

    $('#btnAbrirNuevoFinanza4').click(function () {
        $('#FrmFinanzaModal input').val("");
        $('#FrmFinanzaModal textarea').val("");
        $('#FrmFinanzaModal select').val("-1");
        $('#FrmFinanzaModal input').parent().removeClass("has-danger");
        $('#FrmFinanzaModal select').parent().removeClass("has-danger");
        $('#txtTipoFinanzaER').val("4");
        $('#actionFinanza4').val("addFinanza");
        $('#txtTituloModalManFinanza').html("REGISTRAR NUEVO RGE");
        $('#ventanaManFinanza').modal("show");
        document.getElementsByTagName("body")[0].style.paddingRight = "0";
    });

    $("#modalCargandoPresupuesto1").on('shown.bs.modal', function () {
        //DESPUES DE TERMINAR DE MOSTRAR EL MODAL
        procesarAjaxPresupuesto1();
    });

    $("#modalCargandoPresupuesto2").on('shown.bs.modal', function () {
        //DESPUES DE TERMINAR DE MOSTRAR EL MODAL
        procesarAjaxPresupuesto2();
    });

    $("#modalCargandoFinanza1").on('shown.bs.modal', function () {
        //DESPUES DE TERMINAR DE MOSTRAR EL MODAL
        procesarAjaxFinanza1();
    });

    $("#modalCargandoFinanza2").on('shown.bs.modal', function () {
        //DESPUES DE TERMINAR DE MOSTRAR EL MODAL
        procesarAjaxFinanza2();
    });

    $("#modalCargandoFinanza3").on('shown.bs.modal', function () {
        //DESPUES DE TERMINAR DE MOSTRAR EL MODAL
        procesarAjaxFinanza3();
    });

    $("#modalCargandoFinanza4").on('shown.bs.modal', function () {
        //DESPUES DE TERMINAR DE MOSTRAR EL MODAL
        procesarAjaxFinanza4();
    });
    
    $("#ventanaManFinanza").on('hidden.bs.modal', function () {
        $("#actionFinanza").val("paginarFinanza");
        $('#txtDescripcionFinanza').parent().removeClass("has-danger");
    });

    $("#ventanaManPresupuesto").on('hidden.bs.modal', function () {
        $("#actionPresupuesto").val("paginarPresupuesto");
        $('#txtFechaAprobacionER').parent().removeClass("has-danger");
        $('#txtDescripcionER').parent().removeClass("has-danger");
        $('#txtResolucionAprobacionER').parent().removeClass("has-danger");
        $('#txtEstadoER').parent().removeClass("has-danger");
    });

    addEventoCombosPaginar();
    valicacionesCamposPresupuesto();
    valicacionesCamposFinanza();
    $('#modalCargandoPresupuesto1').modal("show");

    procesarAjaxFinanza1();

});



function procesarAjaxPresupuesto1() {
    var datosSerializadosCompletos = $('#' + $('#nameForm1').val()).serialize();
    if ($('#nameForm1').val().toLowerCase() !== "frmpresupuesto1") {
        datosSerializadosCompletos += "&txtTituloPresupuesto=" + $('#txtTituloPresupuesto').val();
        datosSerializadosCompletos += "&comboAnioPresupuesto1=" + $('#comboAnioPresupuesto1').val();
        datosSerializadosCompletos += "&comboTipoListaPresupuesto=" + $('#comboTipoListaPresupuesto').val();
    }
    datosSerializadosCompletos += "&DatoTipo=1";
    datosSerializadosCompletos += "&numberPagePresupuesto=" + $('#numberPagePresupuesto1').val();
    datosSerializadosCompletos += "&sizePagePresupuesto=" + $('#sizePagePresupuesto1').val();
    datosSerializadosCompletos += "&action=" + $('#actionPresupuesto1').val();
    $.ajax({
        url: getContext() + '/finanzas/pendiente',
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        success: function (jsonResponse) {
            $('#modalCargandoPresupuesto1').modal("hide");
            $('#ventanaManPresupuesto').modal("hide");
            if ($('#actionPresupuesto1').val().toLowerCase() === "paginarpresupuesto") {
                listarPresupuesto(jsonResponse.BEAN_PAGINATION, "1");
                procesarAjaxPresupuesto2();
            } else {
                if (jsonResponse.MESSAGE_SERVER.toLowerCase() === "ok") {
                    listarPresupuesto(jsonResponse.BEAN_PAGINATION, "1");
                    viewAlert('success', getMessageServerTransaction($('#actionPresupuesto1').val(), 'Presupuesto', 'o'));
                } else {
                    viewAlert('warning', jsonResponse.MESSAGE_SERVER);
                }
            }
        },
        error: function () {
            $('#modalCargandoPresupuesto1').modal("hide");
            $("#ventanaManPresupuesto").modal("hide");
            /*MOSTRAMOS MENSAJE ERROR SERVIDOR*/
            viewAlert('error', 'Error interno en el servidor!');
        }
    });
    return false;
}

function procesarAjaxPresupuesto2() {
    var datosSerializadosCompletos = $('#' + $('#nameForm2').val()).serialize();
    if ($('#nameForm2').val().toLowerCase() !== "frmpresupuesto2") {
        datosSerializadosCompletos += "&txtTituloPresupuesto=" + $('#txtTituloPresupuesto').val();
        datosSerializadosCompletos += "&comboAnioPresupuesto2=" + $('#comboAnioPresupuesto2').val();
        datosSerializadosCompletos += "&comboTipoListaPresupuesto=" + $('#comboTipoListaPresupuesto').val();
    }
    datosSerializadosCompletos += "&DatoTipo=2";
    datosSerializadosCompletos += "&numberPagePresupuesto=" + $('#numberPagePresupuesto2').val();
    datosSerializadosCompletos += "&sizePagePresupuesto=" + $('#sizePagePresupuesto2').val();
    datosSerializadosCompletos += "&action=" + $('#actionPresupuesto2').val();
    $.ajax({
        url: getContext() + '/finanzas/pendiente',
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        success: function (jsonResponse) {
            $('#modalCargandoPresupuesto2').modal("hide");
            $('#ventanaManPresupuesto').modal("hide");
            if ($('#actionPresupuesto2').val().toLowerCase() === "paginarpresupuesto") {
                listarPresupuesto(jsonResponse.BEAN_PAGINATION, "2");
            } else {
                if (jsonResponse.MESSAGE_SERVER.toLowerCase() === "ok") {
                    listarPresupuesto(jsonResponse.BEAN_PAGINATION, "2");
                    viewAlert('success', getMessageServerTransaction($('#actionPresupuesto2').val(), 'Presupuesto', 'o'));
                } else {
                    viewAlert('warning', jsonResponse.MESSAGE_SERVER);
                }
            }
        },
        error: function () {
            $('#modalCargandoPresupuesto2').modal("hide");
            $("#ventanaManPresupuesto").modal("hide");
            /*MOSTRAMOS MENSAJE ERROR SERVIDOR*/
            viewAlert('error', 'Error interno en el servidor!');
        }
    });
    return false;
}

function listarPresupuesto(BEAN_PAGINATION, i) {
    /*PAGINATION*/
    var $pagination = $('#paginationPresupuesto' + i);
    $('#tbodyPresupuesto' + i).empty();
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
            fila += "titulo_formato='" + value.titulo_formato + "' ";
            fila += "descripcion='" + value.descripcion + "' ";
            fila += "resolucion_aprobacion='" + value.resolucion_aprobacion + "' ";
            fila += "fecha_aprobacion='" + value.fecha_aprobacion + "' ";
            fila += "ubicacion='" + value.ubicacion + "' ";
            fila += "tipo='" + value.tipo + "' ";
            fila += "estado='" + value.estado + "' ";
            fila += "docu_id='" + value.docu_id + "' ";
            fila += ">";
            fila += "<td class='align-middle text-medium-table " + text_color + "'>" + value.fecha_aprobacion + "</td>";
            fila += "<td class='align-middle text-medium-table " + text_color + "'>" + value.descripcion + "</td>";
            fila += "<td class='align-middle text-medium-table " + text_color + "'>" + value.resolucion_aprobacion + "</td>";
            fila += "<td class='align-middle text-medium-table " + text_color + "'><a href='http://lib.peam.gob.pe:8081/ArcDig/OriArc.pdf?id=" + value.docu_id + "' target='_blank' class='btn btn-success btn-sm descargar-doc' data-toggle='tooltip' title='Descargar Presupuesto'><i class='fa fa-download'></i></a></td>";
            fila += "<td class='align-middle text-medium-table " + text_color + "'><button class='btn btn-secondary btn-sm activar-desactivar-presupuesto' title='" + tooltip + " Presupuesto' opcion='" + tooltip.toLowerCase() + "'>" + icono + "</button></td>";
            fila += "<td class='align-middle text-medium-table " + text_color + "'><button class='btn btn-secondary btn-sm editar-presupuesto' title='Editar Presupuesto'><i class='fas fa-edit'></i></button></td>";
            fila += "<td class='align-middle text-medium-table " + text_color + "'><button class='btn btn-secondary btn-sm eliminar-presupuesto' title='Eliminar Presupuesto'><i class='fas fa-trash-alt'></i></button></td>";
            fila += "</tr>";
            $('#tbodyPresupuesto' + i).append(fila);
        });
        var defaultOptions = getDefaultOptionsPagination();
        var options = getOptionsPagination(BEAN_PAGINATION.COUNT_FILTER, $('#sizePagePresupuesto'+i),
                $('#numberPagePresupuesto' + i), $('#actionPresupuesto' + i), 'paginarPresupuesto',
                $('#nameForm' + i), 'FrmPresupuesto' + i, $('#modalCargandoPresupuesto' + i));
        $pagination.twbsPagination('destroy');
        $pagination.twbsPagination($.extend({}, defaultOptions, options));
        agregarEventosPresupuesto();
        $('#txtTituloPresupuesto' + i).focus();
    } else {
        $pagination.twbsPagination('destroy');
        viewAlert('warning', 'No se encontraron resultados');
    }
}

function agregarEventosPresupuesto() {
    $('.editar-presupuesto').each(function () {
        $(this).click(function () {
            $('#txtIdPresupuestoER').val($(this.parentElement.parentElement).attr('id'));
            $('#txtAnhoER').val($(this.parentElement.parentElement).attr('anho'));
            $('#txtTituloFormatoER').val($(this.parentElement.parentElement).attr('titulo_formato'));
            $('#txtDescripcionER').val($(this.parentElement.parentElement).attr('descripcion'));
            $('#txtResolucionAprobacionER').val($(this.parentElement.parentElement).attr('resolucion_aprobacion'));
            $('#txtFechaAprobacionER').datepicker('setDate', getDateJS($(this.parentElement.parentElement).attr('fecha_aprobacion')));
            $('#txtUbicacionER').val($(this.parentElement.parentElement).attr('ubicacion'));
            $('#txtTipoER').val($(this.parentElement.parentElement).attr('tipo'));
            $('#txtEstadoER').val($(this.parentElement.parentElement).attr('estado'));
            $('#txtDocuIDER').val($(this.parentElement.parentElement).attr('docu_id'));
            var i = $('#txtTipoER').val();
            $('#actionPresupuesto'+i).val('updatePresupuesto');
            $('#txtTituloModalManPresupuesto').html("EDITAR PRESUPUESTO");
            $('#ventanaManPresupuesto').modal("show");
            document.getElementsByTagName("body")[0].style.paddingRight = "0";
        });
    });
    $('.eliminar-presupuesto').each(function () {
        $(this).click(function () {
            $('#txtIdPresupuestoER').val($(this.parentElement.parentElement).attr('id'));
            $('#txtTipoER').val($(this.parentElement.parentElement).attr('tipo'));
            var i = $('#txtTipoER').val();
            swal({
                title: 'PEAM',
                text: "¿Está seguro de eliminar este Presupuesto?",
                type: 'warning',
                showCancelButton: true,
                confirmButtonText: 'Sí, continuar!',
                cancelButtonText: 'No, cancelar!',
                confirmButtonClass: 'btn btn-info',
                cancelButtonClass: 'btn btn-danger',
                buttonsStyling: false
            }).then((result) => {
                if (result.value) {
                    $('#actionPresupuesto' + i).val("deletePresupuesto");
                    $("#nameForm" + i).val("FrmPresupuestoModal");
                    $('#modalCargandoPresupuesto' + i).modal("show");
                }
            });
            $('.swal2-confirm').css("margin-right", "15px");
            document.getElementsByTagName("body")[0].style.paddingRight = "0";
        });
    });

    $('.activar-desactivar-presupuesto').each(function () {
        $(this).click(function () {
            $('#txtIdPresupuestoER').val($(this.parentElement.parentElement).attr('id'));
            $('#txtTipoER').val($(this.parentElement.parentElement).attr('tipo'));
            var i = $('#txtTipoER').val();
            if ($(this).attr('opcion').toLowerCase() === "publicar") {
                $('#txtEstadoER').val("true");
            } else {
                $('#txtEstadoER').val("false");
            }
            swal({
                title: 'PEAM',
                text: "¿Está seguro de " + $(this).attr('opcion') + " este Presupuesto?",
                type: 'warning',
                showCancelButton: true,
                confirmButtonText: 'Sí, continuar!',
                cancelButtonText: 'No, cancelar!',
                confirmButtonClass: 'btn btn-info',
                cancelButtonClass: 'btn btn-danger',
                buttonsStyling: false
            }).then((result) => {
                if (result.value) {
                    $('#actionPresupuesto' + i).val("activatePresupuesto");
                    $("#nameForm" + i).val("FrmPresupuestoModal");
                    $('#modalCargandoPresupuesto' + i).modal("show");
                }
            });
            $('.swal2-confirm').css("margin-right", "15px");
            document.getElementsByTagName("body")[0].style.paddingRight = "0";
        });
    });



}

function valicacionesCamposPresupuesto() {
    $('#txtFechaAprobacionER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtDescripcionER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
}

function validarFormularioPresupuesto() {
    if ($('#txtFechaAprobacionER').val() === "") {
        $($('#txtFechaAprobacionER').parent()).addClass('has-danger');
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

function valicacionesCamposFinanza() {
    $('#txtFechaFinanzaER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtDescripcionFinanzaER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
}

function validarFormularioFinanza() {
    if ($('#txtFechaFinanzaER').val() === "") {
        $($('#txtFechaFinanzaER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtDescripcionFinanzaER').val() === "") {
        $($('#txtDescripcionFinanzaER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    return true;
}


/// finanzas

function procesarAjaxFinanza1() {
    var datosSerializadosCompletos = $('#' + $('#nameFormFinanza1').val()).serialize();
    if ($('#nameFormFinanza1').val().toLowerCase() !== "frmfinanza1") {
        datosSerializadosCompletos += "&txtDescripcionFinanza=" + $('#txtDescripcionFinanza').val();
        datosSerializadosCompletos += "&comboAnioFinanza1=" + $('#comboAnioFinanza1').val();
        datosSerializadosCompletos += "&comboTipoListaFinanza=" + $('#comboTipoListaFinanza').val();
    }
    datosSerializadosCompletos += "&DatoTipoFinanza=1";
    datosSerializadosCompletos += "&numberPageFinanza=" + $('#numberPageFinanza1').val();
    datosSerializadosCompletos += "&sizePageFinanza=" + $('#sizePageFinanza1').val();
    datosSerializadosCompletos += "&action=" + $('#actionFinanza1').val();

    $.ajax({
        url: getContext() + '/finanzas/pendiente',
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        success: function (jsonResponse) {
            $('#modalCargandoFinanza1').modal("hide");
            $('#ventanaManFinanza').modal("hide");
            if ($('#actionFinanza1').val().toLowerCase() === "paginarfinanza") {
                listarFinanza(jsonResponse.BEAN_PAGINATION, "1");
                procesarAjaxFinanza2();
            } else {
                if (jsonResponse.MESSAGE_SERVER.toLowerCase() === "ok") {
                    listarFinanza(jsonResponse.BEAN_PAGINATION, "1");
                    viewAlert('success', getMessageServerTransaction($('#actionFinanza1').val(), 'Documento', 'o'));
                } else {
                    viewAlert('warning', jsonResponse.MESSAGE_SERVER);
                }
            }
        },
        error: function () {
            $('#modalCargandoFinanza1').modal("hide");
            $("#ventanaManFinanza").modal("hide");
            /*MOSTRAMOS MENSAJE ERROR SERVIDOR*/
            viewAlert('error', 'Error interno en el servidor!');
        }
    });
    return false;
}

function procesarAjaxFinanza2() {
    var datosSerializadosCompletos = $('#' + $('#nameFormFinanza2').val()).serialize();
    if ($('#nameFormFinanza2').val().toLowerCase() !== "frmfinanza2") {
        datosSerializadosCompletos += "&txtDescripcionFinanza=" + $('#txtDescripcionFinanza').val();
        datosSerializadosCompletos += "&comboAnioFinanza2=" + $('#comboAnioFinanza2').val();
        datosSerializadosCompletos += "&comboTipoListaFinanza=" + $('#comboTipoListaFinanza').val();
    }
    datosSerializadosCompletos += "&DatoTipoFinanza=2";
    datosSerializadosCompletos += "&numberPageFinanza=" + $('#numberPageFinanza2').val();
    datosSerializadosCompletos += "&sizePageFinanza=" + $('#sizePageFinanza2').val();
    datosSerializadosCompletos += "&action=" + $('#actionFinanza2').val();

    $.ajax({
        url: getContext() + '/finanzas/pendiente',
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        success: function (jsonResponse) {
            $('#modalCargandoFinanza2').modal("hide");
            $('#ventanaManFinanza').modal("hide");
            if ($('#actionFinanza2').val().toLowerCase() === "paginarfinanza") {
                listarFinanza(jsonResponse.BEAN_PAGINATION, "2");
                procesarAjaxFinanza3();
            } else {
                if (jsonResponse.MESSAGE_SERVER.toLowerCase() === "ok") {
                    listarFinanza(jsonResponse.BEAN_PAGINATION, "2");
                    viewAlert('success', getMessageServerTransaction($('#actionFinanza2').val(), 'Documento', 'o'));
                } else {
                    viewAlert('warning', jsonResponse.MESSAGE_SERVER);
                }
            }
        },
        error: function () {
            $('#modalCargandoFinanza2').modal("hide");
            $("#ventanaManFinanza").modal("hide");
            /*MOSTRAMOS MENSAJE ERROR SERVIDOR*/
            viewAlert('error', 'Error interno en el servidor!');
        }
    });
    return false;
}

function procesarAjaxFinanza3() {
    var datosSerializadosCompletos = $('#' + $('#nameFormFinanza3').val()).serialize();
    if ($('#nameFormFinanza3').val().toLowerCase() !== "frmfinanza3") {
        datosSerializadosCompletos += "&txtDescripcionFinanza=" + $('#txtDescripcionFinanza').val();
        datosSerializadosCompletos += "&comboAnioFinanza3=" + $('#comboAnioFinanza3').val();
        datosSerializadosCompletos += "&comboTipoListaFinanza=" + $('#comboTipoListaFinanza').val();
    }
    datosSerializadosCompletos += "&DatoTipoFinanza=3";
    datosSerializadosCompletos += "&numberPageFinanza=" + $('#numberPageFinanza3').val();
    datosSerializadosCompletos += "&sizePageFinanza=" + $('#sizePageFinanza3').val();
    datosSerializadosCompletos += "&action=" + $('#actionFinanza3').val();

    $.ajax({
        url: getContext() + '/finanzas/pendiente',
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        success: function (jsonResponse) {
            $('#modalCargandoFinanza3').modal("hide");
            $('#ventanaManFinanza').modal("hide");
            if ($('#actionFinanza3').val().toLowerCase() === "paginarfinanza") {
                listarFinanza(jsonResponse.BEAN_PAGINATION, "3");
                procesarAjaxFinanza4();
            } else {
                if (jsonResponse.MESSAGE_SERVER.toLowerCase() === "ok") {
                    listarFinanza(jsonResponse.BEAN_PAGINATION, "3");
                    viewAlert('success', getMessageServerTransaction($('#actionFinanza3').val(), 'Documento', 'o'));
                } else {
                    viewAlert('warning', jsonResponse.MESSAGE_SERVER);
                }
            }
        },
        error: function () {
            $('#modalCargandoFinanza3').modal("hide");
            $("#ventanaManFinanza").modal("hide");
            /*MOSTRAMOS MENSAJE ERROR SERVIDOR*/
            viewAlert('error', 'Error interno en el servidor!');
        }
    });
    return false;
}

function procesarAjaxFinanza4() {
    var datosSerializadosCompletos = $('#' + $('#nameFormFinanza4').val()).serialize();
    if ($('#nameFormFinanza4').val().toLowerCase() !== "frmfinanza4") {
        datosSerializadosCompletos += "&txtDescripcionFinanza=" + $('#txtDescripcionFinanza').val();
        datosSerializadosCompletos += "&comboAnioFinanza4=" + $('#comboAnioFinanza4').val();
        datosSerializadosCompletos += "&comboTipoListaFinanza=" + $('#comboTipoListaFinanza').val();
    }
    datosSerializadosCompletos += "&DatoTipoFinanza=4";
    datosSerializadosCompletos += "&numberPageFinanza=" + $('#numberPageFinanza4').val();
    datosSerializadosCompletos += "&sizePageFinanza=" + $('#sizePageFinanza4').val();
    datosSerializadosCompletos += "&action=" + $('#actionFinanza4').val();

    $.ajax({
        url: getContext() + '/finanzas/pendiente',
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        success: function (jsonResponse) {
            $('#modalCargandoFinanza4').modal("hide");
            $('#ventanaManFinanza').modal("hide");
            if ($('#actionFinanza4').val().toLowerCase() === "paginarfinanza") {
                listarFinanza(jsonResponse.BEAN_PAGINATION, "4");
            } else {
                if (jsonResponse.MESSAGE_SERVER.toLowerCase() === "ok") {
                    listarFinanza(jsonResponse.BEAN_PAGINATION, "4");
                    viewAlert('success', getMessageServerTransaction($('#actionFinanza4').val(), 'Documento', 'o'));
                } else {
                    viewAlert('warning', jsonResponse.MESSAGE_SERVER);
                }
            }
        },
        error: function () {
            $('#modalCargandoFinanza4').modal("hide");
            $("#ventanaManFinanza").modal("hide");
            /*MOSTRAMOS MENSAJE ERROR SERVIDOR*/
            viewAlert('error', 'Error interno en el servidor!');
        }
    });
    return false;
}

function listarFinanza(BEAN_PAGINATION, i) {
    /*PAGINATION*/
    var $pagination = $('#paginationFinanza'+i);
    $('#tbodyFinanza'+i).empty();
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
                tooltip = "Activar";
            } else {
                icono = "<i class='far fa-hand-point-down'></i>";
                tooltip = "Desactivar";
            }
            fila = "<tr ";
            fila += "id='" + value.id + "' ";
            fila += "tipo='" + value.tipo + "' ";
            fila += "anho='" + value.anho + "' ";
            fila += "mes='" + value.mes + "' ";
            fila += "titulo_formato='" + value.titulo_formato + "' ";
            fila += "documento='" + value.documento + "' ";
            fila += "descripcion='" + value.descripcion + "' ";
            fila += "ubicacion='" + value.ubicacion + "' ";
            fila += "estado='" + value.estado + "' ";
            fila += "docu_id='" + value.docu_id + "' ";
            fila += "fecha='" + value.fecha + "' ";
            fila += ">";
            fila += "<td class='text-center align-middle text-medium-table " + text_color + "'>" + value.mes+"/"+value.anho + "</td>";
            fila += "<td class='align-middle text-medium-table " + text_color + "'>" + value.descripcion + "</td>";
            fila += "<td class='align-middle text-medium-table " + text_color + "'><a href='http://lib.peam.gob.pe:8081/ArcDig/OriArc.pdf?id=" + value.docu_id + "' target='_blank' class='btn btn-success btn-sm descargar-doc' data-toggle='tooltip' title='Descargar Finanza'><i class='fa fa-download'></i></a></td>";
            fila += "<td class='align-middle text-medium-table " + text_color + "'><button class='btn btn-secondary btn-sm activar-desactivar-finanza' title='" + tooltip + " Finanza' opcion='" + tooltip.toLowerCase() + "'>" + icono + "</button></td>";
            fila += "<td class='align-middle text-medium-table " + text_color + "'><button class='btn btn-secondary btn-sm editar-finanza' title='Editar Finanza'><i class='fas fa-edit'></i></button></td>";
            fila += "<td class='align-middle text-medium-table " + text_color + "'><button class='btn btn-secondary btn-sm eliminar-finanza' title='Eliminar Finanza'><i class='fas fa-trash-alt'></i></button></td>";
            fila += "</tr>";
            $('#tbodyFinanza'+i).append(fila);
        });
        var defaultOptions = getDefaultOptionsPagination();
        var options = getOptionsPagination(BEAN_PAGINATION.COUNT_FILTER, $('#sizePageFinanza'+i),
                $('#numberPageFinanza'+i), $('#actionFinanza'+i), 'paginarFinanza',
                $('#nameFormFinanza'+i), 'FrmFinanza'+i, $('#modalCargandoFinanza'+i));
        $pagination.twbsPagination('destroy');
        $pagination.twbsPagination($.extend({}, defaultOptions, options));
        agregarEventosFinanza();
        $('#txtDescripcionFinanza').focus();
    } else {
        $pagination.twbsPagination('destroy');
        viewAlert('warning', 'No se encontraron resultados');
    }
}

function agregarEventosFinanza() {
    $('.editar-finanza').each(function () {
        $(this).click(function () {
            $('#txtIdFinanzaER').val($(this.parentElement.parentElement).attr('id'));
            $('#txtTipoFinanzaER').val($(this.parentElement.parentElement).attr('tipo'));
            var i = $('#txtTipoFinanzaER').val();
            $('#txtDescripcionFinanzaER').val($(this.parentElement.parentElement).attr('descripcion'));
            if ($(this.parentElement.parentElement).attr('fecha') !== "undefined") {
                $('#txtFechaFinanzaER').datepicker('setDate', getDateJS($(this.parentElement.parentElement).attr('fecha')));
            }
            $('#actionFinanza'+i).val('updateFinanza');
            $('#txtTituloModalManFinanza').html("EDITAR DOCUMENTO");
            $('#ventanaManFinanza').modal("show");
            document.getElementsByTagName("body")[0].style.paddingRight = "0";
        });
    });
    $('.eliminar-finanza').each(function () {
        $(this).click(function () {
            $('#txtIdFinanzaER').val($(this.parentElement.parentElement).attr('id'));
            $('#txtTipoFinanzaER').val($(this.parentElement.parentElement).attr('tipo'));
            var i = $('#txtTipoFinanzaER').val();
            swal({
                title: 'PEAM',
                text: "¿Está seguro de eliminar este Documento?",
                type: 'warning',
                showCancelButton: true,
                confirmButtonText: 'Sí, continuar!',
                cancelButtonText: 'No, cancelar!',
                confirmButtonClass: 'btn btn-info',
                cancelButtonClass: 'btn btn-danger',
                buttonsStyling: false
            }).then((result) => {
                if (result.value) {
                    $('#actionFinanza'+i).val("deleteFinanza");
                    $("#nameFormFinaza"+i).val("FrmFinanzaModal");
                    $('#modalCargandoFinanza'+i).modal("show");
                }
            });
            $('.swal2-confirm').css("margin-right", "15px");
            document.getElementsByTagName("body")[0].style.paddingRight = "0";
        });
    });

    $('.activar-desactivar-finanza').each(function () {
        $(this).click(function () {
            $('#txtIdFinanzaER').val($(this.parentElement.parentElement).attr('id'));
            $('#txtTipoFinanzaER').val($(this.parentElement.parentElement).attr('tipo'));
            var i = $('#txtTipoFinanzaER').val();
            if ($(this).attr('opcion').toLowerCase() === "activar") {
                $('#txtEstadoFinanzaER').val("true");
            } else {
                $('#txtEstadoFinanzaER').val("false");
            }
            swal({
                title: 'PEAM',
                text: "¿Está seguro de " + $(this).attr('opcion') + " este Documento?",
                type: 'warning',
                showCancelButton: true,
                confirmButtonText: 'Sí, continuar!',
                cancelButtonText: 'No, cancelar!',
                confirmButtonClass: 'btn btn-info',
                cancelButtonClass: 'btn btn-danger',
                buttonsStyling: false
            }).then((result) => {
                if (result.value) {
                    $('#actionFinanza'+i).val("activateFinanza");
                    $("#nameFormFinanza"+i).val("FrmFinanzaModal");
                    $('#modalCargandoFinanza'+i).modal("show");
                }
            });
            $('.swal2-confirm').css("margin-right", "15px");
            document.getElementsByTagName("body")[0].style.paddingRight = "0";
        });
    });



}
