$('#searchIdInput').keyup(function() {
    var s = $('#searchIdInput').val();
    var $rows = $(document).find("#searchTable").find("tr");
    console.log(s);
    $.each($rows, function() {
        console.log($($(this).find(".idSearch")[0]).text());
        if ($($(this).find(".idSearch")[0]).text() != s) $(this).addClass("hidden");
        else $(this).removeClass("hidden"); 
    });
});