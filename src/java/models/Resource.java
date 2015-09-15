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
public class Resource extends DBModel {
    public Resource(DBEntry[] entryes) {
        super(entryes);
        
    }
    
    public static void init()
    {
        Person.tableName = "resource";
        Person.stdEntryes = new DBEntry[3];
        Person.stdEntryes[0] = new DBEntry();
        Person.stdEntryes[0].name = "id";
        Person.stdEntryes[0].type = EntryType.Int;
        Person.stdEntryes[1] = new DBEntry();
        Person.stdEntryes[1].name = "name";
        Person.stdEntryes[1].type = EntryType.String;
        Person.stdEntryes[2] = new DBEntry();
        Person.stdEntryes[2].name = "weight";
        Person.stdEntryes[2].type = EntryType.Int;        
    }
     public static Resource getOne( DBEntry[] entryes) throws ClassNotFoundException, SQLException
    {
        return (Resource)Resource.getOne(entryes, 1);
    }
    public static Resource[] getAll( DBEntry[] entryes) throws ClassNotFoundException, SQLException
    {
        return (Resource[])Resource.getAll(entryes, 1);
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
    public int getWeigth()
    {
        return Integer.parseInt(this.entryes[2].getValue());
    }
    public void setWeight(int weight)
    {
        this.entryes[2].setValue(weight);
    }
}
