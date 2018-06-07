(function() {
    $(function() {
        var modal_holder_selector, modal_selector;
        modal_holder_selector = '#modal-holder';
        modal_selector = '.modal';
        $(document).on('click', 'a[data-modal]', function() {
            var location;
            location = $(this).attr('href');
            $.get(location, function(data) {
                return $(modal_holder_selector).html(data).find(modal_selector).modal();
            });
            return false;
        });
        $(document).on('click', '#mainModal', function() {
            $("input[type=radio]").change(function (e) {
                $("#user_asin, #list_asin").removeClass("selected");
                $("#" + $(e.currentTarget).val()).addClass("selected")
            });
        });
        $(document).on("submit", "form", function(event) {
            event.preventDefault();
            var list = $('div');
            var form = $(this);
            var keyId = parseInt($(this).attr('id'));
            var inputVal = $(this).find("input:checked").nextAll('div').first().children('[name=key-asin]').val();
            $.ajax({
                type: "POST",
                url: "/keys/" + keyId  +"/check_availability",
                dataType: "xml",
                data: {"key": {"asin": inputVal}},
                success: function(xml) {
                    var asin = $(xml).find('Item').children('asin').text();
                    var image = $(xml).find('Item').children('imagesets').children('imageset').children('mediumimage')[0].outerHTML;
                    var list = $("<div></div>")
                      .append('<div>'+asin+'</div>')
                      .append('<img src="'+ image.match(/<URL>(.+)<\/URL>/)[1] +'" />');
                    form.replaceWith(list);
                    return true
                },
                error: function() {
                    alert("An error occurred while processing XML file.");
                }

            });
        });
        return $(document).on('ajax:success', 'form[data-modal]', function(event, data, status, xhr) {
            var url;
            url = xhr.getResponseHeader('Location');
            if (url) {
                window.location = url;
            } else {
                $('.modal-backdrop').remove();
                $(modal_holder_selector).html(data).find(modal_selector).modal();
            }
            return false;
        });
    });


}).call(this);