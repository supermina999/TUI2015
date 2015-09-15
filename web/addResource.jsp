<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% int minpermission = 8; 
   int tab = 6; %>
<%@include file = "layout1.jsp"%>
<br>
    <div class="form-block center-block">
        <center><h1 class="title">Добавить новый ресурс</h1></center>
        <hr>
            <form role="form">
                <label class="col-sm-3 control-label">Наименование</label>
		<select class="form-control">
                    <option>1</option>
                    <option>2</option>
                    <option>3</option>
                    <option>4</option>
                    <option>5</option>
		</select>
            <br>
            </form>
            <form role="form">
                <div class="form-group">
                    <label for="exampleInputEmail1">Количество</label>
                    <input type="email" class="form-control" id="exampleInputEmail1">
		</div>
		<div class="form-group">
                    <label for="exampleInputPassword1">Город</label>
                    <input type="password" class="form-control" id="exampleInputPassword1">
		</div>
                <div class="form-group">
                    <label for="exampleInputPassword1">Склад</label>
                    <input type="password" class="form-control" id="exampleInputPassword1">
		</div>
		<button type="submit" class="btn btn-default">Добавить</button>
            </form>
    </div>
          
<%@include file = "layout2.jsp"%>
