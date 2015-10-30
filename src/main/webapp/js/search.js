String.prototype.contains = function(it) { return this.indexOf(it) != -1; };
//Возможно это говнокод, но ничего другого в час ночи я не придумала. Зато работает :)
$.each($('.searchInput'),function() {
    $(this).change(function() {
        var f = 0;
        $.each($('.searchInput'), function() {
            if (!$(this).val().toLowerCase().contains("выберите")) {
                f = 1;
                return;
            }
        });
        $.each($('.searchInputText'), function() {
            if ($(this).val() !== "") {
                f = 1;
                return;
            }
        });
        if (!f) {
            $.each($(document).find("#searchTable").find("tr"), function() {
                $(this).removeClass("hidden");
            });
        } else {
            var $rows = $(document).find("#searchTable").find("tr");
            $.each($rows, function() {
                    var t = $(this);
                    var b = 1;
                    $.each($('.searchInput'), function() {
                        var s = $(this).val();
                        s = s.toLowerCase();
                        if (!s.contains("выберите")) {
                            if (!t.text().toLowerCase().contains(s)) {
                                b = 0;
                            }
                        }
                    });
                    $.each($('.searchInputText'), function() {
                        var s = $(this).val();
                        s = s.toLowerCase();
                        if (s !== "") {
                            if (!t.text().toLowerCase().contains(s)) {
                                b = 0;
                            }
                        }
                    });
                    if (b === 0) t.addClass("hidden"); 
                    else t.removeClass("hidden");
            });
        }
    });
});

$.each($('.searchInputText'),function() {
    $(this).keyup(function() {
        var f = 0;
        $.each($('.searchInput'), function() {
            if (!$(this).val().toLowerCase().contains("выберите")) {
                f = 1;
                return;
            }
        });
        $.each($('.searchInputText'), function() {
            if ($(this).val() !== "") {
                f = 1;
                return;
            }
        });
        if (!f) {
            $.each($(document).find("#searchTable").find("tr"), function() {
                $(this).removeClass("hidden");
            });
        } else {
            var $rows = $(document).find("#searchTable").find("tr");
            $.each($rows, function() {
                    var t = $(this);
                    var b = 1;
                    $.each($('.searchInput'), function() {
                        var s = $(this).val();
                        s = s.toLowerCase();
                        if (!s.contains("выберите")) {
                            if (!t.text().toLowerCase().contains(s)) {
                                b = 0;
                            }
                        }
                    });
                    $.each($('.searchInputText'), function() {
                        var s = $(this).val();
                        s = s.toLowerCase();
                        if (s !== "") {
                            if (!t.text().toLowerCase().contains(s)) {
                                b = 0;
                            }
                        }
                    });
                    if (b === 0) t.addClass("hidden"); 
                    else t.removeClass("hidden");
            });
        }
    });
});

$.each($('.searchInput1'),function() {
    $(this).change(function() {
        var f = 0;
        $.each($('.searchInput1'), function() {
            if (!$(this).val().toLowerCase().contains("выберите")) {
                f = 1;
                return;
            }
        });
        $.each($('.searchInputText1'), function() {
            if ($(this).val() !== "") {
                f = 1;
                return;
            }
        });
        if (!f) {
            $.each($(document).find("#searchTable1").find("tr"), function() {
                $(this).removeClass("hidden");
            });
        } else {
            var $rows = $(document).find("#searchTable1").find("tr");
            $.each($rows, function() {
                    var t = $(this);
                    var b = 1;
                    $.each($('.searchInput1'), function() {
                        var s = $(this).val();
                        s = s.toLowerCase();
                        if (!s.contains("выберите")) {
                            if (!t.text().toLowerCase().contains(s)) {
                                b = 0;
                            }
                        }
                    });
                    $.each($('.searchInputText1'), function() {
                        var s = $(this).val();
                        s = s.toLowerCase();
                        if (s !== "") {
                            if (!t.text().toLowerCase().contains(s)) {
                                b = 0;
                            }
                        }
                    });
                    if (b === 0) t.addClass("hidden"); 
                    else t.removeClass("hidden");
            });
        }
    });
});

$.each($('.searchInputText1'),function() {
    $(this).keyup(function() {
        var f = 0;
        $.each($('.searchInput1'), function() {
            if (!$(this).val().toLowerCase().contains("выберите")) {
                f = 1;
                return;
            }
        });
        $.each($('.searchInputText1'), function() {
            if ($(this).val() !== "") {
                f = 1;
                return;
            }
        });
        if (!f) {
            $.each($(document).find("#searchTable1").find("tr"), function() {
                $(this).removeClass("hidden");
            });
        } else {
            var $rows = $(document).find("#searchTable1").find("tr");
            $.each($rows, function() {
                    var t = $(this);
                    var b = 1;
                    $.each($('.searchInput1'), function() {
                        var s = $(this).val();
                        s = s.toLowerCase();
                        if (!s.contains("выберите")) {
                            if (!t.text().toLowerCase().contains(s)) {
                                b = 0;
                            }
                        }
                    });
                    $.each($('.searchInputText1'), function() {
                        var s = $(this).val();
                        s = s.toLowerCase();
                        if (s !== "") {
                            if (!t.text().toLowerCase().contains(s)) {
                                b = 0;
                            }
                        }
                    });
                    if (b === 0) t.addClass("hidden"); 
                    else t.removeClass("hidden");
            });
        }
    });
});

$.each($('.searchInput2'),function() {
    $(this).change(function() {
        var f = 0;
        $.each($('.searchInput2'), function() {
            if (!$(this).val().toLowerCase().contains("выберите")) {
                f = 1;
                return;
            }
        });
        $.each($('.searchInputText2'), function() {
            if ($(this).val() !== "") {
                f = 1;
                return;
            }
        });
        if (!f) {
            $.each($(document).find("#searchTable2").find("tr"), function() {
                $(this).removeClass("hidden");
            });
        } else {
            var $rows = $(document).find("#searchTable2").find("tr");
            $.each($rows, function() {
                    var t = $(this);
                    var b = 1;
                    $.each($('.searchInput2'), function() {
                        var s = $(this).val();
                        s = s.toLowerCase();
                        if (!s.contains("выберите")) {
                            if (!t.text().toLowerCase().contains(s)) {
                                b = 0;
                            }
                        }
                    });
                    $.each($('.searchInputText2'), function() {
                        var s = $(this).val();
                        s = s.toLowerCase();
                        if (s !== "") {
                            if (!t.text().toLowerCase().contains(s)) {
                                b = 0;
                            }
                        }
                    });
                    if (b === 0) t.addClass("hidden"); 
                    else t.removeClass("hidden");
            });
        }
    });
});

$.each($('.searchInputText2'),function() {
    $(this).keyup(function() {
        var f = 0;
        $.each($('.searchInput2'), function() {
            if (!$(this).val().toLowerCase().contains("выберите")) {
                f = 1;
                return;
            }
        });
        $.each($('.searchInputText2'), function() {
            if ($(this).val() !== "") {
                f = 1;
                return;
            }
        });
        if (!f) {
            $.each($(document).find("#searchTable2").find("tr"), function() {
                $(this).removeClass("hidden");
            });
        } else {
            var $rows = $(document).find("#searchTable2").find("tr");
            $.each($rows, function() {
                    var t = $(this);
                    var b = 1;
                    $.each($('.searchInput2'), function() {
                        var s = $(this).val();
                        s = s.toLowerCase();
                        if (!s.contains("выберите")) {
                            if (!t.text().toLowerCase().contains(s)) {
                                b = 0;
                            }
                        }
                    });
                    $.each($('.searchInputText2'), function() {
                        var s = $(this).val();
                        s = s.toLowerCase();
                        if (s !== "") {
                            if (!t.text().toLowerCase().contains(s)) {
                                b = 0;
                            }
                        }
                    });
                    if (b === 0) t.addClass("hidden"); 
                    else t.removeClass("hidden");
            });
        }
    });
});
