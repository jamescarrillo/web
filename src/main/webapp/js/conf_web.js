$(document).ready(function () {
    /*
     $.toast({ 
     text : "Let's test some HTML stuff... <a href='#'>github</a>", 
     showHideTransition : 'slide',  // It can be plain, fade or slide
     bgColor : 'blue',              // Background color for toast
     textColor : '#eee',            // text color
     allowToastClose : false,       // Show the close button or not
     hideAfter : 5000,              // `false` to make it sticky or time in miliseconds to hide after
     stack : 5,                     // `fakse` to show one stack at a time count showing the number of toasts that can be shown at once
     textAlign : 'left',            // Alignment of text i.e. left, right, center
     position : 'bottom-left'       // bottom-left or bottom-right or bottom-center or top-left or top-right or top-center or mid-center or an object representing the left, right, top, bottom values to position the toast on page
     })
     */

    procesarAjaxAnunciosWeb();
    procesarAjaxGaleriaWeb();
    //procesarAjaxMultimediaWeb();

});

function procesarAjaxAnunciosWeb() {
    var datosSerializadosCompletos = "action=getAnuncios&count=5";
    $.ajax({
        url: getContext() + '/anunciosweb',
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        success: function (jsonResponse) {
            $.each(jsonResponse.DATA, function (index, value) {
                $.toast({
                    heading: value.titulo,
                    text: value.contenido,
                    position: 'top-right',
                    hideAfter: false
                });
            });
            $('.jq-toast-single').css('border', '3px solid #a20505');
            $('.jq-toast-heading').addClass('text-peam-negrita');
        },
        error: function () {
            /*MOSTRAMOS MENSAJE ERROR SERVIDOR*/
            //viewAlertWeb('error', 'Error interno al cargar anuncios!');
        }
    });
    return false;
}

function procesarAjaxGaleriaWeb() {
    var apiKey = '43635b83205357579f0b3da4d79feb48';
    var idUsuario = '83313636@N07';
    var idAlbum = '72157691821802514';
    $.ajax({
        url: "https://api.flickr.com/services/rest/",
        type: 'GET',
        data: {
            method: "flickr.photosets.getPhotos",
            api_key: apiKey,
            photoset_id: idAlbum,
            user_id: idUsuario,
            format: "rest",
            per_page: 9,
            page: 1,
            extras: "url_c,url_m"
        },
        success: function (response) {
            var portafolio;
            var dataGrupo;
            $.each($(response).find('photo'), function (i, item) {
                dataGrupo = '["all"]';
                portafolio = "<div class='portfolio-item' data-groups='" + dataGrupo + "'>";

                portafolio += "<div class='portfolio-wrapper'>";
                portafolio += "<div class='thumb'>";
                portafolio += "<div class='bg-overlay'></div>";
                portafolio += "<img src='" + $(item).attr('url_c') + "' alt=''>";
                portafolio += "<div class='portfolio-intro'>";

                portafolio += "<div class='action-btn'>";
                portafolio += "<a href='" + $(item).attr('url_c') + "' class='tt-lightbox' title=''><i class='fa fa-search'></i></a>";
                portafolio += "</div>";
                portafolio += "<h2><a>Ver</a></h2>";
                portafolio += "<p><a>Peam</a></p>";

                portafolio += "</div>";

                portafolio += "</div>";

                portafolio += "</div>";

                $('#containerGaleriaFotosPeam').append(portafolio);
            });
            if ($('.tt-lightbox').length > 0) {
                $('.tt-lightbox').magnificPopup({
                    type: 'image',
                    mainClass: 'mfp-fade',
                    removalDelay: 160,
                    fixedContentPos: false
                            // other options
                });
            }

        },
        error: function (e) {
            console.log("error al traer datos de la galería");
        }
    });
    return false;
}

function procesarAjaxMultimediaWeb() {
    var datosSerializadosCompletos = "action=paginarMultimedia";
    datosSerializadosCompletos += "&txtMultimedia=";
    datosSerializadosCompletos += "&comboAnio=-1";//+ (new Date().getFullYear());
    datosSerializadosCompletos += "&estadoMultimedia=true";
    datosSerializadosCompletos += "&sizePageMultimedia=4";
    datosSerializadosCompletos += "&numberPageMultimedia=1";
    $.ajax({
        url: getContext() + '/publicaciones/noticias/multimedia',
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        success: function (jsonResponse) {
            var portafolio;
            var dataGrupo;
            $.each(jsonResponse.BEAN_PAGINATION.LIST, function (index, value) {
                dataGrupo = '["all"]';
                portafolio = "<div class='portfolio-item' data-groups='" + dataGrupo + "'>";

                portafolio += "<div class='portfolio-wrapper'>";
                portafolio += "<div class='thumb'>";
                portafolio += "<div class='bg-overlay'></div>";
                portafolio += "<img src='/web/peam_resources/logos_complementos/bn2013 - copia.png' alt=''>";
                portafolio += "<div class='portfolio-intro'>";

                portafolio += "<div class='action-btn'>";
                portafolio += "<a href='" + value.fuente + "' class='popup-video' title=''><i class='fa fa-play'></i></a>";
                portafolio += "</div>";
                portafolio += "<h2><a>Ver</a></h2>";
                portafolio += "<p><a>Peam</a></p>";

                portafolio += "</div>";

                portafolio += "</div>";

                portafolio += "</div>";
                $('#containerGaleriaFotosPeam').append(portafolio);
            });
            if ($('.popup-video').length > 0) {
                $('.popup-video').magnificPopup({
                    disableOn: 700,
                    type: 'iframe',
                    mainClass: 'mfp-fade',
                    removalDelay: 160,
                    preloader: false,
                    fixedContentPos: false
                });
            }
        },
        error: function () {

        }
    });
    return false;
}

$(window).resize(function () {
    //aqui el codigo que se ejecutara cuando se redimencione la ventana
    //var alto = $(window).height();
    var ancho = $(window).width();
    //style="height: 495px"
    if (ancho <= 400) {
        $('.img-responsive-peam').css('height', '280');
        $('#idColumnaCarrusel').css('height', '285');
    } else if (ancho <= 500) {
        $('.img-responsive-peam').css('height', '300');
        $('#idColumnaCarrusel').css('height', '305');
    } else if (ancho <= 630) {
        $('.img-responsive-peam').css('height', '345');
        $('#idColumnaCarrusel').css('height', '350');
    } else if (ancho <= 680) {
        $('.img-responsive-peam').css('height', '380');
        $('#idColumnaCarrusel').css('height', '385');
    } else if (ancho <= 900) {
        $('.img-responsive-peam').css('height', '420');
        $('#idColumnaCarrusel').css('height', '425');
    } else if (ancho <= 1000) {
        $('.img-responsive-peam').css('height', '430');
        $('#idColumnaCarrusel').css('height', '435');
    } else if (ancho > 1000 && ancho < 1200) {
        $('.img-responsive-peam').css('height', '495');
        $('#idColumnaCarrusel').css('height', '500');
    } else {
        $('.img-responsive-peam').css('height', '495');
        $('#idColumnaCarrusel').css('height', '500');
    }


    if (ancho <= 770) {
        $('#row_logos_lg').css('display', 'none');
        $('#row_logos_md').css('display', 'none');
        $('#row_logos_sm').css('display', 'none');
    } else if (ancho <= 1000) {
        $('#row_logos_lg').css('display', 'none');
        $('#row_logos_md').css('display', 'none');
        $('#row_logos_sm').css('display', 'block');
    } else if (ancho > 1000 && ancho < 1200) {
        $('#row_logos_lg').css('display', 'none');
        $('#row_logos_md').css('display', 'block');
        $('#row_logos_sm').css('display', 'none');
    } else {
        $('#row_logos_lg').css('display', 'block');
        $('#row_logos_md').css('display', 'none');
        $('#row_logos_sm').css('display', 'none');
    }
    /*
     if (ancho > 1200) {
     $('#menu-list').css('margin-right', '40px');
     } else {
     $('#menu-list').css('margin-right', '0px');
     }
     */
});