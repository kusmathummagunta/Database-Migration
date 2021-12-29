<%@ page contentType="text/html"%>
<%@ page import="javax.xml.parsers.DocumentBuilderFactory,javax.xml.parsers.DocumentBuilder,org.w3c.dom.*,javax.xml.parsers.*,javax.xml.transform.*, javax.xml.transform.dom.*,javax.xml.transform.stream.*,java.util.*,MD5.MD5,AES.AES"
%>
<html>
<body bgcolor="#FFFFFF">

<center>

<%
    
DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
DocumentBuilder db = dbf.newDocumentBuilder();
Document doc = db.parse("webapps\\ROOT\\register.xml");


NodeList nl= doc.getElementsByTagName("username");
NodeList n2= doc.getElementsByTagName("password");
String uname=request.getParameter("user");
String passwd = request.getParameter("newpass");
String encpwd = MD5.getMD5(passwd);

int i=0;
%>

<% for(int k=0;k<nl.getLength();k++)
{
	
	if(AES.decrypt(nl.item(k).getFirstChild().getNodeValue()).equals(session.getAttribute("fuser"))){
 n2.item(k).getFirstChild().setNodeValue(encpwd) ;
 i++;
 %>
 <font color="green" size="6"><%out.println("Password Updated Successfully");%></font>
	<%}%>

<%}
if(i==0)
{%>
<font color="red" size="6"><%out.println("InCorrect Old Password. Please try again");%></font>

<%}
TransformerFactory transformerFactory = TransformerFactory.newInstance();
       Transformer transformer = transformerFactory.newTransformer();
       DOMSource source = new DOMSource(doc);
       StreamResult result = new StreamResult("C:\\Program Files\\Apache Software Foundation\\Tomcat 7.0\\webapps\\ROOT\\register"
                + ".xml");
       transformer.transform(source, result);
%>
</center>

</body>
</html>