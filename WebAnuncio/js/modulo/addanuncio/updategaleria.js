function btn_eliminar_foto(id) {
    get_eliminar_foto(id).done(response_eliminar_foto);
}
function get_eliminar_foto(id) {
    return $.ajax({
        type: "POST",
        url: $("#url_base").val() + "updGaleria/EliminarFoto",
        data: { id_galeria: id },
        dataType: "Json",
        async: false,
        error: function (ex) {
            alert("error function get_dar_baja");
        }
    });
}     

function response_eliminar_foto(response) {
    if (response.Status === "OK") {
        var response = JSON.parse(response.DataJson);
        cargar_galeria_fotos(response);
    }
}

function cargar_galeria_fotos(response) {
    $("#id_container_galeria").html("");
    for (var i = 0; i < response.length; i++) {
        var html = "";
        html += "<div class='contenedor-fotos'>";
        html += "<img src='" + response[i].txt_ruta_virtuales_cortada + "' alt='Forest'>";
        html += "<div class='group-button'>";
        html += "<a 'javascript:void(0);' onclick='btn_eliminar_foto(" + response[i].id + ");' class='btn btn-default btn-success btn-xs btn-block myButton'>Eliminar</a>";
        html += "</div>";
        html += "</div>";
        $("#id_container_galeria").append(html);
    }              
}

$('#file_fotos').filestyle({
    buttonText: 'Examinar',
    buttonName: 'btn-success btn-sm'
});

(function ($, window, document) {

    function cargarInicial() {
        getCargarInicia().done(responseCargarInicia);
    }

    function getCargarInicia() {
        return $.ajax({
            type: "POST",
            url: $("#url_base").val() + "updGaleria/getGeleriaXIdAnuncio",
            data: { id_anuncio: parseInt(__getSessionStorage("id_anuncio_upd")) },
            dataType: "Json",
            async: false,
            error: function (ex) {
                alert("error function getCargarInicia");
            }
        });
    }

    function responseCargarInicia(response) {
        if (response.Status === "Ok") {
            var response = JSON.parse(response.DataJson);
            cargar_galeria_fotos(response);           
        }
    }                

    function btn_agregar_fotos() {
        var object = getObjectagregar_fotos();
        getagregar_fotos(object).done(responseagregar_fotos);
    }

    function getObjectagregar_fotos() {
        var data = new FormData();
        var files = $("#file_fotos").get(0).files;
        for (var x = 0; x < files.length; x++) {
            data.append("file" + x, files[x]);
        }
        return data;
    }

    function getagregar_fotos(data) {    3
        $("#idprogress").css('display', 'block');
        return $.ajax({
            xhr: function () {
                var xhr = new window.XMLHttpRequest();
                //Upload Progress
                xhr.upload.addEventListener("progress", function (evt) {
                    if (evt.lengthComputable) {
                        var percentComplete = (evt.loaded / evt.total) * 100;
                        $('div.progress > div.progress-bar').css({ "width": percentComplete + "%" });
                        //$('div.progress > div.progress-bar').html(percentComplete + '%');
                    }
                }, false);
                //Download progress
                xhr.addEventListener("progress", function (evt) {
                    if (evt.lengthComputable) {
                        var percentComplete = (evt.loaded / evt.total) * 100;
                        $("div.progress > div.progress-bar").css({ "width": percentComplete + "%" });
                        //$('div.progress > div.progress-bar').html(percentComplete + '%');
                    }
                },
                    false);
                return xhr;
            },
            type: "POST",
            url: $("#url_base").val() + "updGaleria/AgregarFotos?id_anuncio=" + __getSessionStorage("id_anuncio_upd"),
            contentType: false,
            processData: false,
            data: data,
            error: function (ex) {
                alert("error function getagregar_fotos");
            }
        });
    }

    function responseagregar_fotos(response) {
        if (response.Status === "Ok") {
            $("#idprogress").css('display', 'none');
            $('#file_fotos').filestyle('clear');
            var response = JSON.parse(response.DataJson);
            cargar_galeria_fotos(response);
        }
    }

    function codeBehind() {
        cargarInicial();
        $("#btn_agregar_imagen").click(btn_agregar_fotos);           
    }     

    $(function () {
        codeBehind();
    });
}(window.jQuery, window, document));