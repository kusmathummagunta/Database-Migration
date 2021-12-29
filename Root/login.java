   import java.io.*;
   import java.sql.*;
   import javax.servlet.*;
   import javax.servlet.http.*;
   public class login extends HttpServlet {
    String username="";
    String password="";
	//String department="";
    Connection con=null;
    Statement st=null;
    ResultSet rs=null;
    RequestDispatcher rd=null;
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException,ServletException {
        username = req.getParameter("username");
        password = req.getParameter("password");
	//	department=req.getParameter("department");
		HttpSession sn = req.getSession(true);
	   
        //sn.setAttribute("dpm",department);
		RequestDispatcher rd;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dws","root","password");
            st = con.createStatement();
            rs = st.executeQuery("select * from userdetails where username='"+username+"' and password='"+password+"'");
            if(rs.next()) {
		sn.setAttribute("uid",username);
		int interval = 86400000;
		sn.setMaxInactiveInterval(interval);
             // department=rs.getString(3);
                rd=req.getRequestDispatcher("CandidateHomePage.jsp");
			//	sn.setAttribute("dpm",department);
            } else {

               rd=req.getRequestDispatcher("failure.jsp");
	        }
	        rd.forward(req,res);
        }
        catch(Exception e2)
         {
            System.out.println("Exception : "+e2.toString());
        }
    }
}