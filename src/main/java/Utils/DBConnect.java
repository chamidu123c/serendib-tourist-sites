package Utils;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {

    public static Connection getConnection() {
        Connection con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            String url = "jdbc:mysql://localhost:3306/serendib";
            String user = "root";
            String password = "samisql123";

            con = DriverManager.getConnection(url, user, password);
        } catch (Exception e) {
            System.out.println("Database Connection Failed!");
            e.printStackTrace();
        }
        return con;
    }

    public static void main(String[] args) {
        Connection conn = getConnection();
        if (conn != null) {
            System.out.println("Connection successful!");
        }
    }

}
