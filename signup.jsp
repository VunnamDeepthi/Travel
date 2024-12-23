<%@page import="java.sql.*"%>
<%
String fname=request.getParameter("fname");
String lname=request.getParameter("lname");
String email=request.getParameter("mail");
String pass=request.getParameter("pass");
try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","Deepu");
	PreparedStatement pst=con.prepareStatement("insert into Signup values(?,?,?,?)");
	pst.setString(1,fname);
	pst.setString(2,lname);
	pst.setString(3,email);
    pst.setString(4,pass);
	pst.executeUpdate();
	response.sendRedirect("index.html");
	con.close();
}
catch(Exception e)
{
	%>
		<%=e%>
}
<%
}
%>
