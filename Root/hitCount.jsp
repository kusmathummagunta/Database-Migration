<%@ page %>

<html>
<head>
<title>Applcation object in JSP</title>
</head>
<body>
<%
	
    Integer hitsCount = 
      (Integer)application.getAttribute("hitCounter");
    if( hitsCount ==null || hitsCount == 0 ){
       /* First visit */
       out.println("Welcome to my website!");
       hitsCount = 1;
    }else{
       /* return visit */
       out.println("Welcome back to my website!");
       hitsCount += 1;
    }
    application.setAttribute("hitCounter", hitsCount);
        
%>
<center>
<p>Total number of visits: <%= hitsCount%></p>
</center>
<% response.setHeader("Refresh", "60;url=history_register.jsp");%>
</body>
</html>
