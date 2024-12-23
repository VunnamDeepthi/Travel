<%@page import="java.sql.*"%>
<%
String fname=request.getParameter("firname");
String lname=request.getParameter("lastname");
String email=request.getParameter("email");
String pno=request.getParameter("phone");
String add=request.getParameter("address");
String coun=request.getParameter("country");
String ch=request.getParameter("child");
String dest=request.getParameter("destination");
String hotel=request.getParameter("hotel");
String ques=request.getParameter("q1");
String amount=request.getParameter("amount");


try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","Deepu");
	PreparedStatement pst=con.prepareStatement("insert into Booking values(?,?,?,?,?,?,?,?,?,?,?)");
	pst.setString(1,fname);
	pst.setString(2,lname);
	pst.setString(3,email);
	pst.setString(4,pno);
	pst.setString(5,add);
	pst.setString(6,coun);
	pst.setString(7,ch);
	pst.setString(8,dest);
	pst.setString(9,hotel);
	pst.setString(10,ques);
	pst.setString(11,amount);
	pst.executeUpdate();
	if(pst!=null)
	{
		 out.print("<h1>Insert successfully</h1>");
	}
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
