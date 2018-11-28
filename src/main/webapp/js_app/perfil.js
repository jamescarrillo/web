$(document).ready(function () {

    $("#FrmPerfil").submit(function () {
        if (validarFormularioPerfil()) {
            $('#modalCargandoPerfil').modal("show");
        }
        return false;
    });

    $('#txtLoginER').on('change', function () {
        (this.value === "") ? $("#validarLogin").fadeIn("slow") : $("#validarLogin").fadeOut();
    });

    $('#txtPassER').on('change', function () {
        (this.value === "") ? $("#validarPass").fadeIn("slow") : $("#validarPass").fadeOut();
    });

    $("#modalCargandoPerfil").on('shown.bs.modal', function () {
        procesarAjaxPerfil();
    });

});

function procesarAjaxPerfil() {
    var datosSerializadosCompletos = $("#FrmPerfil").serialize();
    $.ajax({
        url: 'perfil',
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        success: function (jsonResponse) {
            $('#modalCargandoPerfil').modal("hide");
            if (jsonResponse.MESSAGE_SERVER !== undefined) {
                if (jsonResponse.MESSAGE_SERVER === "ok") {
                    swal({
                        title: "PEAM",
                        html: "<h5>Datos actualizados exitosamente.</h5><strong>...Redirigiendo en 5 segundos!!!</strong>",
                        type: "success",
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
                        $(location).attr('href', 'cerrarsession');
                    });
                    setTimeout(function () {
                        $(location).attr('href', 'cerrarsession');
                    }, 3000);
                } else {
                    viewAlert('warning', jsonResponse.MESSAGE_SERVER);
                }
            }
        },
        error: function () {
            $('#modalCargandoPerfil').modal("hide");
            viewAlert('error', 'Error interno en el servidor!');
        }
    });
    return false;
}

function validarFormularioPerfil() {
    if ($('#txtLoginER').val() === "") {
        $("#validarLogin").fadeIn("slow");
        return false;
    } else {
        $("#validarLogin").fadeOut();
    }
    if ($('#txtPassER').val() === "") {
        $("#validarPass").fadeIn("slow");
        return false;
    } else {
        $("#validarPass").fadeOut();
    }
    return true;
}