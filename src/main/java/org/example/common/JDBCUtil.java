package org.example.common;

import org.mariadb.jdbc.Connection;

import java.sql.DriverManager;
import java.sql.SQLException;

public class JDBCUtil {
    private static Connection con = null;

    public static Connection getConnection() throws ClassNotFoundException {
        try {
            if (con == null || con.isClosed()) {
                Class.forName("org.mariadb.jdbc.Driver");
                con = (Connection) DriverManager.getConnection("jdbc:mariadb://walab.handong.edu/W25_22400412", "W25_22400412", "Uife7t");
            }
        } catch (SQLException ex) {
            throw new RuntimeException(ex);
        } catch (Exception e) {
            System.out.println(e);
        }
        return con;
    }

    public static void main(String args[]) throws ClassNotFoundException {
        Connection con = JDBCUtil.getConnection();
        if(con != null) {
            System.out.println("DB 연결 성공!");
        }
    }
}
