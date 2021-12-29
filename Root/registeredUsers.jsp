<%@ page contentType="text/html"%>
<%@ page import="javax.xml.parsers.DocumentBuilderFactory,javax.xml.parsers.DocumentBuilder,org.w3c.dom.*"
%>
<html>
<body bgcolor="#FFFFFF">
<table width="102%" height="628" border="1">
<tr>
            <td height="23" colspan="2"><jsp:include page="CandidateHeader.jsp"/></td>
      </tr>
          <tr>
            <td width="15%"  height="597"><jsp:include page="Candidatemenu.jsp"/></td>
            <td width="85%" valign="top">
<center>
<table border="1" cellspacing="0", cellpadding="0">

<%
DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
DocumentBuilder db = dbf.newDocumentBuilder();
Document doc = db.parse("webapps\\ROOT\\register.xml");


NodeList nl= doc.getElementsByTagName("username");
//NodeList n2= doc.getElementsByTagName("password");
NodeList n3= doc.getElementsByTagName("firstname");
NodeList n4= doc.getElementsByTagName("lastname");
NodeList n5= doc.getElementsByTagName("address");
NodeList n6= doc.getElementsByTagName("city");
NodeList n7= doc.getElementsByTagName("state");
NodeList n8= doc.getElementsByTagName("zipcode");
NodeList n9= doc.getElementsByTagName("telephone");

%>

<tr>
<td colspan="9" align="center" bgcolor="yellow"><h2>Registered Users Details</h2></td>
</tr>
<tr bgcolor="cyan">
<td>S.No.</td><td>Username</td><td>Firstname</td><td>Lastname</td><td>Address</td><td>City</td><td>State</td><td>Zipcode</td><td>Telephone</td>
</tr>
<% for(int k=0;k<n3.getLength();k++){
%>

<tr>
<td><%=k+1%></td>
<td bgcolor="pink"><%= nl.item(k).getFirstChild().getNodeValue() %> </td>
<td><%= n3.item(k).getFirstChild().getNodeValue() %> </td>
<td bgcolor="pink"><%= n4.item(k).getFirstChild().getNodeValue() %> </td>
<td><%= n5.item(k).getFirstChild().getNodeValue() %> </td>
<td bgcolor="pink"><%= n6.item(k).getFirstChild().getNodeValue() %> </td>
<td><%= n7.item(k).getFirstChild().getNodeValue() %> </td>
<td bgcolor="pink"><%= n8.item(k).getFirstChild().getNodeValue() %> </td>
<td><%= n9.item(k).getFirstChild().getNodeValue() %> </td>
</tr>
<%}%>
</table>
</center>
</td>
</tr>
</table>
</body>
</html>

