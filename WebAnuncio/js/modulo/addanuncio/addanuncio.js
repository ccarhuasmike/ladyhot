$('#file_fotos').filestyle({
    buttonText: 'Examinar',
    buttonName:'btn-success btn-sm'
});

/*Eliminar Fotos */
function btn_eliminar_foto(id) {
    get_eliminar_foto(id).done(response_eliminar_foto);
}

function get_eliminar_foto(id) {
    return $.ajax({
        type: "POST",
        url: $("#url_base").val() + "AddAnuncio/EliminarFoto",
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
    }else {

    }
}

function cargar_galeria_fotos(response) {
    $("#id_container_galeria").html("");
    __AddSessionStorage('cantidad_image_agregado', response.length);
    for (var i = 0; i < response.length; i++) {
        var html = "";
        html += "<div class='contenedor-fotos'>";
        html += "<img src='" + response[i].txt_ruta_virtuales_cortada+"' alt='Forest'>";
        html += "<div class='group-button'>";
        html += "<a 'javascript:void(0);' onclick='btn_eliminar_foto(" + response[i].id + ");' class='btn btn-primary btn-xs  btn-block myButton'>Eliminar</a>";
        html += "</div>";
        html += "</div>";
        $("#id_container_galeria").append(html);
    }

}
                                                 
(function ($, window, document) {             

    function cargarInicial() {
        getCargarInicia().done(responseCargarInicia);         
    }    

    function getCargarInicia() {
        return $.ajax({
            type: "POST",
            url: $("#url_base").val() + "Parameter/getCargarControles_Add",
            data: {},
            dataType: "Json",
            async: false,   
            error: function (ex) {
                alert("error function getCargarInicia");
            }            
        });
    }
    
    function responseCargarInicia(response) {        
        if (response.Status === "OK") {
            var response = JSON.parse(response.DataJson);
            loadCombos(response);
            loadCheckoxes(response);
        }else {

        }          
    }        

    //Primer paso
    function primerpaso() {          
        if (__getSessionStorage("id_anuncio_val") != null) {
            var object = getObjectUpdatePrimerpaso();
            getupdateprimerpaso(object).done(responseupdateprimerpaso);
        } else {
            var object = getObjectPrimerpaso();
            getprimerpaso(object).done(responseprimerpaso);
        }                  
    }

    function getObjectPrimerpaso() {
        var txt_nombre = $("#txt_nombre").val();
        var txt_telefono_1 = $("#txt_telefono_1").val();
        var txt_telefono_2 = $("#txt_telefono_2").val();
        var txt_email = $("#txt_email").val();
        var txt_web = $("#txt_web").val();        
        var cbo_edad = $("#cbo_edad").val();
        var cbo_pais = $("#cbo_pais").val();
        var cbo_estudios = $("#cbo_estudios").val();
        var txt_presentacion = $("#txt_presentacion").val();              
        var oregistro = {}
        oregistro = {
            txt_nombre_ficha: txt_nombre,
            txt_telefono_1: txt_telefono_1,
            txt_telefono_2: txt_telefono_2,
            txt_email: txt_email,
            txt_web: txt_web,
            int_edad: parseInt(cbo_edad),
            int_pais_origen: parseInt(cbo_pais),
            int_estudios: parseInt(cbo_estudios),
            txt_presentacion: txt_presentacion,
            id_usuario: parseInt(__getSessionStorage('id_usuario'))
        };
        return oregistro;
    }

    function getObjectUpdatePrimerpaso() {
        var txt_nombre = $("#txt_nombre").val();
        var txt_telefono_1 = $("#txt_telefono_1").val();
        var txt_telefono_2 = $("#txt_telefono_2").val();
        var txt_email = $("#txt_email").val();
        var txt_web = $("#txt_web").val();
        var cbo_edad = $("#cbo_edad").val();
        var cbo_pais = $("#cbo_pais").val();
        var cbo_estudios = $("#cbo_estudios").val();
        var txt_presentacion = $("#txt_presentacion").val();
        var oregistro = {}
        oregistro = {
            txt_nombre_ficha: txt_nombre,
            txt_telefono_1: txt_telefono_1,
            txt_telefono_2: txt_telefono_2,
            txt_email: txt_email,
            txt_web: txt_web,
            int_edad: parseInt(cbo_edad),
            int_pais_origen: parseInt(cbo_pais),
            int_estudios: parseInt(cbo_estudios),
            txt_presentacion: txt_presentacion,
            id_usuario: parseInt(__getSessionStorage('id_usuario')),
            id: parseInt(__getSessionStorage("id_anuncio_val"))
        };
        return oregistro;
    }

    function getupdateprimerpaso(data) {
        return $.ajax({
            type: "POST",
            url: $("#url_base").val() + "AddAnuncio/ActualizarPrimerpaso",
            contentType: "application/json",
            dataType: "Json",
            data: JSON.stringify(data),
            async: false,
            error: function (ex) {
                alert("error function getprimerpaso");
            }
        });
    }

    function responseupdateprimerpaso(response) {
        if (response.Status === "OK") {
            var response = JSON.parse(response.DataJson);
        }
    }    
    
    function getprimerpaso(data) {              
        return $.ajax({
            type: "POST",             
            url: $("#url_base").val() + "AddAnuncio/Primeropaso",
            contentType: "application/json",               
            dataType: "Json",
            data: JSON.stringify(data),
            async: false,
            error: function (ex) {
                alert("error function getprimerpaso");
            }
        });
    }

    function responseprimerpaso(response) {
        if (response.Status === "OK") {
            var response = JSON.parse(response.DataJson); 
            __AddSessionStorage('id_anuncio_val', response[0].id);
            //Alert.success("El archivo seleccionado es inválido , los archivos válidos son de tipo");
        }
    }                 
    //Segundo paso
    function segundopaso() {
        var object = getObjectSegundopaso();
        getsegundopaso(object).done(responsesegundopaso);
    }

    function getObjectSegundopaso() {
        var cbo_pelo = $("#cbo_pelo").val();
        var cbo_ojos = $("#cbo_ojos").val();
        var cbo_estatura = $("#cbo_estatura").val();
        var cbo_peso = $("#cbo_peso").val();
        var txt_medidas_busto = $("#txt_medidas_busto").val();
        var txt_medidas_cintura = $("#txt_medidas_cintura").val();
        var txt_medidas_cadera = $("#txt_medidas_cadera").val();
        var txt_descripcion = $("#txt_descripcion").val();

        var oregistro = {}
        oregistro = {
            id: parseInt(__getSessionStorage("id_anuncio_val")),
            int_color_cabello: cbo_pelo,
            int_color_ojos: cbo_ojos,
            int_peso: cbo_peso,
            int_estatura: cbo_estatura,
            txt_medidas_busto_cintura_cadera: txt_medidas_busto + "," + txt_medidas_cintura + "," + txt_medidas_cadera,
            txt_descripcion_extra_apariencia: txt_descripcion
        };
        return oregistro;
    }

    function getsegundopaso(data) {
        return $.ajax({
            type: "POST",
            async: false,
            url: $("#url_base").val() + "AddAnuncio/Segundopaso",
            contentType: "application/json",
            dataType: "Json",
            data: JSON.stringify(data),             
            error: function (ex) {
                alert("error function getprimerpaso");
            }
        });
    }

    function responsesegundopaso(response) {
        if (response.Status === "OK") {
            var response = JSON.parse(response.DataJson);
        } else {

        }
    }

    //Tercero paso
    function terceropaso() {
        var object = getObjectTercerpaso();
        gettercerpaso(object).done(responsetercerpaso);
    }

    function getObjectTercerpaso() {       
        var txt_30_min = $("#txt_30_min").val();
        var txt_45_min = $("#txt_45_min").val();
        var txt_1_hora = $("#txt_1_hora").val();
        var txt_1_30_hora = $("#txt_1_30_hora").val();  
        var txt_2_hora = $("#txt_2_hora").val();
        var txt_3_hora = $("#txt_3_hora").val();
        var txt_salida_hora = $("#txt_salida_hora").val();
        var txt_toda_noche = $("#txt_toda_noche").val();
        var txt_viajes = $("#txt_viajes").val();
        var chk_forma_pagos = getValueElementoSelected('chk_forma_pagos[]');
        var txt_descripcion_tarifa = $("#txt_descripcion_tarifa").val();
        //1: seleccionado
        //0: no seleccionado
        var chk_atiende_24_hora = 0; //Atiendes las 24hs?	
        if ($('#chk_24horas').is(':checked')) {
            chk_atiende_24_hora = 1;
        }           
        //return false;

        var chk_distrito = getValueElementoSelected('chk_distrito[]');
       
        var txt_descripcion_extra_horario = $("#txt_descripcion_extra_horario").val();
        var chk_lugar_atencion = getValueElementoSelected('chk_lugar_atencion[]');
        var chk_servicio_ofrece = getValueElementoSelected('chk_servicio_ofrece[]');
        var tx_descripcion_extra_servicio = $("#tx_descripcion_extra_servicio").val();   
        var oregistro = {}
        oregistro = {                   
            id: parseInt(__getSessionStorage("id_anuncio_val")),
            dbl_costo_x_tiempo_30min: parseFloat(txt_30_min ),
            dbl_costo_x_tiempo_45min: parseFloat(txt_45_min),
            dbl_costo_x_tiempo_1hora: parseFloat(txt_1_hora),
            dbl_costo_x_tiempo_1hora_media: parseFloat(txt_1_30_hora),
            dbl_costo_x_tiempo_2hora: parseFloat(txt_2_hora),
            dbl_costo_x_tiempo_3hora: parseFloat(txt_3_hora),
            dbl_costo_x_tiempo_salidas: parseFloat(txt_salida_hora),
            dbl_costo_x_tiempo_toda_noche: parseFloat(txt_toda_noche),
            dbl_costo_x_viaje: parseFloat(txt_viajes),                   
            txt_forma_pago: chk_forma_pagos,
            txt_descripcion_extra_tarifa: txt_descripcion_tarifa,
            txt_lugar_servicio_distrito: chk_distrito,
            fl_atencion_24horas: chk_atiende_24_hora,
            tx_descripcion_extra_horario: txt_descripcion_extra_horario,
            tx_lugar_atencion: chk_lugar_atencion,
            tx_servicios_ofrece: chk_servicio_ofrece,
            tx_descripcion_extra_servicio: tx_descripcion_extra_servicio             
        };
        return oregistro;
    }

    function gettercerpaso(data) {
        return $.ajax({
            type: "POST",           
            url: $("#url_base").val() + "AddAnuncio/Tercerpaso",
            contentType: "application/json",
            dataType: "Json",
            data: JSON.stringify(data),
            async: false,
            error: function (ex) {
                alert("error function gettercerpaso");
            }
        });
    }

    function responsetercerpaso(response) {
        if (response.Status === "OK") {
            var response = JSON.parse(response.DataJson);
        } else {

        }
    }

    //Tercero paso
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

    function getagregar_fotos(data) {
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
            url: $("#url_base").val() + "AddAnuncio/AgregarFotos?id=" + __getSessionStorage("id_anuncio_val"),         
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

    function regexEmail() {
        var txt_email = $("#txt_email");
        var regex = /^[a-zA-Z0-9_.-]+@[a-zA-Z0-9]+[a-zA-Z0-9.-]+[a-zA-Z0-9]+.[a-z]{1,4}$/;
        if (!regex.test(txt_email.val())) {
            txt_email.val("");            
            txt_email.addClass('input-error');
            return false;             
        }                        
    }

    function regexWeb() {        
        var input = $("#txt_web");
        var val = input.val();
        if (val && !val.match(/^http([s]?):\/\/.*/)) {
            input.val('https://' + val);
        }
    }           

    function regexNumber(event) {
        var valor = $("#" + event.currentTarget.id + "");
        valor.val(valor.val().replace(/[^\d].+/, ""));
        if ((event.which < 48 || event.which > 57)) {
            event.preventDefault();
        }
    }

    function codeBehind() { 
        cargarInicial();
        $("#btn_primerpaso").click(primerpaso);
        $("#btn_segundopaso").click(segundopaso);
        $("#btn_terceropaso").click(terceropaso);
        $("#btn_agregar_imagen").click(btn_agregar_fotos);          
        
        /*onblur*/
        $("#txt_email").blur(regexEmail);       
        $("#txt_web").blur(regexWeb);                                   
        $("#txt_medidas_busto").on("keypress keyup blur", regexNumber);
        $("#txt_medidas_cintura").on("keypress keyup blur", regexNumber);
        $("#txt_medidas_cadera").on("keypress keyup blur", regexNumber);
        $("#txt_30_min").on("keypress keyup blur", regexNumber);
        $("#txt_45_min").on("keypress keyup blur", regexNumber);
        $("#txt_1_hora").on("keypress keyup blur", regexNumber);
        $("#txt_1_30_hora").on("keypress keyup blur", regexNumber);
        $("#txt_2_hora").on("keypress keyup blur", regexNumber);
        $("#txt_3_hora").on("keypress keyup blur", regexNumber);
        $("#txt_salida_hora").on("keypress keyup blur", regexNumber);
        $("#txt_toda_noche").on("keypress keyup blur", regexNumber);
        $("#txt_viajes").on("keypress keyup blur", regexNumber);

        //$('input[rel="txtTooltip"]').tooltip();

    }

    $(function () {
        codeBehind();
    });
}(window.jQuery, window, document));