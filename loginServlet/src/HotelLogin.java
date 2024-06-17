import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet("/login")
public class HotelLogin extends HttpServlet{
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter pr = response.getWriter();
        try{


            String jdbcUrl = "jdbc:mysql://localhost:3306/hotelrewards";
            String user = request.getParameter("user");
            String pass = request.getParameter("pass");

            //DriverManager.registerDriver(new oracle.jdbc.OracleDriver());
            Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
            Connection con = DriverManager.getConnection(jdbcUrl, "root", "omar1998");
            //if(con != null){ pr.write("Connection was successful");}

            Statement stmt = con.createStatement();
            //ResultSet rs = stmt.executeQuery("SELECT * FROM emp_account");
            ResultSet rs = stmt.executeQuery("select * from emp_account where username = '" + user + "' and user_pass = '" + pass + "'");

            String userId = "";
            String username = "";
            while(rs.next()){
                userId += rs.getObject(1);
                username += rs.getString(2);

            }
            if(userId.equals("")){
                pr.write("Wrong username or password");
            }else{
                pr.write("Welcome back " + username + ":" + userId);
                //pr.write(result);
            }
            con.close();


        }catch(Exception e){
            e.printStackTrace();
        }

    }
    /*
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter pr = response.getWriter();
        try{


            String jdbcUrl = "jdbc:mysql://localhost:3306/hotelrewards";
            String user = request.getParameter("textName");
            String pass = request.getParameter("textPass");
            Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
            Connection con = DriverManager.getConnection(jdbcUrl, "root", "omar1998");
            //if(con != null){ pr.write("Connection was successful");}
            PreparedStatement ps = con.prepareStatement("select * from emp_account where username = '" + user + "' and user_pass = '" + pass + "'");
            ResultSet rs = ps.executeQuery();

            String result = "";
            String username = "";
            if(rs.next()){
                RequestDispatcher rd = request.getRequestDispatcher("welcome.jsp");
                rd.forward(request, response);
            }else{
                pr.println(user + "   " + pass);
                pr.println("Login Failed");
                pr.println("<a href=login.jsp> Try Again</a>");
            }
            con.close();


        }catch(Exception e){
            e.printStackTrace();
        }
    }

     */
}
