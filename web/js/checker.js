$('#password1').keyup(function() {
    var pass1 = $('#password1').val();
    var pass2 = $('#password2').val();
    if (pass1 == "" || pass2 == "") {
        $('#divPass1').removeClass("has-error");
        $('#divPass2').removeClass("has-error");
        $('#divPass1').removeClass("has-success");
        $('#divPass2').removeClass("has-success");
    }
    else if (pass1 != pass2) {
        $('#divPass1').removeClass("has-success");
        $('#divPass2').removeClass("has-success");
        $('#divPass1').addClass("has-error");
        $('#divPass2').addClass("has-error");
    }
    else {
        $('#divPass1').removeClass("has-error");
        $('#divPass2').removeClass("has-error");
        $('#divPass1').addClass("has-success");
        $('#divPass2').addClass("has-success");
    }
});

$('#password2').keyup(function() {
    var pass1 = $('#password1').val();
    var pass2 = $('#password2').val();
    if (pass1 == "" || pass2 == "") {
        $('#divPass1').removeClass("has-error");
        $('#divPass2').removeClass("has-error");
        $('#divPass1').removeClass("has-success");
        $('#divPass2').removeClass("has-success");
    }
    else if (pass1 != pass2) {
        $('#divPass1').removeClass("has-success");
        $('#divPass2').removeClass("has-success");
        $('#divPass1').addClass("has-error");
        $('#divPass2').addClass("has-error");
    }
    else {
        $('#divPass1').removeClass("has-error");
        $('#divPass2').removeClass("has-error");
        $('#divPass1').addClass("has-success");
        $('#divPass2').addClass("has-success");
    }
});