$(window).resize(function () {
    //aqui el codigo que se ejecutara cuando se redimencione la ventana
    //var alto = $(window).height();
    var ancho = $(window).width();
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
