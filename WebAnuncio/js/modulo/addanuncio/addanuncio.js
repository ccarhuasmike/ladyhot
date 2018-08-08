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
    }
}

function cargar_galeria_fotos(response) {
    $("#id_container_galeria").html("");
    for (var i = 0; i < response.length; i++) {
        var html = "";
        //var valTokens = {
        //    id: response[i].id
        //};
        //var ValsTokens = JSON.stringify(valTokens);
        html += "<div class='contenedor-fotos'>";
        html += "<img src='" + response[i].txt_ruta_virtuales+"' alt='Forest'>";
        html += "<div class='group-button'>";
        html += "<a 'javascript:void(0);' onclick='btn_eliminar_foto(" + response[i].id + ");' class='myButton'>Eliminar</a>";
        html += "</div>";
        html += "</div>";
        $("#id_container_galeria").append(html);
    }

}


(function ($, window, document) {             

    var listInicial = [];
    var HTML = "";
    var cod_anuncion_encriptado;
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
        }          
    }     
    //Primer paso
    function primerpaso() {             
        var object = getObjectPrimerpaso();
        getprimerpaso(object).done(responseprimerpaso);
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

    function getprimerpaso(data) {              
        return $.ajax({
            type: "POST",             
            url: $("#url_base").val() + "AddAnuncio/primeropaso",
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
            //$("#id_anuncio_val").val(response[0].id);
            __AddSessionStorage('id_anuncio_val', response[0].id);
            console.log(response);
            alert("alert function responseprimerpaso");              
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
            url: $("#url_base").val() + "AddAnuncio/segundopaso",
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
            console.log(response);
            alert("alert function responsesegundopaso");
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
            url: $("#url_base").val() + "AddAnuncio/tercerpaso",
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
            console.log(response[0]);
            alert("alert function responsesegundopaso");
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
        return $.ajax({
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
            $('#file_fotos').filestyle('clear');
            var response = JSON.parse(response.DataJson);
            cargar_galeria_fotos(response);
            //console.log(response[0]);
            //alert("alert function responseagregar_fotos");
        }
    }

    function codeBehind() { 
        cargarInicial();
        $("#btn_primerpaso").click(primerpaso);
        $("#btn_segundopaso").click(segundopaso);
        $("#btn_terceropaso").click(terceropaso);
        $("#btn_agregar_imagen").click(btn_agregar_fotos);           
    }

    $(function () {
        codeBehind();
    });
}(window.jQuery, window, document));