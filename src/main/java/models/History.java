package models;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class History extends DBModel {

    static protected String tableName = "history";
    static public DBEntry[] stdEntryes = {
        new DBEntry("id", EntryType.Int),
        new DBEntry("number", EntryType.Int),
        new DBEntry("resource_id", EntryType.Int),
        new DBEntry("stock_id", EntryType.Int),
        new DBEntry("date", EntryType.Date)
    };

    protected History(DBEntry[] entryes) {
        super(entryes);

    }

    public History() {
        super();

    }

    public static void init() {
    }

    public static History getOne(int id) throws Exception {
        DBEntry[] params = {
            new DBEntry("id", EntryType.Int, id)
        };
        return getOne(params);
    }

    public static History getOne(DBEntry[] entryes) throws Exception {
        DBModel.tableName = History.tableName;
        DBModel.stdEntryes = History.stdEntryes;
        DBModel buf = History.getOne(entryes, 1);
        if (buf != null) {
            return new History(buf.entryes);
        } else {
            return null;
        }
    }

    public static History[] getAll(DBEntry[] entryes) throws Exception {
        DBModel.tableName = History.tableName;
        DBModel.stdEntryes = History.stdEntryes;
        DBModel[] ans1 = History.getAll(entryes, 1);
        History[] ans2 = new History[ans1.length];
        for (int i = 0; i < ans1.length; i++) {
            if (ans1[i] != null) {
                ans2[i] = new History(ans1[i].entryes);
            }
        }
        return ans2;
    }

    public int getId() {
        return Integer.parseInt(this.entryes[0].getValue());
    }

    public void setId(int id) {
        this.entryes[0].setValue(id);
    }
    
    public int getNumber() {
        return Integer.parseInt(this.entryes[1].getValue());
    }

    public void setNumber(int id) {
        this.entryes[1].setValue(id);
    }
    
    public int getResourceId() {
        return Integer.parseInt(this.entryes[2].getValue());
    }

    public void setResourceId(int id) {
        this.entryes[2].setValue(id);
    }
    
    public int getStockId() {
        return Integer.parseInt(this.entryes[3].getValue());
    }

    public void setStockId(int id) {
        this.entryes[3].setValue(id);
    }
    
    public Date getDate() throws ParseException {
        return new SimpleDateFormat("yyyy-MM-dd").parse(this.entryes[4].getValue());
    }

    public String getDateString() throws ParseException {
        return this.entryes[4].getValue();
    }

    public void setDate(Date date) {
        this.entryes[4].setValue(date);
    }
}
