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
        <div class="modal fade" id="ventanaManDirectivo" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <form id="FrmDirectivoModal">
                        <div class="modal-header">
                            <h6 class="modal-title" id="txtTituloModalManDirectivo"></h6>
                            <button type="button" class="close" data-dismiss="modal"
                                    aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body p-0">
                            <ul class="nav nav-tabs" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active show" id="idItemDL" data-toggle="tab" href="#datosLaborales" role="tab" aria-selected="true"><span><i class="ti-home"></i> DATOS LABORALES</span></a>
                                </li>
                                <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#datosAdicionales" role="tab" aria-selected="false"><span><i class="ti-user"></i></span> DATOS ADICIONALES</a></li>
                            </ul>
                            <div class="tab-content tabcontent-border">
                                <div class="tab-pane p-20 active show" id="datosLaborales"
                                     role="tabpanel">
                                    <div class="row">
                                        <div class="form-group col-12 mb-3">
                                            <label for="txtNombreCompletoERDIR">NOMBRE COMPLETO</label>
                                            <input class="form-control form-control-sm" id="txtNombreCompletoERDIR" name="txtNombreCompletoERDIR" type="text" placeholder="NOMBRE COMPLETO"> 
                                        </div>
                                        <div class="form-group col-md-6 mb-3">
                                            <label for="txtDniERDIR">DNI</label>
                                            <input class="form-control form-control-sm" id="txtDniERDIR" name="txtDniERDIR" type="text" placeholder="DNI"> 
                                        </div>
                                        <div class="form-group col-md-6 mb-3">
                                            <label for="datePickerFechaDesignacionDIR">FECHA DESIGNACIÓN</label>
                                            <input type="text" class="form-control form-control-sm" id="datePickerFechaDesignacionDIR" name="datePickerFechaDesignacionDIR" placeholder="DD/MM/AAAA"> 
                                        </div>
                                        <div class="form-group col-12 mb-3">
                                            <label for="txtDesignadoPorERDIR">DESIGNADO POR</label>
                                            <input class="form-control form-control-sm" id="txtDesignadoPorERDIR" name="txtDesignadoPorERDIR" type="text" placeholder="DESIGNADO POR">
                                        </div>
                                        <div class="form-group col-12 mb-3">
                                            <label for="comboInstitucionERDIR">INSTITUCION</label>
                                            <input class="form-control form-control-sm" id="comboInstitucionERDIR" name="comboInstitucionERDIR" type="text" placeholder="INSTITUCION">
                                        </div>
                                        <div class="form-group col-md-6 mb-3">
                                            <label for="txtCargoERDIR">CARGO</label>
                                            <input class="form-control form-control-sm" id="txtCargoERDIR" name="txtCargoERDIR" type="text" placeholder="CARGO">
                                        </div>
                                        <div class="form-group col-md-6 col-12 mb-3">
                                            <label for="txtNivelERDIR">NIVEL</label>
                                            <input class="form-control form-control-sm" id="txtNivelERDIR" name="txtNivelERDIR" type="text" placeholder="NIVEL">
                                        </div>
                                        <div class="form-group col-md-6 col-12 mb-3">
                                            <label for="txtRegimenLaboralERDIR">REGIMEN LABORAL</label>
                                            <input class="form-control form-control-sm" id="txtRegimenLaboralERDIR" name="txtRegimenLaboralERDIR" type="text" placeholder="REGIMEN LABORAL">
                                        </div>
                                        <div class="form-group col-md-6 col-12 mb-3">
                                            <label for="txtRetribucionMensualERDIR">RETRIBUCIÓN MENSUAL</label>
                                            <input class="form-control form-control-sm" id="txtRetribucionMensualERDIR" name="txtRetribucionMensualERDIR" type="text" placeholder="RETRIBUCIÓN MENSUAL">
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane p-20" id="datosAdicionales" role="tabpanel">
                                    <div class="row">
                                        <div class="form-group col-lg-8 col-12 mb-3">
                                            <label for="txtProfesionERDIR">PROFESIÓN</label>
                                            <input class="form-control form-control-sm" id="txtProfesionERDIR" name="txtProfesionERDIR" type="text" placeholder="PROFESIÓN">
                                        </div>
                                        <div class="form-group col-lg-4 col-sm-6 col-12 mb-3">
                                            <label for="txtTelefonoERDIR">TELÉFONO</label>
                                            <input class="form-control form-control-sm" id="txtTelefonoERDIR" name="txtTelefonoERDIR" type="text" placeholder="TELÉFONO">
                                        </div>
                                        <div class="form-group col-lg-4 col-sm-6 col-12 mb-3">
                                            <label for="txtFaxERDIR">FAX</label>
                                            <input class="form-control form-control-sm" id="txtFaxERDIR" name="txtFaxERDIR" type="text" placeholder="FAX">
                                        </div>
                                        <div class="form-group col-lg-4 col-sm-6 col-12 mb-3">
                                            <label for="txtEmailERDIR">EMAIL</label>
                                            <input class="form-control form-control-sm" id="txtEmailERDIR" name="txtEmailERDIR" type="text" placeholder="EMAIL">
                                        </div>
                                        <div class="form-group col-lg-8 col-12 mb-3">
                                            <label for="">HOJA DE VIDA (PDF)</label>
                                            <div style="display: inline">
                                                <input id="fileCVDIR" name="fileCVDIR" type="file" style="display: none">
                                                <div class="input-group">
                                                    <input type="text" class="form-control form-control-sm" name="txtNombreCvDIR" id="txtNombreCvDIR" disabled="" maxlength="100">
                                                    <button type="button" id="btnSeleccionarCvDIR" class="btn btn-info btn-sm">
                                                        <i class="fa fa-folder-open"></i>
                                                    </button>
                                                </div>
                                            </div>
                                            <div class="text-center">
                                                <small>Seleccione Archivo < 1000 KB</small> <input type="hidden" id="txtCvDIR" name="txtCvDIR" value=""> 
                                                <input type="hidden" class="form-control form-control-sm" id="txtNombreFileResultadoActual" name="txtNombreFileResultadoActual" value="">
                                                <input type="hidden" id="txtValidacionCvDIR" name="txtValidacionCvDIR" value="">
                                                <div id="validarResultado" class="err-validation-file">Seleccione Adjunto!</div>
                                            </div>
                                        </div>
                                        <div class="form-group col-lg-4 col-12 mb-3">
                                            <label for="comboEstadoERDIR">ESTADO</label>
                                            <select id="comboEstadoERDIR" name="comboEstadoERDIR" class="form-control form-control-sm">
                                                <option value="-1">Seleccione...</option>
                                                <option value="true">ACTIVO</option>
                                                <option value="false">INACTIVO</option>
                                            </select>
                                        </div>
                                        <div class="form-group col-12 mb-3">
                                            <div class="row justify-content-sm-center">
                                                <div class="col-sm-4 col-12 text-center">
                                                    <div class="card border-primary borde-redondeado mb-2">
                                                        <div class="card-body p-2">
                                                            <div class="text-center">
                                                                <img id="visorFotoDIR" src='<%out.print(getServletContext().getContextPath());%>/peam_resources_app/conf_app/img/default_user.png' alt="user-img" class="rounded mx-auto d-block" style="width: 80px; height: 80px">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <button type="button" id="btnEliminarFotoDIR" class="btn btn-secondary btn-sm">
                                                        <i class="fa fa-trash"></i>
                                                    </button>
                                                    <div style="display: inline">
                                                        <input id="fileFotoDIR" name="fileFotoDIR" type="file" style="display: none">
                                                        <button type="button" id="btnSeleccionarFotoDIR" class="btn btn-info btn-sm">
                                                            <i class="fa fa-folder-open"></i>
                                                        </button>
                                                        <input type="hidden" id="txtNombreFotoDIR" name="txtNombreFotoDIR" value="">
                                                        <input type="hidden" id="txtValidacionFotoDIR" name="txtValidacionFotoDIR" value="">
                                                    </div>
                                                    <br><small>Seleccione FotoDIR < 1000 KB</small>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <input type="hidden" id="txtIdDirectivoERDIR" name="txtIdDirectivoERDIR" value="">
                            <input type="hidden" id="txtFechaInicioERDIR" name="txtFechaInicioERDIR" value="">
                            <input type="hidden" id="txtTratamientoERDIR" name="txtTratamientoERDIR" value="">
                            <input type="hidden" id="txtResumenERDIR" name="txtResumenERDIR" value="">
                            <div class="clearfix"></div>
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
