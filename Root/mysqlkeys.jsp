 <%@ page contentType="text/html;charset=UTF-8" language="java" %>
   <%@ page import="java.sql.*,java.util.Date"%>
   <%@ page import="javax.xml.parsers.DocumentBuilderFactory,javax.xml.parsers.DocumentBuilder,org.w3c.dom.*,javax.xml.parsers.*,javax.xml.transform.*, javax.xml.transform.dom.*,javax.xml.transform.stream.*,java.util.*"%>
 <%
 try {
            Class.forName("com.mysql.jdbc.Driver");
			Connection con = null,con1=null;
			Statement st=null;
			ResultSet rs,rs1=null;
			
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/user_details","root","asdf");
			
            st = con.createStatement();
			//st1 = con1.createStatement();
			 DocumentBuilderFactory documentBuilderFactory = DocumentBuilderFactory.newInstance();
        DocumentBuilder documentBuilder = documentBuilderFactory.newDocumentBuilder();
        Document document = documentBuilder.parse("C:\\Program Files (x86)\\Apache Software Foundation\\Tomcat 7.0\\webapps\\ROOT\\mysqlkeys.xml");
        Element root = document.getDocumentElement();
			
            rs = st.executeQuery("select table_name from information_schema.tables where table_type='base table' and table_schema='user_details'");
            Element rootElement = document.getDocumentElement();
			while(rs.next()){
            //rs.getString(1);
			 //ResultSet rsColumns = null;
    DatabaseMetaData meta = con.getMetaData();
   /* rsColumns = meta.getColumns(null, null, rs.getString(1), null);
    while (rsColumns.next()) {
         

Element rows = document.createElement("Row");
           root.appendChild(rows); 

            Element name = document.createElement("Table");
            name.appendChild(document.createTextNode(rsColumns.getString(3)));
            rows.appendChild(name);

			Element col_name = document.createElement("ColumnName");
            col_name.appendChild(document.createTextNode(rsColumns.getString("COLUMN_NAME")));
            rows.appendChild(col_name);

			Element col_type = document.createElement("ColumnType");
            col_type.appendChild(document.createTextNode(rsColumns.getString("TYPE_NAME")));
            rows.appendChild(col_type);
                  
			Element col_length = document.createElement("ColumnLength");
            col_length.appendChild(document.createTextNode(rsColumns.getString(7)));
            rows.appendChild(col_length);


	}*/


   ResultSet result = meta.getPrimaryKeys(
    null, null, rs.getString(1));

while(result.next()){
    String columnName = result.getString(4);
   // System.out.println(columnName);
 Element row = document.createElement("Key");
           root.appendChild(row); 
          Element primary_key = document.createElement("PrimaryKey");
            primary_key.appendChild(document.createTextNode(columnName));
            row.appendChild(primary_key);
           
		


            }
			}



			
			 DOMSource source = new DOMSource(document);

        TransformerFactory transformerFactory = TransformerFactory.newInstance();
        Transformer transformer = transformerFactory.newTransformer();
        StreamResult result = new StreamResult("C:\\Program Files (x86)\\Apache Software Foundation\\Tomcat 7.0\\webapps\\ROOT\\mysqlkeys"
                + ".xml");
        transformer.transform(source, result);
 }catch(Exception ex){
ex.printStackTrace();
 }


    %>   