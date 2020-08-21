<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*" %>
<%@ page import="java.lang.*" %>
<html>
<body style="background-color:powderblue;">
<%
	String ch1=null;
	ch1=request.getParameter("choice");
	if (ch1.equals("Check details")){
		response.sendRedirect("a_details.jsp");
	}
	else if(ch1.equals("Add")){
		response.sendRedirect("admin.jsp");	
	}
	else if(ch1.equals("Delete")){
		response.sendRedirect("delete1.jsp");	
	}
	
	
	%>
</body>
</html>