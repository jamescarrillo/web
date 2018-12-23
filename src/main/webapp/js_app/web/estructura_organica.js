$(document).ready(function () {

    $('#btnCerrarModal').click(function () {
        $('#header').css('display', 'block');
        $('#myModal').css('display', 'none');
    });

    $('#btnCerrarModalDirectivos').click(function () {
        $('#header').css('display', 'block');
        $('#myModalDirectivos').css('display', 'none');
    });
    
    $('#btnCerrarModalPEAM').click(function () {
        $('#header').css('display', 'block');
        $('#myModalPEAM').css('display', 'none');
    });
    
    procesarAjaxOrganigramaWeb();

});

$(window).resize(function () {
    var ancho = $(window).width();
    if (ancho <= 400) {
        $('.contentMyModal').css("width", "80%");
    } else if (ancho <= 700) {
        $('.contentMyModal').css("width", "70%");
    } else if (ancho <= 900) {
        $('.contentMyModal').css("width", "60%");
    } else {
        $('.contentMyModal').css("width", "40%");
    }
});

function procesarAjaxOrganigramaWeb() {
    $.ajax({
        url: getContext() + '/gestiontransparente/recursos-humanos',
        type: 'POST',
        data: "action=getDataOrganigrama",
        dataType: 'json',
        success: function (jsonResponse) {
            //console.log(jsonResponse);
            var representantes = new Array();
            $(jsonResponse.DATA_DIRECTIVOS.LIST).each(function (index, value) {
                if (value.cargo.toLowerCase() !== "representante") {
                    $('#containerModalDirectivos').append(getCard(value, "col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2 col-xs-10 col-xs-offset-1"));
                } else {
                    representantes.push(getCard(value, "col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2 col-xs-10 col-xs-offset-1"));
                }
            });
            for (var i = 0; i < representantes.length; i++) {
                $('#containerModalDirectivos').append(representantes[i]);
            }
            crearDiagrama(jsonResponse.DATA_FUNCIONARIOS);
        },
        error: function () {
            viewAlertWeb('error', 'Error interno en el servidor!');
        }
    });
    return false;
}

function crearDiagrama(DATA_FUNCIONARIOS) {
    var funcionarios = [];
    $(DATA_FUNCIONARIOS.LIST).each(function (index, value) {
        funcionarios.push(
                {
                    "id": value.id,
                    "puesto": value.cargo,
                    "nombre": "",
                    "hijos": []
                }
        );
    });
    var myJsonCadena = JSON.stringify(DATA_FUNCIONARIOS.LIST);
    $('#jsonFuncionarios').val(myJsonCadena);
    var data = {
        "id": "idgoresam",
        "puesto": "GRSM",
        "nombre": "",
        "hijos": [
            {
                "id": "idconsejodirectivo",
                "puesto": "Consejo Directivo",
                "nombre": "",
                "hijos": funcionarios
            }
        ]
    };
    organigrama.data = data;
    // creación del organigrama, se le manda el id del contenedor
    organigrama.create('organigrama');
    // Agregamos los eventos para los nodos

//    $('.nodo-puesto').click(function () {
//        $('#header').css('display', 'none');
//        $('#myModal').css('display', 'block');
//    });

    $('.nodo-puesto').each(function (index, value) {
        $(this).click(function () {
            if ($(this).attr("iditem-caja") === "idconsejodirectivo") {
                $('#header').css('display', 'none');
                $('#myModalDirectivos').css('display', 'block');
            } else {
                if ($(this).attr("iditem-caja") !== "idgoresam") {
                    var id = $(this).attr("iditem-caja");
                    var jsonFuncionarios = JSON.parse($('#jsonFuncionarios').val());
                    $(jsonFuncionarios).each(function (index, value) {
                        if (value.id.toString() === id.toString()) {
                            $('#containerModalFuncionarios').empty();
                            $('#containerModalFuncionarios').append(getCard(value, "col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2 col-xs-10 col-xs-offset-1"));
                        }
                    });
                    $('#header').css('display', 'none');
                    $('#myModal').css('display', 'block');
                }else{
                    $('#header').css('display', 'none');
                    $('#myModalPEAM').css('display', 'block');
                }
            }
        });
    });
}

function getCard(value, columnas) {
    var card;
//    card = "<div class='col-lg-3 col-lg-offset-0 col-md-4 col-md-offset-0 col-sm-6 col-sm-offset-0 col-xs-10 col-xs-offset-1 mt-15'>";
    card = "<div class='" + columnas + "'>";

    card += "<div class='team-wrapper text-center'>";

    card += "<div class='team-img'>";
    card += "<a href=''><img src='/web/peam_resources_app/conf_app/DirectivoFuncionario/img/" + value.foto + "' class='img-responsive' alt='Imagen'></a>";

    card += "<div class='team-title' style='padding-top: 10px;padding-left: 10px; padding-right: 10px'>";
    card += "<h3 class='text-peam-negrita'><a style='text-transform: none'>" + value.nombres_apellidos + "</a></h3>";
    card += "<span class='mb-10'>" + value.cargo + "</span>";
    card += "<div class='row'>";
    card += "<div class='col-xs-12'><h5 class='text-peam' style='margin-bottom: 5px'>Régimel Laboral:</h5></div><div class='col-xs-12'><h5 style='margin-bottom: 5px'>" + value.regimen_laboral + "</h5></div>";
    card += "<div class='col-xs-12'><h5 class='text-peam' style='margin-bottom: 5px'>Designado Por:</h5></div><div class='col-xs-12'><h5 style='margin-bottom: 5px'>" + value.resolucion + "</h5></div>";
    card += "<div class='col-xs-12'><h5 class='text-peam' style='margin-bottom: 5px'>Fecha Designación:</h5></div><div class='col-xs-12'><h5 style='margin-bottom: 5px'>" + value.fecha_designacion + "</h5></div>";
    //CIERRE row
    card += "</div>";
    card += "<h5 class='text-peam'><i class='fa fa-phone'></i> " + value.telefono + "</h5>";
    card += "<h5 class='mb-20 text-peam-verde-index'><i class='fa fa-envelope-o'></i> <a href='mailto:" + value.e_mail + "'>" + value.e_mail + "</a></h5>";
    //CIERRE team-title
    card += "</div>";
    //CIERRE team-img
    card += "</div>";
    //CIERRE DE team-wrapper 
    card += "</div>";
    //CIERRE DEL LA COLUMNA
    card += "</div>";
    return card;
}