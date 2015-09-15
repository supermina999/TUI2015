/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import java.sql.SQLException;

/**
 *
 * @author roma
 */
public class Person extends DBModel {
    public Person(DBEntry[] entryes) {
        super(entryes);
        
    }
    
    public static void init()
    {
        Person.tableName = "person";
        Person.stdEntryes = new DBEntry[12];
        Person.stdEntryes[0] = new DBEntry();
        Person.stdEntryes[0].name = "id";
        Person.stdEntryes[0].type = EntryType.Int;
        Person.stdEntryes[1] = new DBEntry();
        Person.stdEntryes[1].name = "name";
        Person.stdEntryes[1].type = EntryType.String;
        Person.stdEntryes[2] = new DBEntry();
        Person.stdEntryes[2].name = "surname";
        Person.stdEntryes[2].type = EntryType.String;
        Person.stdEntryes[3] = new DBEntry();
        Person.stdEntryes[3].name = "second_name";
        Person.stdEntryes[3].type = EntryType.String;
        Person.stdEntryes[4] = new DBEntry();
        Person.stdEntryes[4].name = "login";
        Person.stdEntryes[4].type = EntryType.String;
        Person.stdEntryes[5] = new DBEntry();
        Person.stdEntryes[5].name = "password";
        Person.stdEntryes[5].type = EntryType.String;
        Person.stdEntryes[6] = new DBEntry();
        Person.stdEntryes[6].name = "age";
        Person.stdEntryes[6].type = EntryType.Int;
        Person.stdEntryes[7] = new DBEntry();
        Person.stdEntryes[7].name = "location_id";
        Person.stdEntryes[7].type = EntryType.Int;
        Person.stdEntryes[8] = new DBEntry();
        Person.stdEntryes[8].name = "phone";
        Person.stdEntryes[8].type = EntryType.String;
        Person.stdEntryes[9] = new DBEntry();
        Person.stdEntryes[9].name = "email";
        Person.stdEntryes[9].type = EntryType.String;
        Person.stdEntryes[10] = new DBEntry();
        Person.stdEntryes[10].name = "permission_id";
        Person.stdEntryes[10].type = EntryType.Int;
        Person.stdEntryes[11] = new DBEntry();
        Person.stdEntryes[11].name = "organization_id";
        Person.stdEntryes[11].type = EntryType.Int;
    }
    
    public static Person getOne( DBEntry[] entryes) throws ClassNotFoundException, SQLException
    {
        return (Person)Person.getOne(entryes, 1);
    }
    public static Person[] getAll( DBEntry[] entryes) throws ClassNotFoundException, SQLException
    {
        return (Person[])Person.getAll(entryes, 1);
    }
    public int getId()
    {
        return Integer.parseInt(this.entryes[0].getValue());
    }
    public void setId(int id)
    {
        this.entryes[0].setValue(id);
    }
    public String getName()
    {
        return this.entryes[1].getValue();
    }
    public void setName(String name)
    {
        this.entryes[1].setValue(name);
    }
    public String getSurname()
    {
        return this.entryes[2].getValue();
    }
    public void setSurname(String surname)
    {
        this.entryes[2].setValue(surname);
    }
    public String getSecondName()
    {
        return this.entryes[3].getValue();
    }
    public void setSecondName(String secondName)
    {
        this.entryes[3].setValue(secondName);
    }
    public String getLogin()
    {
        return this.entryes[4].getValue();
    }
    public void setLogin(String login)
    {
        this.entryes[4].setValue(login);
    }
    public String getPassword()
    {
        return this.entryes[5].getValue();
    }
    public void setPassword(String password)
    {
        this.entryes[5].setValue(password);
    }
    public int getAge()
    {
        return Integer.parseInt(this.entryes[6].getValue());
    }
    public void setAge(int age)
    {
        this.entryes[6].setValue(age);
    }
    public int getLocationId()
    {
        return Integer.parseInt(this.entryes[7].getValue());
    }
    public void setLocationId(int id)
    {
        this.entryes[7].setValue(id);
    }
    public String getPhone()
    {
        return this.entryes[8].getValue();
    }
    public void setPhone(String phone)
    {
        this.entryes[8].setValue(phone);
    }
    public String getEmail()
    {
        return this.entryes[9].getValue();
    }
    public void setEmail(String email)
    {
        this.entryes[9].setValue(email);
    }
    public int getPermissionId()
    {
        return Integer.parseInt(this.entryes[10].getValue());
    }
    public void setPermissionId(int id)
    {
        this.entryes[10].setValue(id);
    }
    public int getOrganizationId()
    {
        return Integer.parseInt(this.entryes[11].getValue());
    }
    public void setOrganizationId(int id)
    {
        this.entryes[11].setValue(id);
    }
}