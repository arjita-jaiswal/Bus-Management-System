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
	String u=null;
	u=request.getParameter("user");
	session.setAttribute("who",u);
	String p=null;
	p=request.getParameter("pass");
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
 			String pp=res.getString(3);
 			String r=res.getString(6);
 			
 			if(nm.equals(u)){
 				flag=1;
 				if(pp.equals(p)){
 				    flag=2;
 					if(r.equals("A")){
 						response.sendRedirect("ad.jsp");
 					}
 					else if(r.equals("P")){
 						response.sendRedirect("passenger.jsp");
 					}
 				}
 			}
 		}
 		if(flag==0){
 			%>
				<h2 style="color:red">OOPS!!</h2>
				<h3 align="center" style="color:blue;font-family:Comic Sans MS, cursive, sans-serif;">No user found.<br>If you are new to E-Bus,please sign up.</h3>
				<form action="signup.jsp">
				<input type ="submit" value="Sign Up"/>
				<%
 		}
 		else if(flag==1){
 			%>
				<h2 style="color:red">OOPS!!</h2>
				<h3 align="center" style="color:blue;font-family:Comic Sans MS, cursive, sans-serif;">Wrong password.Please enter your correct password.</h3>
				<form action="try.jsp">
				<input type ="submit" value="Try Again"/>
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