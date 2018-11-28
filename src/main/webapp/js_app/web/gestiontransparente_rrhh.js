$(document).ready(function () {

    cargarAniosCombo($('#comboAnioPersonal'), 2007, "-1", 'Año');
    cargarAniosCombo($('#comboAnioPersonalCategoria'), 2008, "-1", 'Año');

    $("#FrmPersonal").submit(function () {
        $("#nameFormPersonal").val("FrmPersonal");
        $("#numberPagePersonal").val(1);
        $('#actionPersonal').val("paginarPersonal");
        $('#loader_contenido_personal').css("display", "block");
        procesarAjaxPersonalWeb();
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

    addEventoCombosPaginar();
    processAjaxDataRRHH();
});

function processAjaxDataRRHH() {
    var datosSerializadosCompletos = $('#' + $('#nameFormPersonal').val()).serialize();
    datosSerializadosCompletos += "&" + $('#' + $('#nameFormPersonalCategoria').val()).serialize();
    datosSerializadosCompletos = datosSerializadosCompletos.replace("&action=paginarPersonal", "");
    datosSerializadosCompletos = datosSerializadosCompletos.replace("&action=paginarPersonalCategoria", "");
    datosSerializadosCompletos += "&action=getDataRRHH";
    $.ajax({
        url: getContext() + '/gestiontransparente/recursos-humanos',
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        success: function (jsonResponse) {
            console.log(jsonResponse);
            listarPersonalWeb(jsonResponse.DATA_PERSONAL);
            listarPersonalCategoriaWeb(jsonResponse.DATA_PERSONAL_PORCATEGORIAS);
            addFuncionarios(jsonResponse.DATA_FUNCIONARIOS);
            addDirectivos(jsonResponse.DATA_DIRECTIVOS);
        },
        error: function () {
            console.log('Error interno al trear datos de rrhh!');
        }
    });
    return false;
}

function addFuncionarios(DATA) {
    var card;
    $(DATA.LIST).each(function (index, value) {
        card = "<div class='col-lg-3 col-lg-offset-0 col-md-4 col-md-offset-0 col-sm-6 col-sm-offset-0 col-xs-10 col-xs-offset-1 mt-15'>";

        card += "<div class='team-wrapper text-center'>";

        card += "<div class='team-img'>";
        card += "<a href=''><img src='/web/peam_resources_app/conf_app/DirectivoFuncionario/img/" + value.foto + "' class='img-responsive' alt='Imagen'></a>";

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
        //CIERRE team-title
        card += "</div>";
        //CIERRE team-img
        card += "</div>";
        //CIERRE DE team-wrapper 
        card += "</div>";
        //CIERRE DEL LA COLUMNA
        card += "</div>";
        $('#containerFuncionarios').append(card);
    });
}

function addDirectivos(DATA) {
    var card;
    $(DATA.LIST).each(function (index, value) {
        card = "<div class='col-lg-3 col-lg-offset-0 col-md-4 col-md-offset-0 col-sm-6 col-sm-offset-0 col-xs-10 col-xs-offset-1 mt-15'>";

        card += "<div class='team-wrapper text-center'>";

        card += "<div class='team-img'>";
        card += "<a href=''><img src='/web/peam_resources_app/conf_app/DirectivoFuncionario/img/" + value.foto + "' class='img-responsive' alt='Imagen'></a>";

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
        //CIERRE team-title
        card += "</div>";
        //CIERRE team-img
        card += "</div>";
        //CIERRE DE team-wrapper 
        card += "</div>";
        //CIERRE DEL LA COLUMNA
        card += "</div>";
        $('#containerDirectivos').append(card);
    });
}

function procesarAjaxPersonalWeb() {
    var datosSerializadosCompletos = $('#' + $('#nameFormPersonal').val()).serialize();
    $.ajax({
        url: getContext() + '/gestiontransparente/recursos-humanos',
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        success: function (jsonResponse) {
            $('#loader_contenido_personal').css('display', 'none');
            listarPersonalWeb(jsonResponse.BEAN_PAGINATION);
        },
        error: function () {
            $('#loader_contenido_personal').css('display', 'none');
            console.log('Error interno en el servidor!');
        }
    });
    return false;
}

function listarPersonalWeb(BEAN_PAGINATION) {
    /*PAGINATION*/
    var $pagination = $('#paginationPersonal');
    $('#tbodyPersonal').empty();
    if (BEAN_PAGINATION.COUNT_FILTER > 0) {
        var fila;
        var dni;
        var cargo;
        var pension;
        var fecha_ingreso;
        var oficina_area;
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
            fila += "<td class='text-medium-table text-middle text-center'>" + dni + "</td>";
            fila += "<td class='text-medium-table text-middle'>" + value.apellidos_nombres + "</td>";
            fila += "<td class='text-medium-table text-middle'>" + fecha_ingreso + "</td>";
            fila += "<td class='text-medium-table text-middle'>" + oficina_area + "</td>";
            fila += "<td class='text-medium-table text-middle'>" + cargo + "</td>";
            fila += "<td class='text-medium-table text-middle text-center'>" + pension + "</td>";
            fila += "<td class='text-medium-table text-middle text-center'>" + value.remuneracion_mensual.toFixed(2) + "</td>";
            fila += "<td class='text-medium-table text-middle text-center'>" + value.bonificacion_quinq.toFixed(2) + "</td>";
            fila += "<td class='text-medium-table text-middle text-center'>" + value.beneficios.toFixed(2) + "</td>";
            fila += "<td class='text-medium-table text-middle text-center'>" + value.ingreso_total.toFixed(2) + "</td>";
            fila += "</tr>";
            $('#tbodyPersonal').append(fila);
        });
        var defaultOptions = getDefaultOptionsPagination();
        var totalPages = getTotalPages(BEAN_PAGINATION.COUNT_FILTER, parseInt($('#sizePagePersonal').val()));
        var options =
                {
                    startPage: parseInt($('#numberPagePersonal').val()),
                    totalPages: totalPages,
                    visiblePages: 5,
                    initiateStartPageClick: false,
                    first: "<i class='fa fa-angle-double-left' aria-hidden='true'></i>",
                    prev: "<i class='fa fa-angle-left' aria-hidden='true'></i>",
                    next: "<i class='fa fa-angle-right' aria-hidden='true'></i>",
                    last: "<i class='fa fa-angle-double-right' aria-hidden='true'></i>",
                    onPageClick: function (evt, page) {
                        $('#actionPersonal').val('paginarPersonal');
                        $('#numberPagePersonal').val(page);
                        $('#nameFormPersonal').val('FrmPersonal');
                        $('#loader_contenido_personal').css('display', 'block');
                        procesarAjaxPersonalWeb();
                    }
                };
        $pagination.twbsPagination('destroy');
        $pagination.twbsPagination($.extend({}, defaultOptions, options));
        $('#txtPersonal').focus();
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
