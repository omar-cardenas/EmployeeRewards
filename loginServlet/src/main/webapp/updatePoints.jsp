<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: odalw
  Date: 6/16/2024
  Time: 7:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    PrintWriter pw = response.getWriter();
    try {
        String jdbcUrl = "jdbc:mysql://localhost:3306/hotelrewards";
        String newPoints = request.getParameter("newPoints");
        String employeeID = request.getParameter("id");
        String currentPoints = request.getParameter("points");


        Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
        Connection con = DriverManager.getConnection(jdbcUrl, "root", "omar1998");
        if (!con.isClosed()) {
            System.out.println("Connection success for JSP");
        }
        Statement stmt = con.createStatement();
        String result = "";
        //update emp_points set total_points= 500 where emp_id=100 and total_points=100;


        PreparedStatement ps = con.prepareStatement("update emp_points set total_points='" + newPoints + "'" + "where emp_id='" + employeeID + "'" + " and total_points='" + currentPoints + "'");
        int rowsUpdated = ps.executeUpdate();

        if (rowsUpdated > 0) {
            pw.write("Points updated successfully");
        } else {
            pw.write("Update Failed");
        }
    }catch(SQLException e){
        e.printStackTrace();
    }


%>