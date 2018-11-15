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

    $('#FrmPersonalizacionWEB').submit(function () {
        swal({
            title: 'PEAM',
            text: "¿Esta seguro de guardar cambios?",
            type: 'warning',
            showCancelButton: true,
            confirmButtonText: 'Sí, continuar!',
            cancelButtonText: 'No, cancelar!',
            confirmButtonClass: 'btn btn-info',
            cancelButtonClass: 'btn btn-danger',
            buttonsStyling: false
        }).then((result) => {
            if (result.value) {
                if (validarFormularioConWeb()) {
                    $('#redes_sociales').val(getCadenaRedesSociales());
                    $('#modalCargandoPersonalizacion').modal("show");
                }
            }
        });
        $('.swal2-confirm').css("margin-right", "15px");
        $('.swal2-container').css('z-index', '2000');
        return false;
    });

    $("#modalCargandoPersonalizacion").on('shown.bs.modal', function () {
        procesarAjaxPersonalizacionWeb();
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
        $('#' + $(this).attr('inputvalidacion')).val("SI");
        readImageSelected(this, $(this).attr('idvisor'));
    });

    addEventosRedesSociales();
    addValidacionCamposConfWeb();

});

function procesarAjaxPersonalizacionWeb() {
    var form = $('#FrmPersonalizacionWEB')[0];
    var datosSerializadosCompletos = new FormData(form);
    datosSerializadosCompletos.append('numero_fotos_galeria', $('#numero_fotos_galeria').val());
    datosSerializadosCompletos.append('numero_videos_multimedia', $('#numero_videos_multimedia').val());
    datosSerializadosCompletos.append('numero_anuncios_mostrar', $('#numero_anuncios_mostrar').val());
    datosSerializadosCompletos.append('icono_pagina', $('#icono_pagina').val());
    datosSerializadosCompletos.append('redes_sociales', $('#redes_sociales').val());
    datosSerializadosCompletos.append('apikey', $('#apikey').val());
    datosSerializadosCompletos.append('idusuario', $('#idusuario').val());
    datosSerializadosCompletos.append('idalbum', $('#idalbum').val());
    datosSerializadosCompletos.append('action', $('#action').val());
    $.ajax({
        url: getContext() + '/personalizacion/web',
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        enctype: 'multipart/form-data',
        processData: false,
        contentType: false,
        cache: false,
        timeout: 600000,
        success: function (jsonResponse) {
            $('#modalCargandoPersonalizacion').modal("hide");
            if (jsonResponse.MESSAGE_SERVER.toLowerCase() === "ok") {
                //viewAlert('success', 'Datos Actualizados exitosamente!!!');
                swal({
                    title: "",
                    html: "<!--img src='img/logo_ceplomo.png' alt='Logo' style='width:150px;'><br--><h5>Datos actualizados exitosamente.</h5><strong>. . . Redirigiendo en 3 segundos!!!</strong>",
                    type: "success",
                    allowOutsideClick: false, //para que no cierre con clic
                    allowEscapeKey: false, //ni con spcape
                    focusConfirm: false,
                    allowEnterKey: false, //que no confirme con enter
                    showCancelButton: false,
                    showLoaderOnConfirm: true,
                    confirmButtonText: "<i class='fa fa-spinner fa-spin fa-2x fa-fw'></i>",
                    confirmButtonClass: 'btn btn-outline-primary',
                    buttonsStyling: false,
                    timer: 5000
                }).catch(swal.noop);
                $('.swal2-confirm').css('border', 'none');
                $('.swal2-confirm').css('box-shadow', 'none');
                $('.swal2-confirm').click(function () {
                    $(location).attr('href', '../indexgc');
                });
                setTimeout(function () {
                    $(location).attr('href', '../indexgc');
                }, 3000);
            }
        },
        error: function () {
            $('#modalCargandoPersonalizacion').modal("hide");
            viewAlert('error', 'Error interno en el servidor!');
        }
    });
    return false;
}

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

function addValidacionCamposConfWeb() {
    $('#numero_fotos_galeria').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#numero_videos_multimedia').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#numero_anuncios_mostrar').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#url_goresam').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
    $('#url_portal_transparencia').on('change', function () {
        $(this).val() === "" ? $(this.parentElement).addClass('has-danger') : $(this.parentElement).removeClass('has-danger');
    });
}

function validarFormularioConWeb() {
    if ($('#numero_fotos_galeria').val() === "") {
        $($('#numero_fotos_galeria').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#numero_videos_multimedia').val() === "") {
        $($('#numero_videos_multimedia').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#numero_anuncios_mostrar').val() === "") {
        $($('#numero_anuncios_mostrar').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#url_goresam').val() === "") {
        $($('#url_goresam').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#url_portal_transparencia').val() === "") {
        $($('#url_portal_transparencia').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtDirectorInfraestructura').val() === "") {
        $($('#txtDirectorInfraestructura').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtDirectorManejoAmbiental').val() === "") {
        $($('#txtDirectorManejoAmbiental').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtDirectorDesarrolloAgropecuario').val() === "") {
        $($('#txtDirectorDesarrolloAgropecuario').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    if ($('#txtResponsableEstudios').val() === "") {
        $($('#txtResponsableEstudios').parent()).addClass('has-danger');
        return false;
    } else {
        $(this.parentElement).removeClass('has-danger');
    }
    return true;
}