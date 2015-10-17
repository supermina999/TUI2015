String.prototype.contains = function(it) { return this.indexOf(it) != -1; };
$.each($('.searchInput'),function() {
    var search = function() {
        var s = $(this).val();
        if ($(this).hasClass("Region")) s+=", ";
        s = s.toLowerCase();
        console.log(s);
        var $rows = $(document).find("#searchTable").find("tr");
        if (!s.contains("выберите")) {
            $.each($rows, function() {
                var t = $(this).text();
                    t = t.toLowerCase();
                console.log(t);
                if (t.contains(s)) $(this).removeClass("hidden");
                else $(this).addClass("hidden"); 
            });
        } else {
            $.each($rows, function() {
                $(this).removeClass("hidden");
            });
        }
    };
    $(this).keyup(search);
    $(this).change(search);
});
