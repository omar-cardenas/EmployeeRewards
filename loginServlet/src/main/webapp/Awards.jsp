<%--
  Created by IntelliJ IDEA.
  User: odalw
  Date: 6/5/2024
  Time: 5:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%@page  import = "java.sql.*"%>
<%@ page import="java.io.PrintWriter" %>


<%
    PrintWriter pr = response.getWriter();
    try {
        String jdbcUrl = "jdbc:mysql://localhost:3306/hotelrewards";

        Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
        Connection con = DriverManager.getConnection(jdbcUrl, "root", "omar1998");
        if(!con.isClosed()) {
            System.out.println("Connection success for JSP");
        }
        Statement stmt = con.createStatement();
        String result = "";

        PreparedStatement ps = con.prepareStatement("select * from award");
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
            //System.out.println("In Resultset loop");
            //System.out.println(rs.getObject(1));
            result +=  rs.getObject(1) + "," + rs.getObject(2) + "," + rs.getObject(3) + "," + rs.getObject(4) + "," + rs.getObject(5) +"#";
        }
        con.close();
        System.out.println(result);
        pr.println(result);


    }catch(SQLException e) {
        e.printStackTrace();
    }

%>
