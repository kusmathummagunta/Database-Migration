<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<style type="text/css">
<!--
.style2 {
	font-size: 14px;
	font-family: "Times New Roman", Times, serif;
}
-->
</style>
<script type="text/javascript" src="js/modernizr-1.5.min.js"></script>
  <style type="text/css">
  #accordion {
	list-style: none;
	padding: 0 0 0 0;
	width: 150px;
}
#accordion li{
	display: block;
	background-color: #3B6299;
	
	font-weight: bold;
	margin: 1px;
	cursor: pointer;
	padding: 5 5 5 7px;
	list-style: circle;
	-moz-border-radius: 10px;
	-webkit-border-radius: 10px;
	border-radius: 10px;
}
#accordion ul {
	list-style: none;
	padding: 0 0 0 0;
	display: none;
}
#accordion ul li{
	font-weight: bold;
	cursor: auto;
	background-color: #fff;
    color:black;
	font:black;
	padding: 0 0 0 7px;
}
#accordion a {
	text-decoration: none;
}
#accordion a:hover {
	text-decoration: underline;
}


    </style>
    <script type="text/javascript" src="jquery-latest.js"></script>
</head>

<body>
<table width="151" border="0" valign="top">
  <tr valign="top">
    <td width="145" height="531" valign="top"><p><img src="bsnl-logo.jpg" width="145" height="162" /></p>
  
          <ul id="accordion">
    <li><div><a href="AdminHomePage.jsp"><font color="white"><center>Home</center></font></a></div></li>
    <li><div><font color="white"><center>CRM Forms</center></font></div>
        <ul>
			<li><font color="black"><a href="Cust_Provision.jsp"><center>Customer Provisioni ng</center></a></font></li>
			<li><font color="black"><a href="add_mob_plans.jsp"><center>Add Mobile Plans(3G/2G)</center></a></font></li>

			<li><font color="black"><a href="Cust_Fac.jsp"><center>Customer Facilities</center></a></font></li>
			
		</ul>
    </li>
	<li><div><font color="white"><center>MNP Forms</center></font></div>
        <ul>
             <li><font color="black"><a href="mnp_approve.jsp"><center>MNP Approval Form</center></a></font></li>
	    

			
		</ul>
    </li>
	<li><div><font color="white"><center>CRM-MNP Reports</center></font></div>
        <ul>
             <li><font color="black"><a href="MNP_rep.jsp"><center>MNP Report</center></a></font></li>
			<li><font color="black"><a href="cus_rep.jsp"><center>CRM Report</center></a></font></li>
	    

			
		</ul>
    </li>
	
    <li><div><a href="loginhome.jsp"><font color="white"><center>Logout</center></font></a></div></li>
    
</ul>
    </strong></p></td>
  </tr>
</table>
<script>
$("#accordion > li > div").click(function(){
 
    if(false == $(this).next().is(':visible')) {
        $('#accordion ul').slideUp(300);
    }
    $(this).next().slideToggle(300);
});
 
$('#accordion ul:eq(0)').show();

</script>
</body>
</html>
