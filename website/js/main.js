(function ($) {
    "use strict";
    $(".carousel-inner .item:first-child").addClass("active");
    /* Mobile menu click then remove
    ==========================*/
    $(".mainmenu-area #mainmenu li a").on("click", function () {
        $(".navbar-collapse").removeClass("in");
    });


    // Select all links with hashes
    $('.smoth a[href*="#"], .mainmenu-area .primary-menu a[href*="#"]')
        // Remove links that don't actually link to anything
        .not('[href="#"]')
        .not('[href="#0"]')
        .click(function (event) {
            // On-page links
            if (
                location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '') &&
                location.hostname == this.hostname
            ) {
                // Figure out element to scroll to
                var target = $(this.hash);
                target = target.length ? target : $('[name=' + this.hash.slice(1) + ']');
                // Does a scroll target exist?
                if (target.length) {
                    // Only prevent default if animation is actually gonna happen
                    event.preventDefault();
                    $('html, body').animate({
                        scrollTop: target.offset().top
                    }, 1000, function () {
                        // Callback after animation
                        // Must change focus!
                        var $target = $(target);
                        $target.focus();
                        if ($target.is(":focus")) { // Checking if the target was focused
                            return false;
                        } else {
                            $target.attr('tabindex', '-1'); // Adding tabindex for elements not focusable
                            $target.focus(); // Set focus again
                        };
                    });
                }
            }
        });




    /* Scroll to top
    ===================*/
    $.scrollUp({
        scrollText: '<i class="fa fa-angle-up"></i>',
        easingType: 'linear',
        scrollSpeed: 900,
        animation: 'fade'
    });

    /* testimonials Slider Active
    =============================*/
    $('.testimonials').owlCarousel({
        loop: true,
        margin: 0,
        responsiveClass: true,
        nav: true,
        autoplay: true,
        autoplayTimeout: 4000,
        smartSpeed: 1000,
        navText: ['<i class="icofont icofont-rounded-left"></i>', '<i class="icofont icofont-rounded-right"></i>'],
        responsive: {
            0: {
                items: 1,
            },
            600: {
                items: 1
            },
            1000: {
                items: 1
            }
        }
    });

    // start easy pie chart plugin when skills section appear // 
    $(".skills1").appear(function () {
        $(".chart1").easyPieChart({
            barColor: "#a4c8fd",
            trackColor: "#e1e1e1",
            scaleColor: false,
            lineWidth: 3,
            lineCap: "round",
            size: 60,
            animate: 1500
        });
        $('.counter').counterUp({
            delay: 10,
            time: 1000
        });
    }, {
        accX: 0,
        accY: -150
    });

    // start easy pie chart plugin when skills section appear // 
    $(".skills2").appear(function () {
        $(".chart2").easyPieChart({
            barColor: "#800080",
            trackColor: "#e1e1e1",
            scaleColor: false,
            lineWidth: 3,
            lineCap: "round",
            size: 60,
            animate: 1500
        });
        $('.counter').counterUp({
            delay: 10,
            time: 1000
        });
    }, {
        accX: 0,
        accY: -150
    });


    $('.count').counterUp({
        delay: 10,
        time: 1000
    });

    // start mixitup plugin in portfolio section //
    $("#filtering").mixItUp();


    /*--------------------
     MAGNIFIC POPUP JS
     ----------------------*/
    $('.video-bttn').magnificPopup({
        type: 'iframe',
        removalDelay: 500, //delay removal by X to allow out-animation
        callbacks: {
            beforeOpen: function () {
                // just a hack that adds mfp-anim class to markup 
                this.st.image.markup = this.st.image.markup.replace('mfp-figure', 'mfp-figure mfp-with-anim');
                this.st.mainClass = this.st.el.attr('data-effect');
            }
        },
        iframe: {
            markup: '<div class="mfp-iframe-scaler">' +
                '<div class="mfp-close"></div>' +
                '<iframe class="mfp-iframe" frameborder="0" allowfullscreen></iframe>' +
                '<div class="mfp-title">Some caption</div>' +
                '</div>'
        },
        gallery: {
            enabled: true
        },
        closeOnContentClick: true,
        midClick: true
    });

    /*------------------------------
    Filter-PopUp
	-------------------------------*/
    $('.filter-popup').magnificPopup({
        type: 'image',
        removalDelay: 500, //delay removal by X to allow out-animation
        callbacks: {
            beforeOpen: function () {
                // just a hack that adds mfp-anim class to markup 
                this.st.image.markup = this.st.image.markup.replace('mfp-figure', 'mfp-figure mfp-with-anim');
                this.st.mainClass = this.st.el.attr('data-effect');
            }
        },
        gallery: {
            enabled: true
        },
        closeOnContentClick: true,
        midClick: true // allow opening popup on middle mouse click. Always set it to true if you don't provide alternative source.
    });

    /* Preloader Js
    ===================*/
    $(window).on("load", function () {
        $('.preloader').fadeOut(500);
        /*WoW js Active
        =================*/
        new WOW().init({
            mobile: false,
        });
    });
})(jQuery);