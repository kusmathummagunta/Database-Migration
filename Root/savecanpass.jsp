<%@ page contentType="text/html"%>
<%@ page import="javax.xml.parsers.DocumentBuilderFactory,javax.xml.parsers.DocumentBuilder,org.w3c.dom.*,javax.xml.parsers.*,javax.xml.transform.*, javax.xml.transform.dom.*,javax.xml.transform.stream.*,java.util.*"
%>
<html>
<body bgcolor="#FFFFFF">
<table width="102%" height="628" border="1">
<tr>
            <td height="23" colspan="2"><jsp:include page="CandidateHeader.jsp"/></td>
      </tr>
          <tr>
            
            <td width="15%"  height="597"><jsp:include page="Adminmenu.jsp"/></td>
			
            <td width="85%" valign="top">
<center>

<%
    
DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
DocumentBuilder db = dbf.newDocumentBuilder();
Document doc = db.parse("webapps\\ROOT\\register.xml");


NodeList nl= doc.getElementsByTagName("username");
NodeList n2= doc.getElementsByTagName("password");
String uname=request.getParameter("user");
String passwd = request.getParameter("newpass");


int i=0;
%>

<% for(int k=0;k<nl.getLength();k++)
{
	
	if(nl.item(k).getFirstChild().getNodeValue().equals(uname)){
 n2.item(k).getFirstChild().setNodeValue(passwd) ;
 i++;
 %>
 <font color="green" size="6"><%out.println("Password Updated Successfully");%></font>
	<%}%>

<%}
if(i==0)
{%>
<font color="red" size="6"><%out.println("Password Updation Failed.Please try again");%></font>

<%}
TransformerFactory transformerFactory = TransformerFactory.newInstance();
       Transformer transformer = transformerFactory.newTransformer();
       DOMSource source = new DOMSource(doc);
       StreamResult result = new StreamResult("webapps\\ROOT\\register"
                + ".xml");
       transformer.transform(source, result);
%>
</center>
</td>
</tr>
</table>
</body>
</html>