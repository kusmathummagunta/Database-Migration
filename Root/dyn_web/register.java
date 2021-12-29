   import java.io.*;
   import java.sql.*;
   import javax.servlet.*;
   import javax.servlet.http.*;
   public class register extends HttpServlet {
    Connection con=null;
    Statement st=null;
    ResultSet rs=null;
    RequestDispatcher rd=null;
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException,ServletException {
        String username= req.getParameter("username");
        String password= req.getParameter("password");
        String firstname= req.getParameter("firstname");
        String lastname= req.getParameter("lastname");
        String address= req.getParameter("address");
	String city= req.getParameter("city");
	String state= req.getParameter("state");
	String zipcode= req.getParameter("zipcode");
	String telephone= req.getParameter("telephone");
        RequestDispatcher rd;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dws","root","password");
            st = con.createStatement();
            int add=st.executeUpdate("insert into userdetails values('"+username+"','"+password+"','"+firstname+"','"+lastname+"','"+address+"','"+city+"','"+state+"','"+zipcode+"','"+telephone+"')");
			
            rd=req.getRequestDispatcher("insertsuccess.jsp");
            rd.forward(req,res);
        } catch(Exception e2) {
             rd=req.getRequestDispatcher("failure.jsp");
        }
    }
}