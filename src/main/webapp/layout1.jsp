<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="models.*"%>
<%@page import="users.User"%>
<jsp:useBean id="user" class="users.User" scope="session"/>
<% boolean isLogin = user.getStatus(); 
   int permission = 0;
   if (isLogin) permission = user.user.getPermissionId();
%>
<!DOCTYPE html>
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
    <!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <title>XLV</title>
        <meta name="description" content="iDea a Bootstrap-based, Responsive HTML5 Template">
        <meta name="author" content="htmlcoder.me">

        <!-- Mobile Meta -->
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- Favicon -->
        <link rel="shortcut icon" href="images/icon.png">

        <!-- Web Fonts -->
        <!--<link href='../../../../../fonts.googleapis.com/css_6EE468F4' rel='stylesheet' type='text/css'>
        <link href='../../../../../fonts.googleapis.com/css_A7E562AD' rel='stylesheet' type='text/css'>

        <!-- Bootstrap core CSS -->
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet">

        <!-- Font Awesome CSS -->
        <link href="fonts/font-awesome/css/font-awesome.css" rel="stylesheet">

        <!-- Fontello CSS -->
        <link href="fonts/fontello/css/fontello.css" rel="stylesheet">

        <!-- Plugins -->
        <link href="plugins/rs-plugin/css/settings.css" media="screen" rel="stylesheet">
        <link href="plugins/rs-plugin/css/extralayers.css" media="screen" rel="stylesheet">
        <link href="plugins/magnific-popup/magnific-popup.css" rel="stylesheet">
        <link href="css/animations.css" rel="stylesheet">
        <link href="plugins/owl-carousel/owl.carousel.css" rel="stylesheet">

        <!-- iDea core CSS file -->
        <link href="css/style.css" rel="stylesheet">

        <!-- Style Switcher Styles (Remove these two lines) -->
        <!--<link href="#" data-style="styles" rel="stylesheet"> -->
        <link href="style-switcher/style-switcher.css" rel="stylesheet">

        <!-- Custom css -->
        <link href="css/custom.css" rel="stylesheet">

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
                <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
                <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->

        <script type="text/javascript" src="plugins/jquery.min.js"></script>
        
    </head>

    <!-- body classes: 
                    "boxed": boxed layout mode e.g. <body class="boxed">
                    "pattern-1 ... pattern-9": background patterns for boxed layout mode e.g. <body class="boxed pattern-1"> 
    -->
    <body class="front no-trans">
        <!-- scrollToTop -->
        <!-- ================ -->
        <div class="scrollToTop scrollToTop-red"><i class="icon-up-open-big"></i></div>

        <!-- page wrapper start -->
        <!-- ================ -->
        <div class="page-wrapper">

            <!-- header start classes:
                    fixed: fixed navigation mode (sticky menu) e.g. <header class="header fixed clearfix">
                     dark: dark header version e.g. <header class="header dark clearfix">
            ================ -->
            <header class="header header-custom fixed clearfix">
                <div class="container">
                    <div class="row">
                        <div class="col-md-3">

                            <!-- header-left start -->
                            <!-- ================ -->
                            <div class="header-left clearfix">

                                <!-- logo -->
                                <div class="logo">
                                    <a href="index.jsp"><img id="logo" src="images/logo.png" alt="iDea"></a>
                                </div>

                            </div>
                            <!-- header-left end -->

                        </div>
                        <div class="col-md-9">

                            <!-- header-right start -->
                            <!-- ================ -->
                            <div class="header-right clearfix">

                                <!-- main-navigation start -->
                                <!-- ================ -->
                                <div class="main-navigation animated">

                                    <!-- navbar start -->
                                    <!-- ================ -->
                                    <nav class="navbar navbar-default navbar-custom" role="navigation">
                                        <div class="container-fluid">

                                            <!-- Toggle get grouped for better mobile display -->
                                            <div class="navbar-header">
                                                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse-1">
                                                    <span class="sr-only">Toggle navigation</span>
                                                    <span class="icon-bar"></span>
                                                    <span class="icon-bar"></span>
                                                    <span class="icon-bar"></span>
                                                </button>
                                            </div>
                                            <% 
                                                int width = 0;
                                                if (isLogin) {
                                                    if (user.user.getPermissionId() == 1) width = 4;
                                                    if (user.user.getPermissionId() == 2) width = 25;
                                                    if (user.user.getPermissionId() == 3) width = 75;
                                                    if (user.user.getPermissionId() == 4) width = 71;
                                                    if (user.user.getPermissionId() == 5) width = 45;
                                                    if (user.user.getPermissionId() == 6) width = 79;
                                                }
                                            %>
                                            <!-- Collect the nav links, forms, and other content for toggling -->
                                            <div class="collapse navbar-collapse" style="margin-left: -20px">
                                                <ul class="nav navbar-nav">
                                                    <% if (isLogin) {%>
                                                    <li style="margin-left: <%=width%>px; margin-right: <%=width%>px" <% if (tab == 1) { %>class="active" <% } %>>
                                                        <a class="text-center" href="index.jsp">Главная</a>
                                                    </li>
                                                    <% if (permission == 1 || permission == 6) {%><li style="margin-left: <%=width%>px; margin-right: <%=width%>px" <% if (tab == 2) { %>class="active" <% } %>>
                                                        <a class="text-center" href="applications.jsp">Заявки</a>
                                                    </li> <%}%>
                                                    <% if (permission == 1 || permission == 2 || permission == 5 || permission == 6) {%><li style="margin-left: <%=width%>px; margin-right: <%=width%>px">
                                                        <a class="text-center" type="button" class="btn btn-toggle <% if (tab == 3) { %>btn-toggle-active <% }%>" data-toggle="dropdown">Ресурсы</a>
                                                        <ul class="dropdown-menu dropdown-animation">
                                                            <% if (permission == 1 || permission == 2 || permission == 5 || permission == 6) {%><li><a href="availableResources.jsp">В наличии</a></li><%}%>
                                                            <% if (permission == 1 || permission == 5 || permission == 6) {%><li><a href="typesOfResources.jsp">Виды</a></li><%}%>
                                                        </ul>
                                                    </li>  <% } %>                                    
                                                    <% if (permission == 1 || permission == 2 || permission == 3 || permission == 5) {%><li style="margin-left: <%=width%>px; margin-right: <%=width%>px" <% if (tab == 4) { %>class="active" <% } %>>
                                                        <a class="text-center" href="stocks.jsp">Склады</a>
                                                    </li><%}%>
                                                    <% if (permission == 1 || permission == 2 || permission == 4 || permission == 5) {%><li style="margin-left: <%=width%>px; margin-right: <%=width%>px">
                                                        <a class="text-center" type="button" class="btn btn-toggle <% if (tab == 5) { %>btn-toggle-active <% }%>" data-toggle="dropdown">Транспорт</a>
                                                        <ul class="dropdown-menu dropdown-animation">
                                                            <% if (permission == 1 || permission == 2 || permission == 4 || permission == 5) {%><li><a href="transport.jsp">В наличии</a></li><%}%>
                                                            <% if (permission == 1 || permission == 5 ) {%><li><a href="typesOfTransport.jsp">Виды</a></li><%}%>
                                                        </ul>
                                                    </li><% } %>
                                                    <% if (permission == 1 || permission == 2 || permission == 3 || permission == 4) {%><li style="margin-left: <%=width%>px; margin-right: <%=width%>px">
                                                        <a class="text-center" type="button" class="btn btn-toggle <% if (tab == 6) { %>btn-toggle-active<% }%>" data-toggle="dropdown">Перевозки</a>
                                                        <ul class="dropdown-menu dropdown-animation">
                                                            <% if (permission == 1 || permission == 2 || permission == 4) {%><li><a href="transportations.jsp">Расписание</a></li><%}%>
                                                            <% if (permission == 1 || permission == 2) {%> <li><a href="calculationControlPanel.jsp">Расчет маршрутов</a></li><%}%>
                                                            <% if (permission == 1 || permission == 3 || permission == 4) {%><li><a href="showSafety.jsp">Состояние дорог</a></li><%}%>
                                                        </ul>
                                                    </li><%}%>
                                                    <% if (permission == 1) {%> <li style="margin-left: <%=width%>px; margin-right: <%=width%>px;" <% if (tab == 7) { %>class="active" <% } %>>
                                                        <a class="text-center" href="volunteers.jsp">Волонтёры</a>
                                                    </li><%}}%>
                                                    <li>
                                                        <div class="btn-group"  style="margin-left: 15px">
                                                            <% if (isLogin) {%>
                                                            <a type="button" class="btn btn-login btn-default" href="userInfo.jsp?id=<%=user.user.getId()%>" style="width: 110px;"><i class="fa fa-user"></i> Кабинет</a>
                                                            <a type="button" class="btn btn-login btn-default" href="exit.jsp"><i class="fa fa-sign-out"></i></a>
                                                                <%} else { %>

                                                            <button type="button" class="btn dropdown-toggle btn-login btn-default" data-toggle="dropdown" style="width: 165px; margin-left: 750px;"><i class="fa fa-sign-in"></i> Вход</button>
                                                            <ul class="dropdown-menu dropdown-menu-right dropdown-animation">
                                                                <li>
                                                                    <div class="form-block center-block">
                                                                        <center><h2 class="title">Авторизация</h2></center>
                                                                        <hr>
                                                                        <form class="form-horizontal" method = "post" action = "auth.jsp">
                                                                            <div class="form-group has-feedback">
                                                                                <label class="col-sm-3 control-label">Логин</label>
                                                                                <div class="col-sm-8">
                                                                                    <input type="text" class="form-control" name="login" required>
                                                                                    <i class="fa fa-user form-control-feedback"></i>
                                                                                </div>
                                                                            </div>
                                                                            <div class="form-group has-feedback">
                                                                                <label class="col-sm-3 control-label">Пароль</label>
                                                                                <div class="col-sm-8">
                                                                                    <input type="password" class="form-control" name="password"required>
                                                                                    <i class="fa fa-lock form-control-feedback"></i>
                                                                                </div>
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <div class="col-sm-offset-3 col-sm-8">										
                                                                                    <button type="submit" class="btn btn-group btn-default btn-block">Войти</button>
                                                                                </div>
                                                                            </div>
                                                                        </form>
                                                                </li>
                                                            </ul>
                                                            <% }%>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>

                                        </div>
                                    </nav>
                                    <!-- navbar end -->

                                </div>
                                <!-- main-navigation end -->

                            </div>
                            <!-- header-right end -->

                        </div>
                    </div>
                </div>
            </header>
            <!-- header end -->