<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*" %>
<%@ page import="java.lang.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
  String pass=null;
  pass=request.getParameter("pass");                                                       // getting pass from html page //
  if(pass==null)
     {   System.out.println("Please Enter The Data..."); }
  else
  {
  out.println("User data is ....\n");                                                 // printing data from user  
  Connection con=null;                                                                     // connection object
  PreparedStatement ps=null;                                                               // prepared statement                
  Statement st=null;                                                                       // statement
  FileReader fr=null;                                                                      // file reader
  BufferedReader br=null;                                                                  // buffered reader
  ResultSet rs=null;                                                                       // result from database
  try                                                                                       
  {
       //String url="jdbc:mysql://localhost:3306/d2";                                        // database address  ******
       br = new BufferedReader(new FileReader("C:\\Users\\dell\\Documents\\JAVA\\data.txt"));        // reding file into buffer  *****
       String line=br.readLine();                                                             //
       Class.forName("com.mysql.jdbc.Driver");                                                // manually  specifying  jdbc driver  ****
       con =DriverManager.getConnection("jdbc:mysql://localhost:3306/l10?user=root&password=bhulgayi&useSSL=false");                                   //  creating connection
       st=con.createStatement();                                                              //  create  statement  ******* 
//st.executeUpdate("create table employee(id varchar(30),dep varchar(30),marks varchar(10))");// creating table  ********
  /*while(line!=null)
  {    
       String arr[]=line.split(" ");
       int i=0;
       ps=con.prepareStatement("insert into employee values(?,?,?)");                         // statement to insert data 
                     while(i<arr.length)
                 {  
    	               ps.setString(1,arr[i++]);                                              //  inserting data
                	   ps.setString(2,arr[i++]);                                              //  inserting data
                	   ps.setString(3,arr[i++]);                                              //  inserting data
                	   ps.executeUpdate();                                                    //  inserting data
                 }
       line=br.readLine();
  }*/
     ps=con.prepareStatement("select * from employee where id=?");                             //  statement to read a particular data
     //ps.setString(1,name);                                                                    //  giving vlaue of department
     ps.setString(1,pass);                                                                         //  giving vlaue of pass/ id
     rs=ps.executeQuery();
     int flag=0;                                                                                //  executing query
     while(rs.next())                                                                               //  movng pointer to first row
     {String id=rs.getString(1);                                                               //  getting data ********
     String n=rs.getString(2);                                                                //  getting data ********
     String sal=rs.getString(3);                                                              //  getting data  ********
     out.println(id+" "+n+" "+sal);                                                           //  printing data *********
     flag=1;
     }      
            if(flag==0)
            	{   out.println("NO SUCH USER FOUND"); }                                                                                   
  } 
  catch(Exception e) 
  { System.out.println(e.getMessage());   }
  }
  %>
</body>
</html>