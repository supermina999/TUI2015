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
    static protected String tableName = "person";
    static protected DBEntry[] stdEntryes = {
        new DBEntry("id", EntryType.Int),
        new DBEntry("name", EntryType.String),
        new DBEntry("surname", EntryType.String),
        new DBEntry("second_name", EntryType.String),
        new DBEntry("login", EntryType.String),
        new DBEntry("password", EntryType.String),
        new DBEntry("city_id", EntryType.Int),
        new DBEntry("address", EntryType.String),
        new DBEntry("phone", EntryType.String),
        new DBEntry("email", EntryType.String),
        new DBEntry("permission_id", EntryType.Int),
        new DBEntry("organization_id", EntryType.Int)
    };
    
    public Person()
    {
        super();
    }
    
    protected Person(DBEntry[] entryes) {
        super(entryes);        
    }
    
    public static void init()
    {
    }
    
    public static Person getOne( DBEntry[] entryes) throws ClassNotFoundException, SQLException
    {
        DBModel.tableName = Person.tableName;
        DBModel.stdEntryes = Person.stdEntryes;
        return new Person(Person.getOne(entryes, 1).entryes);
    }
    public static Person[] getAll( DBEntry[] entryes) throws ClassNotFoundException, SQLException
    {
        DBModel.tableName = Person.tableName;
        DBModel.stdEntryes = Person.stdEntryes;
        DBModel[] ans1 = Person.getAll(entryes, 1);
        Person[] ans2 = new Person[ans1.length];
        for(int i=0; i<ans1.length; i++) ans2[i]=new Person(ans1[i].entryes);
        return ans2;
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
    public int getCityId()
    {
        return Integer.parseInt(this.entryes[6].getValue());
    }
    public void setCityId(int id)
    {
        this.entryes[6].setValue(id);
    }
    public String getAddress()
    {
        return this.entryes[7].getValue();
    }
    public void setAddress(String address)
    {
        this.entryes[7].setValue(address);
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
