<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*" %>
<%@ page import="java.lang.*" %>
<html>
<body style="background-color:powderblue;">
 <center>
  <h1> Book your tickets </h1> 
  <br>
  <form action="book1.jsp">
  
  From:<input type="text" name="fro" /> <br>
  To: <input type="text" name="to" /> <br>
  No of tickets: <input type="number" name="no" />
  Date of journey: <input type="text" name="datt" /> 
   <br>
  <input type="submit" value="Submit" />
  
  </form>
 
 </center>
</body>
</html>