$(document).ready(function () {

    procesarAjaxIndexWeb();
});

function procesarAjaxIndexWeb() {
    var datosSerializadosCompletos = "action=getDataIndex";
    $.ajax({
        url: getContext() + '/index',
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        success: function (jsonResponse) {
            $('#loader_contenido').css('display', 'none');
            procesarAjaxGaleriaWeb(jsonResponse.GALERIA_APIKEY, jsonResponse.GALERIA_IDUSUARIO, jsonResponse.GALERIA_IDALBUM, jsonResponse.GALERIA_NUM_FOTOS_MOSTRAR);
            addNoticiasWeb(jsonResponse.DATA_NOTASPRENSA);
            addAnunciosWeb(jsonResponse.DATA_ANUNCIOS);
            addMultimediaWeb(jsonResponse.DATA_MULTIMEDIA);
        },
        error: function () {
            console.log("error al traer datos del index");
        }
    });
    return false;
}

function addNoticiasWeb(DATA_NOTASPRENSA) {
    /*PAGINATION*/
    if (DATA_NOTASPRENSA.COUNT_FILTER > 0) {
        var cadenaContenido;
        $.each(DATA_NOTASPRENSA.LIST, function (index, value) {
            cadenaContenido = removeTagHTML(value.contenido);
            if (index < 5) {
                $('#idNota' + (index + 1)).val(value.id);
                $('#tituloNotaPrensa' + (index + 1)).html(getTituloWeb(value.titulo, 45));
                $('#resumenNotaPrensa' + (index + 1)).html(getTituloWeb(getResumenContenidoWeb(cadenaContenido, 150), 90));
            }
            $('#imgCNotaPrensa' + index).attr('src', value.foto);
            $('#tituloCNotaPrensa' + index).html(value.titulo + getFormViewNoticeWeb(value.id));
        });
        $("#contenedorCarrusel").owlCarousel();
        addEventsNoticias();
    }
}

function getFormViewNoticeWeb(idNoticia) {
    var form = "";
    form += "<form class='form-ver-noticia' method='POST' action='notas-de-prensa'>";
    form += "<input type='hidden' name='idNota' value='" + idNoticia + "'>";
    form += "<input type='hidden' name='action' value='readNotaPrensa'>";
    //form += "<button type='submit' class='btn-link' style='color: #a20505; font-weight: bold;'>Ver Noticia <i class='fa fa-long-arrow-right'></i></button>";
    form += "</form>";
    return form;
}

function addEventsNoticias() {
    jQuery(document).ready(function () {
        jQuery(".materialize-slider").revolution({
            sliderType: "standard",
            sliderLayout: "fullwidth",
            delay: 9000,
            navigation: {
                keyboardNavigation: "on",
                keyboard_direction: "horizontal",
                mouseScrollNavigation: "off",
                onHoverStop: "off",
                touch: {
                    touchenabled: "on",
                    swipe_threshold: 75,
                    swipe_min_touches: 1,
                    swipe_direction: "horizontal",
                    drag_block_vertical: false
                },
                arrows: {
                    style: "gyges",
                    enable: true,
                    hide_onmobile: false,
                    hide_onleave: true,
                    tmp: '',
                    left: {
                        h_align: "left",
                        v_align: "center",
                        h_offset: 10,
                        v_offset: 0
                    },
                    right: {
                        h_align: "right",
                        v_align: "center",
                        h_offset: 10,
                        v_offset: 0
                    }
                }
            },
            responsiveLevels: [1240, 1024, 778, 480],
            gridwidth: [1240, 1024, 778, 480],
            gridheight: [500, 500, 500, 500],
            disableProgressBar: "on",
            parallax: {
                type: "mouse",
                origo: "slidercenter",
                speed: 2000,
                levels: [2, 3, 4, 5, 6, 7, 12, 16, 10, 50]
            }
        });
    });
}

function addAnunciosWeb(DATA_ANUNCIOS) {
    $.each(DATA_ANUNCIOS, function (index, value) {
        $.toast({
            heading: value.titulo,
            text: value.contenido,
            position: 'top-right',
            hideAfter: false
        });
    });
    $('.jq-toast-single').css('border', '3px solid #a20505');
    $('.jq-toast-heading').addClass('text-peam-negrita');
}

function addMultimediaWeb(DATA_MULTIMEDIA) {
    var card;
    $.each(DATA_MULTIMEDIA.LIST, function (index, value) {
        card = "<div class='col-lg-3 col-md-4 col-sm-6 col-xs-12'>";

        card += "<div class='featured-item' style='padding: 5px'>";

        card += "<div class='embed-responsive embed-responsive-16by9'>";

        card += "<iframe class='embed-responsive-item' src='" + value.fuente + "' allowfullscreen></iframe>";

        card += "</div>";

        card += "</div>";

        card += "</div>";

        $('#containerMultimedia').append(card);
    });
    //ADD BUTTON VIEW ALL
    $('#containerMultimedia').append("<div class='col-md-12 mt-10 text-center'><a class='waves-effect waves-light btn' href='publicaciones/noticias/multimedia'>Ver todos <i class='fa fa-long-arrow-right'></i></a></div>");
}

function procesarAjaxGaleriaWeb(apikey, idusuario, idalbum, numero_fotos_mostrar) {
    //var apiKey = '43635b83205357579f0b3da4d79feb48';
    //var idUsuario = '83313636@N07';
    //var idAlbum = '72157691821802514';
    $.ajax({
        url: "https://api.flickr.com/services/rest/",
        type: 'GET',
        data: {
            method: "flickr.photosets.getPhotos",
            api_key: apikey,
            photoset_id: idalbum,
            user_id: idusuario,
            format: "rest",
            per_page: numero_fotos_mostrar,
            page: 1,
            extras: "url_c,url_m"
        },
        success: function (response) {
            var portafolio;
            var dataGrupo;
            $.each($(response).find('photo'), function (i, item) {
                dataGrupo = "[\"all\"]";
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
                });
            }

        },
        error: function (e) {
            console.log("error al traer datos de la galería");
        }
    });
    return false;
}

