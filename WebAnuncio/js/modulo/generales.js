//Variables Globales

var HTML = "";          
function poblar_checkboxes(item, index, name) {  
    HTML += "<p><label>";
    HTML += "<input type='checkbox' value=" + item.val_valor + " id='ta_checkbox_0' name=" + name + "> ";
    HTML += item.tx_descripcion;
    HTML += '</label><br></p>';            
}    

function loadCombos(data) {    
    //edad
    $("#cbo_edad option").remove();
    $("#cbo_edad").append('<option value="0">[seleccione Edad]</option>');
    $.each(data.edad, function (key, value) {
        $("#cbo_edad").append("<option value=" + value.val_valor + ">" + value.tx_descripcion + "</option>");
    });
    //pais
    $("#cbo_pais option").remove();
    $("#cbo_pais").append('<option value="0">[seleccione Pais]</option>');
    $.each(data.pais, function (key, value) {
        $("#cbo_pais").append("<option value=" + value.val_valor + ">" + value.tx_descripcion + "</option>");
    });
    //estudios
    $("#cbo_estudios option").remove();
    $("#cbo_estudios").append('<option value="0">[seleccione Estudios]</option>');
    $.each(data.estudios, function (key, value) {
        $("#cbo_estudios").append("<option value=" + value.val_valor + ">" + value.tx_descripcion + "</option>");
    });      
    //Color cabello
    $("#cbo_pelo option").remove();
    $("#cbo_pelo").append('<option value="0">[seleccione Color cabello]</option>');
    $.each(data.color_cabello, function (key, value) {
        $("#cbo_pelo").append("<option value=" + value.val_valor + ">" + value.tx_descripcion + "</option>");
    });      

    //Color ojos
    $("#cbo_ojos option").remove();
    $("#cbo_ojos").append('<option value="0">[seleccione Color ojos]</option>');
    $.each(data.color_ojos, function (key, value) {
        $("#cbo_ojos").append("<option value=" + value.val_valor + ">" + value.tx_descripcion + "</option>");
    });  

    //Estatura
    $("#cbo_estatura option").remove();
    $("#cbo_estatura").append('<option value="0">[seleccione Estatura]</option>');
    $.each(data.estatura, function (key, value) {
        $("#cbo_estatura").append("<option value=" + value.val_valor + ">" + value.tx_descripcion + "</option>");
    }); 
    //Peso
    $("#cbo_peso option").remove();
    $("#cbo_peso").append('<option value="0">[seleccione Peso]</option>');
    $.each(data.peso, function (key, value) {
        $("#cbo_peso").append("<option value=" + value.val_valor + ">" + value.tx_descripcion + "</option>");
    });      
}
function loadCheckoxes(data) {
    for (index in data.formapago) {
        poblar_checkboxes(data.formapago[index], index, "chk_forma_pagos[]");
    }
    __('check_forma_pago').innerHTML = HTML;
    HTML = "";

    for (index in data.distritro) {
        poblar_checkboxes(data.distritro[index], index, "chk_distrito[]");
    }
    __('check_distrito').innerHTML = HTML;
    HTML = "";

    for (index in data.lugaratencion) {
        poblar_checkboxes(data.lugaratencion[index], index, "chk_lugar_atencion[]");
    }
    __('check_lugar_atencion').innerHTML = HTML;
    HTML = "";

    for (index in data.servicio_ofrece) {
        poblar_checkboxes(data.servicio_ofrece[index], index, "chk_servicio_ofrece[]");
    }
    __('check_servicio_ofrece').innerHTML = HTML;
    HTML = "";

   

}

function getValueElementoSelected(name) {
    var value_selected = [];
    var elements = __findByName(name);
    var count_elements_checked = 0;
    var contador = 0;
    for (index in elements) {
        if (index == 0) {
            for (index_aux in elements) {
                if (elements[index_aux].checked) {
                    count_elements_checked++;
                }
            }
        }
        if (elements[index].checked) {
            contador++;
            value_selected.push(elements[index].value);
            if (count_elements_checked == contador) {
                break;
            }
        }
    }
    return value_selected.join(",");
}

function __findByName(name) {
    return document.getElementsByName(name);
}

function __(id) {
    return document.getElementById(id);
}

function setValueElemento(name, value) {
    var elements = __findByName(name);
    var array_elements = value.split(',');
    for (index_array in array_elements) {
        for (index in elements) {
            if (array_elements[index_array] == elements[index].value) {
                elements[index].checked = true;
                break;
            }
        }
    }
}