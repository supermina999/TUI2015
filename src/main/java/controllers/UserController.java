package controllers;


import javax.servlet.http.HttpServletRequest;
import models.*;

import sql.Sql;
import java.util.Date;

import java.text.SimpleDateFormat;


public class UserController {
    
    public static String add(HttpServletRequest request) throws Exception
    {
        String login = request.getParameter("login");
        String password1 = request.getParameter("password1");
        String password2 = request.getParameter("password2");
        if (!password1.equals(password2)) return "Пароли не совпадают";
        String organization_id = request.getParameter("organization_id");
        if (!Sql.isInt(organization_id)) return "Неправильный формат организации";
        if (Integer.parseInt(organization_id) == -1) return "Не выбрана организация";
        String permission_id = request.getParameter("permission_id");
        if (!Sql.isInt(permission_id)) return "Неправильный формат должности";
        if (Integer.parseInt(permission_id) == -1) return "Не выбрана должность";
        String name = request.getParameter("name");
        String surname = request.getParameter("surname");
        String second_name = request.getParameter("second_name");
        String city_id = request.getParameter("city_id");
        if (!Sql.isInt(city_id)) return "Неправильный формат города";
        if (Integer.parseInt(city_id) == -1) return "Не выбран город";
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        if (!Sql.isInt(phone)) return "Неправильный формат номера. Он должен содержать только цифры и состоять не более чем из 9 символов.";
        Date date = new Date();
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
        person.setDate(date);
        person.writeToDB();
        return "OK";
    }
    
    public static String update(HttpServletRequest request) throws Exception
    {
        String id = request.getParameter("id");
        String login = request.getParameter("login");
        String organization_id = request.getParameter("organization_id");
        if (!Sql.isInt(organization_id)) return "Неправильный формат организации";
        if (Integer.parseInt(organization_id) == -1) return "Не выбрана организация";
        String permission_id = request.getParameter("permission_id");
        if (!Sql.isInt(permission_id)) return "Неправильный формат должности";
        if (Integer.parseInt(permission_id) == -1) return "Не выбрана должность";
        String name = request.getParameter("name");
        String surname = request.getParameter("surname");
        String second_name = request.getParameter("second_name");
        String city_id = request.getParameter("city_id");
        if (!Sql.isInt(city_id)) return "Неправильный формат города";
        if (Integer.parseInt(city_id) == -1) return "Не выбран город";
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        if (!Sql.isInt(phone)) return "Неправильный формат номера. Он должен содержать только цифры и состоять не более чем из 9 символов.";
        Person person = Person.getOne(Integer.parseInt(id));
        person.setLogin(login);
        person.setOrganizationId(Integer.parseInt(organization_id));
        person.setPermissionId(Integer.parseInt(permission_id));
        person.setName(name);
        person.setSurname(surname);
        person.setSecondName(second_name);
        person.setCityId(Integer.parseInt(city_id));
        person.setAddress(address);
        person.setEmail(email);
        person.setPhone(phone);
        person.saveChanges();
        return "OK";
    }
    
    public static String updatePassword(HttpServletRequest request) throws Exception 
    {
        String id = request.getParameter("id");
        Person person = Person.getOne(Integer.parseInt(id));
        String passwordOld = request.getParameter("passwordOld");
        if (!passwordOld.equals(person.getPassword())) return "Старый пароль неправильный";
        String password1 = request.getParameter("password1");
        String password2 = request.getParameter("password2");
        if (!password1.equals(password2)) return "Пароли не совпадают";
        person.setPassword(password1);
        person.saveChanges();
        return "OK";
    }
    
    public static void delete(HttpServletRequest request) throws Exception
    {
        String id = request.getParameter("id");
        Person.getOne(Integer.parseInt(id)).delete();       
    }
}
