$(document).ready(function () {
    $("#FrmBusquedaPage").submit(function () {
        if ($('#txtBusquedaPage').val() !== "") {
            $('#actionBusquedaPage').val("buscarPage");
            //$('#loader_contenido_busqueda').css('display', 'block');
            procesarAjaxBusquedaWeb();
        } else {
            viewAlertWeb('warning', 'Por favor ingrese texto');
        }
        return false;
    });

    $('#btnCerrarModalBusqueda').click(function () {
        $('#ventanaModalBusqueda').css('display', 'none');
        $('#txtBusquedaPage').focus();
    });

    $('.search-close').click(function () {
        $('#txtBusquedaPage').val("");
    });
});

function procesarAjaxBusquedaWeb() {
    var datosSerializadosCompletos = $('#FrmBusquedaPage').serialize();
    $.ajax({
        url: getContext() + '/index',
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        success: function (jsonResponse) {
            $('#loader_contenido_busqueda').css('display', 'none');
            //console.log(jsonResponse);
            $('#containerBusqueda').empty();
            var div;
            $(jsonResponse.DATA_BUSQUEDA).each(function (index, value) {
                div = "<div class='col-xs-12'>";
                div += "<a href='" + value.r + "'><h3 style='background-color: #00793D; color: #ffffff;cursor: pointer; padding: 10px; text-decoration: underline'>" + value.t + "</h3></a>";
                div += "<p>" + removeTagHTML(value.d) + " . . . ";
                div += "<a href='" + value.r + "'>Leer más</a></p>";
                div += "</div>";
                $('#containerBusqueda').append(div);
            });
            $('#ventanaModalBusqueda').css('display', "block");
        },
        error: function () {
            $('#loader_contenido_busqueda').css('display', 'none');
        }
    });
    return false;
}


$(window).resize(function () {
    //aqui el codigo que se ejecutara cuando se redimencione la ventana
    //var alto = $(window).height();
    var ancho = $(window).width();
    if (ancho <= 400) {
        $('.img-responsive-peam').css('height', '270');
    } else if (ancho <= 500) {
        $('.img-responsive-peam').css('height', '300');
    } else {
        $('.img-responsive-peam').css('height', '340');
    }

//    if (ancho <= 400) {
//        $('.img-responsive-peam').css('height', '280');
//        $('#idColumnaCarrusel').css('height', '285');
//    } else if (ancho <= 500) {
//        $('.img-responsive-peam').css('height', '300');
//        $('#idColumnaCarrusel').css('height', '305');
//    } else if (ancho <= 630) {
//        $('.img-responsive-peam').css('height', '345');
//        $('#idColumnaCarrusel').css('height', '350');
//    } else if (ancho <= 680) {
//        $('.img-responsive-peam').css('height', '380');
//        $('#idColumnaCarrusel').css('height', '385');
//    } else if (ancho <= 900) {
//        $('.img-responsive-peam').css('height', '420');
//        $('#idColumnaCarrusel').css('height', '425');
//    } else if (ancho <= 1000) {
//        $('.img-responsive-peam').css('height', '430');
//        $('#idColumnaCarrusel').css('height', '435');
//    } else if (ancho > 1000 && ancho < 1200) {
//        $('.img-responsive-peam').css('height', '495');
//        $('#idColumnaCarrusel').css('height', '500');
//    } else {
//        $('.img-responsive-peam').css('height', '475');
//        //$('#idColumnaCarrusel').css('height', '500');
//    }

    if (ancho <= 770) {
        $('#row_logos_lg').css('display', 'none');
        $('#row_logos_md').css('display', 'none');
        $('#row_logos_sm').css('display', 'none');
        $('#row_logos_xs').css('display', 'block');
    } else if (ancho <= 1000) {
        $('#row_logos_lg').css('display', 'none');
        $('#row_logos_md').css('display', 'none');
        $('#row_logos_sm').css('display', 'block');
        $('#row_logos_xs').css('display', 'none');
    } else if (ancho > 1000 && ancho < 1200) {
        $('#row_logos_lg').css('display', 'none');
        $('#row_logos_md').css('display', 'block');
        $('#row_logos_sm').css('display', 'none');
        $('#row_logos_xs').css('display', 'none');
    } else {
        $('#row_logos_lg').css('display', 'block');
        $('#row_logos_md').css('display', 'none');
        $('#row_logos_sm').css('display', 'none');
        $('#row_logos_xs').css('display', 'none');
    }

    if (ancho < 750) {
        $('#logoIndexPrincipal').css('margin-top', '5px');
        $('#materialize-menu').css('height', '52px');
    } else {
        $('#logoIndexPrincipal').css('margin-top', '20px');
        $('#materialize-menu').css('height', '82px');
    }

    if (ancho >= 750 && ancho < 850) {
        $('#logoIndexPrincipal').css('display', 'none');
        $('#menu-list').css('margin-left', '100px');
    } else if (ancho >= 850 && ancho < 980) {
        $('#logoIndexPrincipal').css('display', 'block');
        $('#menu-list').css('margin-left', '0px');
    } else if (ancho >= 980 && ancho < 1200) {
        $('#logoIndexPrincipal').css('display', 'none');
        $('#menu-list').css('margin-left', '70px');
    } else {
        $('#logoIndexPrincipal').css('display', 'block');
        $('#menu-list').css('margin-left', '0px');
    }
    /*
     if (ancho > 1200) {
     $('#menu-list').css('margin-right', '40px');
     } else {
     $('#menu-list').css('margin-right', '0px');
     }
     */
});