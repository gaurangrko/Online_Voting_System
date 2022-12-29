<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.DriverManager" %>
     <%@page import="java.sql.ResultSet" %>
      <%@page import="java.sql.Statement" %>
       <%@page import="java.sql.Connection" %>
        <%@page import="java.sql.PreparedStatement" %>
    
    
    
    
    
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Results</title>
<link rel ="stylesheet"  type="text/css" href="style.css">

 <%
   
    Integer a[] = new Integer[100];
 
    Class.forName("com.mysql.cj.jdbc.Driver");
	java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinevotingdb","root","Gaurangdx@123");
	
	PreparedStatement preparedStatement = con.prepareStatement("select party,count(party) as c from vote group by party");
	ResultSet rs=((java.sql.Statement) preparedStatement).executeQuery("select party,count(party) as c from vote group by party");
	
    int i=0;
    while(rs.next()){
        int temp = Integer.valueOf(rs.getString("c"));
        a[i]=temp-1;
        i++;
    }
    %>




</head>
<%@ include file="adminNavbar.jsp" %>
<body>

<div class="checkTable">

<table>
<tr class="firstrow">
<th>
Parties
</th>
<th>
Names
</th>
<th>
Votes
</th>
</tr>

<tr>
<td>
<img src="https://n1.sdlcdn.com/imgs/i/b/e/MAHALAXMI-ART-CRAFT-AAP-Logo-SDL520603892-1-7a9bb.jpg"   alt="AAP">
</td>
<td>AAP</td>

<td><%=a[0]%></td>
</tr>

<tr>
<td>
<img src="https://m.media-amazon.com/images/I/61OgrIEL7EL._SX679_.jpg"   alt="BJP">
</td>
<td>BJP</td>
<td><%=a[1] %></td>
</tr>

<tr>
<td>
<img src="https://content.jdmagicbox.com/comp/lucknow/q7/0522px522.x522.180319200748.i2q7/catalogue/bsp-party-office-hazratganj-lucknow-political-party-office-femkeqed92.jpg"   alt="BSP">
</td>
<td>BSP</td>
<td><%=a[2] %></td>
</tr>

<tr>
<td>
<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/6/63/Indian_National_Congress_hand_logo.png/600px-Indian_National_Congress_hand_logo.png"   alt="Congress">
</td>
<td>Congress</td>
<td><%=a[3]%></td>
</tr>

<tr>
<td>
<img src="https://www.kindpng.com/picc/m/128-1286831_cpi-logo-communist-party-of-india-hd-png.png"   alt="CPI">
</td>
<td>CPI</td>
<td><%=a[4] %></td>
</tr>




</table>
</div>
</body>
</html>