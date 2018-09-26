$(document).ready(function () {
    //$.backstretch("img/fondo_opt.jpg");
    $("#FrmLogin").submit(function () {
        if (validarFormularioLogin()) {
            $("#modalCargando").modal("show");
        }
        return false;
    });

    $("#modalCargando").on('shown.bs.modal', function (e) {
        // Invoke your server side code here.
        validarErrores();
    });

    $('#txtUsuario').focus();

    validacionesCamposLogin();
});

function validarErrores() {
    $.ajax({
        url: 'session',
        dataType: 'json',
        type: 'POST',
        data: $('#FrmLogin').serialize(),
        success: function (jsonResponse) {
            $('#modalCargando').modal('hide');
            //console.log(jsonResponse.AUTENTICACION);
            if (jsonResponse.AUTENTICACION === "CORRECTO") {
                $(location).attr('href', 'indexgc');
            } else {
                swal(
                        {
                            title: "SisBu",
                            text: jsonResponse.AUTENTICACION,
                            type: "error",
                            confirmButtonText: "Aceptar",
                            confirmButtonClass: 'btn btn-info',
                            buttonsStyling: false
                        }
                );

                if (jsonResponse.AUTENTICACION.toLowerCase() === "el usuario ingresado no existe") {
                    $('#txtUsuario').val("");
                    $('#txtPass').val("");
                    $('#txtUsuario').focus();
                } else if (jsonResponse.AUTENTICACION.toLowerCase() === "contraseña incorrecta") {
                    $('#txtPass').val("");
                    $('#txtPass').focus();
                } else {
                    $('#txtUsuario').val("");
                    $('#txtPass').val("");
                    $('#txtUsuario').focus();
                }
            }
        },
        error: function () {
            $('#modalCargando').modal("hide");
            swal(
                    {
                        title: "RedPos!",
                        text: "Error en el servidor",
                        type: "error",
                        showCancelButton: false,
                        confirmButtonColor: '#3085d6',
                        confirmButtonText: "Aceptar",
                        confirmButtonClass: 'btn btn-info',
                        buttonsStyling: false
                    }
            );

        }
    });

    return false;
}

function validacionesCamposLogin() {
    $('#txtUsuario').on('change', function () {
        (this.value === "") ? $("#validarUsuario").fadeIn("slow") : $("#validarUsuario").fadeOut();
    });
    $('#txtPass').on('change', function () {
        (this.value === "") ? $("#validarPass").fadeIn("slow") : $("#validarPass").fadeOut();
    });
}

function validarFormularioLogin() {
    if ($('#txtUsuario').val() === "") {
        $("#validarUsuario").fadeIn("slow");
        $('#txtUsuario').focus();
        return false;
    } else {
        $("#validarUsuario").fadeOut();
    }
    if ($('#txtPass').val() === "") {
        $('#txtPass').focus();
        $("#validarPass").fadeIn("slow");
        return false;
    } else {
        $("#validarPass").fadeOut();
    }
    return true;
}

