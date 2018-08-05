(function ($, window, document) {
    function btn_dar_baja() {          
        get_dar_baja().done(response_dar_baja);
    }
    function get_dar_baja() {
        return $.ajax({
            type: "POST",           
            url: $("#url_base").val() + "DarBaja/upd_dar_baja",
            data: { anuncio_token: __getSessionStorage("cod_anuncio_encryptado") },
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
            console.log(response);
            location.href = '/MisAnuncio';
        }
    }

    function codeBehind() {  
        $("#btn_dar_baja").click(btn_dar_baja);
        
    }          
    $(function () {
        codeBehind();
    });
}(window.jQuery, window, document));