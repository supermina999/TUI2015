package controllers;


import javax.servlet.http.HttpServletRequest;
import models.*;

import sql.Sql;


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
    
    public static String update(HttpServletRequest request) throws Exception
    {
        String id = request.getParameter("id");
        String login = request.getParameter("login");
        Person user = Person.getOne(Integer.parseInt(id));
        String passwordOld = request.getParameter("passwordOld");
        if (!passwordOld.equals(user.getPassword())) return "Старый пароль неправильный";
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
        Person person = new Person();
        person.setId(user.getId());
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
        person.saveChanges();
        return "OK";
    }
    
    public static void delete(HttpServletRequest request) throws Exception
    {
        String id = request.getParameter("id");
        Person user = Person.getOne(Integer.parseInt(id));
        Person person = new Person();
        person.setId(user.getId());
        person.setLogin(user.getLogin());
        person.setPassword(user.getPassword());
        person.setName(user.getName());
        person.setSurname(user.getSurname());
        person.setSecondName(user.getSecondName());
        person.setCityId(user.getCityId());
        person.setAddress(user.getAddress());
        person.setEmail(user.getEmail());
        person.setPhone(user.getPhone());
        person.setPermissionId(user.getPermissionId());
        person.setOrganizationId(user.getOrganizationId());
        person.delete();
    }
}
