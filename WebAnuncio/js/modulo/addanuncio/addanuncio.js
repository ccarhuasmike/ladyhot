function scroll_to_class(element_class, removed_height) {
    var scroll_to = $(element_class).offset().top - removed_height;
    if ($(window).scrollTop() != scroll_to) {
        $('html, body').stop().animate({ scrollTop: scroll_to }, 0);
    }
}

function bar_progress(progress_line_object, direction) {
    var number_of_steps = progress_line_object.data('number-of-steps');
    var now_value = progress_line_object.data('now-value');
    var new_value = 0;
    if (direction == 'right') {
        new_value = now_value + (100 / number_of_steps);
    }
    else if (direction == 'left') {
        new_value = now_value - (100 / number_of_steps);
    }
    progress_line_object.attr('style', 'width: ' + new_value + '%;').data('now-value', new_value);
}
      
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


    $('.f1 fieldset:first').fadeIn('slow');

    $('.f1 input[type="text"], .f1 input[type="password"], .f1 textarea, .f1 select').on('focus', function () {
        $(this).removeClass('input-error');
    });

    // next step
    $('.f1 .btn-next').on('click', function () {
        var parent_fieldset = $(this).parents('fieldset');
        var next_step = true;
        // navigation steps / progress steps
        var current_active_step = $(this).parents('.f1').find('.f1-step.active');
        var progress_line = $(this).parents('.f1').find('.f1-progress-line');

        // fields validation
        // fields validation del primero paso
        if (parent_fieldset.attr("id") == 'fieldset_primero_paso') {
            parent_fieldset.find('input[type="text"], input[type="password"], textarea , select').each(function () {
                if (
                    $(this).attr("id") == 'txt_nombre' ||
                    $(this).attr("id") == 'txt_telefono_1' ||
                    $(this).attr("id") == 'txt_telefono_2' ||
                    $(this).attr("id") == 'txt_email' ||
                    $(this).attr("id") == 'cbo_edad' ||
                    $(this).attr("id") == 'cbo_pais' ||
                    $(this).attr("id") == 'cbo_estudios' ||
                    $(this).attr("id") == 'txt_presentacion'
                ) {
                    if ($(this).val() == "" || $(this).val() == "0") {
                        $(this).addClass('input-error');
                        next_step = false;
                    }
                    else {
                        $(this).removeClass('input-error');                        
                    }
                }

            });
            if (next_step){
                primerpaso();
            }
        }

        // fields validation del segundo paso
        if (parent_fieldset.attr("id") == 'fieldset_segundo_paso') {
            parent_fieldset.find('input[type="text"], input[type="password"], textarea , select').each(function () {
                if (
                    $(this).attr("id") == 'cbo_pelo' ||
                    $(this).attr("id") == 'cbo_ojos' ||
                    $(this).attr("id") == 'cbo_estatura' ||
                    $(this).attr("id") == 'cbo_peso' ||
                    $(this).attr("id") == 'txt_medidas_busto' ||
                    $(this).attr("id") == 'txt_medidas_cintura' ||
                    $(this).attr("id") == 'txt_medidas_cadera'
                ) {
                    if ($(this).val() == "" || $(this).val() == "0") {
                        $(this).addClass('input-error');
                        next_step = false;
                    }
                    else {
                        $(this).removeClass('input-error');
                    }
                }
            });    
            if (next_step) {
                segundopaso();
            }
        }

        if (parent_fieldset.attr("id") == 'fieldset_tercer_paso') {
            parent_fieldset.find('input[type="text"], input[type="password"], textarea , select').each(function () {
                if (
                    $(this).attr("id") == 'txt_30_min' ||
                    $(this).attr("id") == 'txt_45_min' ||
                    $(this).attr("id") == 'txt_1_hora' ||
                    $(this).attr("id") == 'txt_1_30_hora' ||
                    $(this).attr("id") == 'txt_2_hora' ||
                    $(this).attr("id") == 'txt_3_hora' ||
                    $(this).attr("id") == 'txt_salida_hora' ||
                    $(this).attr("id") == 'txt_toda_noche' ||
                    $(this).attr("id") == 'txt_viajes'
                ) {
                    if ($(this).val() == "") {
                        $(this).addClass('input-error');
                        next_step = false;
                    }
                    else {
                        $(this).removeClass('input-error');
                    }
                }
            });
            if (next_step) {
                terceropaso();
            }
        }

        if (parent_fieldset.attr("id") == 'fieldset_cuarto_paso') {
            parent_fieldset.find('input[type="text"], input[type="password"], textarea , select').each(function () {
                if (
                    parseInt(__getSessionStorage("cantidad_image_agregado")) < 3
                ) {
                    next_step = false;
                }
            });          
        }
        // fields validation   
        if (next_step) {
            parent_fieldset.fadeOut(400, function () {
                // change icons
                current_active_step.removeClass('active').addClass('activated').next().addClass('active');
                // progress bar
                bar_progress(progress_line, 'right');
                // show next step
                $(this).next().fadeIn();
                // scroll window to beginning of the form
                scroll_to_class($('.f1'), 20);
            });
        }

    });

    // previous step
    $('.f1 .btn-previous').on('click', function () {
        // navigation steps / progress steps
        var current_active_step = $(this).parents('.f1').find('.f1-step.active');
        var progress_line = $(this).parents('.f1').find('.f1-progress-line');

        $(this).parents('fieldset').fadeOut(400, function () {
            // change icons
            current_active_step.removeClass('active').prev().removeClass('activated').addClass('active');
            // progress bar
            bar_progress(progress_line, 'left');
            // show previous step
            $(this).prev().fadeIn();
            // scroll window to beginning of the form
            scroll_to_class($('.f1'), 20);
        });
    });                   
    // submit
    $('.f1').on('submit', function (e) {

        // fields validation
        $(this).find('input[type="text"], input[type="password"], textarea').each(function () {
            if ($(this).val() == "") {
                e.preventDefault();
                $(this).addClass('input-error');
            }
            else {
                $(this).removeClass('input-error');
            }
        });
        // fields validation

    });


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

    /*Obtenemos el detalle del anuncio para poder cargarlos en los controles*/
    function cargarDetAnuncion() {
        getcargarDetAnuncion().done(responsegetcargarDetAnuncion);
    }            
    
    function getcargarDetAnuncion() {
        return $.ajax({
            type: "POST",
            url: $("#url_base").val() + "AddAnuncio/GetAnucionXId",
            data: { id: parseInt(__getSessionStorage("id_anuncio_val")) },
            dataType: "Json",
            async: false,
            error: function (ex) {
                alert("error getcargarDetAnuncion ");
            }
        });
    }

    function responsegetcargarDetAnuncion(response_data) {
        if (response_data.Status === "OK") {
            //var response = JSON.parse(response.DataJson)[0];
            var response = response_data.Data.DetailleAnuncion[0];
            $("#txt_nombre").val(response.txt_nombre_ficha);
            $("#txt_telefono_1").val(response.txt_telefono_1);
            $("#txt_telefono_2").val(response.txt_telefono_2);
            $("#txt_email").val(response.txt_email);
            $("#txt_web").val(response.txt_web);
            $("#txt_presentacion").val(response.txt_presentacion);
            $("#cbo_edad").val(response.int_edad);
            $("#cbo_pais").val(response.int_pais_origen);
            $("#cbo_estudios").val(response.int_estudios);
            $("#cbo_pelo").val(response.int_color_cabello);
            $("#cbo_ojos").val(response.int_color_ojos);
            $("#cbo_estatura").val(response.int_estatura);
            $("#cbo_peso").val(response.int_peso);


            setValueElemento("chk_forma_pagos[]", response.txt_forma_pago == null ? "" : response.txt_forma_pago);
            setValueElemento("chk_distrito[]", response.txt_lugar_servicio_distrito == null ? "" : response.txt_lugar_servicio_distrito);
            setValueElemento("chk_lugar_atencion[]", response.tx_lugar_atencion == null ? "" : response.tx_lugar_atencion);
            setValueElemento("chk_servicio_ofrece[]", response.tx_servicios_ofrece == null ? "" : response.tx_servicios_ofrece);
            if (response.txt_medidas_busto_cintura_cadera != null) {
                var txt_medidas_busto_cintura_cadera = response.txt_medidas_busto_cintura_cadera.split(",");
                $("#txt_medidas_busto").val(txt_medidas_busto_cintura_cadera[0]);
                $("#txt_medidas_cintura").val(txt_medidas_busto_cintura_cadera[1]);
                $("#txt_medidas_cadera").val(txt_medidas_busto_cintura_cadera[2]);
            }
            $("#txt_descripcion").val(response.txt_descripcion_extra_apariencia);
            $("#txt_30_min").val(response.dbl_costo_x_tiempo_30min);
            $("#txt_45_min").val(response.dbl_costo_x_tiempo_45min);
            $("#txt_1_hora").val(response.dbl_costo_x_tiempo_1hora);
            $("#txt_1_30_hora").val(response.dbl_costo_x_tiempo_1hora_media);
            $("#txt_2_hora").val(response.dbl_costo_x_tiempo_2hora);
            $("#txt_3_hora").val(response.dbl_costo_x_tiempo_3hora);
            $("#txt_salida_hora").val(response.dbl_costo_x_tiempo_salidas);
            $("#txt_toda_noche").val(response.dbl_costo_x_tiempo_toda_noche);
            $("#txt_viajes").val(response.dbl_costo_x_viaje);
            $("#txt_descripcion_tarifa").val(response.txt_descripcion_extra_tarifa);

            //1: seleccionado
            //0: no seleccionado
            var chk_atiende_24_hora = false;
            if (response.fl_atencion_24horas == 1) {
                chk_atiende_24_hora = true;
            }

            $("#chk_24horas").prop("checked", chk_atiende_24_hora);
            //var chk_atiende_24_hora = 0; //Atiendes las 24hs?	
            $("#txt_descripcion_extra_horario").val(response.tx_descripcion_extra_horario);
            $("#tx_descripcion_extra_servicio").val(response.tx_descripcion_extra_servicio);

            var listGaleria = response_data.Data.ListCargarInicial;
            cargar_galeria_fotos(listGaleria);
        }
    }  

    //Primer paso
    function primerpaso() {
        debugger;
        //|| __getSessionStorage("id_anuncio_val") != "0"
        if (__getSessionStorage("id_anuncio_val") != null ) {
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
        debugger;
        if (response.Status === "OK") {            
            __AddSessionStorage('id_anuncio_val', response.Id);
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
            //var response = JSON.parse(response.DataJson);
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
            //var response = JSON.parse(response.DataJson);
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
        /*Si refrescamos la pagina despues de haber registrado el anuncion debera de cargar los datos grabados en todos los pasos*/
        if (__getSessionStorage("id_anuncio_val") != null) {
            cargarDetAnuncion();
        }
        //$("#btn_primerpaso").click(primerpaso);
        //$("#btn_segundopaso").click(segundopaso);
        //$("#btn_terceropaso").click(terceropaso);
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