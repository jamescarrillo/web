$(document).ready(function () {

    $('#map-grsm').click(function () {
        document.querySelector('#containerDynamicOrganigrama').innerHTML = '';
        let grsm = 
        `
        <h5 class="text-peam-verde text-peam-negrita" style="margin-top: 15px;">
                        GOBIERNO REGIONAL DE SAN MARTÍN
                    </h5>
                    <div class="col-md-7 col-xs-12">
                        <div class="row" style="margin-top: 20px;">
                            <div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2 col-xs-10 col-xs-offset-1 mt-20 mb-10">
                                <a href="http://www.regionsanmartin.gob.pe/"><img src="${document.querySelector('#pathLogoGORESAM').value}" class="img-responsive" alt="Imagen"></a>
                            </div>
                            <div class="col-xs-12">
                                <h5 class="">
                                    El Proyecto Especial Alto Mayo (PEAM) es una unidad ejecutora del Gobierno Regional de San Martín desde el 
                                    09 de setiembre del año 2003, fecha en que mediante D.S. Nº. 024-2003-VIVIENDA se dispone su transferencia 
                                    definitiva desde el Instituto Nacional de Desarrollo (INADE).
                                    <a href="http://lib.peam.gob.pe:8081/ArcDig/OriArc.pdf?id=26794">Ver Documento de Aprobación</a>
                                </h5>
                            </div>
                        </div>
                    </div>
        `;
        document.querySelector('#containerDynamicOrganigrama').innerHTML = grsm;
    });

    $('#map-consejo-directivo').click(function () {
        setDirectivos();
    });
    
    $('#map-gerencia').click(function () {
        setFuncionario("GERENCIA GENERAL");
    });
    
    $('#map-oci').click(function () {
        setFuncionario("ORGANO DE CONTROL INSTITUCIONAL");
    });
    
    $('#map-administracion').click(function () {
        setFuncionario("OFICINA DE ADMINISTRACION");
    });
    
    $('#map-opp').click(function () {
        setFuncionario("OFICINA DE PRESUPUESTO Y PLANIFICACION");
    });
    
    $('#map-asesoria').click(function () {
        setFuncionario("OFICINA DE ASESORIA JURIDICA");
    });
    
    $('#map-dma').click(function () {
        setFuncionario("DIRECCION DE MANEJO AMBIENTAL");
    });    
    
    $('#map-infraestructura').click(function () {
        setFuncionario("DIRECCION DE INFRAESTRUCTURA");
    });
    
     $('#map-agropecuaria').click(function () {
        setFuncionario("DIRECCION DE DESARROLLO AGROPECUARIO");
    });  
    
    $('#map-grsm').trigger('click');
    
    procesarAjaxOrganigramaWeb();

});

var funcionarios;
var directivos;

function procesarAjaxOrganigramaWeb() {
    $.ajax({
        url: getContext() + '/gestiontransparente/recursos-humanos',
        type: 'POST',
        data: "action=getDataOrganigrama",
        dataType: 'json',
        success: function (jsonResponse) {
            //console.log(jsonResponse);
            directivos = jsonResponse.DATA_DIRECTIVOS.LIST;
            list_funcionarios = jsonResponse.DATA_FUNCIONARIOS.LIST;
            //console.log(jsonResponse.DATA_DIRECTIVOS.LIST);
            //console.log(jsonResponse.DATA_FUNCIONARIOS.LIST);
        },
        error: function () {
            viewAlertWeb('error', 'Error interno en el servidor!');
        }
    });
    return false;
}


function setFuncionario(organigrama) {
    document.querySelector('#containerDynamicOrganigrama').innerHTML = '';
    for (var i = 0; i < list_funcionarios.length; i++) {
        if (organigrama === list_funcionarios[i].organigrama) {
            var funcionario = list_funcionarios[i];
            div_HTML = 
            `
            <h3>${organigrama}</h3>
                    <div class="col-md-7 col-xs-12">
                        <div class="row col-xs-12" style="border: 3px solid;color: #00793D">
                            <div class="col-sm-4">
                                <img class="img-responsive" style="border: 3px solid;color: #00793D;height: 180px; width: 200px; margin-top: 30px; margin-left: 5px" 
                                     src="/web/peam_resources_app/conf_app/DirectivoFuncionario/img/${funcionario.foto}" 
                                     alt="Image">
                            </div>
                            <div class="col-sm-8" style="margin-top: 20px; margin-bottom: 20px">
                                <h5><strong>Nombres y Apellidos: </strong>${funcionario.nombres_apellidos}</h5>
                                <h5><strong>Número de D.N.I: </strong>${funcionario.numero_dni}</h5>
                                <h5><strong>Cargo: </strong>${funcionario.cargo}</h5>
                                <h5><strong>Nivel Remunerativo: </strong>${funcionario.nivel_remunerativo}</h5>
                                <h5><strong>Designado Por: </strong>${funcionario.resolucion}</h5>
                                <h5><strong>Teléfono: </strong>${funcionario.telefono}</h5>
                                <h5><strong>Correo Electrónico: </strong>${funcionario.e_mail}</h5>
                                <h5><strong>Hoja de Vida: </strong><a target="_blank" href="/web/downloadfile?type_file=downloadCV&full_file=n&file=${funcionario.hoja_vida}"><i class="fa fa-download" aria-hidden="true"></i> Descargar</a></h5>
                                <h5><strong>Régimen Laboral: </strong>${funcionario.regimen_laboral}</h5>
                            </div>
                        </div>
                    </div>
            `;
            document.querySelector('#containerDynamicOrganigrama').innerHTML = div_HTML;
            break;
        }
    }
}

function setDirectivos() {
    document.querySelector('#containerDynamicOrganigrama').innerHTML = '';
    let div_general = `
        <div class="col-md-7 col-xs-12">
            <h3>CONSEJO DIRECTIVO</h3>
            <div class="panel-group feature-accordion brand-accordion icon angle-icon" id="tab-consejo-directivo">
    `;
    let i = 1;
    let html_representantes = "";
    for (let it = 0; it < directivos.length; it++) {
        let directivo = directivos[it];
        i++;
        if (directivo.cargo.toLowerCase() === "presidente del consejo") {
            
            div_general +=
                    `
            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title">
                                        <a class="collapsed" data-toggle="collapse" data-parent="#tab" href="#tab-presidente" aria-expanded="false">
                                            ${directivo.nombres_apellidos}
                                        </a>
                                    </h3>
                                </div>
                                <div id="tab-presidente" class="panel-collapse collapse" aria-expanded="false" style="">
                                    <div style="margin-left: 15px; margin-right: 15px">
                                        <div class="row" style="border: 3px solid;color: #00793D">
                                            <div class="col-sm-4">
                                                <img class="img-responsive" style="border: 3px solid;color: #00793D;height: 180px; width: 200px; margin-top: 5px;margin-left: 5px;margin-bottom: 5px;" 
                                                    src="/web/peam_resources_app/conf_app/DirectivoFuncionario/img/${directivo.foto}" 
                                                     alt="Image">
                                            </div>
                                            <div class="col-sm-8" style="margin-top: 20px; margin-bottom: 20px">
                                                <h5><strong>Cargo: </strong>${directivo.cargo}</h5>
                                                <h5><strong>Designado Por: </strong>${directivo.resolucion}</h5>
                                                <h5><strong>Representante de: </strong>${directivo.institucion}</h5>
                                                <h5><strong>Correo Electrónico: </strong>${directivo.e_mail}</h5>
                                                <h5><strong>Hoja de Vida: </strong><a target="_blank" href="/web/downloadfile?type_file=downloadCV&full_file=n&file=${directivo.hoja_vida}"><i class="fa fa-download" aria-hidden="true"></i> Descargar</a></h5>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

            `;
            
        } else {
            html_representantes +=
                    `
            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title">
                                        <a class="collapsed" data-toggle="collapse" data-parent="#tab" href="#tab-representante-${i}" aria-expanded="false">
                                            ${directivo.nombres_apellidos}
                                        </a>
                                    </h3>
                                </div>
                                <div id="tab-representante-${i}" class="panel-collapse collapse" aria-expanded="false">
                                    <div style="margin-left: 15px; margin-right: 15px">
                                        <div class="row" style="border: 3px solid;color: #00793D">
                                            <div class="col-sm-4">
                                                <img class="img-responsive" style="border: 3px solid;color: #00793D;height: 180px; width: 200px; margin-top: 5px;margin-left: 5px;margin-bottom: 5px;" 
                                                    src="/web/peam_resources_app/conf_app/DirectivoFuncionario/img/${directivo.foto}" 
                                                     alt="Image">
                                            </div>
                                            <div class="col-sm-8" style="margin-top: 20px; margin-bottom: 20px">
                                                <h5><strong>Cargo: </strong>${directivo.cargo}</h5>
                                                <h5><strong>Designado Por: </strong>${directivo.resolucion}</h5>
                                                <h5><strong>Representante de: </strong>${directivo.institucion}</h5>
                                                <h5><strong>Correo Electrónico: </strong>${directivo.e_mail}</h5>
                                                <h5><strong>Hoja de Vida: </strong><a target="_blank" href="/web/downloadfile?type_file=downloadCV&full_file=n&file=${directivo.hoja_vida}"><i class="fa fa-download" aria-hidden="true"></i> Descargar</a></h5>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                    `;
            
            
        }
    }

    div_general += html_representantes;
    div_general += `
            </div>
        </div>`;
    document.querySelector('#containerDynamicOrganigrama').innerHTML = div_general;

}