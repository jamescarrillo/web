
$(window).resize(function () {
    //aqui el codigo que se ejecutara cuando se redimencione la ventana
    //var alto = $(window).height();
    var ancho = $(window).width();
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

    if (ancho >= 750 && ancho < 850) {
        $('#logoIndexPrincipal').css('display', 'block');
        $('#menu-list').css('margin-left', '50px');
    } else if (ancho >= 850 && ancho < 980) {
        $('#logoIndexPrincipal').css('display', 'block');
        $('#menu-list').css('margin-left', '0px');
    } else if (ancho >= 980 && ancho < 1200) {
        $('#logoIndexPrincipal').css('display', 'none');
        $('#menu-list').css('margin-left', '15px');
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