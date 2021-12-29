 <%@ page contentType="text/html;charset=UTF-8" language="java" %>
 <%@ page import="java.sql.*"%>
<html>
<head>

</head>
<body>
<table border="1" height="628" width="100%" bgcolor="white">
<tbody>
<tr>
<td colspan="2" height="23"><jsp:include page="SAHeader.jsp"/></td>
</tr>
<tr>

			<td width="15%"  height="597"><jsp:include page="Candidatemenu.jsp"/></td>
			
<td valign="center" width="738">


<%
				String c1 = (String) session.getAttribute("usrname");
            

			   Class.forName("com.mysql.jdbc.Driver");
               Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ssrdbms","root","password");
               Statement st=con.createStatement();
			   ResultSet rs = st.executeQuery("select a.file_path,b.file_desc,d.sno,b.upload_date,b.username,b.faculty,d.grade,d.result_date from assig_files_path a,assig_files_desc b,faculty_details c,stud_grades d where b.username='" + c1 + "' and a.sno=b.sno and b.faculty=c.username and a.username=d.stud_id and b.faculty=d.faculty and b.file_desc=d.assig_name order by d.result_date desc");%>

<table align="center" border="1">
<th>S.No.</th><th>File Desc.</th><th>File Upload Date</th><th>To Faculty</th><th>Grade Obtained</th><th>Result Date</th>
<% 
while(rs.next())
{
   String fp = rs.getString(1);
   String fd = rs.getString(2);
   Integer slno = Integer.parseInt(rs.getString(3));
   String fdate = rs.getString(4);
   String uploadedby=rs.getString(5);
   String to_fac = rs.getString(6);
   String gr = rs.getString(7);
   String rdate = rs.getString(8);
%>



<tr>
<td>
<%=slno%>
</td>
<td>
<a href=<%=fp%>>
<%=fd%>
</a>
</td>
<td>
<%=fdate%>
</td>
<td>
<%=to_fac%>
</td>
<td>
<%=gr%>
</td>
<td>
<%=rdate%>
</td>

<%
	
}

%>
</tr>
</table>
</td>
</tr>
</tbody>
</table>


</body>

</html>