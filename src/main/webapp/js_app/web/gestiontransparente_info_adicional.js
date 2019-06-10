$(document).ready(function () {

    $("#FrmDocumentosRecomendaciones").submit(function () {
        $('#tbodyDocumentosRecomendaciones').empty();
        $('#numberPageDocumentosRecomendaciones').val("1");
        $('#actionDocumentosRecomendaciones').val("paginarDocumentos");
        $('#loader_contenido_recomendaciones').css('display', 'block');
        procesarAjaxDocumentosWeb('Recomendaciones', 700);
        return false;
    });
    
    $("#FrmDocumentosEvaluacion").submit(function () {
        $('#tbodyDocumentosEvaluacion').empty();
        $('#numberPageDocumentosEvaluacion').val("1");
        $('#actionDocumentosEvaluacion').val("paginarDocumentos");
        $('#loader_contenido_evaluacion').css('display', 'block');
        procesarAjaxDocumentosWeb('Evaluacion', 800);
        return false;
    });
    
    $("#FrmDocumentosLaudos").submit(function () {
        $('#tbodyDocumentosLaudos').empty();
        $('#numberPageDocumentosLaudos').val("1");
        $('#actionDocumentosLaudos').val("paginarDocumentos");
        $('#loader_contenido_laudos').css('display', 'block');
        procesarAjaxDocumentosWeb('Laudos', 500);
        return false;
    });
    
    $("#FrmDocumentosActas").submit(function () {
        $('#tbodyDocumentosActas').empty();
        $('#numberPageDocumentosActas').val("1");
        $('#actionDocumentosActas').val("paginarDocumentos");
        $('#loader_contenido_actas').css('display', 'block');
        procesarAjaxDocumentosWeb('Actas', 600);
        return false;
    });
    
    $("#FrmDocumentosDeclaraciones").submit(function () {
        $('#tbodyDocumentosDeclaraciones').empty();
        $('#numberPageDocumentosDeclaraciones').val("1");
        $('#actionDocumentosDeclaraciones').val("paginarDocumentos");
        $('#loader_contenido_declaraciones').css('display', 'block');
        procesarAjaxDocumentosWeb('Declaraciones', 1200);
        return false;
    });

    $("#FrmDocumentosInformes").submit(function () {
        $('#tbodyDocumentosInformes').empty();
        $('#numberPageDocumentosInformes').val("1");
        $('#actionDocumentosInformes').val("paginarDocumentos");
        $('#loader_contenido_informes').css('display', 'block');
        procesarAjaxDocumentosWeb('Informes', 1300);
        return false;
    });
    

    var parameters;
    $('.view-reporte').each(function () {
        $(this).click(function () {
            if ($('#' + $('#nombreComboAnio').val()).val() !== "-1" && $('#tido_id').val() !== "11") {
                parameters = "report=reporte_documentos_normativos_gestion";
                parameters += "&format=" + $(this).attr('format');
                parameters += "&anho=" + $('#comboAnioDocumento').val();
                parameters += "&cate_id=" + $('#cate_id').val();
                parameters += "&tido_id=" + $('#tido_id').val();
                openReport(parameters);
            } else {
                if ($('#tido_id').val() === "12" || $('#tido_id').val() === "11") {
                    parameters = "report=reporte_documentos_normativos_gestion";
                    parameters += "&format=" + $(this).attr('format');
                    parameters += "&anho=";
                    parameters += "&cate_id=" + $('#cate_id').val();
                    parameters += "&tido_id=" + $('#tido_id').val();
                    openReport(parameters);
                } else {
                    viewAlertWeb('warning', 'Por favor seleccione un Año');
                }
            }

        });
    });

    $('.item-documento').each(function (index, value) {
        $(this).click(function () {
            $('#nombreComboAnio').val($(this).attr("combo_anio"));
            $('#cate_id').val($(this).attr("cate_id"));
            $('#tido_id').val($(this).attr("tido_id"));
            $("#" + $(this).attr("formulario")).submit();
        });
    });

    $('#cate_id').on('change', function () {
        $('#tido_id').val($("#cate_id option:selected").attr('tido_id'));
    });

    toLoadAnios();

    addEventoCombosPaginar();

});

function procesarAjaxDocumentosWeb(nombre_complemento, cate_id) {
    var datosSerializadosCompletos = $('#FrmDocumentos' + nombre_complemento).serialize();
    datosSerializadosCompletos += "&cate_id=" + cate_id;
    datosSerializadosCompletos += "&tido_id=";
    //datosSerializadosCompletos += "&txtComplemento=" + nombre_complemento;
    $.ajax({
        url: getContext() + '/documentos/operacionesweb',
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        success: function (jsonResponse) {
            $('#loader_contenido_' + nombre_complemento.toLowerCase()).css('display', 'none');
            listarDocumentos(jsonResponse.BEAN_PAGINATION, nombre_complemento, cate_id);
        },
        error: function () {
            /*MOSTRAMOS MENSAJE ERROR SERVIDOR*/
            $('#loader_contenido_ ' + nombre_complemento.toLowerCase()).css('display', 'none');
            //viewAlertWeb('error', 'Error interno en el servidor!');
        }
    });
    return false;
}

function listarDocumentos(BEAN_PAGINATION, nombre_complemento, cate_id) {
    /*PAGINATION*/
    var $pagination = $('#paginationDocumentos' + nombre_complemento);
    $('#tbodyDocumentos' + nombre_complemento).empty();
    if (BEAN_PAGINATION.COUNT_FILTER > 0) {
        var fila;
        var cadenaFecha;
        var color_fila;
        var fecha;
        var a;
        $.each(BEAN_PAGINATION.LIST, function (index, value) {
            if (value.docu_resumen.toLowerCase() !== "encargo interno.") {
                color_fila = "";
                a = "<a href='http://lib.peam.gob.pe:8081/ArcDig/OriArc.pdf?id=" + value.docu_id + "' target='_blank' class='pdf-documento-web' title='Ver PDF'><i class='fa fa-file-pdf-o'></i></a>";
            } else {
                color_fila = "bg-danger";
                a = "<a class='pdf-documento-web' title='PDF Restringido'><i class='fa fa-lock'></i></a>";
            }
            cadenaFecha = value.docu_fecha_docx.split('/');
            if (cadenaFecha.length === 3) {
                fecha = value.docu_fecha_docx;
            } else {
                fecha = "";
            }
            fila = "<tr class='" + color_fila + "' ";
            /*
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
             */
            fila += ">";
            if (nombre_complemento === '_DG' || nombre_complemento === '_ND') {
            } else {
                if (cate_id.toString() !== "1200") {
                    fila += "<td class='text-center align-middle'>" + fecha + "</td>";
                }                
            }
            fila += "<td class='align-middle'>" + value.docu_titulo + "</td>";
            fila += "<td class='align-middle'>" + value.docu_resumen + "</td>";
            if (cate_id.toString() === "1200") {
                /*GET VALUES OF METADATA*/
            var xml = value.docu_metadata;

            var xmlDoc = $.parseXML(xml);

            var $xml = $(xmlDoc);

            var $docu_metadata = $xml.find("docu_metadata");

            $docu_metadata.each(function (index, value) {
                if (index > 0) {
                    fila += "<td class='align-middle'>" + $(this).find('meta_descripcion').text() + "</td>";
                }
            });
                
                
                    //fila += "<td class='text-center align-middle'>" + arreglartexto(value.docu_metadata,0,(value.docu_titulo).toString()) + "</td>";
                    //fila += "<td class='text-center align-middle'>" + arreglartexto(value.docu_metadata,1,(value.docu_titulo).toString()) + "</td>";
                }
            fila += "<td class='text-center align-middle'>" + a + "</td>";
            fila += "</tr>";
            $('#tbodyDocumentos' + nombre_complemento).append(fila);
        });
        var defaultOptions = getDefaultOptionsPagination();
        var totalPages = getTotalPages(BEAN_PAGINATION.COUNT_FILTER, parseInt($('#sizePageDocumentos' + nombre_complemento).val()));
        var options =
                {
                    startPage: parseInt($('#numberPageDocumentos' + nombre_complemento).val()),
                    totalPages: totalPages,
                    visiblePages: 5,
                    initiateStartPageClick: false,
                    first: "<i class='fa fa-angle-double-left' aria-hidden='true'></i>",
                    prev: "<i class='fa fa-angle-left' aria-hidden='true'></i>",
                    next: "<i class='fa fa-angle-right' aria-hidden='true'></i>",
                    last: "<i class='fa fa-angle-double-right' aria-hidden='true'></i>",
                    onPageClick: function (evt, page) {
                        //$('#actionDocumentos' + nombre_complemento).val('paginarDocumentos');
                        $('#numberPageDocumentos' + nombre_complemento).val(page);
                        $('#loader_contenido_' + nombre_complemento.toLowerCase()).css('display', 'block');
                        procesarAjaxDocumentosWeb(nombre_complemento, cate_id);
                    }
                };
        $pagination.twbsPagination('destroy');
        $pagination.twbsPagination($.extend({}, defaultOptions, options));
        $('#txtTituloDocumento' + nombre_complemento).focus();
    } else {
        $pagination.twbsPagination('destroy');
        viewAlertWeb('warning', 'No se enconntraron resultados');
    }
}

function arreglartexto(valor, tipo, dni){
    var primeracadena = valor.replace("\u003cmetadata\u003e\u003cdocu_metadata\u003e\u003cmeta_id\u003e1\u003c/meta_id\u003e\u003cmeta_nombre\u003eDNI\u003c/meta_nombre\u003e\u003cmeta_descripcion\u003e46009383\u003c/meta_descripcion\u003e\u003c/docu_metadata\u003e\u003cdocu_metadata\u003e\u003cmeta_id\u003e4\u003c/meta_id\u003e\u003cmeta_nombre\u003eCARGO\u003c/meta_nombre\u003e\u003cmeta_descripcion\u003e","");
    var segundacadena= primeracadena.replace("\u003c/meta_descripcion\u003e\u003c/docu_metadata\u003e\u003cdocu_metadata\u003e\u003cmeta_id\u003e5\u003c/meta_id\u003e\u003cmeta_nombre\u003ePRESENTACIÓN\u003c/meta_nombre\u003e\u003cmeta_descripcion\u003e","||");
    var terceracadena = segundacadena.replace("\u003c/meta_descripcion\u003e\u003c/docu_metadata\u003e\u003c/metadata\u003e","");
    var cadenafinal = terceracadena.split("||");
    
    if(tipo===0){
        
       var cuartacadena = cadenafinal[tipo].replace("CARGO","");
       var final = cuartacadena.replace("DNI","");
       var final2 = final.replace(dni,"");
       var final3 = final2.replace("1","");
       var final4 = final3.replace("4","");
       return final4;
       
    }else{
       return cadenafinal[tipo];
    }
}

function toLoadAnios() {
    $('.item-documentos').each(function (index, value) {
        $(this).click(function () {
            let complemento = $(this).attr("complemento");
            var datosSerializadosCompletos = "action=listarAnhos";
            datosSerializadosCompletos += "&cate_id=" + $(this).attr("cate_id");
            datosSerializadosCompletos += "&complemento=" + complemento;
            datosSerializadosCompletos += "&tido_id=";
            addCombosAnios(datosSerializadosCompletos, complemento, $(this).attr("cate_id"));
        });
    });
}


function addCombosAnios(datosSerializadosCompletos, complemento, cate_id) {
    $('#comboAnioDocumento' + complemento).empty();
    $.ajax({
        url: getContext() + '/documentos/operacionesweb?' + datosSerializadosCompletos,
        type: 'POST',
        data: "",
        dataType: 'json',
        success: function (jsonResponse) {
            $(jsonResponse.BEAN_PAGINATION.LIST).each(function (index, value) {
                $('#comboAnioDocumento' + complemento).append(`<option value="${value.docu_metadata}">${value.docu_metadata}</option>`);
            });
            //CARGAMOS LOS DOCUMENTOS
            $('#loader_contenido').css('display', 'block');
            procesarAjaxDocumentosWeb(complemento, cate_id);
        },
        error: function () {
            /*MOSTRAMOS MENSAJE ERROR SERVIDOR*/
        }
    });
}