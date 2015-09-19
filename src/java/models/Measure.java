/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import java.sql.SQLException;

/**
 *
 * @author liza
 */
public class Measure extends DBModel {
    static protected String tableName;
    static protected DBEntry[] stdEntryes;
    protected Measure(DBEntry[] entryes) {
        super(entryes);
        
    }   
     public Measure() {
        super();
        
    }
    public static void init()
    {
        Measure.tableName = "measure";
        Measure.stdEntryes = new DBEntry[2];
        Measure.stdEntryes[0] = new DBEntry();
        Measure.stdEntryes[0].name = "id";
        Measure.stdEntryes[0].type = EntryType.Int;
        Measure.stdEntryes[1] = new DBEntry();
        Measure.stdEntryes[1].name = "name";
        Measure.stdEntryes[1].type = EntryType.String;
    }
     public static Measure getOne( DBEntry[] entryes) throws ClassNotFoundException, SQLException
    {
        DBModel.tableName = Measure.tableName;
        DBModel.stdEntryes = Measure.stdEntryes;
        return new Measure(Measure.getOne(entryes, 1).entryes);
    }
    public static Measure[] getAll( DBEntry[] entryes) throws ClassNotFoundException, SQLException
    {
        DBModel.tableName = Measure.tableName;
        DBModel.stdEntryes = Measure.stdEntryes;
        DBModel[] ans1 = Measure.getAll(entryes, 1);
        Measure[] ans2 = new Measure[ans1.length];
        for(int i=0; i<ans1.length; i++) ans2[i]=new Measure(ans1[i].entryes);
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
