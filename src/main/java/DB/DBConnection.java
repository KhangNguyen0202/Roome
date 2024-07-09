/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DB;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author nguye
 */
public class DBConnection {
    public static Connection getConnection(){
        Connection conn;
        try{
            
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String url = "jdbc:sqlserver://DESKTOP-DEPD7RC:1433;databaseName=Roome;user=sa;password=s0nd3pz4i;encrypt=true;trustServerCertificate=true";
            conn = DriverManager.getConnection(url);
        }catch(Exception ex){
            conn = null;
        }
        return conn;
    }
}
