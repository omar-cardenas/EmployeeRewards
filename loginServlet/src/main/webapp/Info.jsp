<%--
  Created by IntelliJ IDEA.
  User: odalw
  Date: 6/5/2024
  Time: 1:22 PM
  To change this template use File | Settings | File Templates.
--%>

<%@page  import = "java.sql.*"%>
<%@ page import="java.io.PrintWriter" %>

<%
    PrintWriter pr = response.getWriter();
    try {
        String jdbcUrl = "jdbc:mysql://localhost:3306/hotelrewards";
        String employeeID = request.getParameter("id");
        //PrintWriter pw = new PrintWriter("");


        Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
        Connection con = DriverManager.getConnection(jdbcUrl, "root", "omar1998");
        if(!con.isClosed()) {
            System.out.println("Connection success for JSP");
        }
        Statement stmt = con.createStatement();
        String result = "";

        System.out.println("employee id -> " + employeeID);
        PreparedStatement ps = con.prepareStatement("select E.id, E.username, Pts.total_points from emp_account E INNER JOIN emp_points Pts ON E.id = Pts.emp_id WHERE E.id= '" + employeeID+ "'");
        ResultSet rs = ps.executeQuery();
        /*
        if(rs.next() == false) {
            System.out.println("querry failed");
        }else{
            System.out.println("querry passed");
            System.out.println(rs.getObject(1));

            System.out.println(rs.getObject(2));

        } */

        while(rs.next()) {
            System.out.println("In Resultset loop");
            //System.out.println(rs.getObject(1));
            result +=  rs.getObject(1) + "," + rs.getObject(2) + "#";
        }
        con.close();
        System.out.println(result);
        pr.print(result);


    }catch(SQLException e) {
        e.printStackTrace();
    }

%>




