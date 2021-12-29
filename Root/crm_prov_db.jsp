<%@page import="java.io.*,java.sql.*" %>
<%@ page import="java.util.List" %>
   <%@ page import="java.util.Iterator" %>
   <%@ page import="java.io.File" %>
   <%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
   <%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
   <%@ page import="org.apache.commons.fileupload.*"%>
   <%@ page contentType="text/html;charset=UTF-8" language="java" %>
   

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CRM-MNP Application</title>
		
    </head>
    <body bgcolor="#D9EEFB">
	 <table border="1" height="628" width="100%">
<tbody>
<tr>
<td colspan="2" height="23"><jsp:include page="CRMHeader.jsp"></jsp:include></td>
</tr>
<tr>
<td height="597" width="1"><jsp:include page="crmmenu.jsp"></jsp:include></td>
<td valign="center" width="738">
        
		<%
		//String c1 = (String) session.getAttribute("user");
           // String c2 = (String) session.getAttribute("s2");
   String file_desc=null,cust_name = null,cust_address=null,cust_photo_path=null,cust_id_path=null,oth_contact=null,date_of_prov=null,sim=null,mobile=null;
 boolean isMultipart = ServletFileUpload.isMultipartContent(request);
 if (!isMultipart) {
 } else {
	   FileItemFactory factory = new DiskFileItemFactory();
	   ServletFileUpload upload = new ServletFileUpload(factory);
	   List items = null;
	   
		   items = upload.parseRequest(request);
	   
	   Iterator itr = items.iterator();
	    while (itr.hasNext()) {
	   FileItem item = (FileItem) itr.next();
	   if (!item.isFormField()) {
	  // String field_name = item.getName();
	  // out.println(field_name);
	  
	         file_desc = item.getName();
	      // item.getString("name");
		//	   String itemName = item.getName();
			   File savedFile = new File(config.getServletContext().getRealPath("/")+"uploadedFiles/"+file_desc);
			   item.write(savedFile);
			   
		//	   out.println(file_desc);
			  
	  
	   
			  
			   //out.println("<tr><td><b>Your file has been saved at the loaction:</b></td></tr><tr><td><b>"+config.getServletContext().getRealPath("/")+"uploadedFiles"+"\\"+itemName+"</td></tr>");
		//out.println(item);   
	   
	   
	   }
           else{
               if(item.getFieldName().equals("txt_cust_name"))
               {
                   cust_name = item.getString();
                   
               }
		if(item.getFieldName().equals("txt_cust_add"))
               {
                   cust_address = item.getString();
                   
               }
               if(item.getFieldName().equals("txt_cust_oc"))
               {
                   oth_contact = item.getString();
                   
               }
               if(item.getFieldName().equals("txt_date"))
               {
                   date_of_prov = item.getString();
                   
               }
               if(item.getFieldName().equals("txt_cust_sim"))
               {
                   sim = item.getString();
                   
               }
               if(item.getFieldName().equals("txt_cust_mob"))
               {
                  mobile = item.getString();
                   
               }
			     }
		}
              
             try{
		              
		   Class.forName("com.mysql.jdbc.Driver");
               Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/crm","root","rttcadmin");
               Statement st=con.createStatement();
			   Statement st1=con.createStatement();
			   ResultSet rs = st1.executeQuery("select opr_code from login where username='" + session.getAttribute("uid") + "'");
			   rs.next();
		   String file_path = "../uploadedFiles/"+file_desc;
		  // out.println(file_path);
		  // file_desc = item.getString();
		 int i= st.executeUpdate("insert into cust_details(mobile_no,opr_code,sim_no,cust_name,cust_photo_path,cust_id_proof,cust_address,oth_contact,date_of_prov) values("+mobile+",'" + rs.getString(1) +"',"+sim+",'"+cust_name+"','"+file_path+"','"+file_path+"','"+cust_address+"',"+oth_contact+",'"+date_of_prov+"')");
		   if(i>0)
			  {
					

					 response.setContentType("text/html");
					out.println("<font color='green' size='8'>CRM Application Entered Successfully</font>");

			  }
			  else{
						response.setContentType("text/html");
						out.println("<font color='red' size='8'>Error in CRM Provisioning</font>");
			  }
		  
	   }catch(Exception dbex){

          out.println(dbex.getMessage());

	   }
 
 
}			
           
        
%>
      </td>
	  </tr>
	  </table>
          </body>
</html>

