<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<title>selection Page</title>
<script type="text/javascript">
window.addEventListener('load', function() {
	const hidden = document.getElementById('date')
	document.getElementById('check').addEventListener('change', function() {
		console.log(this)
		hidden.style.display = this.checked ? 'initial' : 'none'
	})
})
window.addEventListener('load', function() {
	const hidden = document.getElementById('date')
	document.getElementById('hide').addEventListener('change', function() {
		console.log(this)
		hidden.style.display = this.checked ? 'none' : 'none'
	})
})
</script>
</head>
<body>
<div class="jumbotron text-center">
  <h1>Welcome to your panel <%
  String id=null;
  if(null!= session.getAttribute("name")){
id=(String) session.getAttribute("name");
out.println(id);
}
  else 
	  response.sendRedirect("index.jsp");
%>
</h1>
</div>

<h3>Please select your option</h3>
<br><br>
<form action="Controller">
<div class="col-sm-4" >
<input id="hide" type="radio" name ="button" value="questions" required>Quiz bank
<br><br>
<input id="check" type="radio" name="button" value="update" required>Update answers
<br><br>
<label id="date" style="display:none">Enter Date: <input type="text" name="date" placeholder="yyyy/mm/dd" ></label>
<br><br>

<input type="submit" class="btn btn-primary active" name ="Choice">
    </div>

</form>

</body>
</html>