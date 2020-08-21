<!DOCTYPE form PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*" %>
<%@ page import="java.lang.*" %>
<html>
<body style="background-color:pink;">
<h1 align="center" style="color:blue;">Hi Admin!</h1>
<center>Please choose what you want:
<br>
<form action="ad1.jsp">
<input type="radio" name="choice" value="Check details"/>Check details
<br>
<input type="radio" name="choice" value="Add"/>Add new bus
<br>
<input type="radio" name="choice" value="Delete"/>Remove bus
<br>
<br>
<input type ="submit" value="Enter"/>
</form></center>
</body>
</html>
