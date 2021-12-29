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
        Document document = documentBuilder.parse("C:\\Program Files (x86)\\Apache Software Foundation\\Tomcat 7.0\\webapps\\ROOT\\mysqltabledata.xml");
        Element root = document.getDocumentElement();
			
            rs = st.executeQuery("select *from fac_details");
            Element rootElement = document.getDocumentElement();
			while(rs.next()){
            //rs.getString(1);
			 
       
		Element users = document.createElement("table");
           root.appendChild(users); 

            Element name1 = document.createElement("fielddata");
            name1.appendChild(document.createTextNode(rs.getString(1)));
            users.appendChild(name1);
            
			Element name2 = document.createElement("fielddata");
            name2.appendChild(document.createTextNode(rs.getString(2)));
            users.appendChild(name2);

			Element name3 = document.createElement("fielddata");
            name3.appendChild(document.createTextNode(rs.getString(3)));
            users.appendChild(name3);

			Element name4 = document.createElement("fielddata");
            name4.appendChild(document.createTextNode(rs.getString(4)));
            users.appendChild(name4);

			Element name5 = document.createElement("fielddata");
            name5.appendChild(document.createTextNode(rs.getString(5)));
            users.appendChild(name5);


			}
			 DOMSource source = new DOMSource(document);

        TransformerFactory transformerFactory = TransformerFactory.newInstance();
        Transformer transformer = transformerFactory.newTransformer();
        StreamResult result = new StreamResult("C:\\Program Files (x86)\\Apache Software Foundation\\Tomcat 7.0\\webapps\\ROOT\\mysqltabledata"
                + ".xml");
        transformer.transform(source, result);
 }catch(Exception ex){
ex.printStackTrace();
 }


    %>   