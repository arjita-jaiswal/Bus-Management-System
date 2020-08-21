<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*" %>
<%@ page import="java.lang.*" %>
<html>
<body style="background-color:pink;">
<center>
<%	Integer iid=null;
	iid=Integer.valueOf(request.getParameter("idd"));
	Connection connect= null;
	Statement stmt = null;
	ResultSet res=null;
	PreparedStatement prep= null;
	try {
		Class.forName("com.mysql.jdbc.Driver");
		connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/bus?user=root&password=bhulgayi&useSSL=false");
		stmt = connect.createStatement();
		prep = connect.prepareStatement("delete from mybus where id="+iid);
		prep.executeUpdate();
		
		res = prep.executeQuery("select * from mybus");
		%>
		<h2 align="center" style="color:blue;">MyBus Updated</h2>
		<br>
		<%

		while (res.next()) {
			int i1=res.getInt(1);
			String sss= res.getString(2);
			String eee= res.getString(3);
			int i2=res.getInt(4);
			int i3=res.getInt(5);
			int i4=res.getInt(6);
			out.println("Id: "+i1+"   "+"From: "+sss+"   "+"To: "+eee+"   "+"Fare: "+i2+"   "+"Total seats: "+i3+"   "+"Available seats: "+i4);
			%>
			<br>
			<% 
			out.println("\n");
		}
 	}
 	catch(Exception ex) {
 		ex.printStackTrace();
		}
%>
</center>
</body>
</html>