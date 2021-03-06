$(document).ready(function () {

    $("#FrmConvocatoria").submit(function () {
        $('#tbodyConvocatoriaBien').empty();
        $('#numberPageConvocatoria').val("1");
        $('#actionConvocatoria').val("paginarConvocatoria");
        $('#loader_contenido_Convocatoria').css('display', 'block');
        procesarAjaxConvocatoriaWeb();
        return false;
    });

    $('#btnCerrarModalDatos').click(function () {
        $('#header').css('display', 'block');
        $('#ModalDatos').css('display', 'none');
    });

    $('#btnCerrarModalDocumentosBien').click(function () {
        $('#ModalDocumentosBien').css('display', 'none');
    });

    addEventoCombosPaginar();
    procesarAjaxAnhosConvocatoriaBien();

});

function procesarAjaxAnhosConvocatoriaBien() {
    var datosSerializadosCompletos = "action=listarAnhosConvocatoriaBien";
    datosSerializadosCompletos += "&comboTipoEstado=" + $('#comboTipoListaConvocatoria').val();
    $.ajax({
        url: getContext() + '/convocatorias/convocatoria-de-bienes-y-servicios',
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        success: function (jsonResponse) {
            listarAnhosConvocatoriaBien(jsonResponse.BEAN_PAGINATION);
        },
        error: function () {
            console.log('Error interno en el servidor!');
        }
    });

//    }
    return false;
}
function listarAnhosConvocatoriaBien(BEAN_PAGINATION) {
    $('#comboAnio').empty();
    if (BEAN_PAGINATION.COUNT_FILTER > 0) {
        var option;
        $.each(BEAN_PAGINATION.LIST, function (index, value) {
            if (value.anho !== "2012") {
                option = "<option value='" + value.anho + "'>" + añocorrecto(value.anho) + "</option>";
            }
            $('#comboAnio').append(option);
        });
        procesarAjaxConvocatoriaWeb();
    } else {
        console.log("vacio");
    }
}

function añocorrecto(dato) {
    var añosinespacio = dato.trim();
    var añocorrecto;
    if (añosinespacio.substring(0, 1) === "1") {
        añocorrecto = "20" + añosinespacio.substring(1);
    } else {
        añocorrecto = añosinespacio;
    }
    return añocorrecto;
}

function procesarAjaxConvocatoriaWeb() {
    var datosSerializadosCompletos = $('#' + $('#nameFormConvocatoria').val()).serialize();
    $.ajax({
        url: getContext() + '/convocatorias/convocatoria-de-bienes-y-servicios',
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        success: function (jsonResponse) {
            $('#loader_contenido_Convocatoria').css('display', 'none');
            listarConvocatoriaWeb(jsonResponse.BEAN_PAGINATION);
        },
        error: function () {
            /*MOSTRAMOS MENSAJE ERROR SERVIDOR*/
            $('#loader_contenido_Convocatoria').css('display', 'none');
            viewAlertWeb('error', 'Error interno en el servidor!');
        }
    });
    return false;
}

function listarConvocatoriaWeb(BEAN_PAGINATION) {
    /*PAGINATION*/
    var $pagination = $('#paginationConvocatoria');
    $('#tbodyConvocatoriaBien').empty();
    if (BEAN_PAGINATION.COUNT_FILTER > 0) {
        var fila;
        var tipo;
        var proceso;
        var datos;
        var archivos;
        $.each(BEAN_PAGINATION.LIST, function (index, value) {
            tipo = funtipo(value.tipo);
            proceso = funproceso(value.proceso);

            datos = "titulo='" + value.titulo + "' ";
            datos += "val_referencial='" + value.val_referencial + "' ";
            datos += "cost_participacion='" + value.cost_participacion + "' ";
            datos += "lug_reg_participante='" + value.lug_reg_participante + "' ";

            archivos = "file1='" + value.base_file + "' ";
            archivos += "file2='" + value.res_eject_file + "' ";
            archivos += "file3='" + value.abs_consult_file + "' ";
            archivos += "file4='" + value.abs_observa_file + "' ";
            archivos += "file5='" + value.pro_enti_file + "' ";
            archivos += "file6='" + value.pro_osce_file + "' ";
            archivos += "file7='" + value.bas_inte_file + "' ";
            archivos += "file8='" + value.act_eval_tec_file + "' ";
            archivos += "file9='" + value.cua_compa_file + "' ";
            archivos += "file10='" + value.acta_buena_pro_file + "' ";
            archivos += "file11='" + value.noti_sus_file + "' ";
            archivos += "file12='" + value.res_rec_enti_file + "' ";
            archivos += "file13='" + value.res_res_trib_file + "' ";
            archivos += "file14='" + value.abs_con_obser_file + "' ";

            fila = "<tr convo_id='" + value.convo_id + "' " + datos + " text='" + value.referencia + "' " + archivos + " >";
            fila += "<td class='align-middle'>" + value.fecha + "</td>";
            fila += "<td class='align-middle'>" + value.referencia + "</td>";
            fila += "<td class='align-middle text-center'>" + tipo + "</td>";
            fila += "<td class='align-middle text-center'>" + proceso + "</td>";
            fila += "<td class='align-middle'><button class='waves-effect waves-light btn ver-Info' style='height: 30px; padding-top: 2px; padding-bottom: 2px;'>Info</button></td>";
            fila += "</tr>";
            $('#tbodyConvocatoriaBien').append(fila);
        });
        var defaultOptions = getDefaultOptionsPagination();
        var totalPages = getTotalPages(BEAN_PAGINATION.COUNT_FILTER, parseInt($('#sizePageConvocatoria').val()));
        var options =
                {
                    startPage: parseInt($('#numberPageConvocatoria').val()),
                    totalPages: totalPages,
                    visiblePages: 5,
                    initiateStartPageClick: false,
                    first: "<i class='fa fa-angle-double-left' aria-hidden='true'></i>",
                    prev: "<i class='fa fa-angle-left' aria-hidden='true'></i>",
                    next: "<i class='fa fa-angle-right' aria-hidden='true'></i>",
                    last: "<i class='fa fa-angle-double-right' aria-hidden='true'></i>",
                    onPageClick: function (evt, page) {
                        $('#actionConvocatoria').val('paginarConvocatoria');
                        $('#numberPageConvocatoria').val(page);
                        $('#nameFormConvocatoria').val('FrmConvocatoria');
                        $('#loader_contenido_Convocatoria').css('display', 'block');
                        procesarAjaxConvocatoriaWeb();
                    }
                };
        $pagination.twbsPagination('destroy');
        $pagination.twbsPagination($.extend({}, defaultOptions, options));
        agregarEventosConvocatoria();
        $('#txtConvocatoria').focus();
    } else {
        $pagination.twbsPagination('destroy');
        viewAlertWeb('warning', 'No se enconntraron resultados');
        $('#tbodyConvocatoriaBien').append("<td class='text-center' colspan='5'>No se encontraton resultados</td>");
    }
}

function funtipo(tip) {
    var tipo;
    switch (tip) {
        case 1:
            tipo = "BIENES";
            break;
        case 2:
            tipo = "SERVICIOS";
            break;
        case 3:
            tipo = "OBRAS";
            break;
        case 4:
            tipo = "CONCESION";
            break;
    }
    return tipo;
}

function funproceso(pros) {
    var proceso;
    switch (pros) {
        case 1:
            proceso = "VIGENTE";
            break;
        case 2:
            proceso = "ANULADO";
            break;
        case 3:
            proceso = "FINALIZADO";
            break;
        case 4:
            proceso = "DESIERTO";
            break;
    }
    return proceso;
}

function agregarEventosConvocatoria() {
    $('.ver-Info').each(function () {
        $(this).click(function () {
            $('#TitularCalendario').css('display', 'block');
            //$('#ConvocatoriaTitulo').html($(this.parentElement.parentElement).attr('text'));
            procesarAjaxCalendarioWeb($(this.parentElement.parentElement).attr('convo_id'));
            listarDatosPrincipales($(this.parentElement.parentElement).attr('titulo'),
                    $(this.parentElement.parentElement).attr('val_referencial'),
                    $(this.parentElement.parentElement).attr('cost_participacion'),
                    $(this.parentElement.parentElement).attr('lug_reg_participante'),
                    $(this.parentElement.parentElement).attr('file1'),
                    $(this.parentElement.parentElement).attr('file2'),
                    $(this.parentElement.parentElement).attr('file3'),
                    $(this.parentElement.parentElement).attr('file4'),
                    $(this.parentElement.parentElement).attr('file5'),
                    $(this.parentElement.parentElement).attr('file6'),
                    $(this.parentElement.parentElement).attr('file7'),
                    $(this.parentElement.parentElement).attr('file8'),
                    $(this.parentElement.parentElement).attr('file9'),
                    $(this.parentElement.parentElement).attr('file10'),
                    $(this.parentElement.parentElement).attr('file11'),
                    $(this.parentElement.parentElement).attr('file12'),
                    $(this.parentElement.parentElement).attr('file13'),
                    $(this.parentElement.parentElement).attr('file14'));
            $('#TitularCalendario').css('display', 'block');
            $('#ConvocatoriaTitulo').html($(this.parentElement.parentElement).attr('text'));
            $('#TitularCalendario2').css('display', 'block');
            $('#ConvocatoriaTitulo2').html($(this.parentElement.parentElement).attr('text'));

        });
    });
}

function listarDatosPrincipales(titulo, valor, costo, lugar, f1, f2, f3, f4, f5, f6, f7, f8, f9, f10, f11, f12, f13, f14) {
    $('#tbodyDocumentCal').empty();
    var fila;
    fila += "<tr>";
    fila += "<td class='align-middle'>" + titulo + "</td>";
    fila += "<td class='align-middle text-center'>" + valor + "</td>";
    fila += "<td class='align-middle text-center'>" + costo + "</td>";
    fila += "<td class='align-middle text-center'>" + lugar + "</td>";


    $('#tbodyArchivos').empty();
    var files = [f1, f2, f3, f4, f5, f6, f7, f8, f9, f10, f11, f12, f13, f14];
    var filaArchivo;
    var nombre;
    var vacio = 0;
    for (var i = 0; i < 14; i++) {
        if (files[i] !== "") {
            nombre = listadearchivos(i + 1);
            filaArchivo = "<tr>";
            filaArchivo += "<td class='align-middle'>" + nombre + "</td>";
            filaArchivo += "<td><a href='" + getContext() + "/downloadfile?type_file=downloadDocumentConvocatorias&full_file=n&file=" + files[i] + "' class='waves-effect waves-light btn' title='Descargar' style='height: 40px; padding-top: 5px; padding-bottom: 5px;'><i class='fa fa-download' aria-hidden='true'></i> DESCARGAR</a></td>";
            filaArchivo += "</tr>";
            $('#tbodyArchivos').append(filaArchivo);
        } else {
            vacio++;
        }
    }
    if (vacio === 14) {
        fila += "<td class='align-middle text-center' style='padding-top: 5px; padding-bottom: 0px;'><button class='waves-effect waves-light btn disabled' style='height: 30px; padding-top: 2px; padding-bottom: 2px;'>Sin Documentos</button></td>";
        fila += "</tr>";
        $('#tbodyDocumentCal').append(fila);
        $('#tbodyArchivos').append("<td class='text-center' colspan='2'>Sin Documentos Publicados</td>");
    } else {
        fila += "<td class='align-middle text-center' style='padding-top: 5px; padding-bottom: 0px;'><button class='waves-effect waves-light btn ver-Documentos' style='height: 30px; padding-top: 2px; padding-bottom: 2px;'>Documentos</button></td>";
        fila += "</tr>";
        $('#tbodyDocumentCal').append(fila);
        agregarEventosDocumentos();
    }


}

function agregarEventosDocumentos() {
    $('.ver-Documentos').each(function () {
        $(this).click(function () {
            $('#ModalDocumentosBien').css('z-index', '1900');
            $('#ModalDocumentosBien').css('display', 'block');
        });
    });
}

function procesarAjaxCalendarioWeb(coperid) {
    var datosSerializadosCompletos = $('#' + $('#nameFormCalendario').val()).serialize();
    datosSerializadosCompletos += "&CoperID=" + coperid;
    $.ajax({
        url: getContext() + '/convocatorias/convocatoria-de-bienes-y-servicios',
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        success: function (jsonResponse) {
            $('#loader_contenido_Calendario').css('display', 'none');
            listarCalendario(jsonResponse.BEAN_PAGINATION, coperid);
        },
        error: function () {
            /*MOSTRAMOS MENSAJE ERROR SERVIDOR*/
            $('#loader_contenido_Calendario').css('display', 'none');
            viewAlertWeb('error', 'Error interno en el servidor!');
        }
    });
    return false;
}

function listadearchivos(orden) {
    var nombre = "";
    switch (orden) {
        case 1:
            nombre = "BASES";
            break;
        case 2:
            nombre = "RESUMEN EJECUTIVO";
            break;
        case 3:
            nombre = "ABSOLUCION CONSULTAS";
            break;
        case 4:
            nombre = "ABSOLUCION OBSERVACIONES";
            break;
        case 5:
            nombre = "PRONUNCIA. ENTIDAD";
            break;
        case 6:
            nombre = "PRONUNCIA. OSCE";
            break;
        case 7:
            nombre = "BASES INTEGRADAS";
            break;
        case 8:
            nombre = "ACTA DE EVALUACION TECNICA";
            break;
        case 9:
            nombre = "CUADRO COMPARATIVO Y/O ACTAS";
            break;
        case 10:
            nombre = "ACTA BUENA PRO";
            break;
        case 11:
            nombre = "NOTIFICACION SUSCRIPCION DE ACUERDO";
            break;
        case 12:
            nombre = "RESOLUCION DE RECURSO DE APELACION DE LA ENTIDAD";
            break;
        case 13:
            nombre = "RESOLUCION DE RECURSO DE APELACION DEL TRIBUNAL";
            break;
        case 14:
            nombre = "ABSOLUCION DE CONSULTAS Y OBSERVACION";
            break;
    }
    return nombre;
}


function listarCalendario(BEAN_PAGINATION, id) {
    /*PAGINATION*/
    var $pagination = $('#paginationCalendario');
    $('#tbodyCalendario').empty();
    $('#TitularActividad').css('display', 'none');
    if (BEAN_PAGINATION.COUNT_FILTER > 0) {
        var fila;
        $.each(BEAN_PAGINATION.LIST, function (index, value) {
            fila = "<tr id='" + value.id + "' desc='" + value.acti_id.descripcion + "'>";
            fila += "<td class='align-middle'>" + value.acti_id.descripcion + "</td>";
            fila += "<td class='align-middle text-center'>" + value.fecha_inicio + "</td>";
            fila += "<td class='align-middle text-center'>" + value.fecha_fin + "</td>";
            fila += "</tr>";
            $('#tbodyCalendario').append(fila);
        });
        var defaultOptions = getDefaultOptionsPagination();
        var totalPages = getTotalPages(BEAN_PAGINATION.COUNT_FILTER, parseInt($('#sizePageCalendario').val()));
        var options =
                {
                    startPage: parseInt($('#numberPageCalendario').val()),
                    totalPages: totalPages,
                    visiblePages: 5,
                    initiateStartPageClick: false,
                    first: "<i class='fa fa-angle-double-left' aria-hidden='true'></i>",
                    prev: "<i class='fa fa-angle-left' aria-hidden='true'></i>",
                    next: "<i class='fa fa-angle-right' aria-hidden='true'></i>",
                    last: "<i class='fa fa-angle-double-right' aria-hidden='true'></i>",
                    onPageClick: function (evt, page) {
                        $('#actionCalendario').val('paginarCalendario');
                        $('#numberPageCalendario').val(page);
                        $('#nameForm').val('FrmCalendario');
                        $('#loader_contenido_Calendario').css('display', 'block');
                        procesarAjaxCalendarioWeb(id);
                    }
                };
        $pagination.twbsPagination('destroy');
        $pagination.twbsPagination($.extend({}, defaultOptions, options));
        $('#header').css('display', 'none');
        $('#ModalDatos').css('z-index', '1600');
        $('#ModalDatos').css('display', 'block');
    } else {
        $pagination.twbsPagination('destroy');
        viewAlertWeb('warning', 'Cronograma aún no Publicado');
    }
}

