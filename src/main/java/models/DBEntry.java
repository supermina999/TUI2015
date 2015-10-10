/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author roma
 */
public class DBEntry 
    {
        public String name;
        private String value="1";
        public EntryType type; 
        
        public DBEntry()
        {
        }
        
        public DBEntry(String name, EntryType type)
        {
            this.name = name;
            this.type = type;
        }
        public DBEntry(String name, EntryType type, Object obj)
        {
            this.name = name;
            this.type = type;
            this.setValue(obj);
        }
        public void setValue(Object obj)
        {
            if (type == EntryType.Int) value = ((Integer)obj).toString();
            else if (type == EntryType.Double) value = ((Double)obj).toString();
            else if (type == EntryType.Date)
            {
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                value = sdf.format(obj);
            }
            else value = (String)obj;
        }
        public String getValue()
        {
            return value;
        }
        public String SQLValue() throws UnsupportedEncodingException, ParseException {
            if (type == EntryType.Int || type == EntryType.Double) return value;
            else if (type == EntryType.Date) {
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                Date date = sdf.parse(value);
                String string_date = sdf.format(date);
                return '"' + string_date + '"';
            }
            else return '"' + new String(value.getBytes("iso8859-1"), "utf8") + '"';
        }
    }
