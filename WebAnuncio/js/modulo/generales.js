//Variables Globales

var HTML = "";
function poblar_checkboxes(item, index, name) {
    HTML += "<div class='checkbox'>";
    HTML += "<label><input type='checkbox' value=" + item.val_valor + " id='ta_checkbox_0' name=" + name + "> ";
    HTML += item.tx_descripcion;
    HTML += '</label></div>';
}

//<div class="checkbox">
//<label>
//<input type="checkbox" value="">
//Option one is this and that&mdash;be sure to include why it's great
//</label>
//</div>

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
    if (value != '') {
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
}

function __AddSessionStorage(key, value) {
    __removeSessionStorage(key);
    sessionStorage.setItem(key, value);
}

function __getSessionStorage(key) {
    return sessionStorage.getItem(key);
}

function __clearSessionStorage() {
    sessionStorage.clear();
}

function __removeSessionStorage(key) {
    sessionStorage.removeItem(key);
}


function AddAnuncio() {
    __removeSessionStorage("id_anuncio_val");
    __AddSessionStorage('cantidad_image_agregado', 0);
    window.location.href = "/AddAnuncio";
}
function MisAnuncio() {
    __removeSessionStorage("id_anuncio_val");
    __removeSessionStorage('cantidad_image_agregado');
    window.location.href = '/MisAnuncio';
}

function Publicidad() {
    __removeSessionStorage("id_anuncio_val");
    __removeSessionStorage('cantidad_image_agregado');
    window.location.href = "/Publicidad";
}
function Contactar() {
    location.href = '/Contactar';
}


function salir() {
    __removeSessionStorage("id_usuario");
    __removeSessionStorage('cantidad_image_agregado');
    __removeSessionStorage("id_anuncio_val");
    __removeSessionStorage("cod_anuncio_encryptado");
    __removeSessionStorage("usuario_token");
    location.href = '/Home';
}           

function redirecToDetails(data) {
    //__AddSessionStorage('cod_anuncio_encryptado_details', data.cod_anuncio_encryptado);
    var url = "../Details?id=" + data.cod_anuncio_encryptado+"";
    window.location.href = url;
}

function redirecToAnunciate() {
    var url = "../Tarifas";
    window.location.href = url;
}    

//Alert = {
//    show: function ($div, msg) {
//        $div.find('.alert-msg').text(msg);
//        if ($div.css('display') === 'none') {
//            $div.fadeIn(1000).delay(2000).fadeOut(3000);
//        }
//    },
//    info: function (msg) {
//        this.show($('#alert-info'), msg);
//    },
//    warn: function (msg) {
//        this.show($('#alert-warn'), msg);
//    },
//    danger: function (msg) {
//        this.show($('#alert-danger'), msg);
//    },
//    success: function (msg) {
//        this.show($('#alert-success'), msg);
//    }
//}