package com.complaint.utils;
import java.sql.*;

public class DBConnection {
    public static Connection getConnection() {
        Connection conn = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/complaint_db", "root", "Nithin@2005");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }
}
