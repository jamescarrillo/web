$(document).ready(function () {

});

function viewAlert(type, message) {
    swal(
            {
                title: "",
                html: "<img src='/sisbu/img/logo_ceplomo.png' alt='Logo' style='width:150px;'><br><h5>" + message + "</h5>",
                type: type,
                showCancelButton: false,
                confirmButtonColor: '#3085d6',
                confirmButtonText: "Aceptar",
                confirmButtonClass: 'btn btn-primary',
                buttonsStyling: false
            }
    );
    $('.swal2-icon').css("margin-bottom", "20px");
}

function cargarFiltros(idimput_filter, classcheck, nameattrcheck) {
    var cadenaFiltros = "";
    $('.' + classcheck + ':checked').each(function (index, value) {
        if (index === $('.' + classcheck + ':checked').length - 1) {
            cadenaFiltros = cadenaFiltros + $(this).attr(nameattrcheck);
        } else {
            cadenaFiltros = cadenaFiltros + $(this).attr(nameattrcheck) + ",";
        }
    });
    $('#' + idimput_filter).val(cadenaFiltros);
}

function agregarValidacionesFiltrosCheck(idtodos, classchecks) {
    /*CHECKS*/
    $("#" + idtodos).change(function () {
        $("." + classchecks).prop('checked', $(this).prop("checked"));
    });

    $('.' + classchecks).click(function () {
        if ($('.' + classchecks).length === $('.' + classchecks + ':checked').length) {
            $("#" + idtodos).prop('checked', true);
        } else {
            $("#" + idtodos).prop('checked', false);
        }
    });
}
