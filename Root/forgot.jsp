<%@ page contentType="text/html"%>
<%@ page import="javax.xml.parsers.DocumentBuilderFactory,javax.xml.parsers.DocumentBuilder,org.w3c.dom.*,MD5.MD5,AES.AES"
%>
<html>
<body><center>


<%
DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
DocumentBuilder db = dbf.newDocumentBuilder();
Document doc = db.parse("webapps\\ROOT\\register.xml");

NodeList nl= doc.getElementsByTagName("username");
NodeList n2= doc.getElementsByTagName("secquestion");
NodeList n3= doc.getElementsByTagName("secanswer");
for(int k=0;k<n2.getLength();k++)
{
String user =AES.decrypt(nl.item(k).getFirstChild().getNodeValue());
String sq =AES.decrypt(n2.item(k).getFirstChild().getNodeValue());
String sa =AES.decrypt(n3.item(k).getFirstChild().getNodeValue());
String suser = request.getParameter("username");
String  squser = request.getParameter("secquestion");
String  sauser= request.getParameter("secanswer");



session.setAttribute("fuser",suser);
%>
<%
if(user.equals(suser)&&sq.equals(squser)&&sa.equals(sauser))
{
response.sendRedirect("ForgotPassword.jsp");
}

}
%> 
</center>
</body>
</html>
