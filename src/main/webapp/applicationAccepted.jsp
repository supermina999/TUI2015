<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int tab = 0;
%>
<%@include file = "layout1.jsp"%>
<script>
    function home() {
        window.location.href = "/";
    }
</script>
<center>
    <form class="center-block" style="width: 50%; min-height: 1200px;">
        <div class="form-horizontal" style="border: 4px double #e84c3d; background: transparent; padding: 10px;">
            <h1><i class="fa fa-check" style="color: #e84c3d"></i></h1>
            <h2>Ваша заявка принята и будет рассмотрена в ближайшее время.</h2>
            <br>
            <p>
                <button type="button" class="btn btn-white" onclick="home();"> На главную <i class="fa fa-home"></i> </button>
            </p>
        </div>
    </form>
</center>
<%@include file = "layout2.jsp"%>