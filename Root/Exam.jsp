<%@ page contentType="text/html"%>
<%@ page import="javax.xml.parsers.DocumentBuilderFactory,javax.xml.parsers.DocumentBuilder,org.w3c.dom.*,java.util.Random,java.util.concurrent.ThreadLocalRandom,javax.xml.transform.*,javax.xml.transform.stream.*,javax.xml.transform.dom.*,org.w3c.dom.*"
%>
<html>
<head>
<meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="bootstrap.min.css">
  <script src="bootstrap.min.js"> </script>
<!-- AJAX stands for Asynchronous Javascript and XML. It is required for JQuery-->
  <script src="jquery.min.js"></script>
  		 <script type="text/javascript" language="javascript">
           // javascript:window.history.forward(1);
			//function noBack(){
				window.history.forward(-1);
			//}
            
    </script>
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
</head>
<body bgcolor="#FFFFFF">

<form name="cd" id="cd" method="post" action="result.jsp" onsubmit="return confirm('Do you really want to Submit the Exam Permanently?');">

<center><input id="disp" readonly="true" type="text" value="3:00" border="0" name="disp" style="font-face: 'Comic Sans MS'; font-size: 50; color: Red ; background-color: #FFFFFF; border: 0pt"></center>
<%

if(session.getAttribute("check")==null){
response.sendRedirect("ExamIndex.jsp");
}else {
 
   
%>
<div class="container-fuild">
<table class="table table-responsive">

<%
String uname= request.getParameter("uid");
String pwd= request.getParameter("pwd");
session.setAttribute("usernam",uname);
int i=0,j=0,h=0;
        
		DocumentBuilderFactory dbfu = DocumentBuilderFactory.newInstance();
		DocumentBuilder dbu = dbfu.newDocumentBuilder();
		Document docu = dbu.parse("webapps\\ROOT\\users.xml");
		NodeList nlu= docu.getElementsByTagName("username");
		NodeList nup= docu.getElementsByTagName("password");

		for(int k=0;k<nlu.getLength();k++)
        {
           if(nlu.item(k).getFirstChild().getNodeValue().equals(uname)&&nup.item(k).getFirstChild().getNodeValue().equals(pwd)){
				h++;
			}
        }
        if(h==0){%>
			<script>document.getElementById("disp").style.visibility = "hidden";</script> 
		<%response.setContentType("text/html");
				out.println("<center><font color='red'><h2>Invalid Username or Password. Please Contact Admin!!!!!!</h2></font></center>");
		}else{
		DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
		DocumentBuilder db = dbf.newDocumentBuilder();
		Document doc = db.parse("webapps\\ROOT\\question.xml");

	    DocumentBuilderFactory documentBuilderFactoryt = DocumentBuilderFactory.newInstance();
        DocumentBuilder documentBuildert = documentBuilderFactoryt.newDocumentBuilder();
        Document tdocument = documentBuildert.parse("webapps\\ROOT\\temp.xml");
        
        NodeList nlt= tdocument.getElementsByTagName("user");
		NodeList nft= tdocument.getElementsByTagName("flag");
        for(int k=0;k<nlt.getLength();k++)
        {
           
            if(nlt.item(k).getFirstChild().getNodeValue().equals(uname)&&nft.item(k).getFirstChild().getNodeValue().equals("Y")){
                
                i++;%>
				<script>document.getElementById("disp").style.visibility = "hidden";</script> 
           <% }
		   else if(nlt.item(k).getFirstChild().getNodeValue().equals(uname)&&nft.item(k).getFirstChild().getNodeValue().equals("N")){

				i=2;
				}
        }
		 if(i==1){
			response.setContentType("text/html");
				out.println("<center><font color='red'><h2>You Have Already Taken the Examination. Please Contact Admin!!!!!!</h2></font></center>");
		 }
		 else if(i==2){
		 
		 NodeList nq= tdocument.getElementsByTagName("ques");
		 NodeList n1= tdocument.getElementsByTagName("op1");
		 NodeList n2= tdocument.getElementsByTagName("op2");
		 NodeList n3= tdocument.getElementsByTagName("op3");
		 NodeList n4= tdocument.getElementsByTagName("op4");
		 NodeList ns= tdocument.getElementsByTagName("sno");
		 NodeList na= tdocument.getElementsByTagName("ans");
		 NodeList nu= tdocument.getElementsByTagName("user");
		 NodeList nyua= tdocument.getElementsByTagName("youranswer");
        
		 for(int k=0;k<nq.getLength();k++){
			if(nu.item(k).getFirstChild().getNodeValue().equals(uname)){

		 %>

<tr>
<td width="5%"><b><%=j+1%></b></td>
<td bgcolor="lightblue"><b><%= nq.item(k).getFirstChild().getNodeValue() %></b></td>
</tr>
<tr>
<td></td>
<td><input type="radio" value='<%= n1.item(k).getFirstChild().getNodeValue() %>' name="radio<%=k%>" id="radio<%=k%>" onclick="radio_value<%=k%>()" <%if(nyua.item(k).getFirstChild().getNodeValue().equals(n1.item(k).getFirstChild().getNodeValue())){%> checked="checked"<%}%>/> <%= n1.item(k).getFirstChild().getNodeValue() %> </td>
</tr>
<tr>
<td></td>
<td><input type="radio" value='<%= n2.item(k).getFirstChild().getNodeValue() %>' name="radio<%=k%>" id="radio<%=k%>" onclick="radio_value<%=k%>()" <%if(nyua.item(k).getFirstChild().getNodeValue().equals(n2.item(k).getFirstChild().getNodeValue())){%> checked="checked"<%}%>/> <%= n2.item(k).getFirstChild().getNodeValue() %></td>
</tr>
<tr>
<td></td>
<td><input type="radio" value='<%= n3.item(k).getFirstChild().getNodeValue() %>' name="radio<%=k%>" id="radio<%=k%>" onclick="radio_value<%=k%>()" <%if(nyua.item(k).getFirstChild().getNodeValue().equals(n3.item(k).getFirstChild().getNodeValue())){%> checked="checked"<%}%>/><%= n3.item(k).getFirstChild().getNodeValue() %> </td>
</tr>
<tr>
<td></td>
<td><input type="radio" value='<%= n4.item(k).getFirstChild().getNodeValue() %>' name="radio<%=k%>" id="radio<%=k%>" onclick="radio_value<%=k%>()" <%if(nyua.item(k).getFirstChild().getNodeValue().equals(n4.item(k).getFirstChild().getNodeValue())){%> checked="checked"<%}%>/><%= n4.item(k).getFirstChild().getNodeValue() %> </td>
</tr>
<script type="text/javascript">
function radio_value<%=k%>() {

if(document.cd.radio<%=k%>[0].checked){
//document.getElementById("txt_choice<%=i%>").value = document.cd.radio<%=i%>[0].value;
onChangea(document.cd.radio<%=k%>[0].value); 
function onChangea(val) {
   

 xmlHttp=GetXmlHttpObject()
if (xmlHttp==null)
 {
 alert ("Browser does not support HTTP Request")
 return
 }
var url="http://192.168.43.3:8088/update_answer.jsp"
url=url+"?inp="+val+"&&slno=<%=ns.item(k).getFirstChild().getNodeValue()%>&&uid=<%=uname%>"

xmlHttp.open("GET",url,true)
xmlHttp.send(null)

//openUrl(url);

	
}
}
if(document.cd.radio<%=k%>[1].checked){
//document.getElementById("txt_choice<%=i%>").value = document.cd.radio<%=i%>[1].value; 
 onChangeb(document.cd.radio<%=k%>[1].value); 
function onChangeb(val) {
   

 xmlHttp=GetXmlHttpObject()
if (xmlHttp==null)
 {
 alert ("Browser does not support HTTP Request")
 return
 }
var url="http://192.168.43.3:8088/update_answer.jsp"
url=url+"?inp="+val+"&&slno=<%=ns.item(k).getFirstChild().getNodeValue()%>&&uid=<%=uname%>"

xmlHttp.open("GET",url,true)
xmlHttp.send(null)

//openUrl(url);

	
}
}
if(document.cd.radio<%=k%>[2].checked){
//document.getElementById("txt_choice<%=i%>").value = document.cd.radio<%=i%>[2].value; 
onChangec(document.cd.radio<%=k%>[2].value); 
function onChangec(val) {
   

 xmlHttp=GetXmlHttpObject()
if (xmlHttp==null)
 {
 alert ("Browser does not support HTTP Request")
 return
 }
var url="http://192.168.43.3:8088/update_answer.jsp"
url=url+"?inp="+val+"&&slno=<%=ns.item(k).getFirstChild().getNodeValue()%>&&uid=<%=uname%>"

xmlHttp.open("GET",url,true)
xmlHttp.send(null)

//openUrl(url);

	
}
}
if(document.cd.radio<%=k%>[3].checked){
//document.getElementById("txt_choice<%=i%>").value = document.cd.radio<%=i%>[3].value;
onChanged(document.cd.radio<%=k%>[3].value); 
function onChanged(val) {
   

 xmlHttp=GetXmlHttpObject()
if (xmlHttp==null)
 {
 alert ("Browser does not support HTTP Request")
 return
 }
var url="http://192.168.43.3:8088/update_answer.jsp"
url=url+"?inp="+val+"&&slno=<%=ns.item(k).getFirstChild().getNodeValue()%>&&uid=<%=uname%>"

xmlHttp.open("GET",url,true)
xmlHttp.send(null)

//openUrl(url);

	
}
}
//onChange(document.getElementById("txt_choice<%=i%>").value); 

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


</script>
<%j++;}}%>
<tr>
<td></td>
<td align="center"><input type="submit" Value="Submit" style="font-face: 'Comic Sans MS'; font-size: larger; color: white ; background-color: #FF0000; border: 3pt ridge lightgrey"/></td>
</tr>
</table>
<%}%>
</div>
<%

if(i==0){

NodeList nq= doc.getElementsByTagName("ques");
NodeList n1= doc.getElementsByTagName("op1");
NodeList n2= doc.getElementsByTagName("op2");
NodeList n3= doc.getElementsByTagName("op3");
NodeList n4= doc.getElementsByTagName("op4");
NodeList ns= doc.getElementsByTagName("sno");
NodeList na= doc.getElementsByTagName("ans");


%>



<% for(int k=0;k<nq.getLength()-40;k++){
	int index = ThreadLocalRandom.current().nextInt(nq.getLength());	
			Element rootElement = tdocument.getDocumentElement();
			Element trow = tdocument.createElement("Row");
            rootElement.appendChild(trow);

            Element q = tdocument.createElement("ques");
            q.appendChild(tdocument.createTextNode(nq.item(index).getFirstChild().getNodeValue()));
            trow.appendChild(q);

            Element o1 = tdocument.createElement("op1");
            o1.appendChild(tdocument.createTextNode(n1.item(index).getFirstChild().getNodeValue()));
            trow.appendChild(o1);

			Element o2 = tdocument.createElement("op2");
            o2.appendChild(tdocument.createTextNode(n2.item(index).getFirstChild().getNodeValue()));
            trow.appendChild(o2);

			Element o3 = tdocument.createElement("op3");
            o3.appendChild(tdocument.createTextNode(n3.item(index).getFirstChild().getNodeValue()));
            trow.appendChild(o3);

			Element o4 = tdocument.createElement("op4");
            o4.appendChild(tdocument.createTextNode(n4.item(index).getFirstChild().getNodeValue()));
            trow.appendChild(o4);

			Element a = tdocument.createElement("ans");
            a.appendChild(tdocument.createTextNode(na.item(index).getFirstChild().getNodeValue()));
            trow.appendChild(a);
            
			Element s = tdocument.createElement("sno");
            s.appendChild(tdocument.createTextNode(ns.item(index).getFirstChild().getNodeValue()));
            trow.appendChild(s);

			Element u = tdocument.createElement("user");
            u.appendChild(tdocument.createTextNode(uname));
            trow.appendChild(u);

			Element ya = tdocument.createElement("youranswer");
            ya.appendChild(tdocument.createTextNode(" "));
            trow.appendChild(ya);

			Element f = tdocument.createElement("flag");
            f.appendChild(tdocument.createTextNode("N"));
            trow.appendChild(f);
			
			Element c = tdocument.createElement("count");
            c.appendChild(tdocument.createTextNode(" "));
            trow.appendChild(c);

			Element tv = tdocument.createElement("timervalue");
            tv.appendChild(tdocument.createTextNode(" "));
            trow.appendChild(tv);

			DOMSource tsource = new DOMSource(tdocument);

        TransformerFactory transformerFactoryt = TransformerFactory.newInstance();
        Transformer transformert = transformerFactoryt.newTransformer();
        StreamResult tresult = new StreamResult("webapps\\ROOT\\temp"
                + ".xml");
        transformert.transform(tsource, tresult);
                      
            

%>

<tr>
<td width="5%"><b><%=k+1%></b></td>
<td bgcolor="lightblue"><b><%= nq.item(index).getFirstChild().getNodeValue() %></b></td>
</tr>
<tr>
<td></td>
<td><input type="radio" value='<%= n1.item(index).getFirstChild().getNodeValue() %>' name="radio<%=k%>" id="radio<%=k%>" onclick="radio_value<%=k%>()"/> <%= n1.item(index).getFirstChild().getNodeValue() %> </td>
</tr>
<tr>
<td></td>
<td><input type="radio" value='<%= n2.item(index).getFirstChild().getNodeValue() %>' name="radio<%=k%>" id="radio<%=k%>" onclick="radio_value<%=k%>()"/> <%= n2.item(index).getFirstChild().getNodeValue() %></td>
</tr>
<tr>
<td></td>
<td><input type="radio" value='<%= n3.item(index).getFirstChild().getNodeValue() %>' name="radio<%=k%>" id="radio<%=k%>" onclick="radio_value<%=k%>()"/><%= n3.item(index).getFirstChild().getNodeValue() %> </td>
</tr>
<tr>
<td></td>
<td><input type="radio" value='<%= n4.item(index).getFirstChild().getNodeValue() %>' name="radio<%=k%>" id="radio<%=k%>" onclick="radio_value<%=k%>()"/><%= n4.item(index).getFirstChild().getNodeValue() %> </td>
</tr>
<script type="text/javascript">
function radio_value<%=k%>() {

if(document.cd.radio<%=k%>[0].checked){
//document.getElementById("txt_choice<%=i%>").value = document.cd.radio<%=i%>[0].value;
onChangea(document.cd.radio<%=k%>[0].value); 
function onChangea(val) {
   

 xmlHttp=GetXmlHttpObject()
if (xmlHttp==null)
 {
 alert ("Browser does not support HTTP Request")
 return
 }
var url="http://192.168.43.3:8088/update_answer.jsp"
url=url+"?inp="+val+"&&slno=<%=ns.item(index).getFirstChild().getNodeValue()%>&&uid=<%=uname%>"

xmlHttp.open("GET",url,true)
xmlHttp.send(null)

//openUrl(url);

	
}
}
if(document.cd.radio<%=k%>[1].checked){
//document.getElementById("txt_choice<%=i%>").value = document.cd.radio<%=i%>[1].value; 
 onChangeb(document.cd.radio<%=k%>[1].value); 
function onChangeb(val) {
   

 xmlHttp=GetXmlHttpObject()
if (xmlHttp==null)
 {
 alert ("Browser does not support HTTP Request")
 return
 }
var url="http://192.168.43.3:8088/update_answer.jsp"
url=url+"?inp="+val+"&&slno=<%=ns.item(index).getFirstChild().getNodeValue()%>&&uid=<%=uname%>"

xmlHttp.open("GET",url,true)
xmlHttp.send(null)

//openUrl(url);

	
}
}
if(document.cd.radio<%=k%>[2].checked){
//document.getElementById("txt_choice<%=i%>").value = document.cd.radio<%=i%>[2].value; 
onChangec(document.cd.radio<%=k%>[2].value); 
function onChangec(val) {
   

 xmlHttp=GetXmlHttpObject()
if (xmlHttp==null)
 {
 alert ("Browser does not support HTTP Request")
 return
 }
var url="http://192.168.43.3:8088/update_answer.jsp"
url=url+"?inp="+val+"&&slno=<%=ns.item(index).getFirstChild().getNodeValue()%>&&uid=<%=uname%>"

xmlHttp.open("GET",url,true)
xmlHttp.send(null)

//openUrl(url);

	
}
}
if(document.cd.radio<%=k%>[3].checked){
//document.getElementById("txt_choice<%=i%>").value = document.cd.radio<%=i%>[3].value;
onChanged(document.cd.radio<%=k%>[3].value); 
function onChanged(val) {
   

 xmlHttp=GetXmlHttpObject()
if (xmlHttp==null)
 {
 alert ("Browser does not support HTTP Request")
 return
 }
var url="http://192.168.43.3:8088/update_answer.jsp"
url=url+"?inp="+val+"&&slno=<%=ns.item(index).getFirstChild().getNodeValue()%>&&uid=<%=uname%>"

xmlHttp.open("GET",url,true)
xmlHttp.send(null)

//openUrl(url);

	
}
}
//onChange(document.getElementById("txt_choice<%=i%>").value); 

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


</script>
<%}%>
<tr>
<td></td>
<td align="center"><input type="submit" Value="Submit" style="font-face: 'Comic Sans MS'; font-size: larger; color: white ; background-color: #FF0000; border: 3pt ridge lightgrey"/></td>
</tr>
</table>
<%}}%>
</div>

<script type="text/javascript" language="javascript">
var mins
var secs;


function cd() {

<%      String tim = null;
		int t = 0;
		DocumentBuilderFactory documentBuilderFactoryt = DocumentBuilderFactory.newInstance();
        DocumentBuilder documentBuildert = documentBuilderFactoryt.newDocumentBuilder();
        Document tdocument = documentBuildert.parse("webapps\\ROOT\\temp.xml");
        
        NodeList nlt= tdocument.getElementsByTagName("user");
		NodeList nft= tdocument.getElementsByTagName("flag");
		NodeList ntt= tdocument.getElementsByTagName("timervalue");
        for(int k=0;k<nlt.getLength();k++)
        {
           
            if(nlt.item(k).getFirstChild().getNodeValue().equals(uname)&&nft.item(k).getFirstChild().getNodeValue().equals("N")&&ntt.item(k).getFirstChild().getNodeValue().equals(" ")){
            tim = "40";
			
			}
			else{
				tim = ntt.item(k).getFirstChild().getNodeValue() ;
							}
							}
		%>

    mins = <%=tim%> * m("1"); // change minutes here
    secs = 0 + s(":01"); // change seconds here (always add an additional second to your total)
    redo();
}

function m(obj) {
    for(var i = 0; i < obj.length; i++) {
        if(obj.substring(i, i + 1) == ":")
        break;
    }
    return(obj.substring(0, i));
}

function s(obj) {
    for(var i = 0; i < obj.length; i++) {
        if(obj.substring(i, i + 1) == ":")
        break;
    }
    return(obj.substring(i + 1, obj.length));
}

function dis(mins,secs) {
    var disp;
    if(mins <= 9) {
        disp = " 0";
    } else {
        disp = " ";
    }
    disp += mins + ":";
    if(secs <= 9) {
        disp += "0" + secs;
    } else {
        disp += secs;
    }
    return(disp);

}

function redo() {
    secs--;
    if(secs == -1) {
        secs = 59;
        mins--;
    }
    document.cd.disp.value = dis(mins,secs); 
	window.onbeforeunload = WindowClose; 
    
	function WindowClose() { 

  localStorage.setItem("minits", mins);
localStorage.setItem("sec", secs);
document.getElementById("timr").value = localStorage.getItem("minits");
xmlHttp=GetXmlHttpObject()
if (xmlHttp==null)
 {
 alert ("Browser does not support HTTP Request")
 return
 }
var url="http://192.168.43.3:8088/update_timer.jsp"
url=url+"?minut="+localStorage.getItem("minits")+"&&uid=<%=session.getAttribute("usernam").toString()%>"

xmlHttp.open("GET",url,true)
xmlHttp.send(null)

}

	
    if((mins == 0) && (secs == 0)) {
      
		document.cd.submit();
		
	} else {
        cd = setTimeout("redo()",1000);
    }
}

function init() {
  cd();
}
window.onload = init;
function disableForm() {
	var inputs = document.getElementsByTagName("input");

    for (var i = 0; i < inputs.length; i++) {
    	if(inputs[i].type!="submit"&&inputs[i].value==null){
		inputs[i].disabled = true;
		}
    }
   }
</script>
<input type="hidden" id="timr"/>
<%}%>
</form>
</body>
</html>

