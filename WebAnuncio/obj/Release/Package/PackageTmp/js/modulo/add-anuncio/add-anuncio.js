(function ($, window, document) {

    function cargarTodosMensajes() {
        obtenerTodosMensajes().done(imprimirTodosMensajes);         
    }       

    function obtenerTodosMensajes() {
        return $.ajax({
            type: "POST",
            url: $("#url_base").val() + "Parameter/getCargarControles_Add",
            data: {},
            dataType: "Json",
            async: false,   
            error: function (ex) {
                alert("hola mundo");
            }
            //success: OnAjaxSuccessLoadDataResolusion
        });
    }

    function imprimirTodosMensajes(response) {
       
        if (response.Status === "OK") {
            console.log(response.DataJson);
        }          
    }


    function codeBehind() { 
        cargarTodosMensajes();
    }

    $(function () {
        codeBehind();
    });
}(window.jQuery, window, document));