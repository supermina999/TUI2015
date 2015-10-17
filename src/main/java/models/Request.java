package models;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Request extends DBModel {

    static protected String tableName = "request";
    static public DBEntry[] stdEntryes = {
        new DBEntry("id", EntryType.Int),
        new DBEntry("requets_type_id", EntryType.Int),
        new DBEntry("resource_id", EntryType.Int),
        new DBEntry("number", EntryType.Int),
        new DBEntry("measure_id", EntryType.Int),
        new DBEntry("application_id", EntryType.Int),
        new DBEntry("location_id", EntryType.Int),
        new DBEntry("status_id", EntryType.Int),
        new DBEntry("emergency_id", EntryType.Int),
        new DBEntry("date", EntryType.Date),
    };

    protected Request(DBEntry[] entryes) {
        super(entryes);
    }

    public Request() {
        super();
    }

    public static void init() {
    }

    public static Request getOne(int id) throws Exception {
        DBEntry[] params = {
            new DBEntry("id", EntryType.Int, id)
        };
        return getOne(params);
    }

    public static Request getOne(DBEntry[] entryes) throws Exception {
        DBModel.tableName = Request.tableName;
        DBModel.stdEntryes = Request.stdEntryes;
        DBModel buf = Request.getOne(entryes, 1);
        if (buf != null) {
            return new Request(buf.entryes);
        } else {
            return null;
        }

    }

    public static Request[] getAll(DBEntry[] entryes) throws Exception {
        DBModel.tableName = Request.tableName;
        DBModel.stdEntryes = Request.stdEntryes;
        DBModel[] ans1 = Request.getAll(entryes, 1);
        Request[] ans2 = new Request[ans1.length];
        for (int i = 0; i < ans1.length; i++) {
            ans2[i] = new Request(ans1[i].entryes);
        }
        return ans2;
    }

    public int getId() {
        return Integer.parseInt(this.entryes[0].getValue());
    }

    public void setId(int id) {
        this.entryes[0].setValue(id);
    }

    public void setRequestTypeId(int id) {
        this.entryes[1].setValue(id);
    }

    public Integer getsetRequestTypeId() {
        return Integer.parseInt(this.entryes[1].getValue());
    }
    
    public int getResourceId() {
        return Integer.parseInt(this.entryes[2].getValue());
    }

    public void setResourceId(int id) {
        this.entryes[2].setValue(id);
    }

    public int getNumber() {
        return Integer.parseInt(this.entryes[3].getValue());
    }

    public void setNumber(int number) {
        this.entryes[3].setValue(number);
    }

    public int getMeasureId() {
        return Integer.parseInt(this.entryes[4].getValue());
    }

    public void setMeasureId(int id) {
        this.entryes[4].setValue(id);
    }
    
    public int getApplicationId() {
        return Integer.parseInt(this.entryes[5].getValue());
    }

    public void setApplicationId(int id) {
        this.entryes[5].setValue(id);
    }
    
    public int getLocationId() {
        return Integer.parseInt(this.entryes[6].getValue());
    }

    public void setLocationId(int id) {
        this.entryes[6].setValue(id);
    }
    

    public String getResourceName() throws Exception {
        int id = getResourceId();
        return Resource.getOne(id).getName();
    }

    public String getMeasureName() throws Exception {
        int id = getResourceId();
        return Measure.getOne(id).getName();
    }
    
    public String getStatusName() throws Exception {
        int id = getStatusId();
        return Status.getOne(id).getName();
    }
    
    public String getEmergencyName() throws Exception {
        int id = getEmergencyId();
        return Emergency.getOne(id).getName();
    }
    
    public void setStatusId(int id) {
        this.entryes[7].setValue(id);
    }

    public Integer getStatusId() {
        return Integer.parseInt(this.entryes[7].getValue());
    }
    
    public void setEmergencyId(int id) {
        this.entryes[8].setValue(id);
    }

    public Integer getEmergencyId() {
        return Integer.parseInt(this.entryes[8].getValue());
    }
    
    public Date getDate() throws ParseException {
        return new SimpleDateFormat("yyyy-MM-dd").parse(this.entryes[9].getValue());
    }

    public void setDate(Date date) {
        this.entryes[9].setValue(date);
    }
}