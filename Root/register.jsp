
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
else if (document.getElementById('course').value=="")
{
alert("Please enter Course Name...");
document.form1.course.focus();
return false;
//document.getElementById('in').getAttributeNode('class').value="correct";
}

else if (document.getElementById('dept').value=="")
{
alert("Please enter Department...");
document.form1.dept.focus();
return false;
//document.getElementById('in').getAttributeNode('class').value="correct";
}

else if (document.getElementById('secquestion').value=="---Select a Security Question---")
{
alert("Please Select a Security Question");
document.form1.secquestion.focus();
return false;
//document.getElementById('in').getAttributeNode('class').value="correct";
}
else if (document.getElementById('secanswer').value=="")
{
alert("Please Enter Security Answer");
document.form1.secanswer.focus();
return false;
//document.getElementById('in').getAttributeNode('class').value="correct";
}
return true;
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
	    if (password.match(/.[!,@,#,$,%,^,&,*,?,_,~,-,£,(,)]/))
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
<body>
<table width="104%" height="628" border="1">
<tr>
            <td height="23" colspan="1"><jsp:include page="SAHeader.jsp"/></td>
      </tr>
          <tr>
           
            <td width="738" valign="center">
<table width="1046" height="108" border="0" align="center">
  <tr>
    <td align="center" valign="top"><h1> </h1>
      <table width="813" border="0">
        <tr>
          <td align="center"><a href="loginhome.jsp" id="No CSS Style">Login</a></td>
        </tr>
      </table></td>
  </tr>
</table>

<form id="form1" name="form1" method="POST" action="studreg" onsubmit="return check();" >
	  <table width="70%" border="0" cellspacing="0" cellpadding="0" align="center" class="style17">
        <tr>
          <td height="46" colspan="3" align="center" bgcolor="lightblue"><font size=6><b>Student Registration&nbsp;</b></font></td>
        </tr>
        <tr>
          <td width="40%" height="36"><div align="right">
            <p>&nbsp;</p>
            <p>Username</p>
          </div></td>
          <td width="30%"><p>&nbsp;</p>
              <p>
                <input name="username" type="text" id="username" />
                
            </p></td><td><font color="blue"><b>Please Enter your Student ID as your username</b></font></td>
        </tr>
        <tr>
          <td><div align="right">password</div></td>
          <td><br />
              <input name="password" type="password" id="password"  /></td>
        </tr>
        <tr>
          <td height="30"><div align="right">name</div></td>
          <td><br />
              <input name="firstname" type="text" id="firstname" /></td>
        </tr>
        <tr>
          <td height="38"><div align="right">course&nbsp;</div></td>
          <td><br />
              <input name="course" type="text" id="course" /></td>
        </tr>
        <tr>
          <td><div align="right">Department&nbsp;</div></td>
          <td><br />
              <input name="dept" type="text" id="dept" /></td>
        </tr>
       
          <td><div align="right">Security Question&nbsp;</div></td>
          <td><br />
              <select name="secquestion" id="secquestion">
			  <option>---Select a Security Question---</option>
			  <option>Your Favorite Hobby?</option>
			  <option>Your Pet Name?</option>
			  <option>Your Best Friend's Name?</option>
			  <option>Your First School Name?</option>
			  </select>
			  </td>
        </tr>
		<tr>
          <td><div align="right">Security Answer&nbsp;</div></td>
          <td><br />
              <input name="secanswer" type="text" id="secanswer" /></td>
        </tr>
		<tr>
         
		
        <tr>
          <td><p>&nbsp;</p>
          <p>&nbsp;</p></td>
          <td><input type="submit" name="Submit" value="Register" style="width:60px" />          </td>
        </tr>
      </table>
</form>
</td>
</tr>
</table>
</body>
</html>
