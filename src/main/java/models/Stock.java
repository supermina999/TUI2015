package models;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

public class Stock extends DBModel {

    static protected String tableName = "stock";
    static public DBEntry[] stdEntryes = {
        new DBEntry("id", EntryType.Int),
        new DBEntry("location_id", EntryType.Int),
        new DBEntry("person_id", EntryType.Int)
    };

    protected Stock(DBEntry[] entryes) {
        super(entryes);
    }

    public Stock() {
        super();
    }

    public static void init() {
    }

    public static Stock getOne(int id) throws Exception {
        DBEntry[] params = {
            new DBEntry("id", EntryType.Int, id)
        };
        return getOne(params);
    }

    public static Stock getOne(DBEntry[] entryes) throws Exception {
        DBModel.tableName = Stock.tableName;
        DBModel.stdEntryes = Stock.stdEntryes;
        DBModel buf = Stock.getOne(entryes, 1);
        if (buf != null) {
            return new Stock(buf.entryes);
        } else {
            return null;
        }
    }

    public static Stock[] getAll(DBEntry[] entryes) throws Exception {
        DBModel.tableName = Stock.tableName;
        DBModel.stdEntryes = Stock.stdEntryes;
        DBModel[] ans1 = Stock.getAll(entryes, 1);
        Stock[] ans2 = new Stock[ans1.length];
        for (int i = 0; i < ans1.length; i++) {
            ans2[i] = new Stock(ans1[i].entryes);
        }
        return ans2;
    }

    public int getId() {
        return Integer.parseInt(this.entryes[0].getValue());
    }

    public void setId(int id) {
        this.entryes[0].setValue(id);
    }

    public int getLocationId() {
        return Integer.parseInt(this.entryes[1].getValue());
    }

    public void setLocationId(int id) {
        this.entryes[1].setValue(id);
    }
    
    public int getPersonId() {
        return Integer.parseInt(this.entryes[2].getValue());
    }

    public void setPersonId(int id) {
        this.entryes[2].setValue(id);
    }
    
    public String getFullPersonName() throws Exception {
        int id = getPersonId();
        return Person.getOne(id).getFullName();
    }
    
    public Location getLocation() throws Exception {
        int id = getLocationId();
        return Location.getOne(id);
    }
    
    public Map<Integer, Integer> getAllRecources() throws Exception
    {
        Map<Integer, Integer> ans = new HashMap<>();
        DBEntry[] params = {
           new DBEntry("stock_id", EntryType.Int, getId())
        };
        AvailableResource[] res = AvailableResource.getAll(params);
        for (AvailableResource buf : res)
        {
            int resTypeId = buf.getResourceId();
            int resTypeCnt = buf.getNumber();
            Integer resTypeCntPr = ans.get(resTypeId);
            if (resTypeCntPr != null) resTypeCnt += resTypeCntPr;
            ans.put(resTypeId, resTypeCnt);
        }
        return ans;
    }
    
    public String getFullAddress () throws Exception {
        return getLocation().getFullAddress();
    }
}
