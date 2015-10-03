<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% int minPermission = 8; 
   int tab = 0;
   String s = request.getParameter("id");
   Organization org = new Organization();
   if (s == null)
   {%>
        <script>
         window.location.href = "index.jsp";
        </script>
    <%} else {
        int i = Integer.parseInt(s);
        org = Organization.getOne(i);
   }
%>
<%@include file = "layout1.jsp"%>
<br>
    <div class="form-block center-block" style="min-height: 700px;">
        <center><h2 class="title">Изменить информацию об организации</h2></center>
        <hr>
        <form class="form-horizontal" method="post" action="updateOrganizationInfo.jsp?id=<%=Integer.parseInt(s)%>">
                <div class="form-group has-feedback">
                        <label class="col-sm-3 control-label">Название</label>
                        <div class="col-sm-8">
                                <input type="text" class="form-control" name="name" value="<%=org.getName()%>" required>
                                <i class="fa fa-pencil form-control-feedback"></i>
                        </div>
                </div>
                <div class="form-group has-feedback">
                        <label class="col-sm-3 control-label">Адрес</label>
                        <div class="col-sm-8">
                                <input type="text" class="form-control" name="address" value="<%=org.getAddress()%>" required>
                                <i class="fa fa-map-marker form-control-feedback"></i>
                        </div>
                </div>
                <div class="form-group has-feedback">
                        <label class="col-sm-3 control-label">Вебсайт</label>
                        <div class="col-sm-8">
                                <input type="text" class="form-control" name="website" value="<%=org.getWebsite()%>">
                                <i class="fa fa-globe form-control-feedback"></i>
                        </div>
                </div>
                <div class="form-group">
                        <div class="col-sm-offset-3 col-sm-8">
                                <input class="btn btn-block btn-default" type="submit" name="submit" value="Готово">
                        </div>
                </div>
        </form>
</div>


<%@include file = "layout2.jsp"%>