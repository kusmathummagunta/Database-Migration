<%@page import="java.io.*,org.w3c.dom.*,javax.xml.parsers.*,javax.xml.transform.*, javax.xml.transform.dom.*,javax.xml.transform.stream.*"%>  

  <%!
        public void createXmlTree(Document doc,String username,String password,String firstname,String lastname,String address,String city,String state,String zipcode,String phone) throws Exception {
        System.out.println(username);
        Element root = doc.createElement("Register");
        doc.appendChild(root);
       
        Element child1 = doc.createElement("username");
        root.appendChild(child1);

        Text text1 = doc.createTextNode(username);
        child1.appendChild(text1);

        Element child2 = doc.createElement("password");
        root.appendChild(child2);

        Text text2 = doc.createTextNode(password);
        child2.appendChild(text2);

        Element child3 = doc.createElement("firstname");
        root.appendChild(child3);

        Text text3 = doc.createTextNode(firstname);
        child3.appendChild(text3);

        Element child4 = doc.createElement("lastname");
        root.appendChild(child4);

        Text text4 = doc.createTextNode(lastname);
        child4.appendChild(text4);

		Element child5 = doc.createElement("address");
        root.appendChild(child5);

        Text text5 = doc.createTextNode(address);
        child5.appendChild(text5);

		Element child6 = doc.createElement("city");
        root.appendChild(child6);

        Text text6 = doc.createTextNode(city);
        child6.appendChild(text6);

		Element child7 = doc.createElement("state");
        root.appendChild(child7);

        Text text7 = doc.createTextNode(state);
        child7.appendChild(text7);

		Element child8 = doc.createElement("zipcode");
        root.appendChild(child8);

        Text text8 = doc.createTextNode(zipcode);
        child8.appendChild(text8);

		Element child9 = doc.createElement("Phone");
        root.appendChild(child9);

        Text text9 = doc.createTextNode(phone);
        child9.appendChild(text9);

        TransformerFactory factory = TransformerFactory.newInstance();
        Transformer transformer = factory.newTransformer();

        transformer.setOutputProperty(OutputKeys.INDENT, "yes");

        StringWriter sw = new StringWriter();
        StreamResult result = new StreamResult(sw);
        DOMSource source = new DOMSource(doc);
        transformer.transform(source, result);
        String xmlString = sw.toString();

        File file = new File("C:\\Program Files\\Apache Software Foundation\\Tomcat 7.0\\webapps\\ROOT\\register.xml");
        BufferedWriter bw = new BufferedWriter(new FileWriter(file));
        bw.write(xmlString);
        bw.flush();
        bw.close();

    }%>
<%
     String name=request.getParameter("username");
String password=request.getParameter("password");
String firstname=request.getParameter("firstname");
String lastname=request.getParameter("lastname");
String address=request.getParameter("address");
String city=request.getParameter("city");
String state=request.getParameter("state");
String zipcode=request.getParameter("zipcode");
String phone=request.getParameter("telephone");
//int ph=Integer.parseInt(phone);
  try{
      System.out.println(name);
      DocumentBuilderFactory builderFactory = DocumentBuilderFactory.newInstance();
      DocumentBuilder docBuilder = builderFactory.newDocumentBuilder();
      //Document doc = docBuilder.newDocument();
	  Document doc = docBuilder.parse(new File("C:\\Program Files\\Apache Software Foundation\\Tomcat 7.0\\webapps\\ROOT\\register.xml"));
      createXmlTree(doc,name,password,firstname,lastname,address,city,state,zipcode,phone);

      out.println("<h2><center><font color='green'><b>Registration Successfull</b></font></center></h2>");
  }
  catch(Exception e)
  {
    System.out.println(e);
  }     
  %>