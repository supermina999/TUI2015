package models;

import java.sql.*;

public class DBConnectionHolder
{
  
    public static Connection connection;
    static public String DBName = "tuidb";
    static private String url = "jdbc:mysql://localhost:3306/";
    static private String login = "login";
    static private String password="password";
    
    
    static void createConnection() throws ClassNotFoundException, SQLException
    {
        Connection con;
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection(url, login, password);
        DBConnectionHolder.connection = con;
    }
    
    public void simpleConnect() throws ClassNotFoundException, SQLException
    {
        Statement st;
        Connection con;
        String url = "jdbc:mysql://localhost:3306/";
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection(url, "login", "password");
        st = con.createStatement();
        st.execute("USE " + "tuidb");
        try (ResultSet rs = st.executeQuery("SELECT * FROM Persons"))
        {
            while(rs.next())
            {
                System.out.println(rs.getString("name"));
            }
        }
        st.close();
        con.close();
    }
    
}
