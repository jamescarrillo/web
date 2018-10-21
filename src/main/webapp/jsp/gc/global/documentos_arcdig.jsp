<%-- 
    Document   : modal_documentos_arcdig
    Created on : 21/10/2018, 01:33:36 PM
    Author     : James Carrillo
--%>

<div class="modal fade" id="ventanaDocumentosArcDig" data-backdrop="static" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <form id="FrmDocumentosArcDig">
                <div class="modal-header">
                    <h6 class="modal-title" id="txtTituloModalDocumentosArcDig"></h6>
                    <button type="button" class="close" data-dismiss="modal"
                            aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="row">

                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-outline-secondary btn-sm" data-dismiss="modal">CANCELAR</button>
                    <button type="submit" id="btnSeleccionarDocumentoArcDig" class="btn btn-outline-info btn-sm">
                        <i class="fa fa-floppy-o"></i> SELECCIONAR
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>

<div class="modal fade" id="modalCargandoDocumentosArcDig" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-hidden="true" style="padding-top: 18%; overflow-y: visible;">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-body">
                <div class="progress" style="margin-bottom: 0px;">
                    <div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 100%">
                        Cargando...
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>