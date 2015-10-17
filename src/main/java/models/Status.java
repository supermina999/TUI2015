package models;

import java.sql.SQLException;

public class Status extends DBModel {

    static protected String tableName = "status";
    static public DBEntry[] stdEntryes = {
        new DBEntry("id", EntryType.Int),
        new DBEntry("name", EntryType.String)
    };

    protected Status(DBEntry[] entryes) {
        super(entryes);
    }

    public Status() {
        super();
    }

    public static void init() {
    }

    public static Status getOne(int id) throws Exception {
        DBEntry[] params = {
            new DBEntry("id", EntryType.Int, id)
        };
        return getOne(params);
    }

    public static Status getOne(DBEntry[] entryes) throws Exception {
        DBModel.tableName = Status.tableName;
        DBModel.stdEntryes = Status.stdEntryes;
        DBModel buf = Status.getOne(entryes, 1);
        if (buf != null) {
            return new Status(buf.entryes);
        } else {
            return null;
        }
    }

    public static Status[] getAll(DBEntry[] entryes) throws Exception {
        DBModel.tableName = Status.tableName;
        DBModel.stdEntryes = Status.stdEntryes;
        DBModel[] ans1 = Status.getAll(entryes, 1);
        Status[] ans2 = new Status[ans1.length];
        for (int i = 0; i < ans1.length; i++) {
            if (ans1[i] != null) {
                ans2[i] = new Status(ans1[i].entryes);
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
