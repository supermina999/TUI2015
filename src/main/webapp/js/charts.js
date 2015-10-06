$('#tabRes').click(function() {
    if ($('#tabRes').hasClass("temp")) {
        $('[id ^= res]').addClass("hidden");
        $('#tabRes').removeClass("temp");
    }
    else  { 
        $('[id ^= res]').removeClass("hidden");
        $('#tabRes').addClass("temp");
    }
});