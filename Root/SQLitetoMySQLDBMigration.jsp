<%@page import="java.io.*;"%>
 <%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%

request.setCharacterEncoding("UTF-8");
if(request.getParameter("results")=="")
{
}
else
{
 
}
		   

		   %>
		   <html xmlns="http://www.w3.org/1999/xhtml" xml:lang="te" lang="te">

<head>
<meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="bootstrap.min.css">
  <script src="bootstrap.min.js"> </script>
<!-- AJAX stands for Asynchronous Javascript and XML. It is required for JQuery-->
  <script src="jquery.min.js"></script>
</head>
<body>
<table class="table table-responsive"><tr><td><a href="AdminHomePage.jsp"><img src="home.png" width="50" height="50"/></a></td><td align="center">
 
		<h2> <font color="lightred">XML Based DB Migration - Admin Home Page</font></h2></td><td><a href="LoginXML.html"><img src="logout.png" width="50" height="50"/></a></td></tr></table>
<meta charset="utf-8">
<title></title>

<script language="javascript">
function stateChanged() 
{ 
	//document.getElementById("txt2").value ="";
	// document.getElementById("final_span").value ="";
if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
 { 
	
  var showdata = xmlHttp.responseText; 
    var strar = showdata.split(":");
	
	 if(strar.length==1)
	 {
		 	document.getElementById("final_span").focus();
		  alert("Please Give Voice Input");
		  //document.getElementById("txt2").value =" ";
	document.getElementById("final_span").value =" ";

	 }
	 else if(strar.length>1)
	 {
	var strname = strar[1];
	document.getElementById("final_span").value = strar[2];
	document.getElementById("txt2").value= showdata; 
	
/*var iframe = document.createElement('iframe');
iframe.width = "500";
iframe.height="400";
iframe.src = 'data:text/html;charset=utf-8,' + encodeURI(document.getElementById("txt2").value);
document.body.appendChild(iframe);*/
	 }
	
 }
}

function GetXmlHttpObject()
{
var xmlHttp=null;
try
 {
 // Firefox, Opera 8.0+, Safari
 xmlHttp=new XMLHttpRequest();
 }
catch (e)
 {
 //Internet Explorer
 try
  {
  xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
  }
 catch (e)
  {
  xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
 }
return xmlHttp;
}



function onChange(val) {
	
 xmlHttp=GetXmlHttpObject()
if (xmlHttp==null)
 {
 alert ("Browser does not support HTTP Request")
 return
 }
 if(val=="My SQL server"||val=="MySQL server"||val=="MySQL Server")
		{
	 var url="mysqltest.jsp"
	 alert("DB Migration Successful from SQLite to MySQL")
		}
 else if(val=="SQLite"||val=="sqlite"||val=="Sqlite"||val=="Sq Lite")
 var url="sqlitedatanew.jsp"


xmlHttp.onreadystatechange=stateChanged 
xmlHttp.open("GET",url,true)
xmlHttp.send(null)
	
	}
	

</script>

<table class="table table-responsive table-bordered">
<tr bgcolor="#aaee00">
            <td height="23" colspan="2" align="center"><b>XML Based Database Migration From SQLite to MySQL Server</b></td>
      </tr>
	  </table>
        
			


&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        
		<table class="table table-responsive table-bordered table-condensed">
		  <tr bgcolor="lightblue">
			<td align="center"><b>Source Database : </b><select id="source" onchange="onChange(this.value)">
			<option value="Select">----Select Source---</option>
			<option value="SQLite"> SQLite</option>
			
			</select></td>
			<td align="center"><b>Destination Database : </b><select id="dest" onchange="onChange(this.value)">
			<option value="Select">----Select Destination---</option>
			<option value="MySQL Server"> MySQLServer</option>
			
			</select></td>
		  </tr>
		  <tr><td align="center" colspan="2"><img src="xyz.jpg"/></td></tr>
		</table>
</body>

</html>
