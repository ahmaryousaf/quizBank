<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="Controller">
  <div align="center" class="container">
    <h1>Register</h1>
    <p>Please fill in this form to create an account.</p>
    <hr>
    
    &emsp;&emsp;
    <label for="firstName"><b>First Name: </b></label>
    &emsp;&emsp;&emsp;&emsp;&emsp;
    <input type="text" placeholder="Enter First Name" name="fName" required>
    <br><br>
    
    &emsp;&emsp;
    <label for="lastName"><b>Last Name: </b></label>
    &emsp;&emsp;&emsp;&emsp;&emsp;
    <input type="text" placeholder="Enter Last Name" name="lName" required>
    <br><br>
    
	&emsp;&emsp;&emsp;
    <label for="email"><b>Email: </b></label>
    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
    <input type="text" placeholder="Enter Email"  name="e-mail" required>
    <br><br>
    &emsp;
	
	&emsp;
    <label for="psw"><b>Password: </b></label>
    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
    <input type="password" placeholder="Enter Password" autocomplete="new-password" name="passw" required>
    <br><br>
    &emsp;

    <label for="psw-repeat"><b>Repeat Password: </b></label>
    &emsp;&emsp;&emsp;&emsp;
    <input type="password" placeholder="Repeat Password" name="psw-repeat" required>
    <hr>

    <input type="submit" value="Register" name="Reg" />
  </div>
  <%-- 
  <%
    session.setAttribute("register", "yes");
    %> --%>

  <div align="center" class="container signin">
    <p>Already have an account? <a href="index.jsp">Sign in</a>.</p>
  </div>
</form>
    


</body>
</html>