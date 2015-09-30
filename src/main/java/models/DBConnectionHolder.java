package models;

import java.sql.*;

public class DBConnectionHolder
{
  
    public static Connection connection;
    static public String DBName = "tuidb";
    static private String url = "jdbc:mysql://localhost:3306/";
    static private String login = "root";
    static private String password="root";
    
    
    static void createConnection() throws ClassNotFoundException, SQLException
    {
        Connection con;
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection(url, login, password);
        DBConnectionHolder.connection = con;
    }
    
    
}
