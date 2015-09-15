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
public class Transport extends DBModel {
    public Transport(DBEntry[] entryes) {
        super(entryes);
        
    }
    
    public static void init()
    {
        Person.tableName = "transport";
        Person.stdEntryes = new DBEntry[4];
        Person.stdEntryes[0] = new DBEntry();
        Person.stdEntryes[0].name = "id";
        Person.stdEntryes[0].type = EntryType.Int;
        Person.stdEntryes[1] = new DBEntry();
        Person.stdEntryes[1].name = "name";
        Person.stdEntryes[1].type = EntryType.String;
        Person.stdEntryes[2] = new DBEntry();
        Person.stdEntryes[2].name = "max_weight";
        Person.stdEntryes[2].type = EntryType.Int;
        Person.stdEntryes[3] = new DBEntry();
        Person.stdEntryes[3].name = "organization_id";
        Person.stdEntryes[3].type = EntryType.Int;
        
    }
     public static Transport getOne( DBEntry[] entryes) throws ClassNotFoundException, SQLException
    {
        return (Transport)Transport.getOne(entryes, 1);
    }
    public static Transport[] getAll( DBEntry[] entryes) throws ClassNotFoundException, SQLException
    {
        return (Transport[])Transport.getAll(entryes, 1);
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
    public int getMaxWeight()
    {
        return Integer.parseInt(this.entryes[2].getValue());
    }
    public void setMaxWeight(int weight)
    {
        this.entryes[2].setValue(weight);
    }
    public int getOrganizationId()
    {
        return Integer.parseInt(this.entryes[3].getValue());
    }
    public void setOrganizationId(int id)
    {
        this.entryes[3].setValue(id);
    }
}
