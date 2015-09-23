$('#searchIdInput').change(function() {
    var s = $('#searchIdInput').val();
    var $rows = $(document).find("#stockTable").find("tr");
    $.each($rows, function() {
        if ($($(this).find(".idSearch")[0]).text() != s) $(this).addClass("hidden");
        else $(this).removeClass("hidden"); 
    });
});