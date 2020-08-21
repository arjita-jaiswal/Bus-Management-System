<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*" %>
<%@ page import="java.lang.*" %>
<html>
<body style="background-color:pink;">
<center>
 <h1 align="center" style="color:blue;">Records</h1>
<%
	
	Connection connect= null;
	Statement stmt = null;
	ResultSet res=null;
	PreparedStatement prep= null;
	try {
		Class.forName("com.mysql.jdbc.Driver");
		connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/bus?user=root&password=bhulgayi&useSSL=false");
		stmt = connect.createStatement();
		%>
 		<h3 align="center">Bus Details:</h3>
 		<%
 		res = stmt.executeQuery("select * from mybus");
 		while(res.next()){
 			int pnm=res.getInt(1);
 			String pst=res.getString(2);
 			String pen=res.getString(3);
 			int ti=res.getInt(4);
 			int bpid=res.getInt(5);
 			int dat=res.getInt(6);
 			out.println("Bus id: "+pnm+"      "+"From: "+pst+"      "+"To: "+pen+"      "+"Fare: "+ti+"      "+"Total seats: "+bpid+"      "+"Available seats:"+dat);
 			%>
 			<br>
 			<br>
 			<% 
			
 		}
 		%>
 		<h3 align="center">Passenger Travel History:</h3>
 		<%
 		res = stmt.executeQuery("select * from passenger");
 		while(res.next()){
 			String a1pnm=res.getString(1);
 			String a1pst=res.getString(2);
 			String a1pen=res.getString(3);
 			int a1ti=res.getInt(4);
 			int a1bpid=res.getInt(5);
 			String a1dat=res.getString(6);
 			out.println("Name: "+a1pnm+"      "+"From: "+a1pst+"      "+"To: "+a1pen+"      "+"No. of tickets: "+a1ti+"      "+"Bus Id: "+a1bpid+"      "+"Date of journey:"+a1dat);
 			%>
 			<br>
 			<br>
 			<% 
			
 		}
 	}
 	catch(Exception e) {
			System.out.println(e.getMessage());
		}
%>
</center>
</body>
</html>