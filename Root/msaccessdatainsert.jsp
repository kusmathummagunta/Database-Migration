 <%@ page contentType="text/html;charset=UTF-8" language="java" %>
   <%@ page import="java.sql.*,java.util.Date,java.io.File"%>
   <%@ page import="javax.xml.parsers.DocumentBuilderFactory,javax.xml.parsers.DocumentBuilder,org.w3c.dom.*,javax.xml.parsers.*,javax.xml.transform.*, javax.xml.transform.dom.*,javax.xml.transform.stream.*,java.util.*"%>
 <%
 try {

            File f = new File("C:\\Program Files\\Apache Software Foundation\\Tomcat 7.0\\webapps\\ROOT\\mysqldata.xml");
			if(!f.exists())
			f.createNewFile();
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = null,con1=null;
			Statement st,st1,st2=null;
			ResultSet rs,rs1,rsColumns,rsMeta=null;
			ResultSetMetaData rsMetaData=null;
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/user_details","root","asdf");
			
            st = con.createStatement();
			st1= con.createStatement();
			st2= con.createStatement();
			Element rows;
			//st1 = con1.createStatement();
			 DocumentBuilderFactory documentBuilderFactory = DocumentBuilderFactory.newInstance();
        DocumentBuilder documentBuilder = documentBuilderFactory.newDocumentBuilder();
        Document document = documentBuilder.newDocument();
        Element root = document.createElement("Tables");
		document.appendChild(root);
			
            rs = st.executeQuery("select table_name from information_schema.tables where table_type='base table' and table_schema='user_details'");
            Element rootElement = document.getDocumentElement();
			while(rs.next()){
            //rs.getString(1);
			 rsColumns = null;
    DatabaseMetaData meta = con.getMetaData();
    rsMeta = meta.getColumns(null, null, rs.getString(1), null);
    rsColumns = st2.executeQuery("select *from "+rs.getString(1));
	rsMetaData = rsColumns.getMetaData();
	rows = document.createElement(rs.getString(1));
           root.appendChild(rows);
	 
for(int i=1;i<=rsMetaData.getColumnCount();i++){
          rsMeta.next();	
	rs1 = st1.executeQuery("select *from "+rs.getString(1));

   
    while (rs1.next()) {

            

            Element name = document.createElement(rsMeta.getString("COLUMN_NAME"));
            name.appendChild(document.createTextNode(rs1.getString(i)));
            rows.appendChild(name);

			Element datatype = document.createElement("DataType");
			datatype.appendChild(document.createTextNode(rsMeta.getString("TYPE_NAME")));
			name.appendChild(datatype);

			Element datalength = document.createElement("DataLength");
			datalength.appendChild(document.createTextNode(rsMeta.getString(7)));
			name.appendChild(datalength);

			Element pk = document.createElement("PrimaryKey");
			pk.appendChild(document.createTextNode(rsMeta.getString(11)));
			name.appendChild(pk);

			

	}

}
 			}



			
			 DOMSource source = new DOMSource(document);

        TransformerFactory transformerFactory = TransformerFactory.newInstance();
        Transformer transformer = transformerFactory.newTransformer();
        StreamResult result = new StreamResult("C:\\Program Files\\Apache Software Foundation\\Tomcat 7.0\\webapps\\ROOT\\mysqldata"
                + ".xml");
        transformer.transform(source, result);
 }catch(Exception ex){
ex.printStackTrace();
 }


    %>   