var dMenuFiltros = $(document);
var miMenuFiltros = {};
miMenuFiltros.nDesde = misParametros.fichas_por_mostrar;
miMenuFiltros.nFichasBajoDemanda = misParametros.fichas_carga_bajo_demanda;
miMenuFiltros.sRutaAjax = misParametros.rutaAjax;
miMenuFiltros.nTimer = false;




miMenuFiltros.inicializar = function () {
    //abre y cierra los filtros
    $(".abre").click(function () {
        $('.filtro-contenido').slideToggle("slow");
        $('.filtros').toggleClass('fil-shadows');
    });

    miMenuFiltros.setFiltros();


    $(function () {
        $('.button-checkbox').each(function () {

            // Settings
            var $widget = $(this),
                    $button = $widget.find('button'),
                    $checkbox = $widget.find('input:checkbox'),
                    color = $button.data('color'),
                    settings = {
                        on: {
                            icon: 'glyphicon glyphicon-check'
                        },
                        off: {
                            icon: ''
                        }
                    };

            // Event Handlers
            $button.on('click', function () {
                $checkbox.prop('checked', !$checkbox.is(':checked'));
                $checkbox.triggerHandler('change');
                updateDisplay();
            });
            $checkbox.on('change', function () {
                updateDisplay();
            });

            // Actions
            function updateDisplay() {
                var isChecked = $checkbox.is(':checked');

                // Set the button's state
                $button.data('state', (isChecked) ? "on" : "off");

                // Set the button's icon
                $button.find('.state-icon')
                        .removeClass()
                        .addClass('state-icon ' + settings[$button.data('state')].icon);

                // Update the button's color
                if (isChecked) {
                    $button
                            .removeClass('btn-default')
                            .addClass('btn-' + color + ' active');
                }
                else {
                    $button
                            .removeClass('btn-' + color + ' active')
                            .addClass('btn-default');
                }
            }

            // Initialization
            function init() {
                updateDisplay();
                // Inject the icon if applicable
                if ($button.find('.state-icon').length === 0) {
                    $button.prepend('<i class="state-icon ' + settings[$button.data('state')].icon + '"></i> ');
                }
            }
            init();
        });

    });


};


miMenuFiltros.setFiltros = function () {

    $('#buscador_tarifa_30, #buscador_tarifa_40').noUiSlider({
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
    for (i = 30; i <= 40; i += 10) {
        $("#buscador_tarifa_" + i).Link('lower').to($("#buscador_tarifa_lower_" + i));
        $("#buscador_tarifa_" + i).Link('upper').to($("#buscador_tarifa_upper_" + i));
        $("#buscador_tarifa_" + i).Link('lower').to($("#buscador_tarifa_desde_" + i));
        $("#buscador_tarifa_" + i).Link('upper').to($("#buscador_tarifa_hasta_" + i));
    }


    $('#buscador_edad_30, #buscador_edad_40').noUiSlider({
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

    for (i = 30; i <= 40; i += 10) {
        $("#buscador_edad_" + i).Link('lower').to($("#buscador_edad_lower_" + i));
        $("#buscador_edad_" + i).Link('upper').to($("#buscador_edad_upper_" + i));
        $("#buscador_edad_" + i).Link('lower').to($("#buscador_edad_desde_" + i));
        $("#buscador_edad_" + i).Link('upper').to($("#buscador_edad_hasta_" + i));
    }


};

dMenuFiltros.ready(miMenuFiltros.inicializar);




$(function () {
    $('.button-checkbox').each(function () {

        // Settings
        var $widget = $(this),
                $button = $widget.find('button'),
                $checkbox = $widget.find('input:checkbox'),
                color = $button.data('color'),
                settings = {
                    on: {
                        icon: 'glyphicon glyphicon-check'
                    },
                    off: {
                        icon: ''
                    }
                };

        // Event Handlers
        $button.on('click', function () {
            $checkbox.prop('checked', !$checkbox.is(':checked'));
            $checkbox.triggerHandler('change');
            updateDisplay();
        });
        $checkbox.on('change', function () {
            updateDisplay();
        });

        // Actions
        function updateDisplay() {
            var isChecked = $checkbox.is(':checked');

            // Set the button's state
            $button.data('state', (isChecked) ? "on" : "off");

            // Set the button's icon
            $button.find('.state-icon')
                    .removeClass()
                    .addClass('state-icon ' + settings[$button.data('state')].icon);

            // Update the button's color
            if (isChecked) {
                $button
                        .removeClass('btn-default')
                        .addClass('btn-' + color + ' active');
            }
            else {
                $button
                        .removeClass('btn-' + color + ' active')
                        .addClass('btn-default');
            }
        }

        // Initialization
        function init() {

            updateDisplay();

            // Inject the icon if applicable
            if ($button.find('.state-icon').length == 0) {
                $button.prepend('<i class="state-icon ' + settings[$button.data('state')].icon + '"></i> ');
            }
        }
        init();
    });

});