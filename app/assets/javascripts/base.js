$(document).on("ready", function() {

    $.extend($.expr[":"], {
        "startWith": function(elem, i, match, array) {
            return (elem.textContent || elem.innerText || "").toLowerCase().indexOf((match[3] || "").toLowerCase()) === 0;
        }
    });
    $.extend($.expr[":"], {
        "contains_IS": function(elem, i, match, array) {
            return (elem.textContent || elem.innerText || "").toLowerCase().indexOf((match[3] || "").toLowerCase()) >= 0;
        }
    });

    $(document).on("keyup", "#search_field", function(e) {

        if (this.value.length > 0) {
            $("[data-name]").hide();
            $(".aux").hide();

            $("[data-name*='" + this.value.toLowerCase() + "']").show();
            $("[data-year*='" + this.value.toLowerCase() + "']").show();
            $("[data-genre*='" + this.value.toLowerCase() + "']").show();
            $("[data-platform*='" + this.value.toLowerCase() + "']").show();
            $("[data-description*='" + this.value.toLowerCase() + "']").show();
            $("[data-aux*='" + this.value.toLowerCase() + "']").show();
            $("[data-developer*='" + this.value.toLowerCase() + "']").show();
        } else {
            $("[data-name]").show()
            $(".aux").hide();
        }
    });

})

$(document).on('click', '.add_child', function() {
    var association = $(this).attr('data-association');
    var target = $(this).attr('target');
    var regexp = new RegExp('new_' + association, 'g');
    var new_id = new Date().getTime();

    var Dest = (target == '') ? $(this).parent() : $(target);

    Dest.append(window['children_fields'].replace(regexp, new_id));
    return false;
});

$(document).delegate('.remove_child', 'click', function() {
    $(this).parent()
    $(this).parent().children('.removable')[0].value = 1;
    $(this).parent().hide();
    return false;
});

$(document).ready(function() {


    var lid = window.location.href.substr(window.location.href.lastIndexOf('/') + 1);
    var sort_url = "/tabs/sort?tabable_id=" + lid;

    $('#tabs').sortable({
        axis: 'x',
        dropOnEmpty: false,
        handle: '.handle',
        items: 'li',
        opacity: 0.4,
        scroll: true,
        update: function() {
            $.ajax({
                type: 'post',
                data: $('#tabs').sortable('serialize'),
                dataType: 'script',
                complete: function(request) {
                    $('#tabs').effect('highlight');
                },
                url: sort_url
            })
        }
    });
});

$(document).on('click', function() {

    var obj = $("#rows .active").data('name');
    var tag = $("#rows .active").attr('id');
    var myRe = /[^-]+$/;
    var myTargetId = myRe.exec(tag);
    var sort_url = "/" + obj + "/sort?tab_id=" + myTargetId;

    $('#rows').sortable({
        axis: 'y',
        dropOnEmpty: false,
        handle: '.handle',
        items: 'li',
        opacity: 0.4,
        scroll: true,
        update: function() {
            $.ajax({
                type: 'post',
                data: $('#rows').sortable('serialize'),
                dataType: 'script',
                complete: function(request) {
                    $('#rows').effect('highlight');
                },
                url: sort_url
            })
        }
    });
});


$(document).ready(function() {
    $('.editBtn').click(function() {
        if ($('.editField').is('[readonly]')) { //checks if it is already on readonly mode
            $('.editField').prop('readonly', false); //turns the readonly off
            $('.editBtn').html('Editing'); //Changes the text of the button
            $('.editBtn').css("background", "#2a9fd6"); //changes the background of the button
            $('.editBtn').css("color", "white"); //changes the border of the button
            $('[data-url]').addClass("editing");
        } else { //else we do other things
            $('.editField').prop('readonly', true);
            $('.editBtn').html('Edit');
            $('.editBtn').css("background", "inherit");
            $('.editBtn').css("color", "#2a9fd6");
            $('[data-url]').removeClass("editing");
        }
    });
});

$(document).ready(function() {
    $('.newBtn').click(function() {
        if ($('#new-data-fields').hasClass("adding")) {
            $('.newBtn').html('New');
            $('.newBtn').css("background", "inherit");
            $('.newBtn').css("color", "#2a9fd6");
            $('#new-data-fields').removeClass("adding");
            $('#existing-data-fields').removeClass("adding");
        } else { //else we do other things
            $('.newBtn').html('Adding'); //Changes the text of the button
            $('.newBtn').css("background", "#2a9fd6"); //changes the background of the button
            $('.newBtn').css("color", "white"); //changes the border of the button
            $('#new-data-fields').addClass("adding");
            $('#existing-data-fields').addClass("adding");

        }
    });
});

$(document).on('click', '[data-url]:not(.editing)', function() {
    window.location = $(this).data().url;
});

$(document).on("blur", "[data-submiturl]", function() {

    jQuery.ajax($(this).data().submiturl, {
        data: {
            value: $(this).val()
        },
        context: this,
        complete: function(data) {
            $(this).effect('highlight');
        },
    });

});
