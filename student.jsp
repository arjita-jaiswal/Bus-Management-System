<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*" %>
<%@ page import="java.lang.*" %>
<html>
<h1 align="center">Student Details</h1>
<body style="background-color:powderblue;">
<center>
<%	
	String un=null;
	un=(String)session.getAttribute("who");
	Connection connect= null;
	Statement stmt = null;
	ResultSet res=null;
	ResultSet res1=null;
	PreparedStatement prep= null;
	try {
		Class.forName("com.mysql.jdbc.Driver");
		connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/exam?user=root&password=bhulgayi&useSSL=false");
		stmt = connect.createStatement();
 		res = stmt.executeQuery("select * from student_details");
 		//String flag=null;
 		while(res.next()){
 			String r=String.valueOf(res.getInt(1));
 			String nm=res.getString(2);
 			int id=res.getInt(3);
 			/*res1 = stmt.executeQuery("select * from book_details");
 			while(res1.next()){
 				int iid=res1.getInt(1);
 				String bnm=res1.getString(2);
 				if(iid==id){
 					flag=bnm;
 				}
 			}*/
 			//res1.close();
 			if(r.equals(un)){
 				res1=stmt.executeQuery("select * from book_details b where b.book_id="+id );
 				while(res1.next()){
 					String flag=res1.getString(2); 					
 					out.println("Book issued: "+flag);
 				}
 				%>
 				<br>
 				<%
 				out.println("Roll No.: "+r);
 				%>
 				<br>
 				<%
 				out.println("Name: "+nm);
 				%>
 				<br>
 				<%
 				out.println("Id of book issued: "+id);
 				
 			}
 		}
 				
 	}
 	catch(Exception e) {
			System.out.println(e.getMessage());
		}
%>
</center>

</body>
</html>