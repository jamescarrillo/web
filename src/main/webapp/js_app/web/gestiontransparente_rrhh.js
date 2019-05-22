$(document).ready(function () {



    $("#FrmPersonal").submit(function () {
        $("#nameFormPersonal").val("FrmPersonal");
        $("#numberPagePersonal").val(1);
        $('#actionPersonal').val("paginarPersonal");
        $('#loader_contenido_personal').css("display", "block");
        procesarAjaxPersonalWeb('');
        return false;
    });

    $("#FrmPersonal_CLS").submit(function () {
        $("#nameFormPersonal_CLS").val("FrmPersonal_CLS");
        $("#numberPagePersonal_CLS").val(1);
        $('#actionPersonal_CLS').val("paginarPersonal");
        $('#loader_contenido_personal_CLS').css("display", "block");
        procesarAjaxPersonalWeb('_CLS');
        return false;
    });

    $("#FrmPersonal_CAS").submit(function () {
        $("#nameFormPersonal_CAS").val("FrmPersonal_CAS");
        $("#numberPagePersonal_CAS").val(1);
        $('#actionPersonal_CAS').val("paginarPersonal");
        $('#loader_contenido_personal_CAS').css("display", "block");
        procesarAjaxPersonalWeb('_CAS');
        return false;
    });

    $("#FrmPersonalCategoria").submit(function () {
        $("#nameFormPersonalCategoria").val("FrmPersonalCategoria");
        $("#numberPagePersonalCategoria").val(1);
        $('#actionPersonalCategoria').val("paginarPersonalCategoria");
        $('#loader_contenido_personal_categoria').css("display", "block");
        procesarAjaxPersonalCategoriaWeb();
        return false;
    });

    var parameters;
    $('.view-reporte-personal-categoria').each(function () {
        $(this).click(function () {
            if ($('#comboAnioPersonalCategoria').val() !== "-1") {
                if ($('#comboTrimestrePersonalCategoria').val() !== "-1") {
                    parameters = "report=reporte_personal_categorias";
                    parameters += "&format=" + $(this).attr('format');
                    parameters += "&anho=" + $('#comboAnioPersonalCategoria').val();
                    parameters += "&trimestre=" + $('#comboTrimestrePersonalCategoria').val();
                    openReport(parameters);
                } else {
                    viewAlertWeb('warning', 'Por favor seleccione un Trimestre');
                }
            } else {
                viewAlertWeb('warning', 'Por favor seleccione un Año');
            }
        });
    });

    $('.view-reporte-personal').each(function () {
        $(this).click(function () {
            var complemento;
            switch ($('#cboTipoPersonal').val()) {
                case "1":
                    complemento = "";
                    break;
                case "2":
                    complemento = "_CLS";
                    break;
                default :
                    complemento = "_CAS";
                    break;
            }
            if ($('#comboAnioPersonal' + complemento).val() !== "-1") {
                parameters = "report=reporte_personal";
                parameters += "&format=" + $(this).attr('format');
                parameters += "&anho=" + $('#comboAnioPersonal' + complemento).val();
                parameters += "&tipo=" + $('#cboTipoPersonal').val();
                openReport(parameters);
            } else {
                if (complemento.toLowerCase() === "_cas") {
                    parameters = "report=reporte_personal";
                    parameters += "&format=" + $(this).attr('format');
                    parameters += "&anho=-1";
                    parameters += "&tipo=" + $('#cboTipoPersonal').val();
                    openReport(parameters);
                } else {
                    viewAlertWeb('warning', 'Por favor seleccione un Año');
                }
            }
        });
    });

    $('.item-personal-remuneracines').each(function (index, value) {
        $(this).click(function () {
            ejecucion($(this).attr("complemento"));
        });
    });

    addEventoCombosPaginar();

});

function ejecucion(comp) {
    var tipo;
    if (comp.substring(0, 4) === "rrhh") {
        procesarAjaxAnhosRemuneracion(comp);
    } else {
        switch (comp) {
            case "" :
                tipo = 1;
                break;
            case "_CLS":
                tipo = 2;
                break;
            case "_CAS" :
                tipo = 3;
                break;
        }
        procesarAjaxAnhos(tipo, comp);
    }
}

function processAjaxDataRRHH(tipo) {
    var datosSerializadosCompletos = $('#' + $('#nameFormPersonalCategoria').val()).serialize();
    //datosSerializadosCompletos += "&" + $('#' + $('#nameFormPersonalCategoria').val()).serialize();
    //datosSerializadosCompletos = datosSerializadosCompletos.replace("&action=paginarPersonal", "");
    datosSerializadosCompletos = datosSerializadosCompletos.replace("&action=paginarPersonalCategoria", "");
    datosSerializadosCompletos += "&action=getDataRRHH";
    $.ajax({
        url: getContext() + '/gestiontransparente/recursos-humanos',
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        success: function (jsonResponse) {
            console.log(jsonResponse);
            //listarPersonalWeb(jsonResponse.DATA_PERSONAL);
            if (tipo === "rrhh3") {
                listarPersonalCategoriaWeb(jsonResponse.DATA_PERSONAL_PORCATEGORIAS);
            } else {
                if (tipo === "rrhh1") {
                    addFuncionarios(jsonResponse.DATA_FUNCIONARIOS);
                } else {
                    addDirectivos(jsonResponse.DATA_DIRECTIVOS);
                }
            }
        },
        error: function () {
            console.log('Error interno al trear datos de rrhh!');
        }
    });
    return false;
}

function addFuncionarios(DATA) {
    $('#containerFuncionarios').empty();
    var lista_cards = [];
    var card;
    $(DATA.LIST).each(function (index, value) {
        card = "<div class='col-lg-3 col-lg-offset-0 col-md-4 col-md-offset-0 col-sm-6 col-sm-offset-0 col-xs-10 col-xs-offset-1 mt-15'>";

        card += "<div class='team-wrapper text-center'>";

        card += "<div class='team-img'>";
        card += "<img style='height: 250px' src='/web/peam_resources_app/conf_app/DirectivoFuncionario/img/" + value.foto + "' class='img-responsive' alt='Imagen'>";

        card += "<div class='team-title' style='padding-top: 10px;padding-left: 10px; padding-right: 10px'>";
        card += "<h3 class='text-peam-negrita'><a style='text-transform: none'>" + value.nombres_apellidos + "</a></h3>";
        card += "<span class='mb-10'>" + value.cargo + "</span>";
        card += "<div class='row'>";
        card += "<div class='col-xs-12'><h5 class='text-peam' style='margin-bottom: 5px'>Régimel Laboral:</h5></div><div class='col-xs-12'><h5 style='margin-bottom: 5px'>" + value.regimen_laboral + "</h5></div>";
        card += "<div class='col-xs-12'><h5 class='text-peam' style='margin-bottom: 5px'>Designado Por:</h5></div><div class='col-xs-12'><h5 style='margin-bottom: 5px'>" + value.resolucion + "</h5></div>";
        card += "<div class='col-xs-12'><h5 class='text-peam' style='margin-bottom: 5px'>Fecha Designación:</h5></div><div class='col-xs-12'><h5 style='margin-bottom: 5px'>" + value.fecha_designacion + "</h5></div>";
        //CIERRE row
        card += "</div>";
        card += "<h5 class='text-peam'><i class='fa fa-phone'></i> " + value.telefono + "</h5>";
        card += "<h5 class='mb-20 text-peam-verde-index'><i class='fa fa-envelope-o'></i> <a href='mailto:" + value.e_mail + "'>" + value.e_mail + "</a></h5>";

        card += "<h5 class='mb-20 text-peam-verde-index'><a target='_blank' href='/web/downloadfile?type_file=downloadCV&full_file=n&file=" + value.hoja_vida + "'>Curriculum Vitae</a></h5>";
        //CIERRE team-titless='fa fa-download' aria-hidden='true'></i> Ver CV</a>"
        card += "</div>";
        //CIERRE team-img
        card += "</div>";
        //CIERRE DE team-wrapper 
        card += "</div>";
        //CIERRE DEL LA COLUMNA
        card += "</div>";
        if (value.cargo.toLowerCase() === "gerente general") {
            $('#containerFuncionarios').append(card);
        } else {
            lista_cards.push(card);
        }
    });

    for (var i = 0; i < lista_cards.length; i++) {
        $('#containerFuncionarios').append(lista_cards[i]);
    }
}

function addDirectivos(DATA) {
    var card;
    var lista_cards = [];
    $('#containerDirectivos').empty();
    $(DATA.LIST).each(function (index, value) {

        //card = "<div class='col-lg-3 col-lg-offset-0 col-md-4 col-md-offset-0 col-sm-6 col-sm-offset-0 col-xs-10 col-xs-offset-1 mt-15'>";
        card = "<div class='col-lg-3 col-lg-offset-0 col-md-4 col-md-offset-0 col-sm-6 col-sm-offset-0 col-xs-10 col-xs-offset-1 mt-15'>";

        card += "<div class='team-wrapper text-center' style='height: 620px'>";

        card += "<div class='team-img'>";
        card += "<img style='height: 250px' src='/web/peam_resources_app/conf_app/DirectivoFuncionario/img/" + value.foto + "' class='img-responsive' alt='Imagen'>";

        card += "<div class='team-title' style='padding-top: 10px;padding-left: 10px; padding-right: 10px'>";
        card += "<h3 class='text-peam-negrita'><a style='text-transform: none'>" + value.nombres_apellidos + "</a></h3>";
        card += "<span class='mb-10'>" + value.cargo + "</span>";
        card += "<div class='row'>";
        card += "<div class='col-xs-12'><h5 class='text-peam' style='margin-bottom: 5px'>Régimel Laboral:</h5></div><div class='col-xs-12'><h5 style='margin-bottom: 5px'>" + value.regimen_laboral + "</h5></div>";
        card += "<div class='col-xs-12'><h5 class='text-peam' style='margin-bottom: 5px'>Designado Por:</h5></div><div class='col-xs-12'><h5 style='margin-bottom: 5px'>" + value.resolucion + "</h5></div>";
        card += "<div class='col-xs-12'><h5 class='text-peam' style='margin-bottom: 5px'>Fecha Designación:</h5></div><div class='col-xs-12'><h5 style='margin-bottom: 5px'>" + value.fecha_designacion + "</h5></div>";
        //CIERRE row
        card += "</div>";
        card += "<h5 class='text-peam'><i class='fa fa-phone'></i> " + value.telefono + "</h5>";
        card += "<h5 class='mb-20 text-peam-verde-index'><i class='fa fa-envelope-o'></i> <a href='mailto:" + value.e_mail + "'>" + value.e_mail + "</a></h5>";
        card += "<h5 class='mb-20 text-peam-verde-index'><a target='_blank' href='/web/downloadfile?type_file=downloadCV&full_file=n&file=" + value.hoja_vida + "'>Curriculum Vitae</a></h5>";
        //CIERRE team-title
        card += "</div>";
        //CIERRE team-img
        card += "</div>";
        //CIERRE DE team-wrapper 
        card += "</div>";
        //CIERRE DEL LA COLUMNA
        card += "</div>";
        if (value.cargo.toLowerCase() === "presidente del consejo") {
            $('#containerDirectivos').append(card);
        } else {
            lista_cards.push(card);
        }
    });

    for (var i = 0; i < lista_cards.length; i++) {
        $('#containerDirectivos').append(lista_cards[i]);
    }
}

function procesarAjaxPersonalWeb(complemento) {
    var datosSerializadosCompletos = $('#' + $('#nameFormPersonal' + complemento).val()).serialize();
    datosSerializadosCompletos += "&cboTipoPersonal=" + $('#cboTipoPersonal').val();
    datosSerializadosCompletos += "&complemento=" + complemento;
    console.log(datosSerializadosCompletos);
    $.ajax({
        url: getContext() + '/gestiontransparente/recursos-humanos',
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        success: function (jsonResponse) {
            $('#loader_contenido_personal' + complemento).css('display', 'none');
            listarPersonalWeb(jsonResponse.BEAN_PAGINATION, complemento);
        },
        error: function () {
            $('#loader_contenido_personal' + complemento).css('display', 'none');
            console.log('Error interno en el servidor!');
        }
    });
    return false;
}

function procesarAjaxAnhos(tipo, complemento) {
    var datosSerializadosCompletos = "action=listarAnhos";
    datosSerializadosCompletos += "&tipo=" + tipo;
    datosSerializadosCompletos += "&complemento=" + complemento;
    $.ajax({
        url: getContext() + '/gestiontransparente/recursos-humanos',
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        success: function (jsonResponse) {
            listarAnhos(jsonResponse.BEAN_PAGINATION, tipo, complemento);
        },
        error: function () {
            console.log('Error interno en el servidor!');
        }
    });

//    }
    return false;
}

function procesarMes(complemento, tipo) {
    var datosSerializadosCompletos = "action=listarAnhosMes";
    datosSerializadosCompletos += "&anho=" + $('#comboAnioPersonal' + complemento).val();
    datosSerializadosCompletos += "&complemento=" + complemento;
    datosSerializadosCompletos += "&tipo=" + tipo;


    $.ajax({
        url: getContext() + '/gestiontransparente/recursos-humanos',
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        success: function (jsonResponse) {
            listarMes(jsonResponse.BEAN_PAGINATION, complemento);
        },
        error: function () {
            console.log('Error interno en el servidor!');
        }
    });

//    }
    return false;
}

function procesarAjaxAnhosRemuneracion(comp) {
    var datosSerializadosCompletos = "action=listarAnhosRemuneracion";
    $.ajax({
        url: getContext() + '/gestiontransparente/recursos-humanos',
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        success: function (jsonResponse) {
            listarAnhosRemuneracion(jsonResponse.BEAN_PAGINATION, comp);
        },
        error: function () {
            console.log('Error interno en el servidor!');
        }
    });

//    }
    return false;
}

function listarAnhos(BEAN_PAGINATION, tipo, complemento) {
    $('#comboAnioPersonal' + complemento).empty();
    if (BEAN_PAGINATION.COUNT_FILTER > 0) {
        var option;
        $.each(BEAN_PAGINATION.LIST, function (index, value) {
            option = "<option value='" + value.anho + "'>" + value.anho + "</option>";
            $('#comboAnioPersonal' + complemento).append(option);
        });
        //cargarTrimestreComboActuales($('#comboAnioPersonal' + complemento).val(), $('#comboTrimestrePersonal' + complemento));
        $('#cboTipoPersonal').val(tipo);

//        if (complemento==="") {
        procesarMes(complemento, tipo);
//        }else{
//           $('#FrmPersonal' + complemento).submit(); 
//        }


    } else {
        console.log("vacio");
    }
}

function listarMes(BEAN_PAGINATION, complemeto) {
    $('#comboTrimestrePersonal' + complemeto).empty();
    if (BEAN_PAGINATION.COUNT_FILTER > 0) {
        var option;
        if (complemeto === "") {
            $.each(BEAN_PAGINATION.LIST, function (index, value) {
                option = "<option value='" + value.fecha_ingreso + "'>" + traerNombreMes(value.fecha_ingreso) + "</option>";
                $('#comboTrimestrePersonal' + complemeto).append(option);
            });
        } else {
            cargarTrimestreComboActuales($('#comboAnioPersonal' + complemeto).val(), $('#comboTrimestrePersonal' + complemeto));
        }
        $('#FrmPersonal' + complemeto).submit();
    } else {
        console.log("vacio");
    }
}

function traerNombreMes(orden) {
    var mes;
    switch (orden) {
        case "1":
            mes = "Enero";
            break;
        case "2":
            mes = "Febrero";
            break;
        case "3":
            mes = "Marzo";
            break;
        case "4":
            mes = "Abril";
            break;
        case "5":
            mes = "Mayo";
            break;
        case "6":
            mes = "Junio";
            break;
        case "7":
            mes = "Julio";
            break;
        case "8":
            mes = "Agosto";
            break;
        case "9":
            mes = "Setiembre";
            break;
        case "10":
            mes = "Octubre";
            break;
        case "11":
            mes = "Noviembre";
            break;
        case "12":
            mes = "Diciembre";
            break;
    }
    return mes;
}

function listarAnhosRemuneracion(BEAN_PAGINATION, comp) {
    $('#comboAnioPersonalCategoria').empty();
    if (BEAN_PAGINATION.COUNT_FILTER > 0) {
        var option;
        $.each(BEAN_PAGINATION.LIST, function (index, value) {
            option = "<option value='" + value.anho + "'>" + value.anho + "</option>";
            $('#comboAnioPersonalCategoria').append(option);
        });
        //cargarTrimestreComboActuales($('#comboAnioPersonalCategoria').val(), $('#comboTrimestrePersonalCategoria'));
        processAjaxDataRRHH(comp);
    } else {
        console.log("vacio");
    }
}

function listarPersonalWeb(BEAN_PAGINATION, complemento) {
    /*PAGINATION*/
    var $pagination = $('#paginationPersonal' + complemento);
    $('#tbodyPersonal' + complemento).empty();
    if (BEAN_PAGINATION.COUNT_FILTER > 0) {
        var fila;
        var dni;
        var cargo;
        var pension;
        var fecha_ingreso;
        var oficina_area;
        var ocultar;
        var inverso;
        var nuevo;
        $.each(BEAN_PAGINATION.LIST, function (index, value) {
            fila = "<tr>";
            if (value.numero_dni !== undefined) {
                dni = value.numero_dni;
            } else {
                dni = "";
            }
            if (value.cargo !== undefined) {
                cargo = value.cargo;
            } else {
                cargo = "";
            }
            if (value.pension !== undefined) {
                pension = value.pension;
            } else {
                pension = "";
            }
            if (value.fecha_ingreso !== undefined) {
                fecha_ingreso = value.fecha_ingreso;
            } else {
                fecha_ingreso = "";
            }
            if (value.oficina_area !== undefined) {
                oficina_area = value.oficina_area;
            } else {
                oficina_area = "";
            }
            switch (complemento) {
                case "" :
                    ocultar = "ocultar";
                    inverso = "";
                    nuevo="";
                    break;
                case "_CLS":
                    ocultar = "ocultar";
                    inverso = "";
                    nuevo="ocultar";
                    break;
                case "_CAS" :
                    ocultar = "ocultar";
                    inverso = "";
                    nuevo="ocultar";
                    break;
            }

            fila += "<td class='text-medium-table text-middle '>" + value.apellidos_nombres + "</td>";
            fila += "<td class='text-medium-table text-middle " + inverso + nuevo + " text-center'>" + dni + "</td>";
            fila += "<td class='text-medium-table text-middle " + inverso + nuevo +"'>" + fecha_ingreso + "</td>";
            fila += "<td class='text-medium-table text-middle '>" + oficina_area + "</td>";
            fila += "<td class='text-medium-table text-middle " + inverso + nuevo+ "'>" + cargo + "</td>";
            fila += "<td class='text-medium-table text-middle " + ocultar + " text-center'>" + pension + "</td>";
            fila += "<td class='text-medium-table text-middle text-center " + inverso + "'>" + value.codigo_civil + "</td>";
            fila += "<td class='text-medium-table text-middle text-center'>" + value.remuneracion_mensual.toFixed(2) + "</td>";
            fila += "<td class='text-medium-table text-middle " + ocultar + " text-center'>" + value.bonificacion_quinq.toFixed(2) + "</td>";
            fila += "<td class='text-medium-table text-middle " + ocultar + " text-center'>" + value.beneficios.toFixed(2) + "</td>";
            fila += "<td class='text-medium-table text-middle " + ocultar + " text-center'>" + value.ingreso_total.toFixed(2) + "</td>";
            fila += "</tr>";
            $('#tbodyPersonal' + complemento).append(fila);
        });
        var defaultOptions = getDefaultOptionsPagination();
        var totalPages = getTotalPages(BEAN_PAGINATION.COUNT_FILTER, parseInt($('#sizePagePersonal' + complemento).val()));
        var options =
                {
                    startPage: parseInt($('#numberPagePersonal' + complemento).val()),
                    totalPages: totalPages,
                    visiblePages: 5,
                    initiateStartPageClick: false,
                    first: "<i class='fa fa-angle-double-left' aria-hidden='true'></i>",
                    prev: "<i class='fa fa-angle-left' aria-hidden='true'></i>",
                    next: "<i class='fa fa-angle-right' aria-hidden='true'></i>",
                    last: "<i class='fa fa-angle-double-right' aria-hidden='true'></i>",
                    onPageClick: function (evt, page) {
                        $('#actionPersonal' + complemento).val('paginarPersonal');
                        $('#numberPagePersonal' + complemento).val(page);
                        $('#nameFormPersonal' + complemento).val('FrmPersonal' + complemento);
                        $('#loader_contenido_personal' + complemento).css('display', 'block');
                        procesarAjaxPersonalWeb(complemento);
                    }
                };
        $pagination.twbsPagination('destroy');
        $pagination.twbsPagination($.extend({}, defaultOptions, options));
        $('#txtPersonal' + complemento).focus();
    } else {
        $pagination.twbsPagination('destroy');
        viewAlertWeb('warning', 'No se enconntraron resultados');
    }
}

function procesarAjaxPersonalCategoriaWeb() {
    var datosSerializadosCompletos = $('#' + $('#nameFormPersonalCategoria').val()).serialize();
    $.ajax({
        url: getContext() + '/gestiontransparente/recursos-humanos',
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        success: function (jsonResponse) {
            $('#loader_contenido_personal_categoria').css("display", "none");
            listarPersonalCategoriaWeb(jsonResponse.BEAN_PAGINATION);
        },
        error: function () {
            $('#loader_contenido_personal_categoria').css("display", "none");
            console.log('Error interno en el servidor!');
        }
    });
    return false;
}

function listarPersonalCategoriaWeb(BEAN_PAGINATION) {
    var $pagination = $('#paginationPersonalCategoria');
    $('#tbodyPersonalCategoria').empty();
    if (BEAN_PAGINATION.COUNT_FILTER > 0) {
        var fila;
        $.each(BEAN_PAGINATION.LIST, function (index, value) {
            fila = "<tr ";
            fila += ">";
            fila += "<td class='text-center align-middle'>" + value.codigo + "</td>";
            fila += "<td class='align-middle'>" + value.categoria + "</td>";
            fila += "<td class='text-center align-middle'>" + value.remuneracion_minima.toFixed(2) + "</td>";
            fila += "<td class='text-center align-middle'>" + value.remuneracion_maxima.toFixed(2) + "</td>";
            fila += "<td class='text-center align-middle'>" + value.numero_trabajadores + "</td>";
            fila += "</tr>";
            $('#tbodyPersonalCategoria').append(fila);
        });
        var defaultOptions = getDefaultOptionsPagination();
        var totalPages = getTotalPages(BEAN_PAGINATION.COUNT_FILTER, parseInt($('#sizePagePersonalCategoria').val()));
        var options =
                {
                    startPage: parseInt($('#numberPagePersonalCategoria').val()),
                    totalPages: totalPages,
                    visiblePages: 5,
                    initiateStartPageClick: false,
                    first: "<i class='fa fa-angle-double-left' aria-hidden='true'></i>",
                    prev: "<i class='fa fa-angle-left' aria-hidden='true'></i>",
                    next: "<i class='fa fa-angle-right' aria-hidden='true'></i>",
                    last: "<i class='fa fa-angle-double-right' aria-hidden='true'></i>",
                    onPageClick: function (evt, page) {
                        $("#nameFormPersonalCategoria").val("FrmPersonalCategoria");
                        $("#numberPagePersonalCategoria").val(page);
                        $('#actionPersonalCategoria').val("paginarPersonalCategoria");
                        $('#loader_contenido_personal_categoria').css("display", "block");
                        procesarAjaxPersonalCategoriaWeb();
                    }
                };
        $pagination.twbsPagination('destroy');
        $pagination.twbsPagination($.extend({}, defaultOptions, options));
        $('#txtCategoriaPersonalCategoria').focus();
    } else {
        $pagination.twbsPagination('destroy');
        viewAlertWeb('warning', 'No se enconntraron resultados');
    }
}
