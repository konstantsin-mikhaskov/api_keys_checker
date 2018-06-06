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
            var keyId = parseInt($(this).attr('id'));
            var inputVal = $(this).find("input:checked").nextAll('div').first().children('[name=key-asin]').val();
            $.ajax({
                type: "POST",
                url: "/keys/" + keyId  +"/check_availability",
                dataType: "xml",
                data: {"key": {"asin": inputVal}},
                success: function(xml) {
                    $(xml).find('Item').children('asin').appendTo(".modal-footer");
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