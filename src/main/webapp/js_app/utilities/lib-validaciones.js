$(document).ready(function () {

//    $(document).bind("contextmenu", function (e) {
//        return false;
//    });

    /*
     $(".input-number").numeric(false, function () {
     //SE PUEDE MOSTRAR UNA ALERTA
     this.value = "";
     this.focus();
     });
     */
    $(document).on('hidden.bs.modal', '.modal', function () {
        if ($('body').find('.modal.show').length > 0) {
            $('body').addClass('modal-open');
        }
    });

    var modal_lv = 0;
    
    $('.modal').on('shown.bs.modal', function (e) {
        $('.modal-backdrop:last').css('z-index', 1051 + modal_lv);
        $(e.currentTarget).css('z-index', 1052 + modal_lv);
        modal_lv++;
    });

    $('.modal').on('hidden.bs.modal', function (e) {
        modal_lv--;
    });

});

function addCalendarDivs(ids, formato) {
    for (var i = 0; i < ids.length; i++) {
        $('#' + ids[i]).datetimepicker({
            format: formato === '' ? 'DD/MM/YYYY' : formato
        });
    }
}

function getRandomInt(min, max) {
    // Retorna un entero aleatorio entre min (incluido) y max (excluido)
    // ¡Usando Math.round() te dará una distribución no-uniforme!
    return Math.floor(Math.random() * (max - min)) + min;
}

function readImageSelected(input, idvisor) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            //PARA QUE SE MUESTRE EN UNA ETIQUETA IMG
            $('#' + idvisor).attr('src', e.target.result);
        };
        reader.readAsDataURL(input.files[0]);
        //$('#' + idname).val(input.files[0].name);
    }
}

function readViewNameFile(input, idtxtname) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            //PARA QUE SE MUESTRE EN UNA ETIQUETA IMG
            //$('#visorImagenResultado').attr('src', e.target.result);
        };
        reader.readAsDataURL(input.files[0]);
        $('#' + idtxtname).val(input.files[0].name);
        $('#' + idtxtname).trigger("change");
    }
}

function printDiv(nombreDiv) {
    var contenido = document.getElementById(nombreDiv).innerHTML;
    var contenidoOriginal = document.body.innerHTML;
    document.body.innerHTML = contenido;
    window.print();
    document.body.innerHTML = contenidoOriginal;
}

/*
 function getContexApp(){
 return "/web";
 }
 */