//var $carousel = $('#id_carusel').flickity({
//    asNavFor: '.carousel-main',
//    contain: true,
//    pageDots: false,
//    adaptiveHeight: true,
//    imagesLoaded: true,
//    lazyLoad: true
//});



/*,
    fullscreen: true,
    lazyLoad: 1*/

$(document).on("mouseenter", ".element .sube", function (e) {
    // $('.element .sube').mouseenter(function () {
    var element = $(this).closest('.element');
    var blockHeight = element.height();
    var headerHeight = $(this).height();
    element.find('.description').animate({
        'margin-top': -(blockHeight - headerHeight)
    });
});
$(document).on("mouseleave", ".element", function (e) {
    // $('.element').mouseleave(function () {
    $(this).find('.description').animate({
        'margin-top': "0px"
    });
});

(function ($, window, document) {         

    function cargarInicial() {
        getCargarInicia().done(responseCargarInicia);
    }

    function getCargarInicia() {
        return $.ajax({
            type: "POST",
            url: $("#url_base").val() + "Details/GetDetailsAnuncio",
            data: { cod_anuncio_encryptado: __getSessionStorage('cod_anuncio_encryptado_details')},
            dataType: "Json",
            async: false,
            error: function (ex) {
                console.log(ex);
            }
        });
    }

    function responseCargarInicia(response) {
        if (response.Status === "OK") {
            var responseDetails = JSON.parse(response.Data.DetailsAnuncion.DataJson);
            var responseCargaInicial = JSON.parse(response.Data.ListCargarInicial.DataJson);
            cargar_galeria_fotos(responseDetails.txt_imagen_prensetancion);
            $("#container-presentacion").append(responseDetails.txt_presentacion);
            cargar_container_servicios(responseDetails.tx_servicios_ofrece);
            cargar_container_distrito(responseDetails.txt_lugar_servicio_distrito);
            cargar_container_informacion(responseDetails);
            cargar_container_tarifa(responseDetails);     
            cargar_container_fichas(responseCargaInicial);
        } else {

        }
    }  
    function cargar_container_fichas(response) {
        $("#container-fichas-anuncio").html("");
        if (response.length > 0) {
            for (var i = 0; i < response.length; i++) {
                var html = "";
                var valTokens = {
                    cod_anuncio_encryptado: response[i].cod_anuncio_encryptado
                };
                var ValsTokens = JSON.stringify(valTokens);                
                html += "<li class='col-xs-6 col-sm-4 col-md-2 col-lg-2 mg30'>";
                html += "<div class='element'>";
                html += "<div class='imagen-wrapper'>";
                html += "<a href='javascript:void(0);' onclick='redirecToDetails(" + ValsTokens +");'>";
                html += "<img src='" + response[i].txt_imagen_prensetancion.split(",")[0] + "' alt='Sample' class='img-responsive'>";
                html += "</a>";
                html += "</div>";
                html += "<div class='description'>";
                html += "<ul class='sube list-unstyled clearfix'>";
                html += "<li class='izquierda text-left'>";
                html += "<a href='javascript:void(0);' onclick='redirecToDetails(" + ValsTokens + ");' class='no-deco bold block ellipsis'>" + response[i].txt_nombre_ficha + "</a>";
                html += "<span class='ft12 block'>" + response[i].tx_pais_origen +"</span>";
                html += "</li>";
                html += "<li class='derecha text-left'>";
                html += "<span class='rosa bold block'>" + response[i].dbl_costo_x_tiempo_1hora +" S/.</span>";
                html += "<span class='ft12 block'>1 Hora</span>";
                html += "</li>";
                html += "</ul>";
                html += "<div class='clearfix cuerpo'>" + response[i].txt_presentacion.substring(0, 366) +"...</div>";
                html += "</div>";
                html += "</div>";
                html += "</li>";  
                $("#container-fichas-anuncio").append(html);
            }
        }
        
    }
    function cargar_container_servicios(data) {
        $("#container-servicios").html("");
        var list = data.split(",");
        if (list.length > 0) {
            for (var i = 0; i < list.length; i++) {
                var valor = list[i].split("-")[1]; 
                var html = "";
                html += "<li><a href='javascript:void(0);' title='" + valor +"' target='_blank'>" + valor+"</a></li>"
                $("#container-servicios").append(html);
            }
        }      
    }
    function cargar_container_distrito(data) {
        $("#container-distrito-atencion").html("");
        var list = data.split(",");
        if (list.length > 0) {
            for (var i = 0; i < list.length; i++) {
                var valor = list[i].split("-")[1];
                var html = "";
                html += "<li><a href='javascript:void(0);' title='" + valor + "' target='_blank'>" + valor + "</a></li>"
                $("#container-distrito-atencion").append(html);
            }
        }
    }

    function cargar_container_informacion(data) {
        $("#container-informacion").html("");
        var html = "";              
        if (data.int_edad > 0) {
            html += "<li class='clearfix'>";
            html += "<span class='pull-left'>Edad</span>";
            html += "<span class='pull-right' > <strong>" + data.int_edad+" Años</strong></span >";
            html += "</li>";
        }                   
        if (data.tx_pais_origen != "") {
            html += "<li class='clearfix'>";
            html += "<span class='pull-left'>Pais</span>";
            html += "<span class='pull-right'><strong>" + data.tx_pais_origen+"</strong></span>";
            html += "</li>";
        }
        if (data.tx_estudio != "") {
            html += "<li class='clearfix'>";
            html += "<span class='pull-left'>Estudio</span>";
            html += "<span class='pull-right'><strong>" + data.tx_estudio+"</strong></span>";
            html += "</li>";
        } 
        if (data.tx_color_ojos != "") {
            html += "<li class='clearfix'>";
            html += "<span class='pull-left'>Color Ojos</span>";
            html += "<span class='pull-right'><strong>" + data.tx_color_ojos + "</strong></span>";
            html += "</li>";
        }      
        
        if (data.tx_color_cabello != "") {
            html += "<li class='clearfix'>";
            html += "<span class='pull-left'>Color Cabello</span>";
            html += "<span class='pull-right'><strong>" + data.tx_color_cabello + "</strong></span>";
            html += "</li>";
        }     
        if (data.txt_medidas_busto_cintura_cadera != "") {
            var list_medidas = data.txt_medidas_busto_cintura_cadera.split(",");
            html += "<li class='clearfix'>";
            html += "<span class='pull-left'>Medidas (Busto-Cintura-Caderas</span>";
            html += "<span class='pull-right'><strong>" + list_medidas[0] + " - " + list_medidas[1] + " - " + list_medidas[2] +"</strong></span>";
            html += "</li>";
        }        
        $("#container-informacion").append(html);      
    }

    function cargar_container_tarifa(data) {
        $("#container-tarifa").html("");        
        var html = "";                  
        var tx_costo_x_tiempo_30min = data.dbl_costo_x_tiempo_30min == 0 ? "Consultar" : "S/. "+ data.dbl_costo_x_tiempo_30min;
        var tx_costo_x_tiempo_45min = data.dbl_costo_x_tiempo_45min == 0 ? "Consultar" : "S/. " +data.dbl_costo_x_tiempo_45min;
        var tx_dbl_costo_x_tiempo_1hora = data.dbl_costo_x_tiempo_1hora == 0 ? "Consultar" : "S/. " +data.dbl_costo_x_tiempo_1hora;
        var tx_dbl_costo_x_tiempo_1hora_media = data.dbl_costo_x_tiempo_1hora_media == 0 ? "Consultar" : "S/. " +data.dbl_costo_x_tiempo_1hora_media;
        var tx_dbl_costo_x_tiempo_2hora = data.dbl_costo_x_tiempo_2hora == 0 ? "Consultar" : "S/. " +data.dbl_costo_x_tiempo_2hora;
        var tx_dbl_costo_x_tiempo_3hora = data.dbl_costo_x_tiempo_3hora == 0 ? "Consultar" : "S/. " +data.dbl_costo_x_tiempo_3hora;
        var tx_dbl_costo_x_tiempo_salidas = data.dbl_costo_x_tiempo_salidas == 0 ? "Consultar" : "S/. " +data.dbl_costo_x_tiempo_salidas;
        var tx_dbl_costo_x_tiempo_toda_noche = data.dbl_costo_x_tiempo_toda_noche == 0 ? "Consultar" : "S/. " +data.dbl_costo_x_tiempo_toda_noche;
        var tx_dbl_costo_x_viaje = data.dbl_costo_x_viaje == 0 ? "Consultar" : "S/. " +data.dbl_costo_x_viaje;

        html += "<li class='clearfix'><span class='pull-left'>30 Minutos</span><span class='pull-right'><strong>" + tx_costo_x_tiempo_30min +" </strong></span></li>";
        html += "<li class='clearfix'><span class='pull-left'>45 Minutos</span><span class='pull-right'><strong>" + tx_costo_x_tiempo_45min +"</strong></span></li>";
        html += "<li class='clearfix'><span class='pull-left'>1 Hora</span><span class='pull-right'><strong>" + tx_dbl_costo_x_tiempo_1hora +"</strong></span></li>";
        html += "<li class='clearfix'><span class='pull-left'>1 Hora y media</span><span class='pull-right'><strong>" + tx_dbl_costo_x_tiempo_1hora_media +"</strong></span></li>";
        html += "<li class='clearfix'><span class='pull-left'>2 Horas</span><span class='pull-right'><strong>" + tx_dbl_costo_x_tiempo_2hora +"</strong></span></li>";
        html += "<li class='clearfix'><span class='pull-left'>3 Horas</span><span class='pull-right'><strong>" + tx_dbl_costo_x_tiempo_3hora +"</strong></span></li>";
        html += "<li class='clearfix'><span class='pull-left'>Salidas</span><span class='pull-right'><strong>" + tx_dbl_costo_x_tiempo_salidas +"</strong></span></li>";
        html += "<li class='clearfix'><span class='pull-left'>Toda la noche</span><span class='pull-right'><strong>" + tx_dbl_costo_x_tiempo_toda_noche +"</strong></span></li>";
        html += "<li class='clearfix'><span class='pull-left'>Viajes</span><span class='pull-right'><strong> " + tx_dbl_costo_x_viaje + "</strong></span></li>";    
        if (data.txt_forma_pago != "") {
            html += "<li class='clearfix'><span class='pull-left'>Forma de Pago:</span><span class='pull-right'><strong>" + data.txt_forma_pago + "</strong></span></li>";    
        }        
        $("#container-tarifa").append(html);
    }

    
    function cargar_galeria_fotos(response) {
        $("#id_carusel").html("");
        //$("#container-fotos-seccion-1").html("");
        //$("#container-fotos-seccion-2").html("");
        var list = response.split(",");
        var contador = 0;
        if (list.length > 0) {
            
            for (var i = 0; i < list.length; i++) {       
                var htmlaux = "";
                htmlaux += "<div class='carousel-cell'>";
                htmlaux += "<img src='" + list[i] + "' alt='orange tree' data-flickity-lazyload='" + list[i] + "' />";
                htmlaux += "</div>";
                $("#id_carusel").append(htmlaux);                                                               
            }

            var $carousel = $('#id_carusel').flickity({
                
                contain: true,
                pageDots: false,
                fullscreen: true,
                imagesLoaded: true,
                //autoPlay: 1500,
                pauseAutoPlayOnHover: false,
                adaptiveHeight: true
            });
        }             
    }                   

    function codeBehind() {
        cargarInicial();
    }

    $(function () {
        codeBehind();
    });
}(window.jQuery, window, document));