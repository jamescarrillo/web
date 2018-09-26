$(window).resize(function () {
    //aqui el codigo que se ejecutara cuando se redimencione la ventana
    //var alto = $(window).height();
    var ancho = $(window).width();
    if (ancho <= 768) {
        //PEQUEÑOS DESABILITAMOS
        $('.contenedor-lg-logos').css('display', 'none');
        $('.contenedor-sm-logos').css('display', 'none');
    } else if (ancho > 768 && ancho < 1200) {
        $('.contenedor-lg-logos').css('display', 'none');
        $('.contenedor-sm-logos').css('display', 'block');
    } else {
        $('.contenedor-lg-logos').css('display', 'block');
        $('.contenedor-sm-logos').css('display', 'none');
    }
});