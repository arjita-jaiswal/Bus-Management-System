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
	String name_user=(String)session.getAttribute("who");
	String f1=null;
	String t1=null;
	Integer nn=null;
	String dd=null;
	f1=request.getParameter("fro");
	t1=request.getParameter("to");
	nn=Integer.valueOf(request.getParameter("no"));
	dd=request.getParameter("datt");
	Connection connect= null;
	Statement stmt = null;
	ResultSet res=null;
	PreparedStatement prep= null;
	try {	
		Class.forName("com.mysql.jdbc.Driver");
		connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/bus?user=root&password=bhulgayi&useSSL=false");
		stmt = connect.createStatement();
		res = stmt.executeQuery("select * from mybus");
		int flag=0;
 		while(res.next()){
 			int i11=res.getInt(1);
			String sss1= res.getString(2);
			String eee1= res.getString(3);
			int i21=res.getInt(4);
			int i31=res.getInt(5);
			int i41=res.getInt(6);
 			if(sss1.equals(f1) && eee1.equals(t1)){
 				flag=1;
 				if(i41>=nn){
 					int w=(i41-nn);
 					prep=connect.prepareStatement("insert into passenger values(?,?,?,?,?,?)");
 					prep.setString(1,name_user);
 					prep.setString(2,f1);
 					prep.setString(3,t1);
 					prep.setInt(4,nn);
 					prep.setInt(5,i11);
 					prep.setString(6,dd);
 					prep.executeUpdate();
 					prep=connect.prepareStatement("update mybus set avail_seat='"+w+"' where id="+i11 );
 					prep.executeUpdate();
 					%>
 					<h1 align="center" style="color:blue;">Thank you for travelling with E-Bus.</h1>
 					<br>
 					<h4>Your ticket has been confirmed.</h4>
 					<% 
 					out.println("Bus Id: "+i11);
 					%>
 					<br>
 					<% 
 					out.println("From: "+sss1);
 					%>
 					<br>
 					<% 
 					out.println("To: "+eee1);
 					%>
 					<br>
 					<% 
 					out.println("Fare: "+i21);
 					%>
 					<br>
 					<% 
 					out.println("Number of tickets: "+nn);
 					%>
 					<br>
 					<% 
 					out.println("Date of journey: "+dd);
 				}
 				else{
 					out.println("Sorry, seats not available.");
 				}
 			}
 			
 		}
 		if(flag==0){
				out.println("Sorry, bus not available.");
			}
 		
 	}
 	catch(Exception e) {
			System.out.println(e.getMessage());
		}%>
</center>
</body>
</html>