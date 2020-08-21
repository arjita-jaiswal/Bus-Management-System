<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*" %>
<%@ page import="java.lang.*" %>
<html>
<body style="background-color:powderblue;">
<center>
<%
	String n1=null;
	String u1=null;
	String p1=null;
	String e1=null;
	Long n2=null;
	String r1=null;
	n1=request.getParameter("name");
	u1=request.getParameter("user");
	p1=request.getParameter("pass");
	e1=request.getParameter("email");
	n2=Long.valueOf(request.getParameter("number"));
	Connection connect= null;
	Statement stmt = null;
	ResultSet res=null;
	PreparedStatement prep= null;
	try {	
		Class.forName("com.mysql.jdbc.Driver");
		connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/bus?user=root&password=bhulgayi&useSSL=false");
		stmt = connect.createStatement();
		res = stmt.executeQuery("select * from person");
		int flag=0;
 		while(res.next()){
 			String nm=res.getString(2);
 			if(nm.equals(u1)){
 				flag=1;
 				%>
 				<h3 align="center" style="color:blue;font-family:Comic Sans MS, cursive, sans-serif;">The username already exist.Please try another.</h3>
 				<form action="signup.jsp">
 				<br>
				<br>
				<input type ="submit" value="Try Again"/>
 				<% 
 			}
 		}
 		if(flag==0){
 			prep=connect.prepareStatement("insert into person values(?,?,?,?,?,?)");
 			prep.setString(1,n1);
 			prep.setString(2,u1);
 			prep.setString(3,p1);
 			prep.setString(4,e1);
 			prep.setLong(5,n2);
 			prep.setString(6,"P");
 			prep.executeUpdate();
 			response.sendRedirect("try.jsp");
 		}
	}
 	catch(Exception e) {
			System.out.println(e.getMessage());
		}%>
</center>
</body>
</html>