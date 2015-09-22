/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import java.io.UnsupportedEncodingException;

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
            if (type==EntryType.Int) value = ((Integer)obj).toString();
            else value = (String)obj;
        }
        public String getValue()
        {
            return value;
        }
        public String SQLValue() throws UnsupportedEncodingException
        {
            if (type == EntryType.Int) return value;
            else return '"'+new String(value.getBytes("iso8859-1"), "utf8")+'"';
        }
    }
