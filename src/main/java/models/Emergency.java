package models;

import java.sql.SQLException;

public class Emergency extends DBModel {

    static protected String tableName = "permission";
    static public DBEntry[] stdEntryes = {
        new DBEntry("id", EntryType.Int),
        new DBEntry("name", EntryType.String)
    };

    protected Emergency(DBEntry[] entryes) {
        super(entryes);
    }

    public Emergency() {
        super();
    }

    public static void init() {
    }

    public static Emergency getOne(int id) throws Exception {
        DBEntry[] params = {
            new DBEntry("id", EntryType.Int, id)
        };
        return getOne(params);
    }

    public static Emergency getOne(DBEntry[] entryes) throws Exception {
        DBModel.tableName = Emergency.tableName;
        DBModel.stdEntryes = Emergency.stdEntryes;
        DBModel buf = Emergency.getOne(entryes, 1);
        if (buf != null) {
            return new Emergency(buf.entryes);
        } else {
            return null;
        }
    }

    public static Emergency[] getAll(DBEntry[] entryes) throws Exception {
        DBModel.tableName = Emergency.tableName;
        DBModel.stdEntryes = Emergency.stdEntryes;
        DBModel[] ans1 = Emergency.getAll(entryes, 1);
        Emergency[] ans2 = new Emergency[ans1.length];
        for (int i = 0; i < ans1.length; i++) {
            if (ans1[i] != null) {
                ans2[i] = new Emergency(ans1[i].entryes);
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

    public String getName() {
        return this.entryes[1].getValue();
    }

    public void setName(String name) {
        this.entryes[1].setValue(name);
    }
}
