<%@page import="java.sql.*"%>
<%
String mail=request.getParameter("email");
String Newpass=request.getParameter("password");
String conpass=request.getParameter("confpassword");
String pass="";
try{
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","Deepu");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from Signup where email='"+mail+"'");
while(rs.next()){
pass=rs.getString(3);
}
if(pass.equals(mail)){
      Statement st1=con.createStatement();
      int i=st1.executeUpdate("update Signup set password='"+Newpass+"' where email='"+mail+"'");
      response.sendRedirect("login.html");
      st1.close();
}
else{
    out.print("<h1>Invalid email</h1>");
}
con.close();
}
catch(Exception e)
{
        out.println(e);
}
%>