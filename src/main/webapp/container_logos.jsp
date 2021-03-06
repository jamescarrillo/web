<div class="container">
    <div class="row" style="margin-top: 5px; margin-bottom: 5px" id="row_logos_lg">
        <div class="col-md-2" style="width: 150px;margin-left: 120px;">
            <a href="<%out.print(conf_web.getUrl_logo_goresam());%>" target="_blank">
                <img class="img-responsive" src="<%out.print(getServletContext().getContextPath());%>/peam_resources/logos_principales/<%out.print(conf_web.getNombre_logo_goresam());%>" alt="" style="height: 70px;margin-top: 5px"/>
            </a>
        </div>     
        <div class="col-md-6" style="padding-top: 25px">
            <a href="<%out.print(getServletContext().getContextPath());%>/index">
                <img class="img-responsive" src="<%out.print(getServletContext().getContextPath());%>/peam_resources/logos_principales/<%out.print(conf_web.getNombre_logo_peam());%>" alt=""/>
            </a>
        </div>
        <div class="col-md-2" style="padding-top: 10px;width: 160px">
            <a href="<%out.print(conf_web.getUrl_logo_portal());%>" target="_blank">
                <img class="img-responsive" src="<%out.print(getServletContext().getContextPath());%>/peam_resources/logos_principales/<%out.print(conf_web.getNombre_logo_portal());%>" alt=""/>
            </a>
        </div>
    </div>
    <div class="row" id="row_logos_md" style="display: none">
        <div class="col-md-2 col-md-offset-1" style="width: 150px; margin-top: 10px; margin-bottom: 10px;">
            <a href="<%out.print(conf_web.getUrl_logo_goresam());%>" target="_blank">
                <img class="img-responsive" src="<%out.print(getServletContext().getContextPath());%>/peam_resources/logos_principales/<%out.print(conf_web.getNombre_logo_goresam());%>" alt="" style="height: 60px"/>
            </a>
        </div>
        <div class="col-md-6" style="padding-top: 25px">
            <a href="<%out.print(getServletContext().getContextPath());%>/index">
                <img class="img-responsive" src="<%out.print(getServletContext().getContextPath());%>/peam_resources/logos_principales/<%out.print(conf_web.getNombre_logo_peam());%>" alt="" style="height: 40px"/>
            </a>
        </div>
        <div class="col-md-3" style="padding-top: 10px;width: 160px">
            <a href="<%out.print(conf_web.getUrl_logo_portal());%>" target="_blank">
                <img class="img-responsive" src="<%out.print(getServletContext().getContextPath());%>/peam_resources/logos_principales/<%out.print(conf_web.getNombre_logo_portal());%>" alt=""/>
            </a>
        </div>
    </div>
    <div class="row" id="row_logos_sm" style="display: none">
        <div class="col-sm-2 col-sm-offset-1" style="width: 140px; margin-top: 10px; margin-bottom: 10px; margin-left: 40px">
            <a href="<%out.print(conf_web.getUrl_logo_goresam());%>" target="_blank">
                <img class="img-responsive" src="<%out.print(getServletContext().getContextPath());%>/peam_resources/logos_principales/<%out.print(conf_web.getNombre_logo_goresam());%>" alt="" style="height: 50px"/>
            </a>
        </div>
        <div class="col-sm-6 col-xs-7" style="padding-top: 25px">
            <a href="<%out.print(getServletContext().getContextPath());%>/index">
                <img class="img-responsive" src="<%out.print(getServletContext().getContextPath());%>/peam_resources/logos_principales/<%out.print(conf_web.getNombre_logo_peam());%>" alt="" style="height: 30px"/>
            </a>
        </div>
        <div class="col-sm-3 col-xs-2" style="padding-top: 10px;width: 160px">
            <a href="<%out.print(conf_web.getUrl_logo_portal());%>" target="_blank">
                <img class="img-responsive" src="<%out.print(getServletContext().getContextPath());%>/peam_resources/logos_principales/<%out.print(conf_web.getNombre_logo_portal());%>" alt=""/>
            </a>
        </div>
    </div>
    <div class="row" id="row_logos_xs" style="display: none">
        <div class="col-sm-6 col-sm-offset-3 col-xs-8 col-xs-offset-2" style="padding-top: 15px">
            <a href="<%out.print(getServletContext().getContextPath());%>/index">
                <img class="img-responsive" src="<%out.print(getServletContext().getContextPath());%>/peam_resources/logos_principales/<%out.print(conf_web.getNombre_logo_peam());%>" alt="" style="height: 30px"/>
            </a>
        </div>
    </div>
</div>
