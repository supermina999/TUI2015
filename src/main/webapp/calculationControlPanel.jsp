<%@page import="java.util.Calendar"%>
<%@page import="maps.Planner"%>
<%@page import="models.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>
<%
    int tab = 6;
%>
<%@include file = "layout1.jsp"%>
<%
    if (!isLogin) {%>
<script>
    window.location.href = "/";
</script>
<%} else if (user.user.getPermissionId() != 1 && user.user.getPermissionId() != 2) {%>
<%@include file = "wrongPermission.jsp"%>
<%} else {
   Safety[] safetys = Safety.getAll(null);
   
   if (request.getParameter("startNew") != null && request.getParameter("startNew").equals("true"))
   {
       
   }
%>
<br>

<div class="form-block center-block" style="width: 80%; min-height: 700px;">
    <center><h2 class="title">Управление расчетом маршрутов</h2></center>
    <hr>
    <table class="table" id="tableBases">
        <thead>
            <tr>
                <th style="width: 50%;">Минимально допустимый уровень безопасности:</th>
                <th style="width: 50%;">Готовность:</th>
            </tr>
            <%
                for (Safety safety : safetys)
                {
                    Integer buf = Planner.status.get(safety.getId());
                    String status = "";
                    boolean ready = false;
                    if (buf == null) status = "Не запланирован";
                    else if (buf == 1 ) status = "Ожидает";
                    else if (buf == 2) status = "Идет расчет";
                    else if (buf == 3) 
                    {
                        status = "Готов";
                        ready = true;
                    } else if (buf == 4) 
                    {
                             status = "Утвержден";
                             ready = true;
                    }
                    %>
            <tr>
                <td><%=safety.getName()%></td>
                <td><%=ready ? ("<a href=\"planInfo.jsp?safetyId=" + safety.getId() + "\">") : ""%> <%=status%><%=ready ?"</a>":""%> </td> 
            </tr>
                    <%
                }
            %>
        </thead>
        <tbody >
                       
        </tbody>
    </table>
    
    
    <form class="form-horizontal" method = "post" action = "startPlanning.jsp">
        <input type="hidden" name="startNew" value="true">
        <button type="submit" class="btn btn-group btn-default btn-block">Расcчитать план на завтра</button>
    </form>
    
</div>
<br>
<% }%>
<%@include file = "layout2.jsp"%>