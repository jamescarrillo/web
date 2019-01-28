$(document).ready(function () {

    $('.img-portal-index').hover(function () {
        $(this).attr('src', '/web/peam_resources/logos_principales/portal_x200_rojo.png');
    }, function () {
        $(this).attr('src', '/web/peam_resources/logos_principales/portal_x200.png');
    });

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
            //console.log(jsonResponse);
            $('#loader_contenido').css('display', 'none');
            addDataGerencia(jsonResponse.DATA_FUNCIONARIOS);
            procesarAjaxGaleriaWeb(jsonResponse.GALERIA_APIKEY, jsonResponse.GALERIA_IDUSUARIO, jsonResponse.GALERIA_IDALBUM, jsonResponse.GALERIA_NUM_FOTOS_MOSTRAR);
            addNoticiasWeb(jsonResponse.DATA_NOTASPRENSA, jsonResponse.DATA_DESTACADOS);
            addAnunciosWeb(jsonResponse.DATA_ANUNCIOS);
            addMultimediaWeb(jsonResponse.DATA_MULTIMEDIA);
        },
        error: function () {
            console.log("error al traer datos del index");
        }
    });
    return false;
}

function addDataGerencia(DATA_FUNCIONARIOS) {
    $(DATA_FUNCIONARIOS.LIST).each(function (index, value) {
        var url_foto = "/web/peam_resources_app/conf_app/DirectivoFuncionario/img/" + value.foto;
        $('#imgGG').attr("src", "/web/peam_resources_app/conf_app/DirectivoFuncionario/img/" + value.foto);

        $('#nombreGG').html(value.nombres_apellidos);
        $('#cargoGG').html(value.cargo);
        var valoresTele = value.telefono.split(" ");
        var tele;
        if (valoresTele.length >= 3) {
            tele = valoresTele[0] + " " + valoresTele[1] + " " + valoresTele[2];
        } else {
            tele = value.telefono;
        }
        $('#telefonoGG').html("<i class='fa fa-phone'></i> " + tele);
        $('#correoGG').html("<a href='mailto:" + value.e_mail + "'><i class='fa fa-envelope-o'></i> " + value.e_mail + "</a>");
    });
}

function addNoticiasWeb(DATA_NOTASPRENSA, DATA_DESTACADOS) {
    /*PAGINATION*/
    if (DATA_NOTASPRENSA.COUNT_FILTER > 0) {
        var cadenaContenido;
        $.each(DATA_NOTASPRENSA.LIST, function (index, value) {
            cadenaContenido = removeTagHTML(value.contenido);
            //LAS NOTICIAS EN LA SECCIÓN NOTICIAS
            $('#myCarouselNoticias').append(getItemNoticia(value.titulo, value.foto, value.id));
            //$('#imgCNotaPrensa' + index).attr('src', value.foto);
            //$('#tituloCNotaPrensa' + index).html(value.titulo + getFormViewNoticeWeb(value.id));
        });
        $.each(DATA_DESTACADOS.LIST, function (index, value) {
            cadenaContenido = value.contenido;
            if (index < 5) {
                //console.log(value);
                var url_values = value.url.toLowerCase().split("id=");
                var id = "";
                if (url_values.length === 2) {
                    id = url_values[1];
                } else {
                    //SI NO ENCUENTRA EL ARREGLO TENDRÁ TAMAÑO = 1, VALIDAMOS LA CADENA
                    id = url_values[0];
                }
                $('#idNota' + (index + 1)).val(id);
                $('#tituloNotaPrensa' + (index + 1)).html(getTituloWeb(value.titulo, 45));
                if (cadenaContenido.length > 90) {
                    $('#resumenNotaPrensa' + (index + 1)).html(getTituloWeb(getResumenContenidoWeb(cadenaContenido, 150), 90) + ". . .");
                } else {
                    $('#resumenNotaPrensa' + (index + 1)).html(cadenaContenido);
                }
            }
        });

        $("#myCarouselNoticias").owlCarousel({
            loop: true,
            autoplay: true,
            autoplayTimeout: 5000,
            autoplayHoverPause: true,
            margin: 10,
            responsiveClass: true,
            responsive: {
                0: {
                    items: 1
                },
                600: {
                    items: 1
                },
                1000: {
                    items: 1
                }
            }
        });
        $("#contenedorCarrusel").owlCarousel();
        addEventsNoticias();
    }
}

function getItemNoticia(title, foto, idnoticia) {
    var div = "<div class= 'item item-noticia-slider'>";
    div += "<img src='" + foto + "'>";
    div += "<div class='btn_float_noticias text-center'>";
    //div += "<a class='waves-effect waves-light btn' style='height: 30px;padding-top: 2px;padding-bottom: 2px;'>Leer</a>";
    div += getFormViewNoticeWeb(idnoticia);
    div += "</div>";
    div += "<div class='description_float_noticias text-center'>";
    div += "<h5>" + title + "</h5>";
    div += "</div>";
    div += "</div>";
    return div;
}

function getFormViewNoticeWeb(idNoticia) {
    var form = "";
    form += "<form class='form-ver-noticia' method='POST' action='publicaciones/noticias/notas-de-prensa'>";
    form += "<input type='hidden' name='idNota' value='" + idNoticia + "'>";
    form += "<input type='hidden' name='action' value='readNotaPrensa'>";
    form += "<button type='submit' class='waves-effect waves-light btn' style='height: 30px;padding-top: 2px;padding-bottom: 2px;'>Leer</button>";
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
    $('.jq-toast-single').css('border', '3px solid #00793D');
    $('.jq-toast-heading').addClass('text-peam text-center');
    $('.jq-toast-heading').css('color', '#00793D');
    $('.jq-toast-heading').css('font-weight', 'bold');
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
    $('#containerMultimedia').append("<div class='col-md-12 mt-10 text-center'><a class='waves-effect waves-light btn' href='publicaciones/noticias/multimedia' style='font-size: 18px;'>Ver todos</a></div>");
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

