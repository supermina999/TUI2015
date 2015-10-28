package models;

public class TransportType extends DBModel {

    static protected String tableName = "transport_type";
    static public DBEntry[] stdEntryes = {
        new DBEntry("id", EntryType.Int),
        new DBEntry("name", EntryType.String),
        new DBEntry("speed", EntryType.Int),
        new DBEntry("max_weight", EntryType.Int)
    };

    protected TransportType(DBEntry[] entryes) {
        super(entryes);
    }

    public TransportType() {
        super();
    }

    public static void init() {
    }

    public static TransportType getOne(int id) throws Exception {
        DBEntry[] params = {
            new DBEntry("id", EntryType.Int, id)
        };
        return getOne(params);
    }

    public static TransportType getOne(DBEntry[] entryes) throws Exception {
        DBModel.tableName = TransportType.tableName;
        DBModel.stdEntryes = TransportType.stdEntryes;
        DBModel buf = TransportType.getOne(entryes, 1);
        if (buf != null) {
            return new TransportType(buf.entryes);
        } else {
            return null;
        }

    }

    public static TransportType[] getAll(DBEntry[] entryes) throws Exception {
        DBModel.tableName = TransportType.tableName;
        DBModel.stdEntryes = TransportType.stdEntryes;
        DBModel[] ans1 = TransportType.getAll(entryes, 1);
        TransportType[] ans2 = new TransportType[ans1.length];
        for (int i = 0; i < ans1.length; i++) {
            ans2[i] = new TransportType(ans1[i].entryes);
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
    
    public int getSpeed() {
        return Integer.parseInt(this.entryes[2].getValue());
    }

    public void setSpeed(int speed) {
        this.entryes[2].setValue(speed);
    }
    
    public int getMaxWeight() {
        return Integer.parseInt(this.entryes[3].getValue());
    }

    public void setMaxWeight(int weight) {
        this.entryes[3].setValue(weight);
    }
}
