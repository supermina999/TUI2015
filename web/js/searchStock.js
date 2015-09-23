$('#searchInput').change(function() {
    var s = $('#searchInput').val();
    console.log(s);
    var $rows = $(document).find("#stockTable").find("tr");
    $.each($rows, function() {
        console.log($($(this).find(".stockId")[0]).text());
        if ($($(this).find(".stockId")[0]).text() != s) $(this).addClass("hidden");
        else $(this).removeClass("hidden");        
    });
});