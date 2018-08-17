var dListados = $(document);
var miListados = {};
miListados.nDesde = 0;
miListados.nFichasBajoDemanda = 0;
miListados.sRutaAjax = 0;
miListados.nTimer = false;

miListados.inicializar = function () {


   // miListados.buscadorProximidad();

    $('.typeahead').bind('typeahead:select', function (ev, suggestion) {
        location.href = suggestion.seourl;
    });

    $(document).on("change", "#buscador_provincia", function (e) {
        miListados.cargarLocalidades(this);
    });


    $(document).on("change", "#cf_categoriaID", function (e) {
        miListados.cambiarCategoriaFooter(this);
    });

    $(document).on("click", "#j_cargar_mas_escorts", function () {
        miListados.cargarMasFichas();
    });

    $(document).on("mouseleave", ".ficha-peq img", function () {
        if (miListados.nTimer) {
            clearTimeout(miListados.nTimer);
            miListados.nTimer = 0;
        }
    });

    $(document).on("mouseenter", ".ficha-peq img", function () {
        var img = $(this);
        var images = [];
        if (img.data('original') != '') {
            images[0] = img.data('original');
        }
        if (img.data('thumbnail') != '') {
            images[1] = img.data('thumbnail');
        }
        if (img.data('path') != '') {
            images[2] = img.data('path');
        }
        var count = parseInt(images.length);
        var i = 0;
        (function animateImage() {
            img.attr('src', images[i]);
            i = i + 1;
            if (i == count) {
                i = 0;
            }
            miListados.nTimer = setTimeout(function () {
                animateImage();
            }, 500);
        })();
    });

   //  miListados.setFiltros();

};


miListados.cargarLocalidades = function () {
    $.post(miListados.sRutaAjax + 'ajax-localidades.php', "buscador_provincia=" + $("#buscador_provincia").val(),
            function (resp) {
                if (resp !== "ERROR") {
                    console.log(resp);
                    $("#buscador_ciudad").html(resp);
                    $('#buscador_ciudad').selectpicker('refresh');
                } else {
                    console.log("ouch!");
                }
            }, "html");
};

miListados.setFiltros = function () {
    
    $('#buscador_tarifa').noUiSlider({
        start: [misParametros.tarifa_desde, misParametros.tarifa_hasta],
        step: 10,
        connect: true,
        range: {
            'min': misParametros.tarifa_desde,
            'max': misParametros.tarifa_hasta
        },
        format: wNumb({
            decimals: 0
        })
    });
    $("#buscador_tarifa").Link('lower').to($("#buscador_tarifa_lower"));
    $("#buscador_tarifa").Link('upper').to($("#buscador_tarifa_upper"));
    $("#buscador_tarifa").Link('lower').to($("#buscador_tarifa_desde"));
    $("#buscador_tarifa").Link('upper').to($("#buscador_tarifa_hasta"));

    $('#buscador_tarifa2').noUiSlider({
        start: [misParametros.tarifa_desde, misParametros.tarifa_hasta],
        step: 10,
        connect: true,
        range: {
            'min': misParametros.tarifa_desde,
            'max': misParametros.tarifa_hasta
        },
        format: wNumb({
            decimals: 0
        })
    });
    $("#buscador_tarifa2").Link('lower').to($("#buscador_tarifa_lower2"));
    $("#buscador_tarifa2").Link('upper').to($("#buscador_tarifa_upper2"));
    $("#buscador_tarifa2").Link('lower').to($("#buscador_tarifa_desde2"));
    $("#buscador_tarifa2").Link('upper').to($("#buscador_tarifa_hasta2"));

  
    $('#buscador_edad').noUiSlider({
        start: [misParametros.edad_desde, misParametros.edad_hasta],
        step: 10,
        connect: true,
        range: {
            'min': misParametros.edad_desde,
            'max': misParametros.edad_hasta
        },
        format: wNumb({
            decimals: 0
        })
    });
    $("#buscador_edad").Link('lower').to($("#buscador_edad_lower"));
    $("#buscador_edad").Link('upper').to($("#buscador_edad_upper"));
    $("#buscador_edad").Link('lower').to($("#buscador_edad_desde"));
    $("#buscador_edad").Link('upper').to($("#buscador_edad_hasta"));

    $('#buscador_edad2').noUiSlider({
        start: [misParametros.edad_desde, misParametros.edad_hasta],
        step: 10,
        connect: true,
        range: {
            'min': misParametros.edad_desde,
            'max': misParametros.edad_hasta
        },
        format: wNumb({
            decimals: 0
        })
    });
    $("#buscador_edad2").Link('lower').to($("#buscador_edad_lower2"));
    $("#buscador_edad2").Link('upper').to($("#buscador_edad_upper2"));
    $("#buscador_edad2").Link('lower').to($("#buscador_edad_desde2"));
    $("#buscador_edad2").Link('upper').to($("#buscador_edad_hasta2"));


};

miListados.cargarMasFichas = function () {
    $.post(miListados.sRutaAjax + 'ajax-home.php', "d=" + miListados.nDesde + "&c=" + miListados.nFichasBajoDemanda + "&buscador_buscador=" + misParametros.buscador
            + "&buscador_novedades=" + misParametros.novedades + "&buscador_gratis=" + misParametros.gratis + "&buscador_provincia=" + misParametros.buscador_provincia
            + "&buscador_localidad=" + misParametros.buscador_localidad + "&buscador_tarifa=" + misParametros.buscador_tarifa
            + "&buscador_caracteristicas=" + misParametros.buscador_caracteristicas + "&buscador_tetas=" + misParametros.buscador_tetas
            + "&buscador_culo=" + misParametros.buscador_culo + "&buscador_servicio=" + misParametros.buscador_servicio + "&buscador_home=" + misParametros.buscador_home
            + "&buscador_tag=" + misParametros.buscador_tag + "&provincia=" + misParametros.provincia + "&localidad=" + misParametros.localidad+ "&servicio=" + misParametros.servicio+ "&tag=" + misParametros.tag,
            function (resp) {
                if (resp !== "ERROR") {
                    miListados.nDesde += miListados.nFichasBajoDemanda;
                    $("#j_fichas").append(resp);
                }
            }, "html");
};

/*
 * Procesar el cambio de categorías desde el select del footer.
 */
miListados.cambiarCategoriaFooter = function (miObj) {
    location.href = $(miObj).val();
};
      /*
miListados.buscadorProximidad = function () {
    var scortsProximidad = new Bloodhound({
        datumTokenizer: Bloodhound.tokenizers.obj.whitespace('value'),
        queryTokenizer: Bloodhound.tokenizers.whitespace,
        prefetch: '/procesos/escorts.php',
        remote: {
            url: '/procesos/queries/%QUERY.json?hash=' + misParametros.hash_proximidad,
            wildcard: '%QUERY'
        }
    });

    $('#remote .typeahead').typeahead(null, {
        name: 'scorts',
        display: 'escort',
        source: scortsProximidad
    });
}
         */
dListados.ready(miListados.inicializar);