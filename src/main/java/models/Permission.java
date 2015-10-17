package models;

import java.sql.SQLException;

public class Permission extends DBModel {

    static protected String tableName = "permission";
    static public DBEntry[] stdEntryes = {
        new DBEntry("id", EntryType.Int),
        new DBEntry("name", EntryType.String)
    };

    protected Permission(DBEntry[] entryes) {
        super(entryes);
    }

    public Permission() {
        super();
    }

    public static void init() {
    }

    public static Permission getOne(int id) throws Exception {
        DBEntry[] params = {
            new DBEntry("id", EntryType.Int, id)
        };
        return getOne(params);
    }

    public static Permission getOne(DBEntry[] entryes) throws Exception {
        DBModel.tableName = Permission.tableName;
        DBModel.stdEntryes = Permission.stdEntryes;
        DBModel buf = Permission.getOne(entryes, 1);
        if (buf != null) {
            return new Permission(buf.entryes);
        } else {
            return null;
        }
    }

    public static Permission[] getAll(DBEntry[] entryes) throws Exception {
        DBModel.tableName = Permission.tableName;
        DBModel.stdEntryes = Permission.stdEntryes;
        DBModel[] ans1 = Permission.getAll(entryes, 1);
        Permission[] ans2 = new Permission[ans1.length];
        for (int i = 0; i < ans1.length; i++) {
            if (ans1[i] != null) {
                ans2[i] = new Permission(ans1[i].entryes);
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
