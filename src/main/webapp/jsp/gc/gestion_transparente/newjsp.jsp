<%-- 
    Document   : newjsp
    Created on : 26/10/2018, 12:21:31 PM
    Author     : JhanxD
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>


        <div class="modal fade" id="ventanaManDocumentCal" data-backdrop="static" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" style="z-index: 2000;">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <form id="FrmDocumentCalModal">
                        <div class="modal-header">
                            <h6 class="modal-title" id="txtTituloModalManDocumentCal"></h6>
                            <button type="button" class="close" data-dismiss="modal"
                                    aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="form-group col-12 mb-3">
                                    <label for="txtNombreERDC">NOMBRE</label>
                                    <input class="form-control form-control-sm" id="txtNombreERDC" name="txtNombreERDC" type="text" placeholder="NOMBRE"> 
                                </div>
                                <div class="form-group col-12 mb-3">
                                        <label for="">ARCHIVO</label>
                                        <div style="display: inline">
                                            <input id="fileArchivo" name="fileArchivo" type="file" style="display: none">
                                            <div class="input-group">
                                                <input type="text" class="form-control form-control-sm" name="txtNombreArchivoERDC" id="txtNombreArchivoERDC" disabled="" maxlength="100">
                                                <button type="button" id="btnSeleccionarArchivo" class="btn btn-info btn-sm">
                                                    <i class="fa fa-folder-open"></i>
                                                </button>
                                            </div>
                                        </div>
                                        <div class="text-center">
                                            <small>Seleccione Archivo < 1000 KB</small> <input type="hidden" id="txtCv" name="txtCv" value=""> 
                                            <input type="hidden" class="form-control form-control-sm" id="txtNombreFileResultadoActual" name="txtNombreFileResultadoActual" value="">
                                            <input type="hidden" id="txtValidacionCv" name="txtValidacionCv" value="">
                                            <div id="validarResultado" class="err-validation-file">Seleccione Adjunto!</div>
                                        </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-outline-secondary btn-sm" data-dismiss="modal">CANCELAR</button>
                            <button type="submit" id="btnGuardar" class="btn btn-outline-info btn-sm">
                                <i class="fa fa-floppy-o"></i> GUARDAR
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>



    </body>
</html>
