<%@ page contentType="text/html" %>
<%@ page import="java.sql.*" %>
<%@ page import="org.sqlite.*" %>
 
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>SQLite Demo</title>
    </head>
    <body>
        <table>
            <thead>
                <tr>
                    <th>Item No.</th>
                    <th>Name</th>
                    <th>Price</th>
                    <th>Description</th>
                </tr>
            </thead>
            <tbody>
            <%
			try{

                Class.forName("org.sqlite.JDBC");
                Connection conn =
                     DriverManager.getConnection("jdbc:sqlite:C:\\Program Files\\Apache Software Foundation\\Tomcat 7.0\\webapps\\ROOT\\user_details.db;");
                Statement stat = conn.createStatement();
 
                ResultSet rs = stat.executeQuery("select * from register");
 
                while (rs.next()) {
                    out.println("<tr>");
                    out.println("<td>" + rs.getString("username") + "</td>");
                    out.println("<td>" + rs.getString("password") + "</td>");
                    out.println("<td>" + rs.getString("name") + " kr.</td>");
                    out.println("<td>" + rs.getString("contact") + "</td>");
                    out.println("</tr>");
                }
 
                rs.close();
                conn.close();
}
catch(Exception ex){
ex.printStackTrace();
}
            %>
            </tbody>
        </table>
    </body>
</html>
