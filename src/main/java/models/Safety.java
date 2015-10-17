package models;

import java.sql.SQLException;

public class Safety extends DBModel {

    static protected String tableName = "safety";
    static public DBEntry[] stdEntryes = {
        new DBEntry("id", EntryType.Int),
        new DBEntry("name", EntryType.String)
    };

    protected Safety(DBEntry[] entryes) {
        super(entryes);
    }

    public Safety() {
        super();
    }

    public static void init() {
    }

    public static Safety getOne(int id) throws Exception {
        DBEntry[] params = {
            new DBEntry("id", EntryType.Int, id)
        };
        return getOne(params);
    }

    public static Safety getOne(DBEntry[] entryes) throws Exception {
        DBModel.tableName = Safety.tableName;
        DBModel.stdEntryes = Safety.stdEntryes;
        DBModel buf = Safety.getOne(entryes, 1);
        if (buf != null) {
            return new Safety(buf.entryes);
        } else {
            return null;
        }
    }

    public static Safety[] getAll(DBEntry[] entryes) throws Exception {
        DBModel.tableName = Safety.tableName;
        DBModel.stdEntryes = Safety.stdEntryes;
        DBModel[] ans1 = Safety.getAll(entryes, 1);
        Safety[] ans2 = new Safety[ans1.length];
        for (int i = 0; i < ans1.length; i++) {
            if (ans1[i] != null) {
                ans2[i] = new Safety(ans1[i].entryes);
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
