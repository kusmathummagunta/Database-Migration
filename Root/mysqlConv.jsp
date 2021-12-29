 <%@ page contentType="text/html;charset=UTF-8" language="java" %>
   <%@ page import="java.sql.*,java.util.Date"%>
   <%@ page import="javax.xml.parsers.DocumentBuilderFactory,javax.xml.parsers.DocumentBuilder,org.w3c.dom.*,javax.xml.parsers.*,javax.xml.transform.*, javax.xml.transform.dom.*,javax.xml.transform.stream.*,java.util.*"%>
 <%
 try {
            Class.forName("com.mysql.jdbc.Driver");
			Connection con = null,con1=null;
			Statement st=null;
			ResultSet rs=null;
			
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/user_details","root","asdf");
			
            st = con.createStatement();
			//st1 = con1.createStatement();
			 DocumentBuilderFactory documentBuilderFactory = DocumentBuilderFactory.newInstance();
        DocumentBuilder documentBuilder = documentBuilderFactory.newDocumentBuilder();
        Document document = documentBuilder.parse("C:\\Program Files (x86)\\Apache Software Foundation\\Tomcat 7.0\\webapps\\ROOT\\mysqltables.xml");
        Element root = document.getDocumentElement();
			
            rs = st.executeQuery("select table_name from information_schema.tables where table_type='base table' and table_schema='user_details'");
            Element rootElement = document.getDocumentElement();
			while(rs.next()){
            //rs.getString(1);
			 
       
		Element users = document.createElement("tables");
           root.appendChild(users); 

            Element name = document.createElement("table");
            name.appendChild(document.createTextNode(rs.getString(1)));
            users.appendChild(name);
          




			}
			 DOMSource source = new DOMSource(document);

        TransformerFactory transformerFactory = TransformerFactory.newInstance();
        Transformer transformer = transformerFactory.newTransformer();
        StreamResult result = new StreamResult("C:\\Program Files (x86)\\Apache Software Foundation\\Tomcat 7.0\\webapps\\ROOT\\mysqltables"
                + ".xml");
        transformer.transform(source, result);
 }catch(Exception ex){
ex.printStackTrace();
 }


    %>   