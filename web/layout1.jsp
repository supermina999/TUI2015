<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="models.*"%>
<%@page import="users.User"%>
<jsp:useBean id="user" class="users.User" scope="session"/>
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
		<link rel="shortcut icon" href="images/favicon.ico">

		<!-- Web Fonts -->
		<link href='../../../../../fonts.googleapis.com/css_6EE468F4' rel='stylesheet' type='text/css'>
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
		<link href="#" data-style="styles" rel="stylesheet">
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

											<!-- Collect the nav links, forms, and other content for toggling -->
											<div class="collapse navbar-collapse">
												<ul class="nav navbar-nav">
                                                                                                    
													<li <% if (tab == 1) { %>class="active" <% } %>>
														<a href="index.jsp">Главная</a>
													</li>
                                                                                                        <li <% if (tab == 2) { %>class="active" <% } %>>
														<a href="organizations.jsp">Организации</a>
													</li>
                                                                                                        <li class="dropdown <% if (tab == 3) { %> active <% } %> ">
														<a class="dropdown-toggle" data-toggle="dropdown">Ресурсы</a>
                                                                                                                <ul class="dropdown-menu">
                                                                                                                    <li><a href="availableResources.jsp">В наличии</a></li>
                                                                                                                    <li><a href="neededResources.jsp">Требующиеся</a></li>
                                                                                                                </ul>
													</li>
                                                                                                        <li <% if (tab == 4) { %>class="active" <% } %>>
														<a href="stocks.jsp">Склады</a>
													</li>
                                                                                                        <li <% if (tab == 5) { %>class="active" <% } %>>
														<a href="stations.jsp">Пункты выдачи</a>
													</li>
                                                                                                        <li <% if (tab == 6) { %>class="active" <% } %>>
														<a href="reports.jsp">Отчёты</a>
													</li>
                                                                                                        <li>
                                                                                                            <div class="btn-group">
                                                                                                                <%
                                                                                                                  boolean isLogin = user.getStatus();
                                                                                                                  if (isLogin) {
                                                                                                                  %>
                                                                                                                  <a type="button" class="btn btn-login btn-default" href="userInfo.jsp?id=<%=user.getId()%>" style="width: 110px;"><i class="fa fa-user"></i> Кабинет</a>
                                                                                                                  <a type="button" class="btn btn-login btn-default" href="exit.jsp"><i class="fa fa-sign-out"></i></a>
                                                                                                                <%} else { %>
                                                                                                                  
                                                                                                                <button type="button" class="btn dropdown-toggle btn-login btn-default" data-toggle="dropdown" style="width: 165px;"><i class="fa fa-sign-in"></i> Вход</button>
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
                                                                                                                                                            <div class="checkbox">
                                                                                                                                                                    <label>
                                                                                                                                                                            <input type="checkbox"> Запомнить меня
                                                                                                                                                                    </label>
                                                                                                                                                            </div>											
                                                                                                                                                            <button type="submit" class="btn btn-group btn-default btn-block">Войти</button>
                                                                                                                                                    </div>
                                                                                                                                            </div>
                                                                                                                                    </form>
                                                                                                                        </li>
                                                                                                                </ul>
                                                                                                                <% } %>
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
