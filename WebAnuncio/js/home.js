var dListados = $(document);
var miListados = {};
miListados.nTimer = false;

miListados.inicializar = function () {          
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
};
dListados.ready(miListados.inicializar);