$(document).ready(function () {
    window.onbeforeunload = function(){
        window.scrollTo(0,0);
    }
    $(window).trigger('scroll');
    // fixed the header

    setTimeout(function() {
        $('.header-ficha, .fullwidth.agencia-listado .header').scrollToFixed().fadeIn( 400 );
    }, 1800);

    document.onscroll = function () {
        if ($(window).scrollTop() > $('.img-cabecera').height()) {
            $('.cabecera-agencia').addClass('stick');
            $('.cabecera-agencia').addClass('bg-menu');
            $('header').addClass('no-shadow');
        }
        else {
            $('.cabecera-agencia').removeClass('stick');
            $('.cabecera-agencia').removeClass('bg-menu')
        }
    };
    //historial de busquedas en navegacion
    $("[data-toggle=popover]").popover({
        html: true,
        content: function () {
            return $('.popover-content').html();
        }
    });
    //cierra el popover cuando clicas en otro sitio
    $('body').on('click', function (e) {
        $('[data-toggle="popover"]').each(function () {
            //the 'is' for buttons that trigger popups
            //the 'has' for icons within a button that triggers a popup
            if (!$(this).is(e.target) && $(this).has(e.target).length === 0 && $('.popover').has(e.target).length === 0) {
                $(this).popover('hide');
            }
        });
    });
    //Agrandar imagenes
    $(".fancybox").fancybox();
    //Handles menu drop down
    $('.dropdown-menu').find('form').click(function (e) {
        e.stopPropagation();
    });
    // subir hacia arriba
    $(window).scroll(function () {
        if ($(this).scrollTop() > 50) {
            $('#back-to-top').fadeIn();
        } else {
            $('#back-to-top').fadeOut();
        }
    });
    $('#back-to-top').click(function () {
        $('#back-to-top').tooltip('hide');
        $('body,html').animate({
            scrollTop: 0
        }, 800);
        return false;
    });
    $('#back-to-top').tooltip('show');
    //Convierte los selectsa en un boton

    $('.selectpicker').selectpicker({
        dropupAuto: false,
        size: 8
    });

    //Add hover support for touch devices
    $('.btn').bind('touchstart', function () {
        $(this).addClass('hover');
    }).bind('touchend', function () {
        $(this).removeClass('hover');
    });
    //Activate tooltips
    $("[data-toggle='tooltip']").tooltip();

    //abre y cierra los filtros

    $(".js-abre").on('click', function () {
        $('.js-filtro-contenido').slideToggle();
        $('.js-filtros').toggleClass('fil-shadows');
    });

    //columnas iguales alto
    $('.blq-info .equal').equalHeights();
    $('.blq-ofrece-espec .col-sm-3').equalHeights();
    $('.blq-propuesta .col-sm-2').equalHeights();
    $('.blq-serv .col-sm-4').equalHeights();
    $('.blq-login-frm .equal').equalHeights();
    //cambia imagen en hover


    $('.datepicker').datepicker({
        format: "dd/mm/yy",
        language: "es"
    });


    $('.myTab a').click(function (e) {
        e.preventDefault()
        $(this).tab('show');
    });
    $('.carousel').carousel();
    //video rerproductor
    videojs.options.flash.swf = "common/video-js/video-js.swf";
    //barra de progreso
    var jRes = jRespond([
        {
            label: 'mobile',
            enter: 0,
            exit: 480
        }, {
            label: 'tablet',
            enter: 481,
            exit: 979
        }, {
            label: 'desktop',
            enter: 980,
            exit: 10000
        }
    ]);
    jRes.addFunc({
        breakpoint: 'mobile',
        enter: function () {
            loadChicaMes();
        },
    });

    jRes.addFunc({
        breakpoint: 'tablet',
        enter: function () {
            loadChicaMes();
        },
    });


    jRes.addFunc({
        breakpoint: 'desktop',
        enter: function () {
            loadChicaMes();
            //sube informacion
            /*
            $('.element .sube').mouseenter(function () {
                var element = $(this).closest('.element');
                var blockHeight = element.height();
                var headerHeight = $(this).height();
                element.find('.description').animate({
                    'margin-top': -(blockHeight - headerHeight)
                });
            });
            $('.element').mouseleave(function () {
                $(this).find('.description').animate({
                    'margin-top': "0px"
                });
            });
            */
           /*
           $(document).on("click", "#dentificador", function (e) {

                });*/

             $(document).on("mouseenter", ".element .sube", function (e) {
            // $('.element .sube').mouseenter(function () {
                var element = $(this).closest('.element');
                var blockHeight = element.height();
                var headerHeight = $(this).height();
                element.find('.description').animate({
                    'margin-top': -(blockHeight - headerHeight)
                });
            });
            $(document).on("mouseleave", ".element", function (e) {
            // $('.element').mouseleave(function () {
                $(this).find('.description').animate({
                    'margin-top': "0px"
                });
            });
        },
    });
    function loadChicaMes() {
        $('.chica-mes').each(function () {
            var img = $(this).data(jRes.getBreakpoint());
            $(this).children('a').css('background-image', "url('" + img + "')");
            $(this).children('img').load(function () {
                $(this).removeClass('loading-portada');
            });
        });
    }


    $(function(){
        var $refreshButton = $('#refresh');
        var $results = $('#css_result');

        function refresh(){
            var css = $('style.cp-pen-styles').text();
            $results.html(css);
        }

        refresh();
        $refreshButton.click(refresh);

        // Select all the contents when clicked
        $results.click(function(){
            $(this).select();
        });
    });

    if ($('.js-carousel').length > 0) {
      /*
        var $carousel = $('.js-carousel').flickity({
            freeScroll: true,
            wrapAround: true,
            cellAlign: 'left',
            contain: true,
            pageDots: false
        });*/
    }


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
});
