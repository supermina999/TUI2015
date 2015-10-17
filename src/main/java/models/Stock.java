package models;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Stock extends DBModel {

    static protected String tableName = "stock";
    static public DBEntry[] stdEntryes = {
        new DBEntry("id", EntryType.Int),
        new DBEntry("location_id", EntryType.Int),
        new DBEntry("date", EntryType.Date)
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

    public Location getLocation() throws Exception {
        int id = getLocationId();
        return Location.getOne(id);
    }

    public Date getDate() throws ParseException {
        return new SimpleDateFormat("yyyy-MM-dd").parse(this.entryes[2].getValue());
    }

    public void setDate(Date date) {
        this.entryes[2].setValue(date);
    }
}
