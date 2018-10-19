$(document).ready(function () {
    
    $('#datePickerFechaER').datepicker({
        format: 'dd/mm/yyyy',
        todayHighlight: true,
        autoclose: true
    });
    
    $('#datePickerHoraInicioER').datepicker({
        format: 'HH:mm',
        todayHighlight: true,
        autoclose: true
    });
    
    $('#datePickerHoraFinER').datepicker({
        format: 'HH:mm',
        todayHighlight: true,
        autoclose: true
    });
    
    $("#FrmActividades").submit(function () {
        /*
        $("#nameForm").val("FrmFuncionarios");
        $("#numberPageFuncionarios").val(1);
        $('#actionFuncionarios').val("paginarFuncionario");
        $('#modalCargandoFuncionarios').modal("show");
        */
        return false;
    });
    
    $("#FrmActividadModal").submit(function () {
        /*
        $("#nameForm").val("FrmFuncionarios");
        $("#numberPageFuncionarios").val(1);
        $('#actionFuncionarios').val("paginarFuncionario");
        $('#modalCargandoFuncionarios').modal("show");
        */
        return false;
    });
    
    $("#modalCargandoFuncionarios").on('shown.bs.modal', function () {
        //DESPUES DE TERMINAR DE MOSTRAR EL MODAL
        cargarLista();
    });

    $('#btnAbrirNuevaActividad').click(function () {
        $("#txtTituloModalManActividad").html("REGISTRAR ACTIVIDAD");
        $("#ventanaManActividad").modal("show");
    });

    $("#modalCargandoFuncionarios").modal("show");

});

function cargarLista() {
    $("#modalCargandoFuncionarios").modal("hide");
    viewAlert('warning', 'No se encontraron registros');
}