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
		connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/exam?user=root&password=bhulgayi&useSSL=false");
		stmt = connect.createStatement();
 		res = stmt.executeQuery("select * from log_in_details");
 		int flag=0;
 		while(res.next()){
 			String r=res.getString(1);
 			String pp=res.getString(2);
 			
 			if(r.equals(u)){
 				if(pp.equals(p)){
 					response.sendRedirect("student.jsp");
 				}
 				/*else {
 					flag=2;
 				}*/
 			}
 			else{
 				flag=1;
 			}
 		}
 		if(flag==1){
 			%>
				<h2>OOPS!!</h2>
				<%
			out.println("Wrong data entered.Please enter your data correctly.");
 		}
 		
 	}
 	catch(Exception e) {
			System.out.println(e.getMessage());
		}
%>
</center>

</body>
</html>