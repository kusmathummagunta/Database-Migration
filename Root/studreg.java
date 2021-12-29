   import java.io.*;
   import java.sql.*;
   import javax.servlet.*;
   import javax.servlet.http.*;
   import AES.AES;
   import MD5.MD5;
   public class studreg extends HttpServlet {
    Connection con=null;
    Statement st=null, st1=null;
    ResultSet rs=null;
    RequestDispatcher rd=null;
    String username,password,firstname,lastname,dept,sques,sans,course;
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException,ServletException {
      
    
     
		try {
			username = AES.encrypt(req.getParameter("username"));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        password= MD5.getMD5(req.getParameter("password"));
     try {
		firstname= AES.encrypt(req.getParameter("firstname"));
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
		 try {
			lastname= AES.encrypt(req.getParameter("lastname"));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
         try {
			dept= AES.encrypt(req.getParameter("dept"));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	 try {
		sques= AES.encrypt(req.getParameter("secquestion"));
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	 try {
		sans= AES.encrypt(req.getParameter("secanswer"));
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
		 try {
			course= AES.encrypt(req.getParameter("course"));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        RequestDispatcher rd;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ssrdbms","root","password");
            st = con.createStatement();
			st1 = con.createStatement();
            int add=st.executeUpdate("insert into stud_details values('"+username+"','"+firstname+"','"+course+"','"+dept+"','"+sques+"','"+sans+"')");
			int addl= st1.executeUpdate("insert into login values('"+username+"','"+password+"','s')");
			if(add==1&&addl==1){
            rd=req.getRequestDispatcher("insertsuccess.jsp");
            rd.forward(req,res);
			}
		else{

            rd=req.getRequestDispatcher("failure.jsp");
			rd.forward(req,res);
		}
        } catch(Exception e2) {
             rd=req.getRequestDispatcher("failure.jsp");
        }
    }
}