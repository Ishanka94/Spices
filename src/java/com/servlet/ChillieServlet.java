/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlet;

import java.sql.*;
//import java.util.*;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Ishanka
 */
public class ChillieServlet extends HttpServlet {
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{

        int qty = Integer.parseInt(request.getParameter("quantity"));
        float cprice = Float.parseFloat(request.getParameter("cprice"));
        int nId = Integer.parseInt(request.getParameter("nId"));
        
        java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
        
        try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/spice", "root", "");
        Statement st = con.createStatement();
        st.executeUpdate("update chillie set qty = '"+ qty +"', price = '"+ cprice +"', addedOn = '"+ date +"' where id = '"+ nId +"'  ");
        }catch(Exception e){
            e.printStackTrace();
        }
        
        String changeDate = "" + date;
        response.setContentType("text/plain");
        response.getWriter().write(changeDate);
    }

}
