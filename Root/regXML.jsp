
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
<script type="text/javascript">
function check()
{
if (document.getElementById('username').value=="")
{
alert("Please enter Username...");
document.form1.username.focus();
return false;
//document.getElementById('in').getAttributeNode('class').value="correct";
}
else if (document.getElementById('password').value=="")
{
alert("Please Enter Password...");
document.form1.password.focus();
return false;
//document.getElementById('in').getAttributeNode('class').value="correct";
}
else if (document.getElementById('password').value.length<8)
{
alert("Please enter 8 Digit Password...");
document.form1.password.focus();
return false;
//document.getElementById('in').getAttributeNode('class').value="correct";
}
else if (document.getElementById('firstname').value=="")
{
alert("Please enter your Fistname...");
document.form1.firstname.focus();
return false;
//document.getElementById('in').getAttributeNode('class').value="correct";
}
else if (document.getElementById('lastname').value=="")
{
alert("Please enter lastname...");
document.form1.lastname.focus();
return false;
//document.getElementById('in').getAttributeNode('class').value="correct";
}

else if (document.getElementById('mail').value=="")
{
alert("Please enter address...");
document.form1.address.focus();
return false;
//document.getElementById('in').getAttributeNode('class').value="correct";
}
var x=document.forms["form1"]["mail"].value;
var atpos=x.indexOf("@");
var dotpos=x.lastIndexOf(".");
if (atpos<1 || dotpos<atpos+2 || dotpos+2>=x.length)
  {
  alert("Not a valid e-mail address");
	document.form1.mail.focus();

  return false;
  }
else if(document.getElementById('telephone').value=="")
	{
		alert ("Enter Telephone Number");
	document.form1.telephone.focus();
return false;
	}
else if (document.getElementById('telephone').value.length!="10")
{
alert("Enter valid phone number...");
document.form1.telephone.focus();
return false;
//document.getElementById('in').getAttributeNode('class').value="correct";
}


/* function CheckPassword(password)
	{
	    var strength = new Array();
	    strength[0] = "Blank";
	    strength[1] = "Very Weak";
	    strength[2] = "Weak";
	    strength[3] = "Medium";
	    strength[4] = "Strong";
	    strength[5] = "Very Strong";
 
	    var score = 1;
	 
	    if (password.length < 1)
	        return strength[0];
	 
	    if (password.length < 4)
	        return strength[1];
	 
	    if (password.length >= 8)
	        score++;
	    if (password.length >= 10)
	        score++;
	    if (password.match(/\d+/))
	        score++;
	    if (password.match(/[a-z]/) &&
	        password.match(/[A-Z]/))
	        score++;
	    if (password.match(/.[!,@,#,$,%,^,&,*,?,_,~,-,�,(,)]/))
	        score++;
	 
	    return strength[score];
	} */
</script>

<style type="text/css">
<!--
.style1 {color: #FF0000}
-->
</style>
</head>
<body bgcolor="white">
<table width="102%" height="628" border="1">
<tr>
            <td height="23" colspan="2"><jsp:include page="CandidateHeader.jsp"/></td>
      </tr>
          <tr>
            <td width="15%"  height="597"><jsp:include page="Adminmenu.jsp"/></td>
            <td width="85%" valign="top"><center>
<table width="1046" height="108" border="0" align="center">
  <tr>
    <td align="center" valign="top"><h1> </h1>
      <table width="813" border="0">
        <tr>
         
        </tr>
      </table></td>
  </tr>
</table>

<form id="form1" name="form1" method="post" action="AddXMLNode.jsp" onsubmit="return check();" >
	  <table width="70%" border="0" cellspacing="0" cellpadding="0" align="center" class="style17">
        <tr>
          <td height="46" colspan="2" align="center">&nbsp;</td>
        </tr>
        <tr>
          <td width="40%" height="36"><div align="right">
            <p>&nbsp;</p>
            <p>Username</p>
          </div></td>
          <td width="60%"><p>&nbsp;</p>
              <p>
                <input name="username" type="text" id="username" />
                
            </p></td>
        </tr>
        <tr>
          <td><div align="right">password</div></td>
          <td><br />
              <input name="password" type="password" id="password"  /></td>
        </tr>
        <tr>
          <td height="30"><div align="right">First Name</div></td>
          <td><br />
              <input name="firstname" type="text" id="firstname" /></td>
        </tr>
        
        <tr>
          <td><div align="right">Last Name&nbsp;</div></td>
          <td><br />
              <input name="lastname" type="text" id="lastname" /></td>
        </tr>
        <tr>
          <td><div align="right">E-mail&nbsp;</div></td>
          <td><br />
              <input name="mail" type="text" id="mail" /></td>
        </tr>
		 <tr>
          <td><div align="right">Contact&nbsp;</div></td>
          <td><br />
              <input name="telephone" type="text" id="telephone" /></td>
        </tr>
        
        
        <tr>
          <td><p>&nbsp;</p>
          <p>&nbsp;</p></td>
          <td><input type="submit" name="Submit" value="Register" style="width:60px" />          </td>
        </tr>
      </table>
	  </td>
	  </tr>
	  </table>
</form>
</body>
</html>
