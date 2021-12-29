<%@page import="java.io.*,org.w3c.dom.*,javax.xml.parsers.*,javax.xml.transform.*, javax.xml.transform.dom.*,javax.xml.transform.stream.*"%>  
<%@page import=" java.security.*"%>
<%@page import="javax.crypto.*"%>

<%!
public void createXml(String graph) throws Exception{
try{
	
%>
<!--<%
String name=request.getParameter("username");
String password=request.getParameter("password");
String firstname=request.getParameter("firstname");
String lastname=request.getParameter("lastname");
String address=request.getParameter("address");
String city=request.getParameter("city");
String state=request.getParameter("state");
String zipcode=request.getParameter("zipcode");
String phone=request.getParameter("telephone");
int ph=Integer.parseInt(phone);
%>-->
<%!


    String str="Sanjay";
    DocumentBuilderFactory builderFactory = DocumentBuilderFactory.newInstance();
    DocumentBuilder docBuilder = builderFactory.newDocumentBuilder();
    Document doc = docBuilder.newDocument();
    // questionset elements
    Element rootElement = doc.createElement("register");
    doc.appendChild(rootElement);
    // question elements
    Element user = doc.createElement("username");
    rootElement.appendChild(user);
	user.setTextContent(%><%=request.getParameter("username");%><%!);
	
    // set attribute to question element
    Attr attr = doc.createAttribute("category");
    attr.setValue("auth");
    user.setAttributeNode(attr);
 Element pass = doc.createElement("password");
    rootElement.appendChild(pass);
    pass.setTextContent(%><%=request.getParameter("password");%><%!);
    // set attribute to question element
    Attr attr1 = doc.createAttribute("category");
    attr1.setValue("credential");
    pass.setAttributeNode(attr1);
	Element fn = doc.createElement("firstname");
    rootElement.appendChild(fn);
	fn.setTextContent(%><%=request.getParameter("firstname");%><%!);
	Element ln = doc.createElement("lastname");
    rootElement.appendChild(ln);
	ln.setTextContent(%><%=request.getParameter("lastname");%><%!);
	Element address = doc.createElement("address");
    rootElement.appendChild(address);
	address.setTextContent(%><%=request.getParameter("address");%><%!);
	Element cty = doc.createElement("city");
    rootElement.appendChild(cty);
	cty.setTextContent(%><%=request.getParameter("city");%><%!);
	Element stt = doc.createElement("state");
    rootElement.appendChild(stt);
	stt.setTextContent(%><%=request.getParameter("state");%><%!);
	Element zc = doc.createElement("zipcode");
    rootElement.appendChild(zc);
	zc.setTextContent(%><%=request.getParameter("zipcode");%><%!);
	Element phn = doc.createElement("telephone");
    rootElement.appendChild(phn);
	phn.setTextContent(%><%=request.getParameter("telephone");%><%!);
    // write the content into xml file        

    TransformerFactory factory = TransformerFactory.newInstance();
    Transformer transformer = factory.newTransformer();

    transformer.setOutputProperty(OutputKeys.INDENT, "yes");

    StringWriter sw = new StringWriter();
    StreamResult result = new StreamResult(sw);
    DOMSource source = new DOMSource(doc);
    transformer.transform(source, result);
    String xmlString = sw.toString();

    File file=new File("C:\\Program Files\\Apache Software Foundation\\Tomcat 7.0\\webapps\\ROOT\\"+str+".xml");
    BufferedWriter bw = new BufferedWriter(new FileWriter(file));
    bw.write(xmlString);
    bw.flush();
    bw.close();
	out.println("<h2><b><font color="green">Registered Successfully</font></b></h2>");
}
catch(Exception e)
{
System.out.println(e);
}   
}
%>
<% 
String authentication=request.getParameter("auth");
createXml(authentication);
String credentials=request.getParameter("credential");
createXml(credentials);
%>