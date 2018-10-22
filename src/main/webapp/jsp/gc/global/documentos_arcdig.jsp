<%-- 
    Document   : modal_documentos_arcdig
    Created on : 21/10/2018, 01:33:36 PM
    Author     : James Carrillo
--%>

<div class="modal fade" id="ventanaDocumentosArcDig" data-backdrop="static" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
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
                        <div class="form-group col-lg-5 col-md-6 col-12 mb-3">
                            <select id="comboEtiquetasDocumentosArcDig" name="comboEtiquetasDocumentosArcDig" class="form-control form-control-sm combo-paginar mr-3" idBtnBuscar='btnBuscarDocumento'>

                            </select>
                        </div>
                        <div class="form-group col-lg-2 col-md-6 col-12 mb-3">
                            <select id="comboAnioDocumentosArcDig" name="comboAnioDocumentosArcDig" class="form-control form-control-sm combo-paginar mr-3" idBtnBuscar='btnBuscarDocumento'>

                            </select>
                        </div>
                        <div class="input-group col-lg-5 col-12 mb-3">
                            <input type="text" name="txtTituloResumenDocumentosArcDig" id="txtTituloResumenDocumentosArcDig" class="form-control form-control-sm mr-3" placeholder="TÍTULO O RESUMEN">
                            <button type="submit" id="btnBuscarDocumentoArcDig" class="btn waves-effect waves-light btn-info btn-sm mr-3" data-toggle="tooltip" title="Buscar Funcionario" style="height: 31px"><i class="fas fa-search" aria-hidden="true"></i> BUSCAR</button>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <div class="table-responsive" id="tablaDocumentosArcDig">
                                <table
                                    class="table color-bordered-table muted-bordered-table table-hover">
                                    <thead>
                                        <tr>
                                            <th style="width: 25%">TÍTULO</th>
                                            <th>RESUMEN</th>
                                            <th colspan="3">ACCIONES</th>
                                        </tr>
                                    </thead>
                                    <tbody id="tbodyDocumentosArcDig">
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <div class="card "
                                 style="height: 50px; margin-bottom: 0px">
                                <div class="card-body"
                                     style="padding-top: 10px; padding-bottom: 10px">
                                    <div class="row">
                                        <div class="col-md-2 col-sm-3 col-4">
                                            <select id="sizePageDocumentosArcDig" name="sizePageDocumentosArcDig" class="form-control form-control-sm combo-paginar" idBtnBuscar='btnBuscarDocumentoArcDig'>
                                                <option value="10">10</option>
                                                <option value="15">15</option>
                                                <option value="20">20</option>
                                            </select>
                                        </div>
                                        <div class="col-md-10 col-sm-9 col-8">
                                            <nav aria-label="Page navigation example">
                                                <ul id="paginationDocumentosArcDig"
                                                    class="pagination pagination-sm justify-content-end">

                                                </ul>

                                            </nav>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
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