<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome Voter</title>
<link rel ="stylesheet"  type="text/css" href="style.css">
</head>
<%@ include file="navbar.jsp" %>
<body>

<div class="form-container">
<form  action="Vote"  method="post">

<h3 >Please fill the required details</h3>

<label for="voterNumber">Voter ID</label>
<br>
<input name="voterNumber"  id="voterNumber" type="text" >

<label for="party">Choose a party:</label>
<br>

<select name="party" id="party">

  <option value="aap">AAP</option>
  <option value="bjp">BJP</option>
  <option value="bsp">BSP</option>
  <option value="congress">Congress</option>
    <option value="cpi">CPI</option>
</select>


<button  type="submit">Submit</button>

</form>
</div>

</body>
</html>