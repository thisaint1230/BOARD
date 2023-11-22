package com.example.Util;


import java.sql.Connection;
import java.sql.DriverManager;
public class JAVAUtil {
    public static Connection getConnection() {
        Connection con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://walab.handong.edu:3306/p232_22200527", "p232_22200527", "ohTh8c");
        } catch (Exception e) {
            System.out.println(e);
        }
        return con;
    }

  /*  public static void main (String ars[]){
        Connection conn = getConnection();

        if(conn != null){
            System.out.println("db");
        }
        else {
            System.out.println("이상이상");

        }
        */
    }






