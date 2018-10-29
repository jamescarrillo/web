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
}
);
