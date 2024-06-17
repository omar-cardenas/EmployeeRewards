<%--
  Created by IntelliJ IDEA.
  User: odalw
  Date: 6/13/2024
  Time: 2:07 AM
  To change this template use File | Settings | File Templates.
--%>


<%@page  import = "java.sql.*"%>
<%@ page import="java.io.PrintWriter" %>


<%
    PrintWriter pr = response.getWriter();
    try {
        String jdbcUrl = "jdbc:mysql://localhost:3306/hotelrewards";
        String empId = request.getParameter("empid");
        Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
        Connection con = DriverManager.getConnection(jdbcUrl, "root", "omar1998");
        if(!con.isClosed()) {
            System.out.println("Connection success for JSP");
        }
        Statement stmt = con.createStatement();
        String result = "";

        PreparedStatement ps = con.prepareStatement("select total_points from emp_points where emp_id=" + empId );
        ResultSet rs = ps.executeQuery();
        /*
        if(rs.next() == false) {
            System.out.println("querry failed");
        }else{
            System.out.println("querry passed");
            System.out.println(rs.getObject(1));

            System.out.println(rs.getObject(2));

        } */
        if(rs.next()) {
            result = rs.getString("total_points");
        }
        con.close();
        System.out.println(result);
        pr.write(result);


    }catch(SQLException e) {
        e.printStackTrace();
    }

%>
