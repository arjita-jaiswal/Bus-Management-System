<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*" %>
<%@ page import="java.lang.*" %>
<html>
<body>
<%
	String ch=null;
	ch=request.getParameter("choice");
	if (ch.equals("Check details")){
		response.sendRedirect("details.jsp");
	}
	else if(ch.equals("Book tickets")){
		response.sendRedirect("book.jsp");	
	}
%>
</body>
</html>