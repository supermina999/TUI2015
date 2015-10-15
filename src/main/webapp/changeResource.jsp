<%@page import="models.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    int minPermission = 8;
    int tab = 4;
    int id = Integer.parseInt(request.getParameter("id"));
    Boolean isNeeded = request.getParameter("is_needed").equals("true");
    NeededResource needed = null;
    AvailableResource available = null;
    if (isNeeded)
    {
        needed = NeededResource.getOne(id);
    }
    else
    {
        available = AvailableResource.getOne(id);
    }
%>

<%@include file = "layout1.jsp"%>
<br>
<div class="form-block center-block" style="width: 50%; min-height: 500px;">
    <center><h2 class="title">Изменить информацию о количестве ресурса</h2></center>
    <hr>
    <form class="form-horizontal" method = "get" action = "update<%=isNeeded ? "Needed" : "Available"%>Resource.jsp?">
        <div class="form-group has-feedback">
            <label class="col-sm-4 control-label">Новое количество</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" name="number" value="<%=isNeeded ? needed.getNumber() : available.getNumber()%>" required> 
                <i class="fa form-control-feedback"></i>
            </div>
                <input type="hidden" name="id" value="<%=id%>">
        </div>
        <div class="form-group">
            <div class="col-sm-offset-3 col-sm-8">					
                <button type="submit" class="btn btn-group btn-default btn-block">Готово</button>
            </div>
        </div>
    </form>
</div>
<%@include file = "layout2.jsp"%>