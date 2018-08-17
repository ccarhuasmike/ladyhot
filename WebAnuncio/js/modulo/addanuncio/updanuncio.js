(function ($, window, document) {        

    function cargarDetAnuncion() {
        getcargarDetAnuncion().done(responsegetcargarDetAnuncion);
    }                  
    
    function getcargarDetAnuncion() {
        return $.ajax({
            type: "POST",
            url: $("#url_base").val() + "UpdAnuncio/getAnuncio_x_tokens",
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
            var response_carga_inicial = JSON.parse(response.Data.ListCargarInicial.DataJson);
            loadCombos(response_carga_inicial);
            loadCheckoxes(response_carga_inicial);  
            var response = response.Data.DetailleAnuncion;
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
        }
    }
    //Primer paso
    function primerpaso() {
        var object = getObjectTodopaso();
        getTodopaso(object).done(responseTodopaso);
    }

    function getObjectTodopaso() {
        var txt_nombre = $("#txt_nombre").val();
        var txt_telefono_1 = $("#txt_telefono_1").val();
        var txt_telefono_2 = $("#txt_telefono_2").val();
        var txt_email = $("#txt_email").val();
        var txt_web = $("#txt_web").val();
        var cbo_edad = $("#cbo_edad").val();
        var cbo_pais = $("#cbo_pais").val();
        var cbo_estudios = $("#cbo_estudios").val();
        var txt_presentacion = $("#txt_presentacion").val();


        var cbo_pelo = $("#cbo_pelo").val();
        var cbo_ojos = $("#cbo_ojos").val();
        var cbo_estatura = $("#cbo_estatura").val();
        var cbo_peso = $("#cbo_peso").val();
        var txt_medidas_busto = $("#txt_medidas_busto").val();
        var txt_medidas_cintura = $("#txt_medidas_cintura").val();
        var txt_medidas_cadera = $("#txt_medidas_cadera").val();
        var txt_descripcion = $("#txt_descripcion").val();

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
        var chk_distrito = getValueElementoSelected('chk_distrito[]');
        //1: seleccionado
        //0: no seleccionado
        var chk_atiende_24_hora = 0; //Atiendes las 24hs?	
        if ($('#chk_24horas').is(':checked')) {
            chk_atiende_24_hora = 1;
        }    
        var txt_descripcion_extra_horario = $("#txt_descripcion_extra_horario").val();
        var chk_lugar_atencion = getValueElementoSelected('chk_lugar_atencion[]');
        var chk_servicio_ofrece = getValueElementoSelected('chk_servicio_ofrece[]');
        var tx_descripcion_extra_servicio = $("#tx_descripcion_extra_servicio").val();
        

        var oregistro = {}
        oregistro = {
            id: parseInt(__getSessionStorage('id_anuncio_upd')),
            txt_nombre_ficha: txt_nombre,
            txt_telefono_1: txt_telefono_1,
            txt_telefono_2: txt_telefono_2,
            txt_email: txt_email,
            txt_web: txt_web,
            int_edad: parseInt(cbo_edad),
            int_pais_origen: parseInt(cbo_pais),
            int_estudios: parseInt(cbo_estudios),
            txt_presentacion: txt_presentacion,    
            int_color_cabello: cbo_pelo,
            int_color_ojos: cbo_ojos,
            int_peso: cbo_peso,
            int_estatura: cbo_estatura,
            txt_medidas_busto_cintura_cadera: txt_medidas_busto + "," + txt_medidas_cintura + "," + txt_medidas_cadera,
            txt_descripcion_extra_apariencia: txt_descripcion,     
            dbl_costo_x_tiempo_30min: parseFloat(txt_30_min),
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

    function getTodopaso(data) {
        return $.ajax({
            type: "POST",
            async: false,
            url: $("#url_base").val() + "UpdAnuncio/Todospasos",
            contentType: "application/json",
            dataType: "Json",
            data: JSON.stringify(data),              
            error: function (ex) {
                alert("error function getprimerpaso");
            }
        });
    }

    function responseTodopaso(response) {
        if (response.Status === "OK") {                       
            //responsegetcargarDetAnuncion(response);           
            window.location.href = '/MisAnuncio';
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
        var valor = $("#" + event.currentTarget.id+"");
        valor.val(valor.val().replace(/[^\d].+/, ""));
        if ((event.which < 48 || event.which > 57)) {
            event.preventDefault();
        }
    }

    function codeBehind() {
        //cargarInicial();
        cargarDetAnuncion();
        $("#btn_guardar_todo").click(primerpaso);           
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
      

       // $("#txt_medidas_busto").on("keypress keyup blur", regexNumber());
    }

    $(function () {
        codeBehind();
    });
}(window.jQuery, window, document));