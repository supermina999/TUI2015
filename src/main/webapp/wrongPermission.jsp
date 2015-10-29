<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script>
    function back() {
        window.history.back();
    }
    function userInfo() {
        window.location.href = "userInfo.jsp?id=<%=user.user.getId()%>";
    }
    function home() {
        window.location.href = "/";
    }
</script>
<center>
    <form class="center-block" style="width: 50%; min-height: 1000px;">
        <div class="form-horizontal" style="border: 4px double #e84c3d; background: transparent; padding: 10px;">
            <h1><i class="fa fa-warning" style="color: #e84c3d"></i></h1>
            <h2>К сожалению, у Вас недостаточно прав для просмотра этой страницы.</h2>
            <br>
            <p>
                <button type="button" class="btn btn-white" onclick="back();"> Назад <i class="fa fa-mail-reply"></i> </button>
                <button type="button" class="btn btn-white" onclick="userInfo();"> В кабинет <i class="fa fa-user"></i></button>
                <button type="button" class="btn btn-white" onclick="home();"> На главную <i class="fa fa-home"></i> </button>
            </p>
        </div>
    </form>
</center>