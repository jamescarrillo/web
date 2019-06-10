$(document).ready(function () {

    $("#FrmComites").submit(function () {
        $('#tbodyComites').empty();
        $('#numberPageComites').val("1");
        $('#actionComites').val("paginarComite");
        $('#loader_contenido_Comites').css('display', 'block');
        procesarAjaxComitesWeb();
        return false;
    });

    addEventoCombosPaginar();
    procesarAjaxAnhosComites();

});

function procesarAjaxAnhosComites() {
    var datosSerializadosCompletos = "action=listarAnhosComite";
    datosSerializadosCompletos += "&comboTipoEstado="+$('#comboTipoListaComites').val();
    $.ajax({
        url: getContext() + "/convocatorias/comite-de-seleccion",
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        success: function (jsonResponse) {
            listarAnhosComites(jsonResponse.BEAN_PAGINATION);
        },
        error: function () {
            console.log('Error interno en el servidor!');
        }
    });

//    }
    return false;
}
function listarAnhosComites(BEAN_PAGINATION) {
    $('#comboAnioComites').empty();
    if (BEAN_PAGINATION.COUNT_FILTER > 0) {
        var option;
        $.each(BEAN_PAGINATION.LIST, function (index, value) {
            if (value.anho!=="2012") {
             option = "<option value='" + value.docu_metadata + "'>" + añocorrecto(value.docu_metadata) + "</option>";   
            }
            $('#comboAnioComites').append(option);
        });
        procesarAjaxComitesWeb();
    } else {
        console.log("vacio");
    }
}

function añocorrecto(dato){
    var añosinespacio=dato.trim();
    var añocorrecto;
    if (añosinespacio.substring(0,1)==="1") {
        añocorrecto="20"+añosinespacio.substring(1);
    }else{
        añocorrecto = añosinespacio;
    }
    return añocorrecto;
}

function procesarAjaxComitesWeb() {
    var datosSerializadosCompletos = $('#' + $('#nameFormComites').val()).serialize();
    $.ajax({
        url: getContext() + "/convocatorias/comite-de-seleccion",
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        success: function (jsonResponse) {
            $('#loader_contenido_Comites').css('display', 'none');
            listarComitesWeb(jsonResponse.BEAN_PAGINATION);
        },
        error: function () {
            /*MOSTRAMOS MENSAJE ERROR SERVIDOR*/
            $('#loader_contenido_Comites').css('display', 'none');
            viewAlertWeb('error', 'Error interno en el servidor!');
        }
    });
    return false;
}

function listarComitesWeb(BEAN_PAGINATION) {
    /*PAGINATION*/
    var $pagination = $('#paginationComites');
    $('#tbodyComites').empty();
    if (BEAN_PAGINATION.COUNT_FILTER > 0) {
        var fila;
        var text_color;
        var icono;
        var tooltip;
        $.each(BEAN_PAGINATION.LIST, function (index, value) {
            text_color = "";
            if (!value.docu_estado) {
                text_color = " text-danger";
                icono = "<i class='far fa-hand-point-up'></i>";
                tooltip = "Activar";
            } else {
                icono = "<i class='far fa-hand-point-down'></i>";
                tooltip = "Desactivar";
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
            fila += "<td class='text-center align-middle text-medium-table " + text_color + "'>" + value.docu_fecha_docx + "</td>";
            fila += "<td class='align-middle text-medium-table " + text_color + "'>" + value.docu_titulo + "</td>";
            fila += "<td class='align-middle text-medium-table " + text_color + "'>" + value.docu_resumen + "</td>";
            fila += "<td class='align-middle text-medium-table " + text_color + "'><a href='http://lib.peam.gob.pe:8081/ArcDig/OriArc.pdf?id=" + value.docu_id + "' target='_blank' class='btn btn-success btn-sm' data-toggle='tooltip' title='Descargar Documento'><i class='fa fa-download'></i></a></td>";
            fila += "</tr>";
            $('#tbodyComites').append(fila);
        });
        var defaultOptions = getDefaultOptionsPagination();
        var totalPages = getTotalPages(BEAN_PAGINATION.COUNT_FILTER, parseInt($('#sizePageComites').val()));
        var options =
                {
                    startPage: parseInt($('#numberPageComites').val()),
                    totalPages: totalPages,
                    visiblePages: 5,
                    initiateStartPageClick: false,
                    first: "<i class='fa fa-angle-double-left' aria-hidden='true'></i>",
                    prev: "<i class='fa fa-angle-left' aria-hidden='true'></i>",
                    next: "<i class='fa fa-angle-right' aria-hidden='true'></i>",
                    last: "<i class='fa fa-angle-double-right' aria-hidden='true'></i>",
                    onPageClick: function (evt, page) {
                        $('#actionComites').val('paginarComites');
                        $('#numberPageComites').val(page);
                        $('#nameFormComites').val('FrmComites');
                        $('#loader_contenido_Comites').css('display', 'block');
                        procesarAjaxComitesWeb();
                    }
                };
        $pagination.twbsPagination('destroy');
        $pagination.twbsPagination($.extend({}, defaultOptions, options));
        $('#txtComites').focus();
    } else {
        $pagination.twbsPagination('destroy');
        viewAlertWeb('warning', 'No se enconntraron resultados');
        $('#tbodyComites').append("<td class='text-center' colspan='5'>No se encontraton resultados</td>");
    }
}



