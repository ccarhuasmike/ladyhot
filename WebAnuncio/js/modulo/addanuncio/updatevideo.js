function btn_eliminar_foto(id) {
    get_eliminar_foto(id).done(response_eliminar_foto);
}
function get_eliminar_foto(id) {
    return $.ajax({
        type: "POST",
        url: $("#url_base").val() + "UploadVideo/EliminarVideo",
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
        html += "<div class='contenedor-video'>";
        //html += "<img src='" + response[i].txt_ruta_virtuales + "' alt='Forest'>";
        html += "<video width='320' height='240' poster='/images/w3html5.gif' controls>";
        html += "<source src='" + response[i].txt_ruta_virtuales + "' type='video/mp4'>";
        html += "Your browser does not support the video tag.";
        html += "</video>";
        html += "<div class='group-button'>";
        html += "<a 'javascript:void(0);' onclick='btn_eliminar_foto(" + response[i].id + ");' class='btn btn-default btn-success btn-xs btn-block '>Eliminar</a>";
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
            url: $("#url_base").val() + "UploadVideo/GetVideoXIdAnuncio",
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

    function btn_agregar_video() {
        var object = getObjectagregar_Video();
        getagregar_videos(object).done(responseagregar_videos);
    }

    function getObjectagregar_Video() {
        var data = new FormData();
        var files = $("#file_fotos").get(0).files;
        for (var x = 0; x < files.length; x++) {
            data.append("file" + x, files[x]);
        }
        return data;
    }

    function getagregar_videos(data) {
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
            url: $("#url_base").val() + "UploadVideo/AgregarVideo?id_anuncio=" + __getSessionStorage("id_anuncio_upd"),
            contentType: false,
            processData: false,
            data: data,
            error: function (ex) {
                console.log(ex);
                alert("error function getagregar_videos");
            }
        });
    }

    function responseagregar_videos(response) {
        if (response.Status === "Ok") {
            $("#idprogress").css('display', 'none');
            $('#file_fotos').filestyle('clear');
            var response = JSON.parse(response.DataJson);
            cargar_galeria_fotos(response);
        }
    }

    function codeBehind() {
        cargarInicial();
        $("#btn_agregar_video").click(btn_agregar_video);
    }

    $(function () {
        codeBehind();
    });
}(window.jQuery, window, document));