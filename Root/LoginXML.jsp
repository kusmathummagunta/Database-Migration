<%@ page contentType="text/html"%>
<%@ page import="javax.xml.parsers.DocumentBuilderFactory,javax.xml.parsers.DocumentBuilder,org.w3c.dom.*"
%>
<html>
<body><center>


<%
int i=0;
String user1 = request.getParameter("username");
String pass1 = request.getParameter("password");
session.setAttribute("usrname",user1);
if(user1.equals("admin")&&pass1.equals("priya"))
{
	i=i+1;
response.sendRedirect("AdminHomePage.jsp");
}


if(i==0){
	response.setContentType("text/html");
 out.println("<h2><font color='red'>Incorrect Login or Password</font></h2>");
}
%> 
</center>
</body>
</html>
