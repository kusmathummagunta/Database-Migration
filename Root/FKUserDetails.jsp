<%@ page contentType="text/html"%>
<%@ page import="javax.xml.parsers.DocumentBuilderFactory,javax.xml.parsers.DocumentBuilder,org.w3c.dom.*,AES.AES"
%>
<html>
<body bgcolor="#FFFFFF">
<table width="102%" height="628" border="1">
<tr>

            <td height="23" colspan="2"><jsp:include page="CandidateHeader.jsp"/></td>
      </tr>
          <tr>
		  <% if(session.getAttribute("usrname").toString().equals("admin")){%>
            <td width="15%"  height="597"><jsp:include page="Adminmenu.jsp"/></td>
			<%}else{%>
			<td width="15%"  height="597"><jsp:include page="Candidatemenu.jsp"/></td>
			<%}%>
            <td width="85%" valign="top">
<center>
<table border="1" cellspacing="0", cellpadding="0">

<%
DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
DocumentBuilder db = dbf.newDocumentBuilder();
Document doc = db.parse("webapps\\ROOT\\register.xml");

DocumentBuilderFactory dbf1 = DocumentBuilderFactory.newInstance();
DocumentBuilder db1 = dbf1.newDocumentBuilder();
Document doc1 = db1.parse("webapps\\ROOT\\details.xml");

NodeList nl= doc.getElementsByTagName("username");
NodeList n3= doc.getElementsByTagName("firstname");
NodeList n4= doc.getElementsByTagName("lastname");
NodeList n5= doc.getElementsByTagName("address");
NodeList n6= doc.getElementsByTagName("city");
NodeList n7= doc.getElementsByTagName("state");
NodeList n8= doc.getElementsByTagName("zipcode");
NodeList n9= doc.getElementsByTagName("telephone");

NodeList nld= doc1.getElementsByTagName("username");
NodeList n2d= doc1.getElementsByTagName("dob");
NodeList n3d= doc1.getElementsByTagName("job");


%>

<tr>
<td colspan="11" align="center" bgcolor="yellow"><h2>Foriegn Key Linked User Details</h2></td>
</tr>
<tr bgcolor="cyan">
<td>S.No.</td><td>Username</td><td>Firstname</td><td>Lastname</td><td>Address</td><td>City</td><td>State</td><td>Zipcode</td><td>Telephone</td><td>Date of Birth</td><td>Designation</td>
</tr>
<% for(int k=0;k<n3.getLength();k++){
	for(int j=0;j<n2d.getLength();j++){
%>


<%if(AES.decrypt(nl.item(k).getFirstChild().getNodeValue()).equals(nld.item(j).getFirstChild().getNodeValue())){%>
<tr>
<td><%=j+1%></td>
<td bgcolor="pink"><%= nld.item(j).getFirstChild().getNodeValue() %> </td>
<td><%= AES.decrypt(n3.item(j).getFirstChild().getNodeValue()) %> </td>
<td bgcolor="pink"><%= AES.decrypt(n4.item(j).getFirstChild().getNodeValue()) %> </td>
<td><%= AES.decrypt(n5.item(j).getFirstChild().getNodeValue()) %> </td>
<td bgcolor="pink"><%= AES.decrypt(n6.item(j).getFirstChild().getNodeValue()) %> </td>
<td><%= AES.decrypt(n7.item(j).getFirstChild().getNodeValue()) %> </td>
<td bgcolor="pink"><%= AES.decrypt(n8.item(j).getFirstChild().getNodeValue()) %> </td>
<td><%= AES.decrypt(n9.item(j).getFirstChild().getNodeValue()) %> </td>
<td bgcolor="pink"><%= n2d.item(j).getFirstChild().getNodeValue() %> </td>
<td><%= n3d.item(j).getFirstChild().getNodeValue() %> </td>
</tr>
<%}%>
<%}%>
<%}%>
</table>
</center>
</td>
</tr>
</table>
</body>
</html>

