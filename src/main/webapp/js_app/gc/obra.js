$(document).ready(function () {

    $('#txtFechaInicioER').datepicker({
        format: 'dd/mm/yyyy',
        todayHighlight: true,
        autoclose: true
    });

    $('#txtFechaFinER').datepicker({
        format: 'dd/mm/yyyy',
        todayHighlight: true,
        autoclose: true
    });

    cargarAniosCombo($('#comboAnio'), 2010, "-1", 'AÑO');

    cargarAniosCombo($('#txtAnhoActualizacionER'), 2005, "-1", 'Seleccione...');

    $("#FrmObra").submit(function () {
        $("#nameForm").val("FrmObra");
        $("#numberPageObra").val(1);
        $('#actionObra').val("paginarObra");
        $('#modalCargandoObra').modal("show");
        return false;
    });

    $("#FrmObraModal").submit(function () {
        if (validarFormularioObra()) {
            $("#numberPageObra").val(1);
            $("#nameForm").val("FrmObraModal");
            $('#modalCargandoObra').modal("show");
        }
        return false;
    });

    $("#modalCargandoObra").on('shown.bs.modal', function () {
        //DESPUES DE TERMINAR DE MOSTRAR EL MODAL
        procesarAjaxObra();
    });

    $("#ventanaManObra").on('hidden.bs.modal', function () {
        $("#actionObra").val("paginarObra");
    });

    $('#btnAbrirNuevoObra').click(function () {
        $('#FrmObraModal input').val("");
        $('#FrmObraModal textarea').val("");
        $('#FrmObraModal select').val("-1");
        $('#FrmObraModal input').parent().removeClass("has-danger");
        $('#FrmObraModal select').parent().removeClass("has-danger");
        $('#txtEstadoObraER').val("false");
        $('#actionObra').val("addObra");
        $('#txtTituloModalManObra').html("REGISTRAR OBRA");
        $('#ventanaManObra').modal("show");
        $('#d1').trigger('click');
        document.getElementsByTagName("body")[0].style.paddingRight = "0";
    });

    addEventoCombosPaginar();
    valicacionesCamposObra();
    $('#modalCargandoObra').modal("show");

});

function procesarAjaxObra() {
    var datosSerializadosCompletos = $('#' + $('#nameForm').val()).serialize();
    if ($('#nameForm').val().toLowerCase() !== "frmObra") {
        //AGREGAMOS LOS PARAMETROS DEL FORMULARIO DE BUSQUEDA
        datosSerializadosCompletos += "&txtObra=" + $('#txtObra').val();
        datosSerializadosCompletos += "&comboAnio=" + $('#comboAnio').val();
    }
    datosSerializadosCompletos += "&txtEstadoObraER=" + $('#txtEstadoObraER').val();
    datosSerializadosCompletos += "&numberPageObra=" + $('#numberPageObra').val();
    datosSerializadosCompletos += "&sizePageObra=" + $('#sizePageObra').val();
    datosSerializadosCompletos += "&action=" + $('#actionObra').val();
    console.log(datosSerializadosCompletos);
    $.ajax({
        url: getContext() + '/publicaciones/obrasyproyectos',
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        success: function (jsonResponse) {
            console.log(jsonResponse);
            $('#modalCargandoObra').modal("hide");
            if ($('#actionObra').val().toLowerCase() === "paginarobra") {
                listarObra(jsonResponse.BEAN_PAGINATION);
            } else {
                if (jsonResponse.MESSAGE_SERVER.toLowerCase() === "ok") {
                    $("#ventanaManObra").modal("hide");
                    viewAlert('success', getMessageServerTransaction($('#actionObra').val(), 'Obra', 'o'));
                    listarObra(jsonResponse.BEAN_PAGINATION);
                } else {
                    viewAlert('warning', jsonResponse.MESSAGE_SERVER);
                }
            }
        },
        error: function () {
            $('#modalCargandoObra').modal("hide");
            $("#ventanaManObra").modal("hide");
            /*MOSTRAMOS MENSAJE ERROR SERVIDOR*/
            viewAlert('error', 'Error interno en el servidor!');
        }
    });
    return false;
}

function listarObra(BEAN_PAGINATION) {
    /*PAGINATION*/
    var $pagination = $('#paginationObra');
    $('#containerRegistrosObra').empty();
    if (BEAN_PAGINATION.COUNT_FILTER > 0) {
        var atributosObra;
        var card;
        var cadenaContenido;
        var textColor;
        var icono;
        var opcion_estado;
        $.each(BEAN_PAGINATION.LIST, function (index, value) {
            if (value.estado) {
                textColor = "";
                icono = "<i class='far fa-hand-point-down'></i>";
                opcion_estado = "Ocultar";
            } else {
                textColor = "text-danger";
                opcion_estado = "Publicar";
                icono = "<i class='far fa-hand-point-up'></i>";
            }
            cadenaContenido = value.descripcion;
            cadenaContenido = replaceAll(cadenaContenido, '<p>', '');
            cadenaContenido = replaceAll(cadenaContenido, '</p>', '\n');

            atributosObra = "id='" + value.id + "' ";
            atributosObra += "anho='" + value.anho + "' ";
            atributosObra += "mes='" + value.mes + "' ";
            atributosObra += "fecha_inicio='" + value.fechaInicio + "' ";
            atributosObra += "fecha_fin='" + value.fechaFin + "' ";
            atributosObra += "seguimiento='" + value.seguimiento + "' ";
            atributosObra += "foto='" + value.foto + "' ";
            atributosObra += "estado='" + value.estado + "' ";
            atributosObra += "snip='" + value.snip + "' ";
            atributosObra += "creado_por='" + value.creadoPor.pers_id + "' ";
            atributosObra += "fecha_creado='" + value.fechaCreado + "' ";
            atributosObra += "fecha_editado='" + value.fechaEditado + "' ";
            atributosObra += "descripcion='" + value.descripcion + "' ";
            atributosObra += "monto_inversion='" + value.montoInversion + "' ";
            atributosObra += "monto_gastado='" + value.montoGastado + "' ";
            atributosObra += "tiempo_ejecucion='" + value.tiempoEjecucion + "' ";
            atributosObra += "modalidad_ejecucion='" + value.modalidadEjecucion + "' ";
            atributosObra += "ubicacion='" + value.ubicacion + "' ";
            atributosObra += "contratista='" + value.contratista + "' ";
            atributosObra += "supervisor='" + value.supervisor + "' ";
            atributosObra += "residente='" + value.residente + "' ";
            atributosObra += "avance_fisico='" + value.avanceFisico + "' ";
            atributosObra += "area='" + value.area.id + "' ";
            atributosObra += "galeria='" + value.galeria + "' ";
            atributosObra += "anho_actualizacion='" + value.anhoActualizacion + "' ";
            atributosObra += "mes_actualizacion='" + value.mesActualizacion + "' ";
            atributosObra += "observacion='" + value.observacion + "' ";
            atributosObra += "infobras='" + value.infobras + "' ";
            atributosObra += "leyenda='" + value.leyenda + "' ";

            //cadenaContenido = cadenaContenido.substring(0, 120) + "...";
            cadenaContenido = getResumenContenidoWeb(cadenaContenido, 120) + "...";
            card = "<div class='col-lg-4 col-md-6'>";

            card += "<div class='card blog-widget'>";

            card += "<div class='card-body'>";

            card += "<div class='blog-image'><img src='" + value.foto + "' alt='img' class='img-responsive'></div>";

            card += "<h3 class='" + textColor + "'>" + cadenaContenido + "</h3>";

            card += "<p class='m-t-15 m-b-20 " + textColor + "'>" + value.fechaInicio + "</p>";

            //card += cadenaContenido;

            card += "<div class='d-flex' " + atributosObra + ">";

            //card += "<div class='read'><a class='link font-medium btn-vista-previa-np' style='cursor:pointer'>Vista Previa</a></div>";
            card += "<div class='read'></div>";

            card += "<div class='ml-auto'>";

            card += "<a style='cursor:pointer' class='link mr-2 btn-cambiar-estado-Obra' data-toggle='tooltip' title='" + opcion_estado + "' data-original-title='' opcion_estado='" + opcion_estado.toLowerCase() + "'>" + icono + "</a>";
            card += "<a style='cursor:pointer' class='link mr-2 btn-editar-np' data-toggle='tooltip' title='Editar' data-original-title='Editar'><i class='fas fa-edit'></i></a>";
            card += "<a style='cursor:pointer' class='link btn-eliminar-np' data-toggle='tooltip' title='Eliminar' data-original-title='Eliminar'><i class='fas fa-trash-alt'></i></a>";

            card += "</div>";

            card += "</div>";

            card += "</div>";

            card += "</div>";

            card += "</div>";

            $('#containerRegistrosObra').append(card);
        });
        var defaultOptions = getDefaultOptionsPagination();
        var options = getOptionsPagination(BEAN_PAGINATION.COUNT_FILTER, $('#sizePageObra'),
                $('#numberPageObra'), $('#actionObra'), 'paginarObra',
                $('#nameForm'), 'FrmObra', $('#modalCargandoObra'));
        $pagination.twbsPagination('destroy');
        $pagination.twbsPagination($.extend({}, defaultOptions, options));
        agregarEventosObra();
        $('#txtObra').focus();
    } else {
        $pagination.twbsPagination('destroy');
        viewAlert('warning', 'No se enconntraron resultados');
    }
}

function agregarEventosObra() {

    $('.btn-vista-previa-np').each(function () {
        $(this).click(function () {
            $('#tituloObraVP').html(getResumenContenidoWeb($(this.parentElement.parentElement).attr('descripcion'), 80) + "...");
            $('#ventanaVistaPreviaObra').modal("show");
            document.getElementsByTagName("body")[0].style.paddingRight = "0";
        });
    });

    $('.btn-editar-np').each(function () {
        $(this).click(function () {
            $('#txtIdER').val($(this.parentElement.parentElement).attr('id'));
            $('#comboAreaER').val($(this.parentElement.parentElement).attr('area'));
            $('#txtDescripcionER').val($(this.parentElement.parentElement).attr('descripcion'));
            $('#txtMontoInversionER').val($(this.parentElement.parentElement).attr('monto_inversion'));
            $('#txtMontoGastadoER').val($(this.parentElement.parentElement).attr('monto_gastado'));
            $('#txtFechaInicioER').val($(this.parentElement.parentElement).attr('fecha_inicio'));
            $('#txtFechaFinER').val($(this.parentElement.parentElement).attr('fecha_fin'));
            $('#txtMesActualizacionER').val($(this.parentElement.parentElement).attr('mes_actualizacion'));
            $('#txtAnhoActualizacionER').val($(this.parentElement.parentElement).attr('anho_actualizacion'));
            $('#txtTiempoEjecucionER').val($(this.parentElement.parentElement).attr('tiempo_ejecucion'));
            $('#txtModalidadEjecucionER').val($(this.parentElement.parentElement).attr('modalidad_ejecucion'));
            $('#comboSeguimientoER').val($(this.parentElement.parentElement).attr('seguimiento'));
            $('#txtAvanceFisicoER').val($(this.parentElement.parentElement).attr('avance_fisico'));
            $('#txtSnipER').val($(this.parentElement.parentElement).attr('snip'));
            $('#txtUbicacionER').val($(this.parentElement.parentElement).attr('ubicacion'));
            $('#txtContratistaER').val($(this.parentElement.parentElement).attr('contratista'));
            $('#txtSuppervisorER').val($(this.parentElement.parentElement).attr('supervisor'));
            $('#txtResidenteER').val($(this.parentElement.parentElement).attr('residente'));
            $('#txtInfobrasER').val($(this.parentElement.parentElement).attr('infobras'));
            $('#txtGaleriaER').val($(this.parentElement.parentElement).attr('galeria'));
            $('#txtFotoER').val($(this.parentElement.parentElement).attr('foto'));
            $('#txtLeyendaER').val($(this.parentElement.parentElement).attr('leyenda'));
            $('#txtObservacionER').val($(this.parentElement.parentElement).attr('observacion'));
            $('#actionObra').val('updateObra');
            $('#txtTituloModalManObra').html("EDITAR OBRA");
            $('#ventanaManObra').modal("show");
            document.getElementsByTagName("body")[0].style.paddingRight = "0";
        });
    });

    $('.btn-eliminar-np').each(function () {
        $(this).click(function () {
            $('#txtIdER').val($(this.parentElement.parentElement).attr('id'));
            viewAlertDelete("Obra");
            document.getElementsByTagName("body")[0].style.paddingRight = "0";
        });
    });
    $('.btn-cambiar-estado-Obra').each(function () {
        $(this).click(function () {
            $('#txtIdER').val($(this.parentElement.parentElement).attr('id'));
            if ($(this).attr('opcion_estado').toLowerCase() !== "publicar") {
                $('#txtEstadoObraER').val("true");
            } else {
                $('#txtEstadoObraER').val("false");
            }
            swal({
                title: 'PEAM',
                text: "¿Está seguro de " + $(this).attr('opcion_estado') + " esta Obra?",
                type: 'warning',
                showCancelButton: true,
                confirmButtonText: 'Sí, continuar!',
                cancelButtonText: 'No, cancelar!',
                confirmButtonClass: 'btn btn-info',
                cancelButtonClass: 'btn btn-danger',
                buttonsStyling: false
            }).then((result) => {
                if (result.value) {
                    $('#actionObra').val("activateObra");
                    $("#nameForm").val("FrmObraModal");
                    $('#modalCargandoObra').modal("show");
                }
            });
            $('.swal2-confirm').css("margin-right", "15px");
            document.getElementsByTagName("body")[0].style.paddingRight = "0";
        });
    });
}

function valicacionesCamposObra() {
    $('#txtFechaInicioER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#comboAreaER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#comboSeguimientoER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtFotoER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtSnipER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtDescripcionER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtMontoInversionER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtMontoGastadoER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtFechaFinER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtMesActualizacionER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtAnhoActualizacionER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtTiempoEjecucionER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtModalidadEjecucionER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtAvanceFisicoER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtUbicacionER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtContratistaER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtSuppervisorER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtResidenteER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtInfobrasER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtGaleriaER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtLeyendaER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#txtObservacionER').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
}

function validarFormularioObra() {
    if ($('#comboAreaER').val() === "-1") {
        $($('#comboAreaER').parent()).addClass('has-danger');
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
    if ($('#txtMontoInversionER').val() === "") {
        $($('#txtMontoInversionER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtMontoGastadoER').val() === "") {
        $($('#txtMontoGastadoER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtFechaInicioER').val() === "") {
        $($('#txtFechaInicioER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtFechaFinER').val() === "") {
        $($('#txtFechaFinER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtMesActualizacionER').val() === "-1") {
        $($('#txtMesActualizacionER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtAnhoActualizacionER').val() === "-1") {
        $($('#txtAnhoActualizacionER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtTiempoEjecucionER').val() === "") {
        $($('#txtTiempoEjecucionER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtModalidadEjecucionER').val() === "-1") {
        $($('#txtModalidadEjecucionER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#comboSeguimientoER').val() === "-1") {
        $($('#comboSeguimientoER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtAvanceFisicoER').val() === "") {
        $($('#txtAvanceFisicoER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtSnipER').val() === "") {
        $($('#txtSnipER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtUbicacionER').val() === "") {
        $($('#txtUbicacionER').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtContratistaER').val() === "") {
        $($('#txtContratistaER').parent()).addClass('has-danger');
        $('#d2').trigger('click');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtSuppervisorER').val() === "") {
        $($('#txtSuppervisorER').parent()).addClass('has-danger');
        $('#d2').trigger('click');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtResidenteER').val() === "") {
        $($('#txtResidenteER').parent()).addClass('has-danger');
        $('#d2').trigger('click');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtInfobrasER').val() === "") {
        $($('#txtInfobrasER').parent()).addClass('has-danger');
        $('#d2').trigger('click');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtGaleriaER').val() === "") {
        $($('#txtGaleriaER').parent()).addClass('has-danger');
        $('#d2').trigger('click');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtFotoER').val() === "") {
        $($('#txtFotoER').parent()).addClass('has-danger');
        $('#d2').trigger('click');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtLeyendaER').val() === "") {
        $($('#txtLeyendaER').parent()).addClass('has-danger');
        $('#d2').trigger('click');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtObservacionER').val() === "") {
        $($('#txtObservacionER').parent()).addClass('has-danger');
        $('#d2').trigger('click');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    return true;
}

