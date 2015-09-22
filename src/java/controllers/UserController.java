package controllers;

import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import models.*;
import users.User;

import sql.Sql;


public class UserController {
    
    public static boolean login(HttpServletRequest request) throws Exception
    {
        String login = request.getParameter("login");
        String password = request.getParameter("password");
        User user = new User();
        return user.tryToLogin(login, password);
    }
         
    public static void add(HttpServletRequest request) throws Exception
    {
        String login = request.getParameter("login");
        String password1 = request.getParameter("password1");
        String password2 = request.getParameter("password2");
        if (!password1.equals(password2)) return;
        String organization_id = request.getParameter("organization_id");
        if (!Sql.isInt(organization_id)) return;
        String permission_id = request.getParameter("permission_id");
        if (!Sql.isInt(permission_id)) return;
        String name = request.getParameter("name");
        name = new String(name.getBytes("iso8859-1"), "utf8");
        String surname = request.getParameter("surname");
        surname = new String(surname.getBytes("iso8859-1"), "utf8");
        String second_name = request.getParameter("second_name");
        second_name = new String(second_name.getBytes("iso8859-1"), "utf8");
        String city_id = request.getParameter("city_id");
        if (!Sql.isInt(city_id)) return;
        String address = request.getParameter("address");
        address = new String(address.getBytes("iso8859-1"), "utf8");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        if (!Sql.isInt(phone)) return;
        DBModel.init();
        Person person = new Person();
        person.setLogin(Sql.sql(login));
        person.setPassword(Sql.sql(password1));
        person.setName(Sql.sql(name));
        person.setSurname(Sql.sql(surname));
        person.setSecondName(Sql.sql(second_name));
        person.setCityId(Integer.parseInt(city_id));
        person.setAddress(Sql.sql(address));
        person.setEmail(Sql.sql(email));
        person.setPhone(Sql.sql(phone));
        person.setPermissionId(Integer.parseInt(permission_id));
        person.setOrganizationId(Integer.parseInt(organization_id));
        person.writeToDB();
    }
}
