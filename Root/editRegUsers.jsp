<%@ page contentType="text/html"%>
<%@ page import="javax.xml.parsers.DocumentBuilderFactory,javax.xml.parsers.DocumentBuilder,org.w3c.dom.*,AES.AES"
%>
<html>
<body bgcolor="#FFFFFF">
<%
if(session.getAttribute("usrname")==null){

response.sendRedirect("LoginXML.html");
}else {

%>
<table width="102%" height="628" border="1">
<tr>
            <td height="23" colspan="2"><jsp:include page="CandidateHeader.jsp"/></td>
      </tr>
          <tr>
            <td width="15%"  height="597"><jsp:include page="Adminmenu.jsp"/></td>
            <td width="85%" valign="top">
<center>
<table border="1" cellspacing="0", cellpadding="0">

<%
DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
DocumentBuilder db = dbf.newDocumentBuilder();
Document doc = db.parse("webapps\\ROOT\\register.xml");


NodeList nl= doc.getElementsByTagName("username");
NodeList n2= doc.getElementsByTagName("password");
NodeList n3= doc.getElementsByTagName("firstname");
NodeList n4= doc.getElementsByTagName("lastname");
NodeList n5= doc.getElementsByTagName("address");
NodeList n6= doc.getElementsByTagName("city");
NodeList n7= doc.getElementsByTagName("state");
NodeList n8= doc.getElementsByTagName("zipcode");
NodeList n9= doc.getElementsByTagName("telephone");

%>

<tr>
<td colspan="11" align="center" bgcolor="yellow"><h2>Registered Users Details</h2></td>
</tr>
<tr bgcolor="cyan">
<td>S.No.</td><td>Username</td><td>Firstname</td><td>Lastname</td><td>Address</td><td>City</td><td>State</td><td>Zipcode</td><td>Telephone</td><td></td><td></td>
</tr>
<% for(int k=0;k<n3.getLength();k++){

if(!AES.decrypt(nl.item(k).getFirstChild().getNodeValue()).equals(session.getAttribute("usrname"))){
%>

<tr>
<td><%=k+1%></td>
<td bgcolor="pink"><%=AES.decrypt(nl.item(k).getFirstChild().getNodeValue()) %> </td>
<td>
<%=n2.item(k).getFirstChild().getNodeValue() %>
</td>
<td><%= AES.decrypt(n3.item(k).getFirstChild().getNodeValue()) %> </td>
<td bgcolor="pink"><%= AES.decrypt(n4.item(k).getFirstChild().getNodeValue()) %> </td>
<td><%= AES.decrypt(n5.item(k).getFirstChild().getNodeValue()) %> </td>
<td bgcolor="pink"><%= AES.decrypt(n6.item(k).getFirstChild().getNodeValue()) %> </td>
<td><%= AES.decrypt(n7.item(k).getFirstChild().getNodeValue()) %> </td>
<td bgcolor="pink"><%= AES.decrypt(n8.item(k).getFirstChild().getNodeValue()) %> </td>
<td><%= AES.decrypt(n9.item(k).getFirstChild().getNodeValue()) %> </td>
<td><a href="regUsersEdit.jsp?uname=<%=AES.decrypt(nl.item(k).getFirstChild().getNodeValue())%>&&fn=<%= AES.decrypt(n3.item(k).getFirstChild().getNodeValue()) %>&&ln=<%= AES.decrypt(n4.item(k).getFirstChild().getNodeValue()) %>&&add=<%= AES.decrypt(n5.item(k).getFirstChild().getNodeValue()) %>&&cty=<%= AES.decrypt(n6.item(k).getFirstChild().getNodeValue()) %>&&st=<%= AES.decrypt(n7.item(k).getFirstChild().getNodeValue()) %>&&zc=<%= AES.decrypt(n8.item(k).getFirstChild().getNodeValue()) %>&&ph=<%= AES.decrypt(n9.item(k).getFirstChild().getNodeValue()) %>">Edit</a></td>
<td><a href="regusers_delete.jsp?uname=<%=AES.decrypt(nl.item(k).getFirstChild().getNodeValue())%>">Delete</a></td>
</tr>
<%}
else{%>
<tr>
<td><%=k+1%></td>
<td bgcolor="pink"><%= AES.decrypt(nl.item(k).getFirstChild().getNodeValue()) %> </td>
<td><%= AES.decrypt(n3.item(k).getFirstChild().getNodeValue()) %> </td>
<td bgcolor="pink"><%= AES.decrypt(n4.item(k).getFirstChild().getNodeValue()) %> </td>
<td><%= AES.decrypt(n5.item(k).getFirstChild().getNodeValue()) %> </td>
<td bgcolor="pink"><%= AES.decrypt(n6.item(k).getFirstChild().getNodeValue()) %> </td>
<td><%= AES.decrypt(n7.item(k).getFirstChild().getNodeValue()) %> </td>
<td bgcolor="pink"><%= AES.decrypt(n8.item(k).getFirstChild().getNodeValue()) %> </td>
<td><%= AES.decrypt(n9.item(k).getFirstChild().getNodeValue()) %> </td>
<td><a href="regUsersEdit.jsp?uname=<%=AES.decrypt(nl.item(k).getFirstChild().getNodeValue())%>&&fn=<%= AES.decrypt(n3.item(k).getFirstChild().getNodeValue()) %>&&ln=<%= AES.decrypt(n4.item(k).getFirstChild().getNodeValue()) %>&&add=<%= AES.decrypt(n5.item(k).getFirstChild().getNodeValue()) %>&&cty=<%= AES.decrypt(n6.item(k).getFirstChild().getNodeValue()) %>&&st=<%= AES.decrypt(n7.item(k).getFirstChild().getNodeValue()) %>&&zc=<%= AES.decrypt(n8.item(k).getFirstChild().getNodeValue()) %>&&ph=<%= AES.decrypt(n9.item(k).getFirstChild().getNodeValue()) %>">Edit</a></td>
<td><font color="red">Current User</font></td>
</tr>
<%}
}%>
</table>
</center>
</td>
</tr>
</table>
<%}%>
</body>
</html>

