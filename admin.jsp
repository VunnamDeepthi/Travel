<%@ page import="java.sql.*" %>
<HTML>
 <HEAD>
 <TITLE>ADMIN VIEW</TITLE>
 <style>
 button{float:left;border-radius:10px;padding:10px;background-color:orange;}
 button{display:inline;margin-left:0px;}
 </style>
 </HEAD>
 <BODY BGCOLOR="cyan">
 <%
String mail=request.getParameter("mail");
String password=request.getParameter("password");
int count=0;
try
{
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","Deepu");
 Statement st = con.createStatement() ;
%>
<%
 ResultSet resultset = st.executeQuery("select * from Signup") ;
 %>
 <br>
 <H1>CLIENT INFO DATABASE TABLE </H1>
 <TABLE BORDER="3" >
 <TR>
 <TH>Name</TH>
 <TH>Email</TH>
 <TH>Password</TH>
 
 </TR>
 <% while(resultset.next()){ %>
 <TR>
 <TD> <%= resultset.getString(1) %></TD>
 <TD> <%= resultset.getString(2) %></TD>
 <TD> <%= resultset.getString(3) %></TD>
 </TR>
 <%
}
%>
 </TABLE>
 </BODY>
</HTML>
<H1>TOUR BOOKING DATABASE TABLE </H1>
 <%
 ResultSet rs = st.executeQuery("select * from Booking") ;
 %>
 <TABLE BORDER="3" >
 <TR>
 
 <TH>First Name</TH>
 <TH>Last Name</TH>
 <TH>Email</TH>
 <TH>Contact no</TH>
 <TH>Destinations</TH>
 </TR>
 <% while(rs.next()){ %>
 <TR>
 <TD> <%= rs.getString(1) %></td>
 <TD> <%= rs.getString(2) %></TD>
 <TD> <%= rs.getString(3) %></TD>
 <TD> <%= rs.getString(4) %></TD>
 <TD> <%= rs.getString(5) %></TD>

 </TR>
 <%
} 
%>
 </TABLE>
 </BODY> 
</HTML>
 <% 
 }
catch(Exception e) {
       out.print(e);
}
%>