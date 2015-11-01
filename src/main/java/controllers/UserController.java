package controllers;

import javax.servlet.http.HttpServletRequest;
import models.*;
import sql.Sql;
import java.util.Date;
import java.text.SimpleDateFormat;


public class UserController {
    
    public static boolean add(HttpServletRequest request) throws Exception
    {
        String login = request.getParameter("login");
        String password1 = request.getParameter("password1");
        String password2 = request.getParameter("password2");
        String permissionId = request.getParameter("permission_id");
        String name = request.getParameter("name");
        String surname = request.getParameter("surname");
        String secondName = request.getParameter("second_name");
        String regionId = request.getParameter("region_id");
        String address = request.getParameter("address");
        String city = request.getParameter("city");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String birthday = request.getParameter("birthday");
        if (permissionId == null || name == null || surname == null || secondName == null || regionId == null || address == null ||
            city == null || email == null || phone == null || birthday == null) return false;
        if (permissionId.equals("-1") || regionId.equals("-1")) return false;
        if (!Sql.isInt(regionId) || !Sql.isInt(permissionId) || !Sql.isDate(birthday)) return  false;
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date date = sdf.parse(birthday);
        Person person = new Person();
        person.setLogin(Sql.sql(login));
        person.setPassword(Sql.md5(password1));
        person.setName(Sql.sql(name));
        person.setSurname(Sql.sql(surname));
        person.setSecondName(Sql.sql(secondName));
        person.setRegionId(Integer.parseInt(regionId));
        person.setAddress(Sql.sql(address));
        person.setEmail(Sql.sql(email));
        person.setPhone(Sql.sql(phone));
        person.setCity(Sql.sql(city));
        person.setBirthday(date);
        person.setPermissionId(Integer.parseInt(permissionId));
        person.writeToDB();
        return true;
    }
    
    public static boolean update(HttpServletRequest request) throws Exception
    {
        String id = request.getParameter("id");
        String login = request.getParameter("login");
        String permissionId = request.getParameter("permission_id");
        String name = request.getParameter("name");
        String surname = request.getParameter("surname");
        String secondName = request.getParameter("second_name");
        String regionId = request.getParameter("region_id");
        String address = request.getParameter("address");
        String city = request.getParameter("city");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String birthday = request.getParameter("birthday");
        if (permissionId == null || name == null || surname == null || secondName == null || regionId == null || address == null ||
            city == null || email == null || phone == null || birthday == null) return false;
        if (!Sql.isInt(regionId) || !Sql.isInt(permissionId) || !Sql.isDate(birthday)) return  false;
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date date = sdf.parse(birthday);
        Person person = Person.getOne(Integer.parseInt(id));
        person.setLogin(login);
        person.setPermissionId(Integer.parseInt(permissionId));
        person.setName(name);
        person.setSurname(surname);
        person.setSecondName(secondName);
        person.setRegionId(Integer.parseInt(regionId));
        person.setAddress(address);
        person.setEmail(email);
        person.setPhone(phone);
        person.setCity(Sql.sql(city));
        person.setBirthday(date);
        person.saveChanges();
        return true;
    }
    
    public static void updatePassword(HttpServletRequest request) throws Exception 
    {
        String id = request.getParameter("id");
        Person person = Person.getOne(Integer.parseInt(id));
        String passwordOld = request.getParameter("passwordOld");
        String password1 = request.getParameter("password1");
        String password2 = request.getParameter("password2");
        person.setPassword(Sql.md5(password1));
        person.saveChanges();
    }
    
    public static void delete(HttpServletRequest request) throws Exception
    {
        String id = request.getParameter("id");
        Person.getOne(Integer.parseInt(id)).delete();       
    }
}
