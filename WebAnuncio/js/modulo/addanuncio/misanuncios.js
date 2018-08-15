function click_upd_anuncio(data) {        
    __AddSessionStorage('cod_anuncio_encryptado', data.cod_anuncio_encryptado);
    __AddSessionStorage('id_anuncio_upd', data.id);
    window.location.href = "/UpdAnuncio";        
}
function click_galeria_anuncio(data) {
    __AddSessionStorage('id_anuncio_upd', data.id);
    window.location.href = "/UpdGaleria";      
}
function click_dar_baja_anuncio(data) {
    __AddSessionStorage('cod_anuncio_encryptado', data.cod_anuncio_encryptado);
    window.location.href = "/DarBaja";   
}
function click_videos_anuncio(data) {
    __AddSessionStorage('id_anuncio_upd', data.id);
    window.location.href = "/UploadVideo";
}                           

(function ($, window, document) {

    function cargarInicial() {
        getCargarInicia().done(responseCargarInicia);
    }

    function getCargarInicia() {
        return $.ajax({
            type: "POST",
            url: $("#url_base").val() + "MisAnuncio/GetMisanuncios",
            data: { usuario_token: __getSessionStorage('usuario_token') },
            dataType: "Json",
            async: false,
            error: function (ex) {
                alert("error getCargarInicia ");
            }
        });
    }



    function responseCargarInicia(response) {
        if (response.Status === "OK") {
            var response = JSON.parse(response.DataJson);   
            $("#id_container_mis_anuncios").html("");
            for (var i = 0; i < response.length; i++) {
                var html = "";
                var valTokens = {
                    cod_anuncio_encryptado: response[i].cod_anuncio_encryptado,     
                    id: response[i].id            
                };
                var ValsTokens = JSON.stringify(valTokens);

                html += "<div class='form-group form-group-sm'>";
                html += "<div class='col-sm-4'>";
                html += "<div class=''>";
                html += "<img src='" + response[i].txt_imagen_prensetancion +"' alt='Forest'>";
                html += "</div>";
                html += "</div>";
                html += "<div class='col-sm-8' >";
                html += "<div class='form-group form-group-sm' style='line-height: 24px;'>";
                html += "<p class='parrafo-left' for='tx_descripcion_extra_servicio'><strong>" + response[i].txt_nombre_ficha +"</strong></p>";
                html += "<p class='parrafo-left' for='tx_descripcion_extra_servicio'>Referencia: :</strong> " + response[i].id +"</p>";
                html += "<p class='parrafo-left' for='tx_descripcion_extra_servicio'>Este anuncio esta: <strong>Pendiente de Pago</strong> </p>";
                html += "<p class='parrafo-left' for='tx_descripcion_extra_servicio'>El anuncio ha sido visitado en los últimos días: 0 veces</p>";
                html += "<p class='parrafo-left' for='tx_descripcion_extra_servicio'>Te han mandado a través del formulario de correo: 0 peticiones de contacto</p>";
                html += "</div>";                                        
                html += "<div class='form-group form-group-sm'>";
                html += "<a  href='javascript:void(0);' onclick='click_upd_anuncio(" + ValsTokens +");'     class='btn btn-primary btn-xs  btn-block myButton'>Modificar Anuncio</button>";
                html += "<a  href='javascript:void(0);' onclick='click_galeria_anuncio(" + ValsTokens +");' class='btn btn-primary btn-xs  btn-block myButton'>Fotos del anuncio</button>";
                html += "<a  href='javascript:void(0);' onclick='click_videos_anuncio(" + ValsTokens +");'   class='btn btn-primary btn-xs btn-block myButton' >Videos del anuncio</button>";
                //html += "<a  class='btn btn-primary btn-xs  btn-block myButton'>Estadisticas completas</button>";
                html += "<a  href='javascript:void(0);' onclick='click_dar_baja_anuncio(" + ValsTokens +");' class='btn btn-primary btn-xs  btn-block myButton'>Dar de baja el anuncio</button>";
                html += "</div>";
                html += "</div>";
                html += "</div>";
                html += "<div class='divider'></div>";
                //html += "<div class='listaAnuncio clearfix'>";
                //html += "<a name='ref6978' id='ref6978'></a><img src='../cms/anuncios/l/guia-42766.jpg'>";
                //html += "<p style='color:#f39;'><strong>" + response[i].txt_nombre_ficha +"</strong></p>";
                //html += "<p><strong>Referencia:</strong> " + response[i].id+"</p>";
                //html += "<p></p>";
                //html += "<p><strong>Este anuncio esta: </strong><strong style='color:#f39;'>Pendiente de Pago</strong><a href='anunciosPromociones.php?anuncioID=6978' class='bt_pagar'>pagar ahora</a></p>";
                //html += "<br>";
                //html += "<p>El anuncio ha sido visitado en los últimos días: <strong>0 veces</strong></p>";
                //html += "<p>Te han mandado a través del formulario de correo: <strong>0 peticiones de contacto</strong></p>";
                //html += "<br>";
                //html += "<p><a href='estadisticas.php?anuncioID=6978'>Estadisticas completas</a></p>";
                //html += "<ul>";
                //html += "<li><a href='javascript:void(0);' onclick='click_upd_anuncio(" + ValsTokens +");'>Modificar Anuncio</a></li>";
                //html += "<li><a href='agendas.php?anuncioID=6978'>Agenda del anuncio</a></li>";
                //html += "<li><a href='javascript:void(0);'>Fotos del anuncio</a></li>";
                //html += "<li><a href='estadisticas.php?anuncioID=6978'>Estadisticas completas</a></li>";
                //html += "<li><a href='videos.php?anuncioID=6978'>Videos del anuncio</a></li>";
                //html += "<li><a href='javascript:void(0);' onclick='click_dar_baja_anuncio(" + ValsTokens +");'>Dar de baja el anuncio</a></li>";
                //html += "</ul>";
                //html += "</div>";
                $("#id_container_mis_anuncios").append(html);
            }

            
        }
    }     

    function codeBehind() {
        cargarInicial();
    }

    $(function () {
        codeBehind();
    });
}(window.jQuery, window, document));