

(function ($, window, document) {   

    function cargarInicial() {
        getCargarInicia().done(responseCargarInicia);
    }

    function getCargarInicia() {
        return $.ajax({
            type: "POST",
            url: $("#url_base").val() + "Home/ListarAnuncio",
            data: {},
            dataType: "Json",
            async: false,
            error: function (ex) {
                console.log(ex);
            }
        });
    }

    function responseCargarInicia(response) {
        if (response.Status === "OK") {
            var response = JSON.parse(response.DataJson);
            //cargar_galeria_tops(response);
            cargar_galeria_fotos(response);         

            if ($('.js-carousel').length > 0) {
                var $carousel = $('.js-carousel').flickity({
                    freeScroll: true,
                    wrapAround: true,
                    cellAlign: 'left',
                    contain: true,
                    pageDots: false,
                    draggable: '>10'
                });
            }

        } else {

        }
    }          


    function cargar_galeria_tops(response) {
        $("#js-carousel").html("");
        var html = "";         
        //for (var e = 0; e < 5; e++) {
            for (var i = 0; i < response.length; i++) {
                var html = "";         
                var valTokens = {
                    cod_anuncio_encryptado: response[i].cod_anuncio_encryptado
                };
                var ValsTokens = JSON.stringify(valTokens);         
                html += "<div class='carousel-cell anuncios--top'>";
                html += "<a class='imagen'  href='javascript:void(0);' onclick='redirecToDetails(" + ValsTokens + ");'  title='" + response[i].txt_nombre_ficha + " Escort de  " + response[i].tx_pais_origen + ": " + response[i].txt_presentacion.substring(0, 59) + "'>";
                html += "<span class='overlay'></span>";
                html += "<div class='info text-center'>";
                html += "<h3 class='title nombre'>" + response[i].txt_nombre_ficha + "</h3>";
                html += "<span class='provincia'>" + response[i].tx_pais_origen + "</span>";
                html += "</div>";
                html += "<img class='img-responsive' alt='Ver ficha completa de " + response[i].txt_nombre_ficha + " Escort de " + response[i].tx_pais_origen + "' src='" + response[i].txt_imagen_prensetancion.split(",")[0] + "'>";
                html += "</a>";
                html += "</div>";
                $("#js-carousel").append(html);    
            }
        //}    
    } 
    
    function cargar_galeria_fotos(response) {
        $("#j_fichas").html("");
        var html = "";
        html += "<ul class='blq-list-big list-unstyled clearfix'>";
        for (var i = 0; i < response.length; i++) {   
            var valTokens = {
                cod_anuncio_encryptado: response[i].cod_anuncio_encryptado
            };
            var ValsTokens = JSON.stringify(valTokens);
            html += "<li class='col-xs-6 col-sm-4 col-md-15 col-lg-15 mg30 zona-100'>";
            
            html += "<div class='element'>";
            html += "<div class='contttttt'>";
            html += "<span class='span-top'>Top</span >";                        
            html += "</div>";                               
            html += "<div class='ficha-peq'>";                                                   
            html += "<a class='imagen' href='javascript:void(0);' onclick='redirecToDetails(" + ValsTokens +");' title='" + response[i].txt_nombre_ficha + " de " + response[i].tx_pais_origen + ": " + response[i].txt_presentacion.substring(0, 59) + "'> <img class='img-responsive' alt='Ver ficha completa de " + response[i].txt_nombre_ficha + " de " + response[i].tx_pais_origen +"' src='" + response[i].txt_imagen_prensetancion.split(",")[0] + "' data-original='" + response[i].txt_imagen_prensetancion.split(",")[1] + "' data-thumbnail='" + response[i].txt_imagen_prensetancion.split(",")[2] + "' data-path='" + response[i].txt_imagen_prensetancion.split(",")[3] +"'> </a>";
            html += "</div>";
            html += "<div class='sss'>";                       
            html += "<div class='content-info'>";
            html += "<span class='fa fa-info span-info-circle'></span >";
            html += "</div >";          
            html += "<div class='content-play'>";
            html += "<span class='fa fa-youtube-play span-info-play-circle'></span >";
            html += "</div >";                                 
            html += "</div >";                                 
            html += "<div class='description' style='margin-top: 0px;'>";
            html += "<div class='sube clearfix'>";
            html += "<div class='sube-interior clearfix'>";
            html += "<div class='izquierda text-left'>";
            html += "<a href='javascript:void(0);' onclick='redirecToDetails(" + ValsTokens +");' class='block title bold no-deco ellipsis'>" + response[i].txt_nombre_ficha+"</a>";
            html += "<span class='block subtitle'>" + response[i].tx_pais_origen +"</span>";
            html += "<ul class='list-inline clearfix'>";
            html += "<li><span class='cuadrado bg-rosa'></span> </li>";
            html += "</ul>";
            html += "</div>";
            html += "<div class='derecha'>";
            html += "<span class='rosa bold block'>" + response[i].dbl_costo_x_tiempo_1hora +" S/.</span>";
            html += "<span class='block subtitle'>1 Hora</span>";
            html += "</div>";
            html += "</div>";
            html += "</div>";
            html += "<div class='clearfix cuerpo'>";
            html += "<p class='mg20'>" + response[i].txt_presentacion.substring(0, 366)+"...</p>";
            html += "<ul class='list-unstyled specificaciones'>";
            html += "<li class='clearfix'>";
            html += "<span class='pull-left bold'>Tipo: </span><span class='rosa'>Agencia</span>";
            html += "</li>";
            html += "<li class='clearfix'><span class='pull-left bold'>Edad: </span>" + response[i].int_edad+" Años</li>";
            html += "<li class='clearfix'>";
            html += "<span class='pull-left bold'>Pais: </span>" + response[i].tx_pais_origen+"";
            html += "</li>";
            //html += "<li class='clearfix'>";
            //html += "<span class='pull-left bold'>Idiomas:</span>Italiano, Inglés, Español";
            //html += "</li>";
            
            if (response[i].tx_fl_atencion_24horas != "") {
                html += "<li class='clearfix'>";
                html += "<span class='pull-left bold'>Horarios:</span>" + response[i].tx_fl_atencion_24horas+"";
                html += "<br>";
                html += "</li>";
            }            
            html += "</ul>";
            html += "</div>";
            html += "</div>";
            html += "</div>";
            html += "</li>";
            

            //var html = "";
            //html += "<div class='contenedor-fotos'>";
            //html += "<img src='" + response[i].txt_ruta_virtuales_cortada + "' alt='Forest'>";
            //html += "<div class='group-button'>";
            //html += "<a 'javascript:void(0);' onclick='btn_eliminar_foto(" + response[i].id + ");' class='btn btn-default btn-success btn-xs btn-block myButton'>Eliminar</a>";
            //html += "</div>";
            //html += "</div>";
            
        }
        html += "</ul>";
        $("#j_fichas").append(html);
    }  
    function cerrarAvisosPolitica() {
        $("#capaAvisoPoliticaCookies_superior_mensajes").css("display", "none");        
    }                   
    //function toggleMenu() {
    //    $(this).toggleClass('navicon--active');
    //}
    


    function codeBehind() {
        //cargarInicial();                          
        responseCargarInicia(responsedata);
        $("#id_boton_cerrar_aviso_pc").click(cerrarAvisosPolitica);
        $('#navbar-toggle-resposive').on('click', function (e) {
            e.preventDefault();                 
            
            $('#collapsed-nav').slideToggle("slow");
            //$('#collapsed-nav').animate({ width: ["toggle", "swing"], height: "300px"}, 200);
            //$(this).toggleClass('navicon--active');
            //$('.toggle').toggleClass('toggle--active');
        });

    }

    $(function () {
        codeBehind();
    });
}(window.jQuery, window, document));