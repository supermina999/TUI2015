<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int tab = 1;
    Person[] persons = Person.getAll(null);
    Request[] requests = Request.getAll(null);
    DBEntry[] params1 = {
        new DBEntry("request_id", EntryType.Int, 1)
    };
    DBEntry[] params2 = {
        new DBEntry("request_id", EntryType.Int, 2)
    };    
    Transportation[] transGive = Transportation.getAll(params1);
    Transportation[] transGet = Transportation.getAll(params2);
%>
<%@include file="layout1.jsp"%>


<!-- page-top start-->
<!-- ================ -->
<div class="page-top">
    <div class="container">
        <div class="col-lg-6">
            <h1 style="color: #e84c3d">Добро пожаловать!</h1>
            <h2 style="margin-bottom: 0">Хотите пожертвовать что-то?</h2>
            <h2 style="margin-top: 0">Нуждаетесь в помощи?</h2> 
            <h3 style="margin-bottom: 5px;">Оставьте свои контактные данные, и мы свяжемся с Вами в течение суток.</h3>
            <a class="btn btn-default btn-block" href="newApplication.jsp">Оставить заявку</a>
            <h1 class="text-center" style="font-style: italic">Изменим мир к лучшему вместе!</h1>
        </div>
        <div class="col-lg-6">
            <img src="images/slider-1-layer.png" alt="">
        </div>
    </div><br>
    <div class="container">
        <p style="font-size: 18px;"> В последнее время мы стали все чаще слышать о волонтерском движении, волонтерах. И если где-то в нашем государстве появляется насущная жизненная потребность в лекарствах, одежде, специальных средствах и т.п., обязательно появляются неравнодушные люди, желающие помочь. Военные действия, природные катаклизмы, техногенные аварии и катастрофы - все это может стать объектами сосредоточения внимания волонтеров. Но бывает и так, что помощь приходит не всегда вовремя, бывает так, что в одних местах густо, а в других пусто. Поэтому, возникает потребность в координации волонтерских усилий. Сегодня этим занимаются специальные волонтерские организации. Они собирают вещи, медикаменты, оборудование на местах, а затем пересылают в пункты, где они нужны. Транспортировкой помощи занимаются другие волонтеры, которые либо предоставляют транспортные средства, или сами везут груз в места назначения. Дорога может быть опасной, ситуация в регионах быстро меняться, и перевозчики должны знать об этих изменениях для того, чтобы выбрать самый безопасный и самый быстрый маршрут.</p>

        <div class="row">
            <div class="col-md-5">
                <form class="form-text center-block" style="margin-top: 0px;">
                    <p style="font-size: 18px;"> <strong><a href="about.jsp">Команда XLV</a></strong>, представляющая Харьковский УВК №45 "Академическая гимназия", разработала и реализовала инструмент, который позволит вести базы данных волонтеров, имеющихся ресурсов и потребностей в этих ресурсах, будет включать в себя систему эффективного управления запасами, распределения ресурсов, автоматического определения оптимальных маршрутов в динамике.</p>
                </form>
            </div>
            <div class="col-md-6">
                <% if (!isLogin) {%>
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
                </div> 
                <% } else {%>
                <center>
                    <h2>Добро пожаловать,<br> <%=user.user.getName()%> <%=user.user.getSecondName()%>!</h2>
                    <a type="button" class="btn btn-login btn-default btn-main" href="userInfo.jsp?id=<%=user.user.getId()%>"><i class="fa fa-user"></i> Кабинет</a>
                    <a type="button" class="btn btn-login btn-default btn-main" href="exit.jsp"><i class="fa fa-sign-out"></i> Выйти</a>
                </center>
                <% }%>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="stats row grid-space-10">
            <div class="col-md-3 col-sm-6">
                <div class="box-style-1">
                    <h2 class="title">Волонтёров работает</h2>
                    <i class="fa fa-users"></i>
                    <span class="stat-num" data-to="<%=persons.length%>" data-speed="3000">0</span>
                </div>
            </div>
            <div class="col-md-3 col-sm-6">
                <div class="box-style-1">
                    <h2 class="title">Заявок обработано</h2>
                    <i class="fa fa-pencil-square-o"></i>
                    <span class="stat-num" data-to="<%=requests.length%>" data-speed="3000">0</span>
                </div>
            </div>
            <div class="col-md-3 col-sm-6">
                <div class="box-style-1">
                    <h2 class="title">Ресурсов получено</h2>
                    <i class="fa fa-gift"></i>
                    <span class="stat-num" data-to="<%=transGet.length%>" data-speed="3000">0</span>
                </div>
            </div>
            <div class="col-md-3 col-sm-6">
                <div class="box-style-1">
                    <h2 class="title">Ресурсов доставлено</h2>
                    <i class="fa fa-ambulance"></i>
                    <span class="stat-num" data-to="<%=transGive.length%>" data-speed="3000">0</span>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- page-top end -->






<!-- section start -->
<!-- ================ -->
<div class="section gray-bg clearfix">
    <div class="owl-carousel content-slider">
        <div class="testimonial">
            <div class="container">
                <div class="row">
                    <div class="col-md-8 col-md-offset-2">
                        <div class="testimonial-body">
                            <blockquote class="inline">
                                <p class="margin-clear" style="font-size: 20px;">Маленький акт доброты стоит больше, чем величайшее намерение.</p>	
                                <footer><cite title="Source Title">Оскар Уайльд</cite></footer>
                            </blockquote>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="testimonial">
            <div class="container">
                <div class="row">
                    <div class="col-md-8 col-md-offset-2">
                        <div class="testimonial-body">
                            <blockquote class="inline">
                                <p class="margin-clear" style="font-size: 20px;">Волонтёры не получают зарплату не потому, что они бесполезны, а потому, что они бесценны.</p>	
                                <footer><cite title="Source Title">Шерри Андерсон</cite></footer>
                            </blockquote>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="testimonial">
            <div class="container">
                <div class="row">
                    <div class="col-md-8 col-md-offset-2">
                        <div class="testimonial-body">
                            <blockquote class="inline">
                                <p class="margin-clear" style="font-size: 20px;">Тот, кто ничего не делает для других – ничего не делает для себя.</p>	
                                <footer><cite title="Source Title">Гете</cite></footer>
                            </blockquote>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="testimonial">
            <div class="container">
                <div class="row">
                    <div class="col-md-8 col-md-offset-2">
                        <div class="testimonial-body">
                            <blockquote class="inline">
                                <p class="margin-clear" style="font-size: 20px;">Чтобы поверить в добро, надо начать делать его.</p>	
                                <footer><cite title="Source Title">Лев Толстой</cite></footer>
                            </blockquote>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="testimonial">
            <div class="container">
                <div class="row">
                    <div class="col-md-8 col-md-offset-2">
                        <div class="testimonial-body">
                            <blockquote class="inline">
                                <p class="margin-clear" style="font-size: 20px;">Лучше самая малая помощь, чем самое большое сочувствие.</p>	
                                <footer><cite title="Source Title">Владислав Лоранц</cite></footer>
                            </blockquote>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- section end -->

<%@include file="layout2.jsp"%>
