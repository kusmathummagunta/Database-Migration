import java.util.*;
import javax.xml.transform.*;
import javax.xml.transform.stream.*;
import javax.xml.transform.dom.*;
import org.w3c.dom.*;
import javax.xml.parsers.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import MD5.MD5;
import AES.AES;
public class AddXmlNode extends HttpServlet {
    Integer i=0;
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException,ServletException {
      try{
        DocumentBuilderFactory documentBuilderFactory = DocumentBuilderFactory.newInstance();
        DocumentBuilder documentBuilder = documentBuilderFactory.newDocumentBuilder();
        Document document = documentBuilder.parse("C:\\Program Files\\Apache Software Foundation\\Tomcat 7.0\\webapps\\ROOT\\register.xml");
        Element root = document.getDocumentElement();
        NodeList nl= document.getElementsByTagName("username");
        for(int k=0;k<nl.getLength();k++)
        {
           
            if(AES.decrypt(nl.item(k).getFirstChild().getNodeValue()).equals(req.getParameter("username"))){
                res.getWriter().print("<center><font color='red'><h2>User Already Exists!!!!!!</h2></font></center>");
                i++;
				RequestDispatcher rd = req.getRequestDispatcher("add_user_error.jsp");
				rd.forward(req,res);
            }
            
        }
        if(i==0)
        {
        
        // Root Element
        Element rootElement = document.getDocumentElement();

        Collection<Server> svr = new ArrayList<Server>();
        svr.add(new Server());

        for (Server i : svr) {
            // server elements
            
            Element users = document.createElement("users");
            rootElement.appendChild(users);

            Element name = document.createElement("username");
            name.appendChild(document.createTextNode(AES.encrypt(req.getParameter("username"))));
            users.appendChild(name);

            Element pwd = document.createElement("password");
            pwd.appendChild(document.createTextNode(MD5.getMD5(req.getParameter("password"))));
            users.appendChild(pwd);

            Element fn = document.createElement("firstname");
            fn.appendChild(document.createTextNode(AES.encrypt(req.getParameter("firstname"))));
            users.appendChild(fn);
            
            Element ln = document.createElement("lastname");
            ln.appendChild(document.createTextNode(AES.encrypt(req.getParameter("lastname"))));
            users.appendChild(ln);
            
            Element add = document.createElement("address");
            add.appendChild(document.createTextNode(AES.encrypt(req.getParameter("address"))));
            users.appendChild(add);
            
            Element cty = document.createElement("city");
            cty.appendChild(document.createTextNode(AES.encrypt(req.getParameter("city"))));
            users.appendChild(cty);
            
            Element state = document.createElement("state");
            state.appendChild(document.createTextNode(AES.encrypt(req.getParameter("state"))));
            users.appendChild(state);
            
            Element zc = document.createElement("zipcode");
            zc.appendChild(document.createTextNode(AES.encrypt(req.getParameter("zipcode"))));
            users.appendChild(zc);
            
            Element ph = document.createElement("telephone");
            ph.appendChild(document.createTextNode(AES.encrypt(req.getParameter("telephone"))));
            users.appendChild(ph);

			Element sq = document.createElement("secquestion");
            sq.appendChild(document.createTextNode(AES.encrypt(req.getParameter("secquestion"))));
            users.appendChild(sq);

			Element sa = document.createElement("secanswer");
            sa.appendChild(document.createTextNode(AES.encrypt(req.getParameter("secanswer"))));
            users.appendChild(sa);
            
            root.appendChild(users);
        }
            res.getWriter().print("<center><font color='green'><h2>Registered Successfully</h2></font></center>");
        
                }
        else{
            
            res.getWriter().print("This User Already Exists!!!!!!");
        
        DOMSource source = new DOMSource(document);

        TransformerFactory transformerFactory = TransformerFactory.newInstance();
        Transformer transformer = transformerFactory.newTransformer();
        StreamResult result = new StreamResult("C:\\Program Files\\Apache Software Foundation\\Tomcat 7.0\\webapps\\ROOT\\register"
                + ".xml");
        transformer.transform(source, result);
		RequestDispatcher rd = req.getRequestDispatcher("add_user.jsp");
		rd.forward(req,res);
        }
    }catch(Exception ex){
    }
    }    
    public static class Server {
        public String getName() { return "Ram"; }
        public String getPassword() { return "123456"; }
        public String getfn()   { return "Rama";  }
        public String getln()   { return "Krishna";  }
        public String getAdd()   { return "Attapur";  }
        public String getCity()   { return "Hyderabad";  }
        public String getState()   { return "Andhra Pradesh";  }
        public String getPin()   { return "500048";  }
        public String getPhone()   { return "9490178755";  }
		public String getSecQues()   { return "Your Favorite Time Pass";  }
		public String getSecAns() {return "TV"; }
    }

}