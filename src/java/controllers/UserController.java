package controllers;

import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import models.*;
import users.User;

import sql.Sql;


public class UserController {
    
    public static String add(HttpServletRequest request) throws Exception
    {
        String login = request.getParameter("login");
        String password1 = request.getParameter("password1");
        String password2 = request.getParameter("password2");
        if (!password1.equals(password2)) return "Пароли не совпадают";
        String organization_id = request.getParameter("organization_id");
        if (!Sql.isInt(organization_id)) return "Не выбрана организация";
        String permission_id = request.getParameter("permission_id");
        if (!Sql.isInt(permission_id)) return "Не выбрана должность";
        String name = request.getParameter("name");
        String surname = request.getParameter("surname");
        String second_name = request.getParameter("second_name");
        String city_id = request.getParameter("city_id");
        if (!Sql.isInt(city_id)) return "Не выбран город";
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        if (!Sql.isInt(phone)) return "Неправильный формат номера. Он должен содержать только цифры и состоять не более чем из 9 символов.";
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
        return "OK";
    }
}
