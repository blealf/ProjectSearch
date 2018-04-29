###$(document).on "page:change", -> 
    $(".search-bar").focus();
    $("#search-click").click ->
        $("#search-bar").fadeToggle();
        $("#close-search").toggle();
        $(".search-input").focus();
    $("#close-search").click ->
        $("#search-bar").hide();
        $("#close-search").hide();
    $(".search-btn-top").click ->
        #window.location.href='/projects'+$("#search-param-top").val().trim()+'/index';
        $(".search-btn-top").val = $("#search-param-top").val().trim();
    $(window).scroll ->
        if $(window).scrollTop() >= 80
            $(".nav").addClass("fixed");
            $("main").addClass("div-body");
        else
            $(".nav").removeClass("fixed");
            $("main").removeClass("div-body");###



###    wrap.on("scroll", function(e) {
//        
//        if(this.scrollTop > 80){
//            wrap.addClass("nav-head2");
//        } else {
//            wrap.removeClass("nav-head2");
//        }
//    });
###