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
public class Country extends DBModel {
    static protected String tableName;
    static protected DBEntry[] stdEntryes;
    protected Country(DBEntry[] entryes) {
        super(entryes);
        
    }
    public Country() {
        super();
        
    }
    
    public static void init()
    {
        Country.tableName = "country";
        Country.stdEntryes = new DBEntry[2];
        Country.stdEntryes[0] = new DBEntry();
        Country.stdEntryes[0].name = "id";
        Country.stdEntryes[0].type = EntryType.Int;
        Country.stdEntryes[1] = new DBEntry();
        Country.stdEntryes[1].name = "name";
        Country.stdEntryes[1].type = EntryType.String;
    }
     public static Country getOne( DBEntry[] entryes) throws ClassNotFoundException, SQLException
    {
        DBModel.tableName = Country.tableName;
        DBModel.stdEntryes = Country.stdEntryes;
        return new Country(Country.getOne(entryes, 1).entryes);
    }
    public static Country[] getAll( DBEntry[] entryes) throws ClassNotFoundException, SQLException
    {
        DBModel.tableName = Country.tableName;
        DBModel.stdEntryes = Country.stdEntryes;
        DBModel[] ans1 = Country.getAll(entryes, 1);
        Country[] ans2 = new Country[ans1.length];
        for(int i=0; i<ans1.length; i++) ans2[i]=new Country(ans1[i].entryes);
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
    
}
