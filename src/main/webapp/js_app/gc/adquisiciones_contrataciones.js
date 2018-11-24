$(document).ready(function () {

    $('.btn-abrir-modal').click(function () {
        $('#' + $(this).attr('idmodal')).modal('show');
    });
});