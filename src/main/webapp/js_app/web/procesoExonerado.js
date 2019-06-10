$(document).ready(function () {

    $("#FrmProcesoExonerado").submit(function () {
        $('#tbodyProcesoExonerado').empty();
        $('#numberPageProcesoExonerado').val("1");
        $('#actionProcesoExonerado').val("paginarProceso");
        $('#loader_contenido_ProcesoExonerado').css('display', 'block');
        procesarAjaxProcesoExoneradoWeb();
        return false;
    });

    addEventoCombosPaginar();
    procesarAjaxAnhosProcesoExonerado();

});

function procesarAjaxAnhosProcesoExonerado() {
    var datosSerializadosCompletos = "action=listarAnhosProceso";
    datosSerializadosCompletos += "&comboTipoEstado="+$('#comboTipoListaProcesoExonerado').val();
    $.ajax({
        url: getContext() + '/convocatorias/procesos-exonerados',
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        success: function (jsonResponse) {
            listarAnhosProcesoExonerado(jsonResponse.BEAN_PAGINATION);
        },
        error: function () {
            console.log('Error interno en el servidor!');
        }
    });

//    }
    return false;
}
function listarAnhosProcesoExonerado(BEAN_PAGINATION) {
    $('#comboAnioProcesoExonerado').empty();
    if (BEAN_PAGINATION.COUNT_FILTER > 0) {
        var option;
        $.each(BEAN_PAGINATION.LIST, function (index, value) {
            if (value.anho!=="2012") {
             option = "<option value='" + value.anho + "'>" + añocorrecto(value.anho) + "</option>";   
            }
            $('#comboAnioProcesoExonerado').append(option);
        });
        procesarAjaxProcesoExoneradoWeb();
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

function procesarAjaxProcesoExoneradoWeb() {
    var datosSerializadosCompletos = $('#' + $('#nameFormProcesoExonerado').val()).serialize();
    $.ajax({
        url: getContext() + '/convocatorias/procesos-exonerados',
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        success: function (jsonResponse) {
            $('#loader_contenido_ProcesoExonerado').css('display', 'none');
            listarProcesoExoneradoWeb(jsonResponse.BEAN_PAGINATION);
        },
        error: function () {
            /*MOSTRAMOS MENSAJE ERROR SERVIDOR*/
            $('#loader_contenido_ProcesoExonerado').css('display', 'none');
            viewAlertWeb('error', 'Error interno en el servidor!');
        }
    });
    return false;
}

function listarProcesoExoneradoWeb(BEAN_PAGINATION) {
    /*PAGINATION*/
    var $pagination = $('#paginationProcesoExonerado');
    $('#tbodyProcesoExonerado').empty();
    if (BEAN_PAGINATION.COUNT_FILTER > 0) {
        var fila;
        $.each(BEAN_PAGINATION.LIST, function (index, value) {
            fila = "<tr ";
            fila += "id='" + value.id + "' ";
            fila += "anho='" + value.anho + "' ";
            fila += "nro_exonerado='" + value.nro_exonerado + "' ";
            fila += "ruc='" + value.ruc + "' ";
            fila += "objeto='" + value.objeto + "' ";
            fila += "fecha='" + value.fecha + "' ";
            fila += "causa='" + value.causa + "' ";
            fila += "descripcion='" + value.descripcion + "' ";
            fila += "monto='" + value.monto + "' ";
            fila += "contratista='" + value.contratista + "' ";
            fila += "url='" + value.url + "' ";
            fila += ">";
            fila += "<td class='text-center align-middle text-medium-table' >" + value.fecha + "</td>";
            fila += "<td class='align-middle text-medium-table' >" + value.descripcion + "</td>";
            fila += "<td class='align-middle text-medium-table text-center' >" + validar(value.monto) + "</td>";
            fila += "<td class='align-middle text-medium-table text-center' >" + validar(value.contratista) + "</td>";
            fila += "<td class='align-middle text-medium-table text-center' >" + validar(value.ruc) + "</td>";
            fila += "<td class='align-middle '><a target='_blank' href='" + value.url + "'>VER</a></td>";
            fila += "</tr>";
            $('#tbodyProcesoExonerado').append(fila);
        });
        var defaultOptions = getDefaultOptionsPagination();
        var totalPages = getTotalPages(BEAN_PAGINATION.COUNT_FILTER, parseInt($('#sizePageProcesoExonerado').val()));
        var options =
                {
                    startPage: parseInt($('#numberPageProcesoExonerado').val()),
                    totalPages: totalPages,
                    visiblePages: 5,
                    initiateStartPageClick: false,
                    first: "<i class='fa fa-angle-double-left' aria-hidden='true'></i>",
                    prev: "<i class='fa fa-angle-left' aria-hidden='true'></i>",
                    next: "<i class='fa fa-angle-right' aria-hidden='true'></i>",
                    last: "<i class='fa fa-angle-double-right' aria-hidden='true'></i>",
                    onPageClick: function (evt, page) {
                        $('#actionProcesoExonerado').val('paginarProcesoExonerado');
                        $('#numberPageProcesoExonerado').val(page);
                        $('#nameFormProcesoExonerado').val('FrmProcesoExonerado');
                        $('#loader_contenido_ProcesoExonerado').css('display', 'block');
                        procesarAjaxProcesoExoneradoWeb();
                    }
                };
        $pagination.twbsPagination('destroy');
        $pagination.twbsPagination($.extend({}, defaultOptions, options));
        $('#txtProcesoExonerado').focus();
    } else {
        $pagination.twbsPagination('destroy');
        viewAlertWeb('warning', 'No se enconntraron resultados');
        $('#tbodyProcesoExonerado').append("<td class='text-center' colspan='5'>No se encontraton resultados</td>");
    }
}

function validar(valor){
    var final;
    if (valor===undefined) {
        final="---";
    }else{
        final=valor;
    }
    return final;
}



