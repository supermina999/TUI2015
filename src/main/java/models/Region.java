package models;

import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.text.ParseException;


public class Region extends DBModel {
    static protected String tableName = "region";
    static public DBEntry[] stdEntryes = {
        new DBEntry("id", EntryType.Int), 
        new DBEntry("name",EntryType.String)
    };
    protected Region(DBEntry[] entryes) {
        super(entryes);
        
    }
     public Region() {
        super();
        
    }
    
    public static void init()
    {
           
    }
     public static Region getOne(int id) throws Exception
    {
        DBEntry[] params = {
            new DBEntry("id", EntryType.Int, id)
        };
        return getOne(params);
    }
     public static Region getOne( DBEntry[] entryes) throws Exception {
        DBModel.tableName = Region.tableName;
        DBModel.stdEntryes = Region.stdEntryes;
        DBModel buf = Region.getOne(entryes, 1);
        if (buf != null) return new Region(buf.entryes);
        else return null;
    }
    public static Region[] getAll( DBEntry[] entryes) throws Exception
    {
        DBModel.tableName = Region.tableName;
        DBModel.stdEntryes = Region.stdEntryes;
        DBModel[] ans1 = Region.getAll(entryes, 1);
        Region[] ans2 = new Region[ans1.length];
        for(int i=0; i<ans1.length; i++) if (ans1[i] != null) ans2[i]=new Region(ans1[i].entryes);
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
    
    public String getCountryName() throws Exception
    {
        return "Украина";
    }
}
