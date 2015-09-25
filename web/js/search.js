String.prototype.contains = function(it) { return this.indexOf(it) != -1; };
$('#searchIdInput').keyup(function() {
    var s = $('#searchIdInput').val();
    s = s.toLowerCase();
    var $rows = $(document).find("#searchTable").find("tr");
    console.log(s);
    $.each($rows, function() {
        var t = $(this).text();
        t = t.toLowerCase();
        console.log(t);
        if (t.contains(s)) $(this).removeClass("hidden");
        else $(this).addClass("hidden"); 
    });
});