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


});

function addCalendarDivs(ids, formato) {
    for (var i = 0; i < ids.length; i++) {
        $('#' + ids[i]).datetimepicker({
            format: formato === '' ? 'DD/MM/YYYY' : formato
        });
    }
}

function getDateJs(date) {
    //------------->MM/DD/YYYY
    //VIENE DE LA BBDD DD/MM/YYYY
    var valores = date.split("/");
    return valores[1] + "/" + valores[0] + "/" + valores[2];
}

function getDateFullJs(datefull) {
    //------------->MM/DD/YYYY
    //VIENE DE LA BBDD DD/MM/YYYY HH:MM:SS
    var valoresfull = datefull.split(" ");
    var valores = valoresfull[0].split("/");
    var valoresh = valoresfull[1].split(":");
    return new Date(valores[2], valores[1], valores[0], valoresh[0], valoresh[1], valoresh[2], 0);
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

function getContexApp(){
    return "/web";
}