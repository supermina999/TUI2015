String.prototype.contains = function(it) { return this.indexOf(it) != -1; };
$('#searchIdInput').keyup(function() {
    var s = $('#searchIdInput').val();
    s = s.toLowerCase();
    var $rows = $(document).find("#searchTable").find("tr");
    console.log(s);
    $.each($rows, function() {
        var t = $($(this).find(".idSearch")[0]).text();
        t = t.toLowerCase();
        if (t.contains(s)) $(this).removeClass("hidden");
        else $(this).addClass("hidden"); 
    });
});