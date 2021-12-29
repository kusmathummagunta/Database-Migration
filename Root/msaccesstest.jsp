 <%@ page contentType="text/html;charset=UTF-8" language="java" %>
   <%@ page import="java.sql.*,java.util.Date,java.io.File"%>
   <%@ page import="javax.xml.parsers.DocumentBuilderFactory,javax.xml.parsers.DocumentBuilder,org.w3c.dom.*,javax.xml.parsers.*,javax.xml.transform.*, javax.xml.transform.dom.*,javax.xml.transform.stream.*,java.util.*"%>
 <%
 try {
			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");

// C:\\databaseFileName.accdb" - location of your database 
String url = "jdbc:odbc:Driver={Microsoft Access Driver (*.mdb, *.accdb)};DBQ=" + "C:\\Program Files (x86)\\Apache Software Foundation\\Tomcat 7.0\\webapps\\ROOT\\user_details.accdb";

// specify url, username, pasword - make sure these are valid 
Connection con = DriverManager.getConnection(url,"","");

			Connection con1=null;
			Statement st,st1,st2=null,st3=null,st4=null;
			ResultSet rs,rs1,rsColumns,rsMeta=null,rs2=null;
			ResultSetMetaData rsMetaData=null;
            String tbl = "";
			List<String> tables = new ArrayList<String>();
			List<String> dat= new ArrayList<String>();
			con = DriverManager.getConnection(url);		
            st = con.createStatement();
			st1= con.createStatement();
			st2= con.createStatement();
			st3= con.createStatement();
			st4= con.createStatement();
			DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
		DocumentBuilder db = dbf.newDocumentBuilder();
		Document document = db.parse("webapps\\ROOT\\mysqldata.xml");
		int p = 0;
    
        NodeList nltn= document.getElementsByTagName("Tname");
		NodeList nlcn= document.getElementsByTagName("column_name");
		NodeList nldt= document.getElementsByTagName("DType");
		NodeList nldl= document.getElementsByTagName("DLength");
		NodeList nlpk= document.getElementsByTagName("PKey");
		Node root= document.getDocumentElement();
		NodeList nlda= root.getChildNodes();
		NodeList trow = document.getElementsByTagName("Row");
	
	
		for(int k=0;k<nltn.getLength();k++){
		//st.execute("Drop table "+nltn.item(k).getFirstChild().getNodeValue());
		st.execute("create table  "+nltn.item(k).getFirstChild().getNodeValue()+"(sno char)" );
	
		
		}
		
		List<String> tblName = new ArrayList<String>();
		ArrayList<String> tblCols = new ArrayList<String>();
		//rs = st2.executeQuery("SELECT MSysObjects.Name, MSysObjects.Type FROM MSysObjects WHERE MSysObjects.Name Not Like 'MsyS*' AND MSysObjects.Type=1 ORDER BY MSysObjects.Name;");
	    //while(rs.next()){
		//tblName.add(rs.getString(1));	
	
		//}
	

	

		for(int t=0;t<nltn.getLength();t++){

	
		 
		Node node = nltn.item(t);
		
		
		String tname = nltn.item(t).getFirstChild().getNodeValue();
		
	
		if (node.getNodeType() == Node.ELEMENT_NODE) {

			Element eElement = (Element) node;

		
		for(int i=0;i<eElement.getElementsByTagName("col_name").getLength();i++){
        
		st1.execute("alter table "+tname+ " add column   "+eElement.getElementsByTagName("col_name").item(i).getTextContent()+"     "+eElement.getElementsByTagName("DLength").item(i).getTextContent()+"");
		
		}
        
		for(int i=0;i<eElement.getElementsByTagName("col_name").getLength();i++){
		if(!eElement.getElementsByTagName("PKey").item(i).getTextContent().equals(" ")){
		st1.execute("alter table "+tname+ " add constraint pk"+p+" primary key("+eElement.getElementsByTagName("col_name").item(i).getTextContent()+")");
		p++;
		}
		}
		
		}

		}
		for(int da=0;da<nlda.getLength();da++){
			if(nlda.item(da).getFirstChild().getNodeValue()!=null){
			tables.add(nlda.item(da).getFirstChild().getNodeValue());
			}
		}

		out.println(tables);
	
		int z=0,flag=0;
		

		while(z<tables.size()){
		NodeList flowList = document.getElementsByTagName(tables.get(z));
		
   
        NodeList childList = flowList.item(0).getChildNodes();
        for (int j = 0; j < childList.getLength(); j++) {
            Node childNode = childList.item(j);
           NodeList rowChild = childNode.getChildNodes();
		for (int r = 0; r < rowChild.getLength(); r++) {
			Node rNode = rowChild.item(r);
 
				tblCols.add("'"+rNode.getFirstChild().getNodeValue()+"'");
				
		}
		
				
				StringBuffer concol = new StringBuffer();
				for(int cl=0;cl<tblCols.size();cl++){
				    if(cl!=tblCols.size()-1)
					concol.append(tblCols.get(cl)+",");
					else
					concol.append(tblCols.get(cl));
				}

				
				out.println(concol.toString());
				st4.executeUpdate("insert into "+tables.get(z)+" values('1',"+concol.toString()+")");   
				tblCols.clear();
               
		}
		
		z++;
    }
		
			}catch(Exception ex){
				out.println(ex.getMessage());
			}
			%>   