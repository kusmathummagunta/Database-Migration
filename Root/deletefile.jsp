<%@page  import="java.sql.*" %>
<%@page import="java.io.*,java.sql.*,java.util.*,java.util.Vector;"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>www.rttchyd.bsnl.co.in</title>
    </head>
    <body>
        <table>
    
<% try      
      {

      String sno=request.getParameter("sno");
      out.println(sno);
           Class.forName("com.mysql.jdbc.Driver");
               Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/dws","root","password");
           Statement st=con.createStatement();
		   Statement st1=con.createStatement();
		   Statement st2=con.createStatement();
		   Statement st3=con.createStatement();
		   Statement st4=con.createStatement();
		   Statement st5=con.createStatement();
		   Statement st6=con.createStatement();
		

	 
    
	 st.executeUpdate("delete from file_upload where sno='"+sno+"'");
	 st1.executeUpdate("delete from file_path where sno='"+sno+"'");

     st2.executeUpdate("update file_path set sno=sno-1 where sno>'"+sno+"'");
	 st3.executeUpdate("update file_upload set sno=sno-1 where sno>'"+sno+"'");

	 ResultSet rs = st5.executeQuery("select max(sno)+1 from file_upload");
	 while(rs.next())
{
	 String ai = rs.getString(1);
	 st4.executeUpdate("alter table file_upload AUTO_INCREMENT = " + Integer.parseInt(ai) + "");
	 st5.executeUpdate("alter table file_path AUTO_INCREMENT = " + Integer.parseInt(ai) + "");
}

       //response.sendRedirect("download_file_multiple.jsp");
        out.println("File Deleted Successfully");
   }//try
      
    catch(Exception e)
     {
        out.println("File Deleted Successfully");        
     }
%>
    </table>
    </body>
</html>
