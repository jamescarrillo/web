$(document).ready(function () {

    $('#btnAbrirNuevaRedSocial').click(function () {
        $('#txtLinkRedSocial').val("");
        $('#nombreRedSocial').val("-1");
        $('#iconoRedSocial').val("");
        $('#abrirNuevaVentanaRedSocial').prop('checked', false);
        $('#btnIconoRedSocial').html("Seleccione...   ");
        $('#txtTituloModalManRedSocial').html("AGREGAR");
        $('#btnGuardarRedSocial').html("AGREGAR");
        $('#ventanaManRedSocial').modal("show");
    });

    $('#btnGuardarConfWeb').click(function () {
        $('#redes_sociales').val(getCadenaRedesSociales());
    });

    $('#btnGuardarRedSocial').click(function () {
        if ($('#nombreRedSocial').val().toLowerCase() !== "-1") {
            if ($('#txtLinkRedSocial').val().toLowerCase() !== "") {
                addRedSocial();
            } else {
                viewAlert('warning', 'Por favor ingrese link de la Red Social');
            }
        } else {
            viewAlert('warning', 'Por favor seleccione una Red Social');
        }
    });

    $('.item-red-social').each(function (index, value) {
        $(this).click(function () {
            $('#btnIconoRedSocial').html($(this).html());
            $('#nombreRedSocial').val($(this).attr('nombre_red_social'));
            $('#iconoRedSocial').val($(this).attr('icono'));
        });
    });

    $('.btn-eliminar-logo').each(function (index, value) {
        $(this).click(function () {
            $('#' + $(this).attr('inputfile')).val(null);
            $('#' + $(this).attr('inputname')).val("");
            $('#' + $(this).attr('inputvalidacion')).val("DEFECTO");
            $('#' + $(this).attr('idvisor')).attr('src', $(this).attr('logo_default'));
        });
    });

    $('.btn-seleccionar-logo').each(function (index, value) {
        $(this).click(function () {
            $('#' + $(this).attr('idinputfile')).trigger('click');
        });
    });

    $('.input-file-logo').change(function () {
        console.log("changeeeeeeeeeeeeeeeeee");
        $('#' + $(this).attr('inputvalidacion')).val("SI");
        readImageSelected(this, $(this).attr('idvisor'));
    });

    $("#fileFotoDIR").change(function () {
        $('#txtValidacionFotoDIR').val('SI');
        readImageSelected(this, 'visorFotoDIR');
    });

    addEventosRedesSociales();

});

function addRedSocial() {
    var indice = -1;
    $('.eliminar-redsocial').each(function (index, value) {
        if ($(this.parentElement.parentElement).attr('nombre_red_social').toLowerCase() === $("#nombreRedSocial").val().toLowerCase()) {
            indice = index;
            return;
        }
    });
    if (indice > -1) {
        viewAlert('warning', 'Ya existe la Red Social');
    } else {
        //AGREGAMOS
        var check;
        var atributos = "";
        atributos += "nombre_red_social='" + $("#nombreRedSocial").val() + "' ";
        atributos += "link='" + $("#txtLinkRedSocial").val() + "' ";
        atributos += "icono='" + $("#iconoRedSocial").val() + "' ";
        if ($('#abrirNuevaVentanaRedSocial').prop('checked')) {
            atributos += "abrir_nueva_ventana='1' ";
            check = "<label class='custom-control custom-checkbox' style='cursor: pointer'>";
            check += "<input type='checkbox' checked disabled class='custom-control-input'>";
            check += "<span class='custom-control-label'></span>";
            check += "</label>";
        } else {
            atributos += "abrir_nueva_ventana='0' ";
            check = "<label class='custom-control custom-checkbox' style='cursor: pointer'>";
            check += "<input type='checkbox' disabled class='custom-control-input'>";
            check += "<span class='custom-control-label'></span>";
            check += "</label>";
        }
        var tr = "";
        tr += "<tr " + atributos + ">";
        tr += "<td class='text-medium-table'>" + $("#nombreRedSocial").val() + "</td>";
        tr += "<td class='text-medium-table'>" + $("#txtLinkRedSocial").val() + "</td>";
        tr += "<td class='text-medium-table text-center'>" + check + "</td>";
        tr += "<td class='text-medium-table text-center'><button class='btn btn-outline-secondary btn-sm eliminar-redsocial'><i class='fas fa-trash-alt'></i></button></td>";
        tr += "</tr>";
        $('#tbodyRedesSociales').append(tr);
        addEventosRedesSociales();
        $('#ventanaManRedSocial').modal('hide');
    }
}

function addEventosRedesSociales() {
    $('.eliminar-redsocial').each(function (index, value) {
        $(this).click(function () {
            var boton = $(this);
            swal({
                title: 'PEAM',
                text: "¿Desea eliminar esta Red Social?",
                type: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Sí, continuar!',
                cancelButtonText: 'No, cancelar!',
                confirmButtonClass: 'btn btn-info',
                cancelButtonClass: 'btn btn-danger',
                buttonsStyling: false
            }).then((result) => {
                if (result.value) {
                    $(boton).closest('tr').remove();
                }
            });
            $('.swal2-confirm').css("margin-right", "15px");
            $('.swal2-container').css('z-index', '2000');

        });
    });
}

function getCadenaRedesSociales() {
    var cadena = "";
    $('.eliminar-redsocial').each(function (index, value) {
        if (index === $('.eliminar-redsocial').length - 1) {
            cadena += $(value.parentElement.parentElement).attr('nombre_red_social') + "::" + $(value.parentElement.parentElement).attr('link') + "::" + $(value.parentElement.parentElement).attr('icono') + "::" + $(value.parentElement.parentElement).attr('abrir_nueva_ventana');
        } else {
            cadena += $(value.parentElement.parentElement).attr('nombre_red_social') + "::" + $(value.parentElement.parentElement).attr('link') + "::" + $(value.parentElement.parentElement).attr('icono') + "::" + $(value.parentElement.parentElement).attr('abrir_nueva_ventana') + ":::";
        }
    });
    return cadena;
}
