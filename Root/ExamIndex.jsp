<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome to Online Examination</title>
 <!--<script type="text/javascript" language="javascript">
            javascript:window.history.forward(1);
            
    </script>-->
 <style type="text/css">

#footer{
    float:center;
    position:fixed;
    bottom:0;
}
</style>
	<SCRIPT LANGUAGE="JavaScript">
 
    function ieClicked() {
        if (document.all) {
            return false;
        }
    }
    function firefoxClicked(e) {
        if(document.layers||(document.getElementById&&!document.all)) {
            if (e.which==2||e.which==3) {
                return false;
            }
        }
    }
    if (document.layers){
        document.captureEvents(Event.MOUSEDOWN);
        document.onmousedown=firefoxClicked;
    }else{
        document.onmouseup=firefoxClicked;
        document.oncontextmenu=ieClicked;
    }
    document.oncontextmenu=new Function("return false")
 
</script>
	<script type="text/javascript">
  function opennew(url) {
	 var win= window.open(url+"?uid="+document.getElementById("txt_user").value+"&&pwd="+document.getElementById("txt_pwd").value, '','scrollbars=no,menubar=no,resizable=no,toolbar=no,location=no,status=no,titlebar=0,directories=0,addressbar=0');
	  win.moveTo(0,0);
	  win.resizeTo(screen.width,screen.height);
	  document.index.submit();
	  <%session.setAttribute("check","login");%>
	
		document.close();
      }  
	  </script>
	
	    </head>

    <body bgcolor="lightblue">
        <form name="index" method="post" onsubmit="opennew('http://192.168.43.3:8088/Exam.jsp');">
        <center><h1><span><font color="red">Welcome to Online Examination System</font></span></h1>
        <br>
        <h2><u><span><font color="blue">Instructions to the Candidates</font></span></u></h2>
        <br><h3><ol><li>Fill the correct username and Password.</li>
        <br><li>This Exam has 50 Questions. Maximum Marks : 100 </li>
        <br><li>Read the questions carefully.</li>
        <br><li>No negative marking.</li>
	<br><li>Never press Enter Button once you start the exam. It will immediately submit the Exam.</li>
        <br><li>Please Submit only after completing the Examination.</li>
		<br><li>You will be given 40 Minutes Time. After that the result will be automatically displayed even without submitting the exam using Submit Button.</li></ol></h3>
      
        <br>
        <b>Enter your username :</b>
        <input type="text" name="txt_user" id="txt_user"><br>
        <b>Enter your Password :</b>
        <input type="password" name="txt_pwd" id="txt_pwd"><br><br>
        <input name ="submit" value="Submit" type="submit" onclick="closeWindows();"/>
        </center>
        </form>
    </body>
<div id="footer" align="center">
<!--<center><footer>
<table border=0 align="center"><tr><td>
<center><font color="blue"><b>RTTC, Hyderabad - Online Examination System. Designed and Developed by K.V.S.Sanjay Kumar, JTO(Computers),RTTC,Hyd.</b></font></center></td></tr></table>
</footer></center>-->
</div>
</html>
