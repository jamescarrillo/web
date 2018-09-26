<%@page import="gob.peam.web.model.Usuario"%>
<div class="row page-titles">
    <div class="col-md-5 col-8 align-self-center">
        <ol class="breadcrumb">
            <li class="breadcrumb-item text-primary" style="cursor: pointer"><a>PEAM</a></li>
            <li class="breadcrumb-item active" style="cursor: pointer"><%out.print(((Usuario) request.getSession().getAttribute("user")).getPersona().getPers_nombre() + " " + ((Usuario) request.getSession().getAttribute("user")).getPersona().getPers_apellido_paterno());%></li>
        </ol>
    </div>
    <div class="col-md-7 col-4 align-self-center">
        <div class="d-flex m-t-10 justify-content-end">
            <div class="">
                <button class="right-side-toggle waves-effect waves-light btn-success btn btn-circle btn-sm pull-right m-l-10"><i class="ti-settings text-white"></i></button>
            </div>
        </div>
    </div>
    <div class="col-md-5 col-8 align-self-center">
    </div>
</div>