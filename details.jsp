<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*" %>
<%@ page import="java.lang.*" %>
<html>
<body style="background-color:powderblue;">
 <h1 align="center" style="color:red;">Travel History</h1>
 <center>
<%
	String name_of_user=(String)session.getAttribute("who");
	Connection connect= null;
	Statement stmt = null;
	ResultSet res=null;
	PreparedStatement prep= null;
	try {
		Class.forName("com.mysql.jdbc.Driver");
		connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/bus?user=root&password=bhulgayi&useSSL=false");
		stmt = connect.createStatement();
 		res = stmt.executeQuery("select * from passenger");
 		int flag=0;
 		while(res.next()){
 			String pnm=res.getString(1);
 			String pst=res.getString(2);
 			String pen=res.getString(3);
 			int ti=res.getInt(4);
 			int bpid=res.getInt(5);
 			String dat=res.getString(6);
 			if(pnm.equals(name_of_user)){
 				flag=1;
 			
			out.println("From: "+pst);
			%>
			<br>
			<% 
			out.println("To: "+pen);
			%>
			<br>
			<% 
			out.println("Number of tickets: "+ti);
			%>
			<br>
			<% 
			out.println("Bus id: "+bpid);
			%>
			<br>
			<% 
			out.println("Date of journey: "+dat);
			%>
			<br>
			<br>
			<br>
			<% 
			}
 		}
 		if(flag==0){
 			%>
 			<h3 align="center" style="color:blue;font-family:Comic Sans MS, cursive, sans-serif;">You haven't travelled with E-Bus.<br>Please book tickets if you want to travel with E-Bus.</h3>
 			<form action="book.jsp">
 			<input type ="submit" value="Book Tickets"/>
 			<% 
 		}
 	}
 	catch(Exception e) {
			System.out.println(e.getMessage());
		}
%>

</body>
</html>