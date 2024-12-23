<%@page import="java.sql.*"%>
<%
String email=request.getParameter("email");
String msg=request.getParameter("msg");

try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","Deepu");
	PreparedStatement pst=con.prepareStatement("insert into Contact values(?,?)");
	pst.setString(1,email);
	pst.setString(2,msg);
	pst.executeUpdate();
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