String.prototype.contains = function(it) { return this.indexOf(it) != -1; };
$.each($('.searchInput'),function() {
    var search = function() {
        var s = $(this).val();
        if ($(this).hasClass("City")) s+=", ";
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
    };
    $(this).keyup(search);
    $(this).change(search);
});
