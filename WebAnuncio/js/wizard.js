function scroll_to_class(element_class, removed_height) {
    var scroll_to = $(element_class).offset().top - removed_height;
    if ($(window).scrollTop() != scroll_to) {
        $('html, body').stop().animate({ scrollTop: scroll_to }, 0);
    }
}

function bar_progress(progress_line_object, direction) {
    var number_of_steps = progress_line_object.data('number-of-steps');
    var now_value = progress_line_object.data('now-value');
    var new_value = 0;
    if (direction == 'right') {
        new_value = now_value + (100 / number_of_steps);
    }
    else if (direction == 'left') {
        new_value = now_value - (100 / number_of_steps);
    }
    progress_line_object.attr('style', 'width: ' + new_value + '%;').data('now-value', new_value);
}

jQuery(document).ready(function () {

    /*
        Fullscreen background
    */
    //$.backstretch("assets/img/backgrounds/1.jpg");

    //$('#top-navbar-1').on('shown.bs.collapse', function () {
    //    $.backstretch("resize");
    //});
    //$('#top-navbar-1').on('hidden.bs.collapse', function () {
    //    $.backstretch("resize");
    //});

    /*
        Form
    */
    $('.f1 fieldset:first').fadeIn('slow');

    $('.f1 input[type="text"], .f1 input[type="password"], .f1 textarea, .f1 select').on('focus', function () {
        $(this).removeClass('input-error');
    });

    // next step
    $('.f1 .btn-next').on('click', function () {
        var parent_fieldset = $(this).parents('fieldset');
        var next_step = true;
        // navigation steps / progress steps
        var current_active_step = $(this).parents('.f1').find('.f1-step.active');
        var progress_line = $(this).parents('.f1').find('.f1-progress-line');

        // fields validation
        // fields validation del primero paso
        if (parent_fieldset.attr("id") == 'fieldset_primero_paso') {
            parent_fieldset.find('input[type="text"], input[type="password"], textarea , select').each(function () {
                if (
                    $(this).attr("id") == 'txt_nombre' ||
                    $(this).attr("id") == 'txt_telefono_1' ||
                    $(this).attr("id") == 'txt_telefono_2' ||
                    $(this).attr("id") == 'txt_email' ||
                    $(this).attr("id") == 'cbo_edad' ||
                    $(this).attr("id") == 'cbo_pais' ||
                    $(this).attr("id") == 'cbo_estudios' ||
                    $(this).attr("id") == 'txt_presentacion'
                ) {
                    if ($(this).val() == "" || $(this).val() == "0") {
                        $(this).addClass('input-error');
                        next_step = false;
                    }
                    else {
                        $(this).removeClass('input-error');
                    }
                }

            });
        }

        // fields validation del segundo paso
        if (parent_fieldset.attr("id") == 'fieldset_segundo_paso') {
            parent_fieldset.find('input[type="text"], input[type="password"], textarea , select').each(function () {
                if (
                    $(this).attr("id") == 'cbo_pelo' ||
                    $(this).attr("id") == 'cbo_ojos' ||
                    $(this).attr("id") == 'cbo_estatura' ||
                    $(this).attr("id") == 'cbo_peso' ||
                    $(this).attr("id") == 'txt_medidas_busto' ||
                    $(this).attr("id") == 'txt_medidas_cintura' ||
                    $(this).attr("id") == 'txt_medidas_cadera'
                ) {
                    if ($(this).val() == "" || $(this).val() == "0") {
                        $(this).addClass('input-error');
                        next_step = false;
                    }
                    else {
                        $(this).removeClass('input-error');
                    }
                }
            });
        }

        if (parent_fieldset.attr("id") == 'fieldset_tercer_paso') {
            parent_fieldset.find('input[type="text"], input[type="password"], textarea , select').each(function () {
                if (
                    $(this).attr("id") == 'txt_30_min' ||
                    $(this).attr("id") == 'txt_45_min' ||
                    $(this).attr("id") == 'txt_1_hora' ||
                    $(this).attr("id") == 'txt_1_30_hora' ||
                    $(this).attr("id") == 'txt_2_hora' ||
                    $(this).attr("id") == 'txt_3_hora' ||
                    $(this).attr("id") == 'txt_salida_hora' ||
                    $(this).attr("id") == 'txt_toda_noche' ||
                    $(this).attr("id") == 'txt_viajes'
                ) {
                    if ($(this).val() == "") {
                        $(this).addClass('input-error');
                        next_step = false;
                    }
                    else {
                        $(this).removeClass('input-error');
                    }
                }
            });
        }         
        if (parent_fieldset.attr("id") == 'fieldset_cuarto_paso') {
            parent_fieldset.find('input[type="text"], input[type="password"], textarea , select').each(function () {
                if (
                    parseInt(__getSessionStorage("cantidad_image_agregado"))<3                   
                ) { 
                    next_step = false;
                }
            });
        }     
        // fields validation   
        if (next_step) {
            parent_fieldset.fadeOut(400, function () {
                // change icons
                current_active_step.removeClass('active').addClass('activated').next().addClass('active');
                // progress bar
                bar_progress(progress_line, 'right');
                // show next step
                $(this).next().fadeIn();
                // scroll window to beginning of the form
                scroll_to_class($('.f1'), 20);
            });
        }

    });

    // previous step
    $('.f1 .btn-previous').on('click', function () {
        // navigation steps / progress steps
        var current_active_step = $(this).parents('.f1').find('.f1-step.active');
        var progress_line = $(this).parents('.f1').find('.f1-progress-line');

        $(this).parents('fieldset').fadeOut(400, function () {
            // change icons
            current_active_step.removeClass('active').prev().removeClass('activated').addClass('active');
            // progress bar
            bar_progress(progress_line, 'left');
            // show previous step
            $(this).prev().fadeIn();
            // scroll window to beginning of the form
            scroll_to_class($('.f1'), 20);
        });
    });

    // submit
    $('.f1').on('submit', function (e) {

        // fields validation
        $(this).find('input[type="text"], input[type="password"], textarea').each(function () {
            if ($(this).val() == "") {
                e.preventDefault();
                $(this).addClass('input-error');
            }
            else {
                $(this).removeClass('input-error');
            }
        });
        // fields validation

    });

});