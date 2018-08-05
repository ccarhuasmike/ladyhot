
(function ($, window, document) {
    function registrarteahora() {          
        document.getElementById("j_registro").style.display = "block";
        document.getElementById("j_login").style.display = "none";   
    }
    function btn_to_login() {
     
        document.getElementById("j_registro").style.display = "none";
        document.getElementById("j_login").style.display = "block";
    }
    function btn_registrar() {   
        var object = getObjectRegistrar();
        getRegistrar(object).done(responseRegistrar);     
    }

    function getObjectRegistrar() {  

        var txt_registro_email = $("#txt_registro_email").val();
        var txt_registro_telefono = $("#txt_registro_telefono").val();
        var txt_registro_clave = $("#txt_registro_clave").val();
        var oregistro = {}
        oregistro = {
            tx_email: txt_registro_email,
            tx_telefono: txt_registro_telefono,
            tx_pass: txt_registro_clave,
                   
        };
        return oregistro;
    }

    function getRegistrar(data) {
        return $.ajax({
            type: "POST",
            async: false,
            url: $("#url_base").val() + "Usuario/registar",
            contentType: "application/json",
            dataType: "Json",
            data: JSON.stringify(data),
            async: false,
            error: function (ex) {
                alert("error function getprimerpaso");
            }
        });
    }

    function responseRegistrar(response) {
        debugger;
        if (response.Status === "OK") {              
            var response = JSON.parse(response.DataJson);
            __AddSessionStorage('id_usuario', response[0].id);
            __AddSessionStorage('usuario_token', response.tx_token);
            console.log(response);
            window.location.href = "/AddAnuncio";  
        }
    }
    function btn_login() {
        var object = getObjectLogin();
        getLogin(object).done(responseLogin);   
    }

    function getObjectLogin() {       
        var txt_email = $("#txt_login_email").val();
        var txt_clave = $("#txt_login_clave").val();
        var oregistro = {}
        oregistro = {
            tx_email: txt_email,                
            tx_pass: txt_clave
        };
        return oregistro;
    }

    function getLogin(data) {
        return $.ajax({
            type: "POST",
            async: false,
            url: $("#url_base").val() + "Usuario/login",
            contentType: "application/json",
            dataType: "Json",
            data: JSON.stringify(data),
            async: false,
            error: function (ex) {
                alert("error function getprimerpaso");
            }
        });
    }

    function responseLogin(response) {
        if (response.Status === "OK") {
            var response = JSON.parse(response.DataJson)[0];
            __AddSessionStorage('id_usuario', response.id);
            __AddSessionStorage('usuario_token', response.tx_token);
            console.log(response);
            window.location.href = "/AddAnuncio";  
        }
    }

    function codeBehind() {       
        $("#btn_registrateahora").click(registrarteahora);
        $("#btn_to_login").click(btn_to_login);
        $("#btn_registrar").click(btn_registrar);      
        $("#btn_login").click(btn_login); 
    }

    $(function () {
        codeBehind();
    });
}(window.jQuery, window, document));