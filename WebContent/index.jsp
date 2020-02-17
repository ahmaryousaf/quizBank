<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<title>Login Page</title>
</head>
<body>
<form >
<div class="jumbotron text-center">
  <h1>Login Here </h1>
</div>

<div class="container-fluid bg">

<div class="row">

<div class="col-md-4 col-sm-4 col-xs-12"></div>
<div class="col-md-4 col-sm-4 col-xs-12">
  <div class="form-group ">
    <label for="uname">E-mail ID</label>
    <input type="text" class="form-control" id="uname" placeholder="Enter username" name="id" required>
    <div class="valid-feedback"></div>
    <div class="invalid-feedback"></div>
  </div>
  <div class="form-group">
    <label for="pwd">Password:</label>
    <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="pass" required>
  </div>
 
 <div class="row justify-content-center">
     
 <button type="submit"  value="login" formaction="Controller" class="btn btn-dark " >LogIn</button>
 &emsp;&emsp;
 <button type="submit"  value="register" formaction="register.jsp" class="btn btn-dark " >Register</button>
 
</div>
</div>
</div>
</div>
</form>

</body>
</html>