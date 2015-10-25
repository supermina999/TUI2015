package models;

public class Transport extends DBModel {

    static protected String tableName = "transport";
    static public DBEntry[] stdEntryes = {
        new DBEntry("id", EntryType.Int),
        new DBEntry("name", EntryType.String),
        new DBEntry("number", EntryType.String),
        new DBEntry("preson_id", EntryType.Int),
        new DBEntry("stock_id", EntryType.Int),
        new DBEntry("speed", EntryType.Int),
        new DBEntry("max_weight", EntryType.Int)
    };

    protected Transport(DBEntry[] entryes) {
        super(entryes);
    }

    public Transport() {
        super();
    }

    public static void init() {
    }

    public static Transport getOne(int id) throws Exception {
        DBEntry[] params = {
            new DBEntry("id", EntryType.Int, id)
        };
        return getOne(params);
    }

    public static Transport getOne(DBEntry[] entryes) throws Exception {
        DBModel.tableName = Transport.tableName;
        DBModel.stdEntryes = Transport.stdEntryes;
        DBModel buf = Transport.getOne(entryes, 1);
        if (buf != null) {
            return new Transport(buf.entryes);
        } else {
            return null;
        }

    }

    public static Transport[] getAll(DBEntry[] entryes) throws Exception {
        DBModel.tableName = Transport.tableName;
        DBModel.stdEntryes = Transport.stdEntryes;
        DBModel[] ans1 = Transport.getAll(entryes, 1);
        Transport[] ans2 = new Transport[ans1.length];
        for (int i = 0; i < ans1.length; i++) {
            ans2[i] = new Transport(ans1[i].entryes);
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
    
    public String getNumber() {
        return this.entryes[2].getValue();
    }

    public void setNumber(String name) {
        this.entryes[2].setValue(name);
    }
    
    public int getPersonId() {
        return Integer.parseInt(this.entryes[3].getValue());
    }

    public void setPersonId(int id) {
        this.entryes[3].setValue(id);
    }
    
    public int getStockId() {
        return Integer.parseInt(this.entryes[4].getValue());
    }

    public void setStockId(int id) {
        this.entryes[4].setValue(id);
    }
    
    public int getSpeed() {
        return Integer.parseInt(this.entryes[5].getValue());
    }

    public void setSpeed(int speed) {
        this.entryes[5].setValue(speed);
    }
    
    public int getMaxWeight() {
        return Integer.parseInt(this.entryes[6].getValue());
    }

    public void setMaxWeight(int weight) {
        this.entryes[6].setValue(weight);
    }
}
