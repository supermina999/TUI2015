package sql;

import java.io.*;
import java.security.*;
import java.text.*;

public class Sql {
    
    public static String md5(String message)
    {
	String digest = null;
	try
	{
	    MessageDigest md = MessageDigest.getInstance("MD5");
	    byte[] hash = md.digest(message.getBytes("UTF-8"));
	    StringBuilder sb = new StringBuilder(2 * hash.length);
	    for (byte b : hash)
	    {
		sb.append(String.format("%02x", b & 0xff));
	    }
	    digest = sb.toString();
	}
	catch (UnsupportedEncodingException ex)
	{
	    //Logger.getLogger(StringReplace.class.getName()).log(Level.SEVERE, null, ex);
	}
	catch (NoSuchAlgorithmException ex)
	{
	    //Logger.getLogger(StringReplace.class.getName()).log(Level.SEVERE, null, ex);
	}
	return digest;
    }
    
    public static String sql(String s)
    {
        if (s == null) return "";
        return s.replace("\\", "\\\\").replace("\"", "\\\"");
    }
    
    public static boolean isInt(String s)
    {
        try
	{
	    Integer.parseInt(s);
	}
	catch (Exception e)
	{
	    return false;
	}
	return true;
    }
    
    public static boolean isDouble(String s)
    {
        try
	{
	    Double.parseDouble(s);
	}
	catch (Exception e)
	{
	    return false;
	}
        if (Double.parseDouble(s) <= 0) return false;
	return true;
    }
    
    public static boolean isDate(String s)
    {
        try
        {
            SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd");
            sdf.parse(s);
        }
        catch (Exception e)
        {
            return false;
        }
        return true;
    }
   
}
