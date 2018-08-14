function btn_dar_baja(data) {
    get_dar_baja(data).done(response_dar_baja);
}
function get_dar_baja(data) {
    return $.ajax({
        type: "POST",
        url: $("#url_base").val() + "DarBaja/Upd_dar_baja",
        data: { anuncio_token: data.cod_anuncio_encryptado},
        dataType: "Json",
        async: false,
        error: function (ex) {
            alert("error function get_dar_baja");
        }
    });
}

function response_dar_baja(response) {
    if (response.Status === "OK") {
        var response = JSON.parse(response.DataJson);        
        location.href = '/MisAnuncio';
    }
}

(function ($, window, document) {

    function cargarDetAnuncion() {
        getcargarDetAnuncion().done(responsegetcargarDetAnuncion);
    }
    function getcargarDetAnuncion() {
        return $.ajax({
            type: "POST",
            url: $("#url_base").val() + "DarBaja/GetAnuncio_x_tokens",
            data: { token_anuncio: __getSessionStorage("cod_anuncio_encryptado") },
            dataType: "Json",
            async: false,
            error: function (ex) {
                alert("error getcargarDetAnuncion ");
            }
        });
    }

    function responsegetcargarDetAnuncion(response) {        
        if (response.Status === "OK") {     
            debugger;
            var response = JSON.parse(response.DataJson);
            var valTokens = {
                cod_anuncio_encryptado: response.cod_anuncio_encryptado
            };
            var ValsTokens = JSON.stringify(valTokens);

            var html = "";
            html += "<div class='col-sm-4'>";
            html += "<img src='" + response.txt_imagen_prensetancion+"' alt='Forest'>";
            html += "</div>";
            html += "<div class='col-sm-8' >";
            html += "<div class='form-group form-group-sm'>";
            html += "<p class='parrafo-left' for='tx_descripcion_extra_servicio'>" + response.txt_nombre_ficha+"</p>";
            html += "<p>";
            html += "<strong class='rosa'>ANTENCIÓN!</strong>";
            html += "<br>Al proceder a Borrar se eliminarán todas las estadisticas del anuncio así como cualqueir tipo de foto,video existente y relacionado al mismo.";
            html += "</p>";
            html += "</div>";
            html += "<div class='divider' ></div > ";
            html += "<div class='form-group form-group-sm'>";
            html += "<button type='button' onclick='javascript:history.back();' class='btn btn-primary btn-xs  btn-block myButton'>cancelar</button>";
            html += "<button type='button' onclick='btn_dar_baja(" + ValsTokens +");'  class='btn btn-primary btn-xs  btn-block myButton'>Borrar</button>";
            html += "</div>";
            html += "</div>";
            $("#contenedor_dar_baja").append(html);
        }
    }

    function codeBehind() {
        cargarDetAnuncion();
        //$("#btn_dar_baja").click(btn_dar_baja);
    }
    $(function () {
        codeBehind();
    });
}(window.jQuery, window, document));