$(document).ready(function () {

    cargarAniosCombo($('#comboAnioObra'), 2012, "-1", 'AÑO');

    $("#FrmObra").submit(function () {
        $('#loader_contenido').css('display', 'block');
        procesarAjaxObrasWeb();
        return false;
    });

    $('#btnAbrirModal').click(function () {
        $('#myModal').css('display', 'block');
    });

    $('#btnCerrarModal').click(function () {
        $('#myModal').css('display', 'none');
    });



    addEventoCombosPaginar();
    procesarAjaxObrasWeb();

});

function procesarAjaxObrasWeb() {
    var pathname = window.location.pathname;
    pathname = pathname.substring(getContext().length, pathname.length);
    var datosSerializadosCompletos = $('#' + $('#nameForm').val()).serialize();
    datosSerializadosCompletos += "&url=" + pathname;
    $('#containerObras').empty();
    $.ajax({
        url: getContext() + '/lineas-de-accion/operaciones',
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        success: function (jsonResponse) {
            $('#loader_contenido').css('display', 'none');
            if (jsonResponse.BEAN_PAGINATION.COUNT_FILTER > 0) {
                var div;
                var por_avance_financiero;
                var por_num_avance_financiero;
                var atributos;
                $.each(jsonResponse.BEAN_PAGINATION.LIST, function (index, value) {
                    atributos = " descripcion='" + value.descripcion + "' ";
                    atributos += "anho_actualizacion='" + value.anhoActualizacion + "' ";
                    atributos += "avance_fisico='" + value.avanceFisico + "' ";
                    atributos += "contratista='" + value.contratista + "' ";
                    atributos += "fecha_fin='" + value.fechaFin + "' ";
                    atributos += "fecha_inicio='" + value.fechaInicio + "' ";
                    atributos += "foto='" + value.foto + "' ";
                    atributos += "galeria='" + value.galeria + "' ";
                    atributos += "leyenda='" + value.leyenda + "' ";
                    atributos += "mes_actualizacion='" + value.mesActualizacion + "' ";
                    atributos += "modalidad_ejecucion='" + value.modalidadEjecucion + "' ";
                    atributos += "monto_gastado='" + value.montoGastado + "' ";
                    atributos += "monto_inversion='" + value.montoInversion + "' ";
                    atributos += "observacion='" + value.observacion + "' ";
                    atributos += "residente='" + value.residente + "' ";
                    atributos += "seguimiento='" + value.seguimiento + "' ";
                    atributos += "snip='" + value.snip + "' ";
                    atributos += "supervisor='" + value.supervisor + "' ";
                    atributos += "tiempo_ejecucion='" + value.tiempoEjecucion + "' ";
                    atributos += "ubicacion='" + value.ubicacion + "' ";


                    if (index === 0) {
                        div = "<div class='row mb-30'>";
                    } else {
                        div = "<div class='row mt-30 mb-30'>";
                    }

                    div += "<div class='col-md-7 col-xs-12'>";

                    div += "<div class='valign-wrapper equal-height-column'>";

                    div += "<div class='hero-intro valign-cell'>";
                    div += "<h2 class='text-peam-negrita mb-20'>" + value.descripcion + "</h2>";
                    //INICIO FILA
                    div += "<div class='row'>";

                    div += "<div class='col-xs-6'>";
                    div += "<h5 class='text-peam text-peam-negrita'><i class='fa fa-money'></i> Monto de la Inversión</h5>";
                    div += "</div>";

                    div += "<div class='col-xs-6'>";
                    div += "<h5 class='text-peam text-right'>S/ " + value.montoInversion + "</h5>";
                    div += "</div>";

                    div += "</div>";
                    //FIN DE FILA

                    //INICIO FILA
                    div += "<div class='row'>";

                    div += "<div class='col-xs-6'>";
                    div += "<h5 class='text-peam text-peam-negrita'><i class='fa fa-calendar'></i> Fecha Inicio</h5>";
                    div += "</div>";

                    div += "<div class='col-xs-6'>";
                    div += "<h5 class='text-peam text-right'> " + value.fechaInicio + "</h5>";
                    div += "</div>";

                    div += "</div>";
                    //FIN DE FILA

                    //INICIO FILA
                    div += "<div class='row'>";

                    div += "<div class='col-xs-6'>";
                    div += "<h5 class='text-peam text-peam-negrita'><i class='fa fa-calendar'></i> Fecha Finalización</h5>";
                    div += "</div>";

                    div += "<div class='col-xs-6'>";
                    div += "<h5 class='text-peam text-right'> " + value.fechaFin + "</h5>";
                    div += "</div>";

                    div += "</div>";
                    //FIN DE FILA

                    por_avance_financiero = parseInt((value.montoGastado / value.montoInversion) * 100);
                    por_num_avance_financiero = por_avance_financiero;
                    if (por_avance_financiero >= 100) {
                        por_avance_financiero = 100;
                    }

                    //INICIO DE PROGESSS
                    div += "<div class='progress-section'>";

                    div += "<span class='progress-title'><strong>Avance Físico</strong></span>";
                    div += "<div class='progress'><div class='progress-bar brand-bg six-sec-ease-in-out' style='background-color: #00793D!important;width: " + value.avanceFisico + "%' role='progressbar' aria-valuenow='" + value.avanceFisico + "' aria-valuemin='0' aria-valuemax='100'><span>" + value.avanceFisico + "%</span></div></div>";

                    div += "</div>";
                    //FIN DE PROGRESS

                    //INICIO DE PROGESSS
                    div += "<div class='progress-section'>";

                    div += "<span class='progress-title'><strong>Avance Financiero</strong></span>";
                    div += "<div class='progress'><div class='progress-bar brand-bg six-sec-ease-in-out' style='background-color: #00793D!important;width: " + por_avance_financiero + "%' role='progressbar' aria-valuenow='" + por_avance_financiero + "' aria-valuemin='0' aria-valuemax='100'><span>" + por_num_avance_financiero + "%</span></div></div>";

                    div += "</div>";
                    //FIN DE PROGRESS

                    //INICIO FILA
                    div += "<div class='row'>";

                    div += "<div class='col-xs-12'>";
                    div += "<h5 class='text-peam text-peam-negrita'>Estado de la Obra</h5>";
                    //div += "<a style='margin-bottom:10px;height: 30px; padding-top: 2px; padding-bottom: 2px;margin-right: 3px' class='waves-effect waves-light btn grey-blue' target='_blank'>En Ejecución</a>";
                    if (value.seguimiento.toLowerCase() === "en ejecucion") {
                        div += "<label style='font-size: 15px; background-color:#00793D;border-radius: 80px; padding-left: 10px; padding-right: 10px; color: #ffffff'>En Ejecución</label>";
                    } else {
                        div += "<label style='font-size: 15px; background-color:#FF0000;border-radius: 80px; padding-left: 10px; padding-right: 10px; color: #ffffff'>Finalizado</label>";
                    }
                    div += "</div>";

                    div += "</div>";
                    //FIN DE FILA

                    div += "</div>";

                    div += "</div>";

                    div += "</div>";

                    div += "<div class='col-md-5 col-md-offset-0 col-sm-8 col-sm-offset-2 col-xs-10 col-xs-offset-1'>";
                    div += "<img style='border: 3px solid;color: #00793D' src='" + value.foto + "' class='img-responsive' alt='Image'>";
                    div += "<h5 class='text-center mt-10'>Camino vecinal Indañe - sector Shango</h5>";

                    div += "<div class='text-center' " + atributos + ">";
                    div += "<a style='margin-top: 5px;height: 30px; padding-top: 2px; padding-bottom: 2px;margin-right: 3px' class='waves-effect waves-light btn ver-detalle-obra'>Ver Detalle</a>";
                    div += "<a style='margin-top: 5px;height: 30px; padding-top: 2px; padding-bottom: 2px;margin-right: 3px' class='waves-effect waves-light btn' target='_blank' href='" + value.galeria + "'>Galería</a>";
                    //div += "<a style='margin-top: 5px;height: 30px; padding-top: 2px; padding-bottom: 2px;margin-right: 3px' class='waves-effect waves-light btn' target='_blank'>Link infobras</a>";
                    div += "</div>";

                    div += "</div>";

                    div += "</div>";
                    if (index !== jsonResponse.BEAN_PAGINATION.LIST.length) {
                        div += "<hr>";
                    }
                    $('#containerObras').append(div);
                });
                //agregamos eventos
                $('.ver-detalle-obra').each(function (index, value) {
                    $(this).click(function () {
                        por_avance_financiero = parseInt((parseInt($(this.parentElement).attr('monto_gastado')) / parseInt($(this.parentElement).attr('monto_inversion'))) * 100);
                        por_num_avance_financiero = por_avance_financiero;
                        if (por_avance_financiero >= 100) {
                            por_avance_financiero = 100;
                        }
                        $('#avanceFisicoModal').parent().css('width', $(this.parentElement).attr('avance_fisico') + "%");
                        $('#avanceFisicoModal').html($(this.parentElement).attr('avance_fisico') + "%");
                        $('#avanceFinancieroModal').parent().css('width', por_avance_financiero + "%");
                        $('#avanceFinancieroModal').html(por_num_avance_financiero + "%");
                        $('#estadoObraModal').html($(this.parentElement).attr('seguimiento'));
                        if ($(this.parentElement).attr('seguimiento').toLowerCase() === "en ejecucion") {
                            $('#estadoObraModal').css('background-color', '#00793D');
                        } else {
                            $('#estadoObraModal').css('background-color', '#FF0000');
                        }
                        $('#descripcionModal').html($(this.parentElement).attr('descripcion'));
                        $('#montoInversionModal').html($(this.parentElement).attr('monto_inversion'));
                        $('#fechaInicioModal').html($(this.parentElement).attr('fecha_inicio'));
                        $('#fechaFinalizacionModal').html($(this.parentElement).attr('fecha_fin'));
                        $('#tiempoEjecucionModal').html($(this.parentElement).attr('tiempo_ejecucion') + " Días");
                        $('#modalidadEjecucionModal').html($(this.parentElement).attr('modalidad_ejecucion'));
                        $('#snipModal').html($(this.parentElement).attr('snip'));
                        $('#fechaActualizacionModal').html($(this.parentElement).attr('mes_actualizacion') + "-" + $(this.parentElement).attr('anho_actualizacion'));
                        $('#ubicacionModal').html($(this.parentElement).attr('ubicacion'));
                        if ($(this.parentElement).attr('supervisor').toLowerCase() === "") {
                            $('#supervisorModal').html('-');
                        } else {
                            $('#supervisorModal').html($(this.parentElement).attr('supervisor'));
                        }
                        if ($(this.parentElement).attr('residente').toLowerCase() === "") {
                            $('#residenteModal').html('-');
                        } else {
                            $('#residenteModal').html($(this.parentElement).attr('residente'));
                        }
                        if ($(this.parentElement).attr('observacion').toLowerCase() === "") {
                            $('#observacionModal').html('-');
                        } else {
                            $('#observacionModal').html($(this.parentElement).attr('observacion'));
                        }
                        $('#fotoModal').attr('src', $(this.parentElement).attr('foto'));
                        $('#leyendaModal').html($(this.parentElement).attr('observacion'));
                        $('#myModal').css('display', 'block');
                    });
                });
            } else {
                viewAlertWeb('success', 'No se encontraron resultados!');
            }
        },
        error: function () {
            $('#loader_contenido').css('display', 'none');
        }
    });
    return false;
}