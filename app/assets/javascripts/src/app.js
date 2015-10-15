var app = function() {

    $(function() {
        tooltips();
        navToggleRight();
        navToggleLeft();
        navToggleSub();
        profileToggle();
        toggleSettings();
        switchTheme();
        fullscreenWidget();
        fullscreenMode();
        switcheryToggle();
        widgetToggle();
        autoWidgetToggle();
        widgetClose();
        widgetFlip();
        tooltips();
        panelOptionsToggle();
        panelSelectProperty();
        panelSelectRoom();
        panelReset();
    });

     //tooltips
     var tooltips = function() {
        $('.tooltip-wrapper').tooltip({
            selector: "[data-toggle=tooltip]",
            container: "body"
        })
    };

    var panelOptionsToggle = function() {
        $("#dashboard").on("click", ".panel-options > .fa-bookmark", function(element) {
            $(this).parent().parent().next().slideToggle("fast")
        });
    };

    var panelSelectProperty = function() {
        $("#dashboard").on("click", "#properties-panel .selected-property", function(element) {
            var propertyID = (this.id).slice(1);

            var request = $.ajax({
                url: '/dashboard/refresh',
                type: 'POST',
                dataType: 'html',
                data: { active_property: propertyID, refresh_action: "Set Property" }
            })

            request.done(function(response) {
                console.log("success - Select Property");
                console.log(request.data);
                $("#dashboard").html(response);
                autoWidgetToggle();
            })
            request.fail(function(response) {
                console.log("error");
                console.log(response);
            });
        });
    };

    // var panelSelectProperty = function() {
    //     $("#dashboard").on("click", "#properties-panel .selected-property", function(element) {
    //         var propertyID = (this.id).slice(1);

    //         var request = $.ajax({
    //             url: '/dashboard/refresh',
    //             type: 'POST',
    //             dataType: 'html',
    //             data: { active_property: propertyID, refresh_action: "Set Property" }
    //         })

    //         request.done(function(response) {
    //             console.log("success - Select Property");
    //             console.log(request.data);
    //             $("#dashboard").html(response);
    //             autoWidgetToggle();
    //         })
    //         request.fail(function(response) {
    //             console.log("error");
    //             console.log(response);
    //         });
    //     });
    // };

    var panelReset = function() {
        $("#dashboard").on("click", ".panel-options > .fa-bookmark-o", function(element) {

            var request = $.ajax({
                url: '/dashboard/refresh',
                type: 'POST',
                dataType: 'html',
                data: { refresh_action: "Reset" }
            })

            request.done(function(response) {
                console.log("success - Panel Reset");
                $("#dashboard").html(response);
                autoWidgetToggle();
            })
            request.fail(function(response) {
                console.log("error");
                console.log(response);
            });
        });
    };

    // var panelSelectRoom = function(roomID, propertyID) {

    //     var request = $.ajax({
    //         url: '/dashboard/refresh',
    //         type: 'POST',
    //         dataType: 'html',
    //         data: { active_room: roomID, refresh_action: "Set Room" }
    //     })

    //     request.done(function(response) {
    //         console.log("success - Select Room");
    //         console.log(request.data);
    //         $("#dashboard").html(response);
    //         autoWidgetToggle();
    //     })
    //     request.fail(function(response) {
    //         console.log("error");
    //         console.log(response);
    //     });

    // };


    var panelSelectRoom = function() {
        $("#dashboard").on("click", "#rooms-table .selected-room", function(element) {
            var roomID = (this.id).slice(1);

            var request = $.ajax({
                url: '/dashboard/refresh',
                type: 'POST',
                dataType: 'html',
                data: { active_room: roomID, refresh_action: "Set Room" }
            })

            request.done(function(response) {
                console.log("success - Select Room");
                $("#dashboard").html(response);
                autoWidgetToggle();
            })
            request.fail(function(response) {
                console.log("error");
                console.log(response);
            });
        });
    };

    var widgetToggle = function() {
        $("#dashboard").on ("click", ".actions > .fa-chevron-down", function() {
            $(this).parent().parent().next().slideToggle("fast"), $(this).toggleClass("fa-chevron-down fa-chevron-up")
        });
        $("#dashboard").on ("click", ".actions > .fa-chevron-up", function() {
            $(this).parent().parent().next().slideToggle("fast"), $(this).toggleClass("fa-chevron-down fa-chevron-up")
        });
    };

    var autoWidgetToggle = function() {
        $(".auto-collapse").slideToggle("fast");
    };

    var widgetClose = function() {
        $("#dashboard").on ("click", ".actions > .fa-times", function() {
            $(this).parent().parent().parent().fadeOut()
        });
    };

    var widgetFlip = function() {
        $("#dashboard").on (".actions > .fa-cog", function() {
            $(this).closest('.flip-wrapper').toggleClass('flipped')
        });
    };

    var toggleSettings = function() {
        $('.config-link').click(function() {
            if ($(this).hasClass('open')) {
                $('#config').animate({
                    "right": "-205px"
                }, 150);
                $(this).removeClass('open').addClass('closed');
            } else {
                $("#config").animate({
                    "right": "0px"
                }, 150);
                $(this).removeClass('closed').addClass('open');
            }
        });
    };

    var switchTheme = function() {
        $('.theme-style-wrapper').click(function() {
            $('#main-wrapper').attr('class', '');
            var themeValue = $(this).data('theme');
            $('#main-wrapper').addClass(themeValue);
        });
    };

    var switcheryToggle = function() {
        var elems = Array.prototype.slice.call(document.querySelectorAll('.js-switch'));
        elems.forEach(function(html) {
            var switchery = new Switchery(html, {
                size: 'small',
                color: '#27B6AF',
                secondaryColor: '#B3B8C3'
            });
        });
    };

    var navToggleRight = function() {
        $('#toggle-right').on('click', function() {
            $('#sidebar-right').toggleClass('sidebar-right-open');
            $("#toggle-right .fa").toggleClass("fa-indent fa-dedent");

        });
    };

    var navToggleLeft = function() {
        $('#toggle-left').on('click', function() {
            var bodyEl = $('#main-wrapper');
            ($(window).width() > 767) ? $(bodyEl).toggleClass('sidebar-mini'): $(bodyEl).toggleClass('sidebar-opened');
        });
    };

    var navToggleSub = function() {
        var subMenu = $('.sidebar .nav');
        $(subMenu).navgoco({
            caretHtml: false,
            accordion: true
        });

    };

    var profileToggle = function() {
        $('#toggle-profile').click(function() {
            $('.sidebar-profile').slideToggle();
        });
    };


    var fullscreenWidget = function() {
        $("#dashboard").on (".panel .fa-expand", function() {
            var panel = $(this).closest('.panel');
            // $(panel, ".auto-collapse").slideToggle("fast");
            panel.toggleClass('widget-fullscreen');
            $(this).toggleClass('fa-expand fa-compress');
            $('body').toggleClass('fullscreen-widget-active')

        })
    };

    var fullscreenMode = function() {
       $('#toggle-fullscreen.expand').on('click',function(){
        $(document).toggleFullScreen()
        $('#toggle-fullscreen .fa').toggleClass('fa-expand fa-compress');
    });
   };

   var formWizard = function() {
    $('#myWizard').wizard()
}

var formValidation = function() {
    $('#form').validate({
        rules: {
            input1: {
                required: true
            },
            input2: {
                minlength: 5,
                required: true
            },
            input3: {
                maxlength: 5,
                required: true
            },
            input4: {
                required: true,
                minlength: 4,
                maxlength: 8
            },
            input5: {
                required: true,
                min: 5
            },
            input6: {
                required: true,
                range: [5, 50]
            },
            input7: {
                minlength: 5
            },
            input8: {
                required: true,
                minlength: 5,
                equalTo: "#input7"
            },
            input9: {
                required: true,
                email: true
            },
            input10: {
                required: true,
                url: true
            },
            input11: {
                required: true,
                digits: true
            },
            input12: {
                required: true,
                phoneUS: true
            },
            input13: {
                required: true,
                minlength: 5
            }
        },
        highlight: function(element) {
            $(element).closest('.form-group').removeClass('success').addClass('error');
        },
        success: function(element) {
            element.text('OK!').addClass('valid')
            .closest('.form-group').removeClass('error').addClass('success');
        }
    });
}

var formMask = function() {
    $("#input1").mask("99/99/9999");
    $("#input2").mask('(999) 999-9999');
    $("#input3").mask("(999) 999-9999? x99999");
    $("#input4").mask("99-9999999");
    $("#input5").mask("999-99-9999");
    $("#input6").mask("a*-999-a999");
}

var dateRangePicker = function() {
    $('.reportdate').daterangepicker({
        format: 'YYYY-MM-DD',
        startDate: '2014-01-01',
        endDate: '2014-06-30'
    });
};


    //tooltips
    var tooltips = function() {
        $('.tooltip-wrapper').tooltip({
            selector: "[data-toggle=tooltip]",
            container: "body"
        })
    };

    // //Sliders
    // var sliders = function() {
    //     $('.slider-span').slider()
    // };


    //return functions
    return {
     dateRangePicker: dateRangePicker,
     // sliders: sliders,
     formValidation: formValidation,
     formMask: formMask,
     formWizard: formWizard
    };
}();


