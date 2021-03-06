<%@page import="java.io.*,org.w3c.dom.*,javax.xml.parsers.*,javax.xml.transform.*, javax.xml.transform.dom.*,javax.xml.transform.stream.*,java.util.*,javax.servlet.*,javax.servlet.http.*"%>  
<%
try{
DocumentBuilderFactory documentBuilderFactory = DocumentBuilderFactory.newInstance();
        DocumentBuilder documentBuilder = documentBuilderFactory.newDocumentBuilder();
        Document document = documentBuilder.parse("webapps\\ROOT\\register.xml");
        Element root = document.getDocumentElement();

        // Root Element
			Element rootElement = document.getDocumentElement();

            // server elements
            Element users = document.createElement("users");
            rootElement.appendChild(users);

            Element name = document.createElement("username");
            name.appendChild(document.createTextNode(request.getParameter("username")));
            users.appendChild(name);

            Element pwd = document.createElement("password");
            pwd.appendChild(document.createTextNode(request.getParameter("password")));
            users.appendChild(pwd);

            Element fn = document.createElement("firstname");
            fn.appendChild(document.createTextNode(request.getParameter("firstname")));
            users.appendChild(fn);
            
            Element ln = document.createElement("lastname");
            ln.appendChild(document.createTextNode(request.getParameter("lastname")));
            users.appendChild(ln);
            
            Element add = document.createElement("mail");
            add.appendChild(document.createTextNode(request.getParameter("mail")));
            users.appendChild(add);
            
            Element ph = document.createElement("telephone");
            ph.appendChild(document.createTextNode(request.getParameter("telephone")));
            users.appendChild(ph);
            
            root.appendChild(users);
        

        DOMSource source = new DOMSource(document);

        TransformerFactory transformerFactory = TransformerFactory.newInstance();
        Transformer transformer = transformerFactory.newTransformer();
        StreamResult result = new StreamResult("webapps\\ROOT\\register"
                + ".xml");
        transformer.transform(source, result);
		response.setContentType("text/html");
		out.println("<center><font color='green' size='6'><b>Registered Successfully</b></font></center>");
		}catch(Exception ex){
		out.println(ex.getMessage());
		}

%>


