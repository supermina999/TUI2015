<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int tab = 0;
%>
<%@include file = "layout1.jsp"%>
<script>
    function back() {
        window.history.back();
    }
</script>
<center>
    <form class="center-block" style="width: 50%; min-height: 1000px;">
        <div class="form-horizontal" style="border: 4px double #e84c3d; background: transparent; padding: 10px;">
            <h1><i class="fa fa-close" style="color: #e84c3d"></i></h1>
            <h2>К сожалению, авторизация не удалась. Пожалуйста, проверьте правильность написания логина и пароля.</h2>
            <br>
            <p>
                <button type="button" class="btn btn-white" onclick="back();"> Назад <i class="fa fa-mail-reply"></i> </button>
            </p>
        </div>
    </form>
</center>
<%@include file = "layout2.jsp"%>