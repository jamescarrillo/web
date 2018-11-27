$(document).ready(function () {

    cargarAniosCombo($('#comboAnioConvocatoria'), 2005, "-1", 'AÑOS');

    $("#FrmConvocatoria").submit(function () {
        $('#tbodyConvocatoria').empty();
        $('#numberPageConvocatoria').val("1");
        $('#actionConvocatoria').val("paginarConvocatoria");
        $('#loader_contenido_Convocatoria').css('display', 'block');
        procesarAjaxConvocatoriaWeb();
        return false;
    });
    
    $('#btnCerrarModalCronogramas').click(function () {
        $('#ModalCronogramas').css('display', 'none');
    });
    
    $('#btnCerrarModalDocumentos').click(function () {
        $('#ModalDocumentos').css('display', 'none');
    });
    $('#btnCerrarModalPlazas').click(function () {
        $('#ModalPlazas').css('display', 'none');
    });

    addEventoCombosPaginar();
    procesarAjaxConvocatoriaWeb();

});

function procesarAjaxConvocatoriaWeb() {
    var datosSerializadosCompletos = $('#' + $('#nameFormConvocatoria').val()).serialize();
    $.ajax({
        url: getContext() + '/convocatorias/convocatoria-de-personal',
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        success: function (jsonResponse) {
            $('#loader_contenido_Convocatoria').css('display', 'none');
            listarConvocatoria(jsonResponse.BEAN_PAGINATION);
        },
        error: function () {
            /*MOSTRAMOS MENSAJE ERROR SERVIDOR*/
            $('#loader_contenido_Convocatoria').css('display', 'none');
            viewAlertWeb('error', 'Error interno en el servidor!');
        }
    });
    return false;
}

function listarConvocatoria(BEAN_PAGINATION) {
    /*PAGINATION*/
    var $pagination = $('#paginationConvocatoria');
    $('#tbodyConvocatoria').empty();
    if (BEAN_PAGINATION.COUNT_FILTER > 0) {
        var fila;
        var estado;
        $.each(BEAN_PAGINATION.LIST, function (index, value) {
            if (value.estado) {
                estado = "<label style='font-size: 10px; background-color:#00793D;border-radius: 80px; padding-left: 10px; padding-right: 10px; color: #ffffff'>VIGENTE</label>";
            } else {
                estado = "<label style='font-size: 10px; background-color:#FF0000;border-radius: 80px; padding-left: 10px; padding-right: 10px; color: #ffffff'>FINALIZADO</label>";
            }
            fila = "<tr coper_id='" + value.coper_id + "' text='" + value.convocatoria + "'>";
            fila += "<td class='align-middle'>" + value.convocatoria + "</td>";
            fila += "<td class='align-middle'>" + value.descripcion + "</td>";
            fila += "<td class='align-middle text-center'>" + value.fecha + "</td>";
            fila += "<td class='align-middle text-center'>" + estado + "</td>";
            fila += "<td class='align-middle text-center'><button class='waves-effect waves-light btn ver-Cronograma' style='height: 30px; padding-top: 2px; padding-bottom: 2px;'>Cronogramas</button></td>";
            fila += "<td class='align-middle text-center'><button class='waves-effect waves-light btn ver-Plazas' style='height: 30px; padding-top: 2px; padding-bottom: 2px;'>Plazas</button></td>";
            fila += "</tr>";
            $('#tbodyConvocatoria').append(fila);
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
        $('#txtTituloConvocatoria').focus();
    } else {
        $pagination.twbsPagination('destroy');
        viewAlertWeb('warning', 'No se enconntraron resultados');
    }
}

function agregarEventosConvocatoria() {
    $('.ver-Cronograma').each(function () {
        $(this).click(function () {
            $('#TitularCalendario').css('display', 'block');
            $('#ConvocatoriaTitulo').html($(this.parentElement.parentElement).attr('text'));
            procesarAjaxCalendarioWeb($(this.parentElement.parentElement).attr('coper_id'));
            $('#ModalCronogramas').css('display', 'block');

        });
    });
    $('.ver-Plazas').each(function () {
        $(this).click(function () {
            procesarAjaxPuestoConvWeb($(this.parentElement.parentElement).attr('coper_id'));
            $('#TitularPlaza').css('display', 'block');
            $('#PlazaTitulo').html($(this.parentElement.parentElement).attr('text'));
            $('#ModalPlazas').css('display', 'block');

        });
    });
}

function procesarAjaxCalendarioWeb(coperid) {
    var datosSerializadosCompletos = $('#' + $('#nameFormCalendario').val()).serialize();
    datosSerializadosCompletos += "&CoperID=" + coperid;
    $.ajax({
        url: getContext() + '/convocatorias/convocatoria-de-personal',
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

function listarCalendario(BEAN_PAGINATION, id) {
    /*PAGINATION*/
    var $pagination = $('#paginationCalendario');
    $('#tbodyCalendario').empty();
    $('#tbodyDocumentCal').empty();
    $('#TitularActividad').css('display', 'none');
    $('#tbodyDocumentCal').append("<tr><td class='text-center' colspan='2'>Escoga una Actividad</td></tr>");
    if (BEAN_PAGINATION.COUNT_FILTER > 0) {
        var fila;
        $.each(BEAN_PAGINATION.LIST, function (index, value) {
            fila = "<tr id='" + value.id + "' desc='" + value.acti_id.descripcion + "'>";
            fila += "<td class='align-middle'>" + value.acti_id.descripcion + "</td>";
            fila += "<td class='align-middle'>" + value.fecha_inicio + "</td>";
            fila += "<td class='align-middle'>" + value.fecha_fin + "</td>";
            fila += "<td class='align-middle'><button class='waves-effect waves-light btn ver-Documentos' style='height: 30px; padding-top: 2px; padding-bottom: 2px;'>Ver Documentos</button></td>";
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
                        $('#nameFormCalendario').val('FrmCalendario');
                        $('#loader_contenido_Calendario').css('display', 'block');
                        procesarAjaxCalendarioWeb(id);
                    }
                };
        $pagination.twbsPagination('destroy');
        $pagination.twbsPagination($.extend({}, defaultOptions, options));
        agregarEventosCalendario();
    } else {
        $pagination.twbsPagination('destroy');
        viewAlertWeb('warning', 'No se enconntraron resultados');
    }
}

function procesarAjaxPuestoConvWeb(coperid) {
    var datosSerializadosCompletos = $('#' + $('#nameFormPuestoConv').val()).serialize();
    datosSerializadosCompletos += "&CoperID=" + coperid;
    $.ajax({
        url: getContext() + '/convocatorias/convocatoria-de-personal',
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        success: function (jsonResponse) {
            $('#loader_contenido_Plaza').css('display', 'none');
            listarPuestoConv(jsonResponse.BEAN_PAGINATION);
        },
        error: function () {
            /*MOSTRAMOS MENSAJE ERROR SERVIDOR*/
            $('#loader_contenido_Plaza').css('display', 'none');
            viewAlertWeb('error', 'Error interno en el servidor!');
        }
    });
    return false;
}

function listarPuestoConv(BEAN_PAGINATION) {
    /*PAGINATION*/
    var $pagination = $('#paginationPlaza');
    $('#tbodyPlaza').empty();
    if (BEAN_PAGINATION.COUNT_FILTER > 0) {
        var fila;
        $.each(BEAN_PAGINATION.LIST, function (index, value) {
            fila = "<tr id='" + value.pues_id + "'>";
            fila += "<td class='align-middle'>" + value.cargo + "</td>";
            fila += "<td class='align-middle'>" + value.ingre_mensual + "</td>";
            fila += "<td class='align-middle'>" + value.modaidad + "</td>";
            fila += "<td class='align-middle'>" + value.nroplaza + "</td>";
            fila += "</tr>";
            $('#tbodyPlaza').append(fila);
        });
    } else {
        var fila;
        fila = "<tr><td class='text-center' colspan='4'>Sin Plazas Publicadas</td></tr>";
        $('#tbodyPlaza').append(fila);
        $pagination.twbsPagination('destroy');
    }
}

function agregarEventosCalendario() {
    $('.ver-Documentos').each(function () {
        $(this).click(function () {
            $('#TitularActividad').css('display', 'block');
            $('#ActividadTitulo').html($(this.parentElement.parentElement).attr('desc'));
            procesarAjaxDocumentosConvWeb($(this.parentElement.parentElement).attr('id'));
            
        });
    });
}

function procesarAjaxDocumentosConvWeb(id) {
    var datosSerializadosCompletos = $('#' + $('#nameFormDocumentoCal').val()).serialize();
    datosSerializadosCompletos += "&CaleId=" + id;
    $.ajax({
        url: getContext() + '/convocatorias/convocatoria-de-personal',
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        success: function (jsonResponse) {
            $('#loader_contenido_Documento').css('display', 'none');
            listarDocumentoCal(jsonResponse.BEAN_PAGINATION);
        },
        error: function () {
            /*MOSTRAMOS MENSAJE ERROR SERVIDOR*/
            $('#loader_contenido_Calendario').css('display', 'none');
            viewAlertWeb('error', 'Error interno en el servidor!');
        }
    });
    return false;

}

function listarDocumentoCal(BEAN_PAGINATION) {
    /*PAGINATION*/
    var $pagination = $('#paginationPlaza');
    $('#tbodyDocumentCal').empty();
    if (BEAN_PAGINATION.COUNT_FILTER > 0) {
        var fila;
        $.each(BEAN_PAGINATION.LIST, function (index, value) {
            fila = "<tr id='" + value.doco_id + "'>";
            fila += "<td class='align-middle'>" + value.nombre + "</td>";
            fila += "<td><a href='" + getContext() + "/downloadfile?type_file=downloadDocumentConvocatorias&full_file=n&file=" + value.url_file + "' class='waves-effect waves-light btn' title='Descargar' style='height: 30px; padding-top: 2px; padding-bottom: 2px;'><i class='fa fa-download' aria-hidden='true'></i> DESCARGAR</a></td>";
            fila += "</tr>";
            $('#tbodyDocumentCal').append(fila);
        });
        $('#ModalDocumentos').css('display', 'block');
    } else {
        viewAlertWeb('warning', "No se encontraron Documentos");
        var fila;
        fila = "<tr><td class='text-center' colspan='2'>Sin Documentos</td></tr>";
        $('#tbodyDocumentCal').append(fila);
        $pagination.twbsPagination('destroy');
    }


}
