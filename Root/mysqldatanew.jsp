 <%@ page contentType="text/html;charset=UTF-8" language="java" %>
   <%@ page import="java.sql.*,java.util.Date,java.io.File"%>
   <%@ page import="javax.xml.parsers.DocumentBuilderFactory,javax.xml.parsers.DocumentBuilder,org.w3c.dom.*,javax.xml.parsers.*,javax.xml.transform.*, javax.xml.transform.dom.*,javax.xml.transform.stream.*,java.util.*"%>
 <%
 try {

            File f = new File("C:\\Program Files (x86)\\Apache Software Foundation\\Tomcat 7.0\\webapps\\ROOT\\mysqldata.xml");
			if(!f.exists())
			f.createNewFile();
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = null,con1=null;
			Statement st,st1,st2=null,st3=null;
			ResultSet rs,rs1,rsColumns,rsMeta=null,rs2=null,rs5=null;
			ResultSetMetaData rsMetaData=null;
            con = DriverManager.getConnection("jdbc:mysql://localhost:3307/user_details","root","root");
			//Class.forName("org.postgresql.Driver");
			//con1 = DriverManager.getConnection("jdbc:mysql://localhost:5432/public","postgres","asdf");		
            st = con.createStatement();
			st1= con.createStatement();
			st2= con.createStatement();
			st3 = con.createStatement();
			Element rows;
			//st1 = con1.createStatement();
			 DocumentBuilderFactory documentBuilderFactory = DocumentBuilderFactory.newInstance();
        DocumentBuilder documentBuilder = documentBuilderFactory.newDocumentBuilder();
        Document document = documentBuilder.newDocument();
        Element root = document.createElement("Tables");
		document.appendChild(root);
			
            rs = st.executeQuery("select table_name from information_schema.tables where table_type='base table' and table_schema='user_details'");

			Element rootElement = document.getDocumentElement();
			int cnt = 0;
			while(rs.next()){
				
			//rs2 = st2.executeUpdate("create table"+rs.getString(1)+" as select *from " + rs.getString(1));
            //rs.getString(1);
			 rsColumns = null;
    DatabaseMetaData meta = con.getMetaData();
    rsMeta = meta.getColumns(null, null, rs.getString(1), null);
    rsColumns = st2.executeQuery("select *from "+rs.getString(1));
	rsMetaData = rsColumns.getMetaData();
	
	 Element table = document.createElement("table"+cnt);       
			root.appendChild(table);

			rows = document.createElement(rs.getString(1));
			//rows.appendChild(document.createTextNode());
           table.appendChild(rows);
			
	 Element tn = document.createElement("Tname");
	       tn.appendChild(document.createTextNode(rs.getString(1)));
           rootElement.appendChild(tn);

rs5 = st3.executeQuery("select table_name,column_name,data_type,character_maximum_length,column_type,column_key from information_schema.columns where table_name='"+rs.getString(1)+"' and table_schema='user_details'");
while(rs5.next()){
	out.println(rs5.getString(2)+rs5.getString(3)+rs5.getString(4)+rs5.getString(6));
Element cname = document.createElement("col_name");
			cname.appendChild(document.createTextNode(rs5.getString(2)));
            tn.appendChild(cname);
Element dtype = document.createElement("DType");
			dtype.appendChild(document.createTextNode(rs5.getString(3)));
			tn.appendChild(dtype);

Element dlen = document.createElement("DLength");
			dlen.appendChild(document.createTextNode(rs5.getString(5)));
			tn.appendChild(dlen);
if(!rs5.getString(6).equals("PRI")){
Element pkey = document.createElement("PKey");
			pkey.appendChild(document.createTextNode(" "));
			tn.appendChild(pkey);
}else{
Element pkey = document.createElement("PKey");
			pkey.appendChild(document.createTextNode(rs5.getString(6)));
			tn.appendChild(pkey);
}
}

rs1 = st1.executeQuery("select *from "+rs.getString(1));
   
	  
    while (rs1.next()) {
		Element row = document.createElement("Row");
			 rows.appendChild(row);
		for(int i=1;i<=rsMetaData.getColumnCount();i++){
          rsMeta.next();	
		
			
            Element name = document.createElement(rsMetaData.getColumnName(i));
			name.appendChild(document.createTextNode(rs1.getString(i)));
            row.appendChild(name);
			

	}
	
}
cnt++;
 			}



			
			 DOMSource source = new DOMSource(document);

        TransformerFactory transformerFactory = TransformerFactory.newInstance();
        Transformer transformer = transformerFactory.newTransformer();
        StreamResult result = new StreamResult("C:\\Program Files (x86)\\Apache Software Foundation\\Tomcat 7.0\\webapps\\ROOT\\mysqldata"
                + ".xml");
        transformer.transform(source, result);
 }catch(Exception ex){
ex.printStackTrace();
 }


    %>   