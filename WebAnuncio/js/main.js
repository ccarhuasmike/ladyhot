$(document).ready(function () {  
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


  
    $('.carousel').carousel();
    //video rerproductor
    //videojs.options.flash.swf = "common/video-js/video-js.swf";
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
            //loadChicaMes();
        },
    });

    jRes.addFunc({
        breakpoint: 'tablet',
        enter: function () {
            //loadChicaMes();
        },
    });    
    jRes.addFunc({
        breakpoint: 'desktop',
        enter: function () {
            //loadChicaMes();            
             $(document).on("mouseenter", ".element .sube", function (e) {            
                var element = $(this).closest('.element');
                var blockHeight = element.height();
                var headerHeight = $(this).height();
                element.find('.description').animate({
                    'margin-top': -(blockHeight - headerHeight)
                });
            });
            $(document).on("mouseleave", ".element", function (e) {                   
                $(this).find('.description').animate({
                    'margin-top': "0px"
                });
            });
        },
    });



  
    //if ($('.js-carousel').length > 0) {          
    //    var $carousel = $('.js-carousel').flickity({
    //        freeScroll: true,
    //        wrapAround: true,
    //        cellAlign: 'left',
    //        contain: true,
    //        pageDots: false
    //    });
    //}
          
       /*
    $('.js-carousel').flickity({
        // options
        cellAlign: 'left',
        contain: true
    });   */

  
});
