<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%@page import="javax.sql.*"%>

<% int minPermission = 8; 
   int tab = 0; %>
<%@include file = "layout1.jsp"%>
<%
    String login = request.getParameter("login");
    String password1 = request.getParameter("password1");
    String password2 = request.getParameter("password2");
    String organization_id = request.getParameter("organization_id");
    String permission_id = request.getParameter("permission_id");
    String name = request.getParameter("name");
    name = new String(name.getBytes("iso8859-1"), "utf8");
    String surname = request.getParameter("surname");
    surname = new String(surname.getBytes("iso8859-1"), "utf8");
    String second_name = request.getParameter("second_name");
    second_name = new String(second_name.getBytes("iso8859-1"), "utf8");
    String city_id = request.getParameter("city_id");
    String address = request.getParameter("address");
    address = new String(address.getBytes("iso8859-1"), "utf8");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");
    DBModel.init();
    Person[] all = Person.getAll(null);
    int prevId;
    if (all.length == 0) prevId = 0;
    else prevId = all[all.length-1].getId();
    Person person = new Person();
    person.setId(prevId+1);
    person.setLogin(login);
    person.setPassword(password1);
    person.setName(name);
    person.setSurname(surname);
    person.setSecondName(second_name);
    person.setCityId(Integer.parseInt(city_id));
    person.setAddress(address);
    person.setEmail(email);
    person.setPhone(phone);
    person.setPermissionId(Integer.parseInt(permission_id));
    person.setOrganizationId(Integer.parseInt(organization_id));
    person.writeToDB();
%>
    <script>
        window.location.href = "organizations.jsp";
    </script>

<%@include file = "layout2.jsp"%>