package models;

import java.sql.*;

public class DBModel
{

    public DBModel()
    {
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
