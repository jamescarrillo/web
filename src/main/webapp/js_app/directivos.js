$(document).ready(function () {

    $("#FrmFuncionarios").submit(function () {
        $("#NumPagina").val(1);
        $("#nombreFormulario").val("FrmCicloAcademico");
        $('#modalCargando').modal("show");
        return false;
    });

    $("#FrmCicloAcademicoModal").submit(function () {
        if (validarFormulario()) {
            $("#NumPagina").val(1);
            $("#nombreFormulario").val("FrmCicloAcademicoModal");
            $('#modalCargando').modal("show");
        }
        return false;
    });

    $("#modalCargando").on('shown.bs.modal', function () {
        //DESPUES DE TERMINAR DE MOSTRAR EL MODAL
        procesarAjax($("#nombreFormulario").val(), parseInt($("#NumPagina").val()));
    });

    $("#ventanaMan").on('hidden.bs.modal', function () {
        $("#accionBuscar").val("Buscar");
        $("#accionModal").val("Buscar");
        $("#validarNombre").fadeOut();
    });

    $('#btnAbrirNuevoFuncionario').click(function () {
        $('#txtNombreER').val("");
        $('#txtFechai').val("");
        $('#txtFechaf').val("");
        $('#txtNombreER').val("");
        $('#txtIdCicloAcademicoER').val("");
        $('#accionModal').val('Nuevo');
        $('#ventanaMan').modal("show");
        $('#txtTituloModalMan').html("REGISTRAR FUNCIONARIO");
        //$('#txtTituloModalMan').html("<i class='fa fa-chevron-circle-right' aria-hidden='true'></i> REGISTRAR FUNCIONARIO");
        document.getElementsByTagName("body")[0].style.paddingRight = "0";
    });

    $('#comboTamPagina').on('change', function () {
        $("#btnBuscar").trigger("click");
    });

    valicacionesCampos();
    $('#modalCargando').modal("show");

});

function procesarAjaxFuncionarios(nombreFormulario, paginaActual) {
    var accionModalMan = $('#accionModal').val();
    var mensajeSalida = "";
    var $pagination = $('#idPaginacion');
    var defaultOpts = {
        totalPages: 10,
        visiblePages: 5,
        initiateStartPageClick: false,
        first: "<i class='fa fa-angle-double-left' aria-hidden='true'></i>",
        prev: "<i class='fa fa-angle-left' aria-hidden='true'></i>",
        next: "<i class='fa fa-angle-right' aria-hidden='true'></i>",
        last: "<i class='fa fa-angle-double-right' aria-hidden='true'></i>"
    };
    var datosSerializadosCompletos = $('#' + nombreFormulario).serialize() +
            "&NumPagina=" + $('#NumPagina').val() +
            "&comboTamPagina=" + $('#comboTamPagina').val();
    accionModalMan = accionModalMan.toLowerCase();
    switch (accionModalMan) {
        case "nuevo":
            mensajeSalida = "Ciclo Académico registrado exitosamente!";
            break;
        case "editar":
            mensajeSalida = "Ciclo Académico modificado exitosamente!";
            break;
        case "eliminar":
            mensajeSalida = "Ciclo Académico eliminado exitosamente!";
            break;
    }
    $.ajax({
        url: 'cicloacademico',
        dataType: 'json',
        type: 'POST',
        data: datosSerializadosCompletos,
        success: function (jsonResponse) {
            $('#modalCargando').modal("hide");
            var mensajeRoot = jsonResponse.MESSAGEROOT.toLowerCase();
            if (mensajeRoot === "transacction") {
                var mensajeAccion = jsonResponse.MESSAGEACTION.toLowerCase();
                if (mensajeAccion === "registrado" | mensajeAccion === "modificado" | mensajeAccion === "eliminado") {
                    listar(jsonResponse, $pagination, defaultOpts, paginaActual);
                    $('#ventanaMan').modal("hide");
                    swal(
                            {
                                title: "SisBu!",
                                text: mensajeSalida,
                                type: "success",
                                showCancelButton: false,
                                confirmButtonColor: '#3085d6',
                                confirmButtonText: "Aceptar",
                                confirmButtonClass: 'btn btn-primary',
                                buttonsStyling: false
                            }
                    );
                } else {
                    //LA RESPUESTA DE METODO
                    swal(
                            {
                                title: "SisBu!",
                                text: jsonResponse.MESSAGEACTION,
                                type: "warning",
                                showCancelButton: false,
                                confirmButtonColor: '#3085d6',
                                confirmButtonText: "Aceptar",
                                confirmButtonClass: 'btn btn-primary',
                                buttonsStyling: false
                            }
                    );
                }
            } else {
                listar(jsonResponse, $pagination, defaultOpts, paginaActual);
            }
        },
        error: function () {
            $('#modalCargando').modal("hide");
            $("#ventanaMan").modal("hide");
            /*MOSTRAMOS MENSAJE ERROR SERVIDOR*/
            swal(
                    {
                        title: "SisBu!",
                        text: "Error en el servidor",
                        type: "error",
                        showCancelButton: false,
                        confirmButtonColor: '#3085d6',
                        confirmButtonText: "Aceptar",
                        confirmButtonClass: 'btn btn-primary',
                        buttonsStyling: false
                    }
            );
        }
    });
    return false;
}

function listarFuncionarios(jsonResponse, $pagination, defaultOpts, paginaActual) {
    /*PAGINATION*/
    $('#registrosTabla').empty();
    var totalDatosFiltrados = jsonResponse.COUNT_FILTER;
    if (totalDatosFiltrados > 0) {
        var fila;
        var fechai;
        var fechaf;
        $.each(jsonResponse.DATA, function (index, value) {
            fechai = "";
            fechaf = "";
            if (value.fechai !== undefined) {
                fechai = value.fechai;
            }
            if (value.fechaf !== undefined) {
                fechaf = value.fechaf;
            }
            fila = "<tr idciclo_academico='" + value.idciclo_academico + "' fechai='" + fechai + "' fechaf='" + fechaf + "'> " +
                    "<td class='text-center align-middle'><button class='btn btn-primary btn-sm editar' title='Editar'><i class='fa fa-pencil-square-o' aria-hidden='true'></i></button></td>" +
                    "<td class='text-center align-middle'><button class='btn btn-primary btn-sm eliminar' title='Eliminar'><i class='fa fa-trash' aria-hidden='true'></i></button></td>" +
                    "<td class='align-middle'>" + value.nombre + "</td>" +
                    "<td class='text-center align-middle'>" + fechai + "</td>" +
                    "<td class='text-center align-middle'>" + fechaf + "</td>";
            fila = fila + "</tr>";
            $('#registrosTabla').append(fila);
        });
        var tamPagina = $('#comboTamPagina').val();
        var cantidadPaginas = totalDatosFiltrados / tamPagina;
        if (totalDatosFiltrados % tamPagina > 0) {
            cantidadPaginas = cantidadPaginas + 1;
        }
        $pagination.twbsPagination('destroy');
        $pagination.twbsPagination($.extend({}, defaultOpts, {
            startPage: paginaActual,
            totalPages: cantidadPaginas,
            visiblePages: 5,
            initiateStartPageClick: false,
            first: "<i class='fa fa-angle-double-left' aria-hidden='true'></i>",
            prev: "<i class='fa fa-angle-left' aria-hidden='true'></i>",
            next: "<i class='fa fa-angle-right' aria-hidden='true'></i>",
            last: "<i class='fa fa-angle-double-right' aria-hidden='true'></i>",
            onPageClick: function (evt, page) {
                $('#accionBuscar').val("Buscar");
                $('#accionModal').val("");
                $('#NumPagina').val(page);
                $('#nombreFormulario').val("FrmCicloAcademico");
                $('#modalCargando').modal("show");
            }
        }));
        agregarEventos();
    } else {
        $pagination.twbsPagination('destroy');
        swal(
                {
                    title: "SisBu!",
                    text: "No se encontraron Ciclos Académicos",
                    type: "warning",
                    showCancelButton: false,
                    confirmButtonColor: '#3085d6',
                    confirmButtonText: "Aceptar",
                    confirmButtonClass: 'btn btn-primary',
                    buttonsStyling: false
                }
        );
    }
    $('#txtNombre').focus();
}

function agregarEventos() {
    var botones = document.getElementsByClassName("editar");
    for (var i = 0; i < botones.length; i++) {
        botones[i].addEventListener("click", function () {
            var array_tr = this.parentElement.parentElement.children;
            var data = {"nombre": array_tr[2].innerText};
            $('#txtIdCicloAcademicoER').val($(this.parentElement.parentElement).attr("idciclo_academico"));
            $('#txtNombreER').val(data.nombre);
            if ($(this.parentElement.parentElement).attr("fechai") !== "") {
                $('#dateFechai').data("DateTimePicker").date(new Date(getDateJs($(this.parentElement.parentElement).attr("fechai"))));
            } else {
                $('#txtFechai').val("");
            }
            if ($(this.parentElement.parentElement).attr("fechaf") !== "") {
                $('#dateFechaf').data("DateTimePicker").date(new Date(getDateJs($(this.parentElement.parentElement).attr("fechaf"))));
            } else {
                $('#txtFechaf').val("");
            }
            $('#accionModal').val("Editar");
            $("#ventanaMan").modal("show");
            document.getElementsByTagName("body")[0].style.paddingRight = "0";
            $('#txtTituloModalMan').html("<i class='fa fa-chevron-circle-right' aria-hidden='true'></i> EDITAR CICLO ACADÉMICO");
        });
    }

    botones = document.getElementsByClassName("eliminar");
    for (var i = 0; i < botones.length; i++) {
        botones[i].addEventListener("click", function () {
            $('#txtIdCicloAcademicoER').val($(this.parentElement.parentElement).attr("idciclo_academico"));
            $("#ventanaMan").modal("hide");
            document.getElementsByTagName("body")[0].style.paddingRight = "0";
            swal(
                    {
                        title: "SisBu!",
                        text: "No se permite eliminar un Ciclo Académico",
                        type: "warning",
                        showCancelButton: false,
                        confirmButtonColor: '#3085d6',
                        confirmButtonText: "Aceptar",
                        confirmButtonClass: 'btn btn-primary',
                        buttonsStyling: false
                    }
            );
        });
    }

}

function valicacionesCamposFuncionarios() {
    $('#txtNombreER').on('change', function () {
        (this.value === "") ? $("#validarNombre").fadeIn("slow") : $("#validarNombre").fadeOut();
    });
}

function validarFormularioFuncionarios() {
    if ($('#txtNombreER').val() === "") {
        $("#validarNombre").fadeIn("slow");
        return false;
    } else {
        $("#validarNombre").fadeOut();
    }
    return true;
}

function utf8_from_str(s) {
    for (var i = 0, enc = encodeURIComponent(s), a = []; i < enc.length; ) {
        if (enc[i] === '%') {
            a.push(parseInt(enc.substr(i + 1, 2), 16))
            i += 3
        } else {
            a.push(enc.charCodeAt(i++))
        }
    }
    return a
}