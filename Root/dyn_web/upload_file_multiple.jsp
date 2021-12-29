 <%@ page import="java.util.List" %>
   <%@ page import="java.util.Iterator" %>
   <%@ page import="java.io.File" %>
   <%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
   <%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
   <%@ page import="org.apache.commons.fileupload.*"%>
   <%@ page contentType="text/html;charset=UTF-8" language="java" %>
   <%@ page import="java.sql.*"%>
   <center><table border="0" bgcolor=green">
        <tr><td><h1>Your files  uploaded </h1></td></tr>
   <%

   String file_desc = null;
 boolean isMultipart = ServletFileUpload.isMultipartContent(request);
 if (!isMultipart) {
 } else {
	   FileItemFactory factory = new DiskFileItemFactory();
	   ServletFileUpload upload = new ServletFileUpload(factory);
	   List items = null;
	   try {
		   items = upload.parseRequest(request);
	   } catch (FileUploadException e) {
		   e.printStackTrace();
	   }
	   Iterator itr = items.iterator();
	   while (itr.hasNext()) {
	   FileItem item = (FileItem) itr.next();
	   if (item.isFormField()) {
	   String field_name = item.getFieldName();
	   if(field_name.equals("filedesc"))
		   {
	   file_desc = item.getString();
		 Class.forName("com.mysql.jdbc.Driver");
               Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/dws","root","password");
               Statement st1=con.createStatement();
			   st1.executeUpdate("insert into file_upload(file_desc,file_upload_date) values('" + file_desc + "',sysDate())"); 
			   st1.close();
		   }
	  
	   } else {
		  
		   try {
			   String itemName = item.getName();
			   File savedFile = new File(config.getServletContext().getRealPath("/")+"uploadedFiles/"+itemName);
			   item.write(savedFile);
			   String file_path = "../uploadedFiles/"+itemName;
			   out.println(file_path);
			   Class.forName("com.mysql.jdbc.Driver");
               Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/dws","root","password");
               Statement st=con.createStatement();
			   
              
			   
			   st.executeUpdate("insert into file_path(file_path) values('" + file_path + "')"); 
			   
			   
			   st.close();
			  
			   out.println("<tr><td><h3><i>Your file has been saved at the loaction:</i></h3></td></tr><tr><td><b>"+config.getServletContext().getRealPath("/")+"uploadedFiles"+"\\"+itemName+"</td></tr>");
		   } catch (Exception e) {
			   e.printStackTrace();
		   }
	   }
	   }
   }
   %>
    </table>
   </center>