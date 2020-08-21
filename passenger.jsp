<!DOCTYPE form PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*" %>
<%@ page import="java.lang.*" %>
<html>
<body style="background-color:powderblue;">
<center>
<h1 align="center" style="color:blue;">Hello! Welcome to Your E-Bus profile!!</h1>
Please choose what you want:
<br>
<form action="intermediate.jsp">
<input type="radio" name="choice" value="Check details"/>Check details
<br>
<input type="radio" name="choice" value="Book tickets"/>Book tickets
<br>
<br>
<input type ="submit" value="Enter"/>
</form>
</center>
</body>