$(document).ready(function () {

    $("#FrmDocumentos").submit(function () {
        $('#tbodyDocumentos').empty();
        $('#numberPageDocumentos').val("1");
        $('#actionDocumentos').val("paginarDocumentos");
        $('#loader_contenido').css('display', 'block');
        procesarAjaxDocumentosWeb('', "< 100", "10");
        return false;
    });

    $("#FrmDocumentos_AS").submit(function () {
        $('#tbodyDocumentos_AS').empty();
        $('#numberPageDocumentos_AS').val("1");
        $('#actionDocumentos_AS').val("paginarDocumentos");
        $('#loader_contenido_AS').css('display', 'block');
        procesarAjaxDocumentosWeb('_AS', '2800', '');
        return false;
    });

    $("#FrmDocumentos_DG").submit(function () {
        $('#tbodyDocumentos_DG').empty();
        $('#numberPageDocumentos_DG').val("1");
        $('#actionDocumentos_DG').val("paginarDocumentos");
        $('#loader_contenido_DG').css('display', 'block');
        procesarAjaxDocumentosWeb('_DG', $('#cboCategoria_Doc').val(), '10');
        return false;
    });

    $("#FrmDocumentos_ND").submit(function () {
        $('#tbodyDocumentos_ND').empty();
        $('#numberPageDocumentos_ND').val("1");
        $('#actionDocumentos_ND').val("paginarDocumentos");
        $('#loader_contenido_ND').css('display', 'block');
        procesarAjaxDocumentosWeb('_ND', '< 100', '12');
        return false;
    });

    $("#FrmDocumentos_ID").submit(function () {
        $('#tbodyDocumentos_ID').empty();
        $('#numberPageDocumentos_ID').val("1");
        $('#actionDocumentos_ID').val("paginarDocumentos");
        $('#loader_contenido_ID').css('display', 'block');
        procesarAjaxDocumentosWeb('_ID', '900', '');
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

    addComboCategoriaDoc();
    addEventoCombosPaginar();

    toLoadAnios();

    $('#item-documento-inicial ').trigger("click");

});

function procesarAjaxDocumentosWeb(nombre_complemento, cate_id, tido_id) {
    var datosSerializadosCompletos = $('#FrmDocumentos' + nombre_complemento).serialize();
    datosSerializadosCompletos += "&cate_id=" + cate_id;
    datosSerializadosCompletos += "&tido_id=" + tido_id;
    datosSerializadosCompletos += "&txtComplemento=" + nombre_complemento;
    $.ajax({
        url: getContext() + '/documentos/operacionesweb',
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        success: function (jsonResponse) {
            $('#loader_contenido' + nombre_complemento).css('display', 'none');
            listarDocumentos(jsonResponse.BEAN_PAGINATION, nombre_complemento, cate_id, tido_id);
        },
        error: function () {
            /*MOSTRAMOS MENSAJE ERROR SERVIDOR*/
            $('#loader_contenido' + nombre_complemento).css('display', 'none');
            //viewAlertWeb('error', 'Error interno en el servidor!');
        }
    });
    return false;
}

function listarDocumentos(BEAN_PAGINATION, nombre_complemento, cate_id, tido_id) {
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
                fila += "<td class='text-center align-middle'>" + fecha + "</td>";
            }
            fila += "<td class='align-middle'>" + value.docu_titulo + "</td>";
            fila += "<td class='align-middle'>" + value.docu_resumen + "</td>";
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
                        $('#actionDocumentos' + nombre_complemento).val('paginarDocumentos');
                        $('#numberPageDocumentos' + nombre_complemento).val(page);
                        $('#loader_contenido' + nombre_complemento).css('display', 'block');
                        procesarAjaxDocumentosWeb(nombre_complemento, cate_id, tido_id);
                    }
                };
        $pagination.twbsPagination('destroy');
        $pagination.twbsPagination($.extend({}, defaultOptions, options));
        $('#txtTituloDocumento' + nombre_complemento).focus();
    } else {
        $pagination.twbsPagination('destroy');
        viewAlertWeb('warning', 'No se encontraron resultados');
    }
}


function addComboCategoriaDoc() {
    $('#cboCategoria_Doc').on('change', function () {
        $('#item-documento-gestion').attr("cate_id", this.value);
    });
    $.ajax({
        url: getContext() + '/documentos/operacionesweb?action=getCategoriasDoc',
        type: 'POST',
        data: "",
        dataType: 'json',
        success: function (jsonResponse) {
            $('#cboCategoria_Doc').append(`<option value="-1">TODOS</option>`);
            $(jsonResponse.DATA_CATEGORIAS).each(function (index, value) {
                $('#cboCategoria_Doc').append(`<option value="${value.id_cate}">${value.nombre}</option>`);
            });
        },
        error: function () {
            /*MOSTRAMOS MENSAJE ERROR SERVIDOR*/
        }
    });
}

function toLoadAnios() {
    $('.item-documento').each(function (index, value) {
        $(this).click(function () {
            let complemento = $(this).attr("complemento");
            var datosSerializadosCompletos = "action=listarAnhos";
            datosSerializadosCompletos += "&cate_id=" + $(this).attr("cate_id");
            datosSerializadosCompletos += "&complemento=" + complemento;
            datosSerializadosCompletos += "&tido_id=" + $(this).attr("tido_id");
            if ($(this).attr("complemento").toLowerCase() == "_dg") {
                $('#loader_contenido').css('display', 'block');
                procesarAjaxDocumentosWeb('_DG', $('#cboCategoria_Doc').val(), '10');
            } else if ($(this).attr("complemento").toLowerCase() == "_nd") {
                $('#loader_contenido').css('display', 'block');
                procesarAjaxDocumentosWeb('_ND', '< 100', '12');
            } else {
                addCombosAnios(datosSerializadosCompletos, complemento, $(this).attr("cate_id"), $(this).attr("tido_id"));
            }
            
        });
    });
}

function addCombosAnios(datosSerializadosCompletos, complemento, cate_id, tido_id) {
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
            procesarAjaxDocumentosWeb(complemento, cate_id, tido_id);
        },
        error: function () {
            /*MOSTRAMOS MENSAJE ERROR SERVIDOR*/
        }
    });
}