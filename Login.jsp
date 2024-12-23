<%@ page import="java.sql.*" %>
<%    
    String mail = request.getParameter("mail");
    String password = request.getParameter("password");    
    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
	    Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","Deepu");
        if(mail.equals("admin@gmail.com") && password.equals("admin"))
        {
            response.sendRedirect("admin.jsp");
        }
        else
        {
        String query = "SELECT * FROM Signup WHERE email = ? AND password = ?";
        PreparedStatement statement = con.prepareStatement(query);
        statement.setString(1, mail);
        statement.setString(2, password);
        ResultSet rs = statement.executeQuery();
        int x=0;
        while(rs.next())
        {
            x++;
            response.sendRedirect("home.html");
        }
       if(x==0)
       {
        
        response.sendRedirect("login1.html");
       }
    }
       con.close();
    }
         catch (Exception e) 
         {
            System.out.println(e);
         }      
%>