function click_upd_anuncio(data) {        
    __AddSessionStorage('cod_anuncio_encryptado', data.cod_anuncio_encryptado);
    __AddSessionStorage('id_anuncio_upd', data.id);
    window.location.href = "/UpdAnuncio";        
}
function click_galeria_anuncio(data) {

}
function click_dar_baja_anuncio(data) {
    __AddSessionStorage('cod_anuncio_encryptado', data.cod_anuncio_encryptado);
    window.location.href = "/DarBaja";   
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

            for (var i = 0; i < response.length; i++) {
                var html = "";
                var valTokens = {
                    cod_anuncio_encryptado: response[i].cod_anuncio_encryptado,     
                    id: response[i].id            
                };
                var ValsTokens = JSON.stringify(valTokens);

                html += "<div class='listaAnuncio clearfix'>";
                html += "<a name='ref6978' id='ref6978'></a><img src='../cms/anuncios/l/guia-42766.jpg'>";
                html += "<p style='color:#f39;'><strong>Nikita</strong></p>";
                html += "<p><strong>Referencia:</strong> " + response[i].id+"</p>";
                html += "<p></p>";
                html += "<p><strong>Este anuncio esta: </strong><strong style='color:#f39;'>Pendiente de Pago</strong><a href='anunciosPromociones.php?anuncioID=6978' class='bt_pagar'>pagar ahora</a></p>";
                html += "<br>";
                html += "<p>El anuncio ha sido visitado en los últimos días: <strong>0 veces</strong></p>";
                html += "<p>Te han mandado a través del formulario de correo: <strong>0 peticiones de contacto</strong></p>";
                html += "<br>";
                html += "<p><a href='estadisticas.php?anuncioID=6978'>Estadisticas completas</a></p>";
                html += "<ul>";
                html += "<li><a href='javascript:void(0);' onclick='click_upd_anuncio(" + ValsTokens +");'>Modificar Anuncio</a></li>";
                html += "<li><a href='agendas.php?anuncioID=6978'>Agenda del anuncio</a></li>";
                html += "<li><a href='javascript:void(0);'>Fotos del anuncio</a></li>";
                html += "<li><a href='estadisticas.php?anuncioID=6978'>Estadisticas completas</a></li>";
                html += "<li><a href='videos.php?anuncioID=6978'>Videos del anuncio</a></li>";
                html += "<li><a href='javascript:void(0);' onclick='click_dar_baja_anuncio(" + ValsTokens +");'>Dar de baja el anuncio</a></li>";
                html += "</ul>";
                html += "</div>";
                $("#contenedor_mis_anuncios").append(html);
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