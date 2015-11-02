<%@page import="java.util.Calendar, users.User, sql.Sql"%><%@page contentType="text/plain" pageEncoding="UTF-8"%><%
    User user = new User();
    boolean isOk = user.tryToLogin(request);
    if (user.user.getPermissionId() != 1 && user.user.getPermissionId() != 4) isOk=false;
    if (isOk) {
        String token = user.user.getName() + Calendar.getInstance().getTimeInMillis();
        token = Sql.md5(token);
%><%=token%>
<%=user.user.getId()%>
<%
} else {
%><%="Wrong login/password"%><%
    }
%>