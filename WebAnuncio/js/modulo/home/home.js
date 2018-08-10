function redirecToDetails() {
    var tempId = "A3EFCCEA-354F-4C0C-AC0B-2DC72247C1F2";
    var url = "../Details?id=" + tempId;
    window.location.href = url;
}

function redirecToAnunciate() {
    var url = "../Tarifas";
    window.location.href = url;
}                     
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
            cargar_galeria_fotos(response);  
        } else {

        }
    }          

    function cargar_galeria_fotos(response) {
        $("#j_fichas").html("");
        var html = "";
        html += "<ul class='blq-list-big list-unstyled clearfix'>";
        for (var i = 0; i < response.length; i++) {                   
            html += "<li class='col-xs-6 col-sm-4 col-md-15 col-lg-15 mg30 zona-100'>";
            html += "<div class='element'>";
            html += "<div class='ficha-peq'>";
            html += "<a class='imagen' href='javascript:void(0);' onclick='redirecToDetails();' title='Sofia teen Escort de Barcelona: Estamos más que encantados de presentarte a nuestra Sofia,'> <img class='img-responsive' alt='Ver ficha completa de Sofia teen Escort de Barcelona' src='" + response[i].txt_imagen_prensetancion.split(",")[0] + "' data-original='" + response[i].txt_imagen_prensetancion.split(",")[1] + "' data-thumbnail='" + response[i].txt_imagen_prensetancion.split(",")[2] + "' data-path='" + response[i].txt_imagen_prensetancion.split(",")[2] +"'> </a>";
            html += "</div>";
            html += "<div class='description' style='margin-top: 0px;'>";
            html += "<div class='sube clearfix'>";
            html += "<div class='sube-interior clearfix'>";
            html += "<div class='izquierda text-left'>";
            html += "<a href='javascript:void(0);' onclick='redirecToDetails();' class='block title bold no-deco ellipsis'>Sofia teen</a>";
            html += "<span class='block subtitle'>Barcelona</span>";
            html += "<ul class='list-inline clearfix'>";
            html += "<li><span class='cuadrado bg-rosa'></span> </li>";
            html += "</ul>";
            html += "</div>";
            html += "<div class='derecha'>";
            html += "<span class='rosa bold block'>150€</span>";
            html += "<span class='block subtitle'>1 Hora</span>";
            html += "</div>";
            html += "</div>";
            html += "</div>";
            html += "<div class='clearfix cuerpo'>";
            html += "<p class='mg20'>Estamos más que encantados de presentarte a nuestra Sofia, una estudiante universitaria de Colombia que está realizando servicios como escort a tiempo parcial. Una auténtica chica buena que ha decidido empezar a ser un poco mala y traviesa. Su cara permanece oculta por motivos de privacidad, pero te sorprenderá la luminosidad de sus ojos, su sonrisa incitante, su...</p>";
            html += "<ul class='list-unstyled specificaciones'>";
            html += "<li class='clearfix'>";
            html += "<span class='pull-left bold'>Tipo: </span><span class='rosa'>Agencia</span>";
            html += "</li>";
            html += "<li class='clearfix'><span class='pull-left bold'>Edad: </span>18 Años</li>";
            html += "<li class='clearfix'>";
            html += "<span class='pull-left bold'>Pais: </span>COLOMBIA";
            html += "</li>";
            html += "<li class='clearfix'>";
            html += "<span class='pull-left bold'>Idiomas:</span>Italiano, Inglés, Español";
            html += "</li>";
            html += "<li class='clearfix'>";
            html += "<span class='pull-left bold'>Horarios:</span>Atiende las 24 horas";
            html += "<br>";
            html += "</li>";
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


    function codeBehind() {
        cargarInicial();
    }

    $(function () {
        codeBehind();
    });
}(window.jQuery, window, document));