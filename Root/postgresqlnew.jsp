 <%@ page contentType="text/html;charset=UTF-8" language="java" %>
   <%@ page import="java.sql.*,java.util.Date,java.io.File"%>
   <%@ page import="javax.xml.parsers.DocumentBuilderFactory,javax.xml.parsers.DocumentBuilder,org.w3c.dom.*,javax.xml.parsers.*,javax.xml.transform.*, javax.xml.transform.dom.*,javax.xml.transform.stream.*,java.util.*"%>
 <%
 try {
			Class.forName("org.postgresql.Driver");
			Connection con = null,con1=null;
			Statement st,st1,st2=null,st3=null;
			ResultSet rs,rs1,rsColumns,rsMeta=null,rs2=null;
			ResultSetMetaData rsMetaData=null;
            String tbl = "";
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/xmldb","postgres","asdf");		
            st = con.createStatement();
			st1= con.createStatement();
			st2= con.createStatement();
			st3= con.createStatement();
			DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
		DocumentBuilder db = dbf.newDocumentBuilder();
		Document document = db.parse("webapps\\ROOT\\mysqldata.xml");
		
        //NodeList nlt= document.getElementsByTagName("table");
        NodeList nltn= document.getElementsByTagName("Tname");
		NodeList nlcn= document.getElementsByTagName("column_name");
		NodeList nldt= document.getElementsByTagName("DType");
		NodeList nldl= document.getElementsByTagName("DLength");
		NodeList nlpk= document.getElementsByTagName("PKey");
		//NodeList tn= document.getElementsByTagName("Table_Name");
		//NodeList tnc= tn.getChildNodes();
		for(int k=0;k<nltn.getLength();k++){
		//if(tbl.equals("")){
		st.execute("create table  "+nltn.item(k).getFirstChild().getNodeValue()+"()" );
		//}else if(!tbl.equals("")&&!tbl.equals(nltn.item(k).getFirstChild().getNodeValue())&&!nltn.item(k).getFirstChild().getNodeValue().equals(nltn.item(k-1).getFirstChild().getNodeValue())){
        //out.println(nltn.item(k).getFirstChild().getNodeValue());
		//st.execute("create table "+nltn.item(k).getFirstChild().getNodeValue()+"()" );

		//}
		
		/*else{
		
		st1.execute("alter table "+nltn.item(k).getFirstChild().getNodeValue()+ " add column   "+nlcn.item(k).getFirstChild().getNodeValue()+"    "+nldt.item(k).getFirstChild().getNodeValue()+"("+nldl.item(k).getFirstChild().getNodeValue()+")");
 

		//}
		}*/
		
		}
		
		List<String> tblName = new ArrayList<String>();
		List<String> tblCols = new ArrayList<String>();
		rs = st2.executeQuery("select table_name from information_schema.tables where table_schema='public'");
	    while(rs.next()){
		tblName.add(rs.getString(1));	
		//out.println("The Table Name is : "+rs.getString(1));
		}
		//out.println("The Table Name is : "+tbl);

		

		// tblName.add(nltn.item(t).getFirstChild().getNodeValue());
		 
		
		//out.println(tname);
		

		
		for(int i=0;i<nlcn.getLength();i++){
        if(!nlpk.item(i).getFirstChild().getNodeValue().equals(" ")){
		st1.execute("alter table "+nltn.item(i).getFirstChild().getNodeValue()+ " add column   "+nlcn.item(i).getFirstChild().getNodeValue()+"    "+nldl.item(i).getFirstChild().getNodeValue()+" add constraint pk"+i+" primary key("+nlcn.item(i).getFirstChild().getNodeValue()+")");
		}
		else{
		st1.execute("alter table "+nltn.item(i).getFirstChild().getNodeValue()+ " add column   "+nlcn.item(i).getFirstChild().getNodeValue()+"    "+nldl.item(i).getFirstChild().getNodeValue()+"");

		}
		
		}

		
		
		
		

		
		
			}catch(Exception ex){
				out.println(ex.getMessage());
			}
			%>   