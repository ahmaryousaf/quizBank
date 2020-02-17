<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.*, java.util.*, java.text.DateFormat, java.text.SimpleDateFormat, com.java.questions.DAO " %>
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
<title>Welcome Page</title>
<style type="text/css">
input[type=radio]{
margin: 09px;
padding: 09px;
}
input[type=checkbox]{
margin: 09px;
padding: 09px;
}
</style>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
window.addEventListener('load', function() {
	const hidden = document.getElementById('true')
	document.getElementById('customer').addEventListener('change', function() {
		console.log(this)
		hidden.style.display = this.checked ? 'initial' : 'none'
	})
})
window.addEventListener('load', function() {
	const hidden = document.getElementById('true1')
	document.getElementById('customer').addEventListener('change', function() {
		console.log(this)
		hidden.style.display = this.checked ? 'initial' : 'none'
	})
})
window.addEventListener('load', function() {
	const hidden = document.getElementById('true2')
	document.getElementById('customer').addEventListener('change', function() {
		console.log(this)
		hidden.style.display = this.checked ? 'initial' : 'none'
			document.getElementById("nullMultiple").checked = false
			document.getElementById("nullMultiple1").checked = false
	})
	
})
window.addEventListener('load', function() {
	const hidden = document.getElementById('true')
	document.getElementById('customerNot').addEventListener('change', function() {
		console.log(this)
		hidden.style.display = this.checked ? 'none' : 'none'
		console.log("Null",document.getElementById("nullMultiple"))

	})
})
window.addEventListener('load', function() {
	const hidden = document.getElementById('true1')
	document.getElementById('customerNot').addEventListener('change', function() {
		console.log(this)
		hidden.style.display = this.checked ? 'none' : 'none';
		hiden.style
		
	})
})
window.addEventListener('load', function() {
	const hidden = document.getElementById('true2')
	document.getElementById('customerNot').addEventListener('change', function() {
		console.log(this)
		hidden.style.display = this.checked ? 'none' : 'none'
	})
})

/* $(".customerNot").click(function(){
	
	

		 if($(".customerNot").length == $(".customerNot:checked").length) {
			 $("#nullMultiple").removeAttr("checked");
		} else {
			$("#nullMultiple").removeAttr("checked");
		} 

	});
}); */

/* $(function(){


	// if all checkbox are selected, check the selectall checkbox
	// and viceversa
	$(".nullMultiple").click(function(){

		if($(".nullMultiple").length == $(".nullMultiple:checked").length) {
			$("#customerNot").removeAttr("checked");
		} else {
			$("#selectall").removeAttr("checked");
		}

	});
}); */

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

<%
int che=0;
String check=(String)session.getAttribute("check");
DAO dao=new DAO();
ArrayList<String> list=new ArrayList<String>();
if(check.equals("questions")){
list=dao.getQuestions();
che=1;
}
else
{
	String breakLine[]=check.split("\t");
list=dao.getUpdateData(breakLine[1]);
}
%>

<form action="TextStore">

<div class="col-sm-9 col-md-6 col-lg-12">
<table class="table">

  <thead class="thead-dark">
    <tr>
      <th scope="col">#</th>
      <th scope="col">Questions</th>
      <th scope="col">Answers</th>
    </tr>
  </thead>
  
  <tbody>
    
    <%
    int z=1;
    ArrayList<String> tempList=new ArrayList<String>();
    String line1[];
    String line2[];
    for(int i=0; i<list.size(); i++){
    String line[]=list.get(i).split("\t");
    int flag=0;
    %>
      <tr>
      <th scope="row"><%
      if(z==10){
    	  out.println("<div id=true2 style=display:none>"+z+"</div>"); 
      }
      else 
    	  out.println(z);
      %></th>
      <td><% 
      if(!tempList.isEmpty()){
    	  line=tempList.get(0).split("\t");
    	  out.println("<div id=true style=display:none>"+line[0]+"</div>");
      }
      else
      out.println(line[0]); %></td>
      <td>
      <% 
      if(line[1].equals("null")){
      %>
      <input type="text" name="<%= z-1 %>" value="<% if(3<line.length)out.println(line[3]); %>" required>
      <%
      }
      
      else if(line[2].equals("Single")) {
    	  int k=0;
    	  if(line[1].equals("Yes")){
    	      flag=z;
    	      line1=list.get(i+1).split("\t");
    	      if(line1[0].equals(line[0]) && i+1<list.size()){
    	    	 line1=list.get(i+2).split("\t");
    	    	 tempList.add(list.get(i+2));
    	    	 k++;
    	      }
    	      
    	      if(!line1[0].equals(line[0])){
    	    	  if(!list.get(i+3).isEmpty()){
    	    		  line1=list.get(i+3).split("\t");
    	    		  tempList.add(list.get(i+3));
    	    		  k++;
    	    		  if(!list.get(i+4).isEmpty()){
    	    			  line2=list.get(i+4).split("\t");
    	    			  if(line2[0].equals(line1[0])){
        	    		  	line1=list.get(i+4).split("\t");
        	    		  	tempList.add(list.get(i+4));
        	    		  	 /*  k++; */  
        	    		  	if(!list.get(i+5).isEmpty()){
          	    			  line2=list.get(i+5).split("\t");
          	    			  if(line2[0].equals(line1[0])){
              	    		  	line1=list.get(i+5).split("\t");
              	    		  	tempList.add(list.get(i+5));
              	    		  	
              	    		  if(!list.get(i+6).isEmpty()){
            	    			  line2=list.get(i+6).split("\t");
            	    			  if(line2[0].equals(line1[0])){
                	    		  	line1=list.get(i+6).split("\t");
                	    		  	tempList.add(list.get(i+6));
            	    			  }
                	    	  	}
          	    			  }
              	    	  	}
    	    			  }
        	    	  }
    	    	  }
    	      }
    	  }
    	  if(flag==z){
      %>
      
      <input id="customer" type="radio" name="<%=z-1 %>" value="1" required <%if(3<line.length && line[3].equals("1"))out.println("checked"); %> ><% out.println(" "+line[1]); %>
      <%} else{ %>
      <input id=<%out.println(z); %> type="radio" name="<%=z-1 %>" value="1" required <%if(3<line.length &&line[3].equals("1"))out.println("checked"); %> ><% out.println(" "+line[1]); %>
      <%
      }
      int s=2;
      	for(int j=i; j<list.size(); j++){
      		String nextLine[]=new String[5];
      		if(i+1<list.size()){
      		nextLine=list.get(i+1).split("\t");}
      		if(line[0].equals(nextLine[0])){
      			if(flag==z){
      %>
      <input id="customerNot" type="radio" name="<%=z-1 %>" value="<%=s %>" required <%if(3<line.length && line[3].equals(s+""))out.println("checked"); %> ><% out.println(" "+nextLine[1]); %>
      <%
      			}
      			else{
      %>
      <input id="<%out.println(z); %>" type="radio" name="<%=z-1 %>" value="<%=s %>" required <%if(3<line.length && line[3].equals(s+""))out.println("checked"); %>><% out.println(" "+nextLine[1]); %>
      <%}
      s++;			
      i++;
    	    }
      	 }
      i+=k;
      }
      else if(line[2].equals("Numerical")){
      %>
      
      <input type="radio" name="<%=z-1 %>" value="1" required <%if(3<line.length && line[3].equals("1"))out.println("checked"); %> ><% out.println(" "+line[1]); %>
      
      <%
      int s=2;
      	for(int j=i; j<list.size(); j++){
      		
      		String nextLine[]=new String[5];
      		if(i+1<list.size()){
      		nextLine=list.get(i+1).split("\t");}
      		if(line[0].equals(nextLine[0])){
      %>
      <input type="radio" name="<%=z-1 %>" value="<%=s %>" required <%if(3<line.length && line[3].equals(s+""))out.println("checked"); %>><% out.println(" "+nextLine[1]); %>
      <% 
      s++;			
      i++;
    	    }
      	 }
      }
      else if(line[2].equals("Multiple")){
    	  String breakLin[]=null;
    	  if(3<line.length){
    	  breakLin=line[3].split(",");
    	  }
    	  int v=1;
    	  if(!tempList.isEmpty()){
    		  %>
    		  <label id="true1" style="display:none">
    		  <input class="nullMultiple" id="nullMultiple" type="checkbox" name="<%=z-1+"_1" %>" <%if(breakLin!=null && 0<breakLin.length && line[3].contains("a"))out.println("checked"); %> ><% out.println(" "+line[1]); %>
    		  
    		  <%
    		  int s=2;
      	for(int q=0; q<tempList.size(); q++){
      		String nextLine[]=new String[5];
      		if(q+1<tempList.size()){
      		nextLine=tempList.get(q+1).split("\t");}
      		if(line[0].equals(nextLine[0])){
      %>
      <input class="nullMultiple" id="nullMultiple1" type="checkbox" name="<%=z-1+"_"+s %>" <%
      String ch=null;
      if(v==1){
    	  ch="b";
      }
      else if(v==2)
    	  ch="c";
      else if(v==3)
    	  ch="d";
      else if(v==4)
    	  ch="e";
      if ( breakLin!=null && line[3].contains(ch))
    	  out.println("checked"); 
      %> ><% out.println(" "+nextLine[1]);  
      			  s++;  
    	    }
      		v++;
      	 }
    		  %>
    		  </label>
    		  <%
    		   tempList=new ArrayList<String>(); 
    	  }
    	  else{
      %>
      
      <input type="checkbox" name="<%=z-1+"_1" %>" <%if(breakLin!=null && 0<breakLin.length && line[3].contains("a"))out.println("checked"); %> ><% out.println(" "+line[1]); %>
      
      <%
       v=1;
      int s=2;
      	for(int j=i; j<list.size(); j++){
      		String nextLine[]=new String[5];
      		if(i+1<list.size()){
      		nextLine=list.get(i+1).split("\t");}
      		if(line[0].equals(nextLine[0])){
      %>
      <input type="checkbox" name="<%=z-1+"_"+s %>" <%
      /* if(v<breakLin.length)
      System.out.println(v+"\t"+breakLin[v]); */
      String ch=null;
      if(v==1){
    	  ch="b";
      }
      else if(v==2)
    	  ch="c";
      else if(v==3)
    	  ch="d";
      else if(v==4)
    	  ch="e";
      if(breakLin!=null && line[3].contains(ch))
    	  out.println("checked"); 
      %> ><% out.println(" "+nextLine[1]); %>
      <% 
      v++;
      s++;			
      i++;
    	    }
      	 }
      }
      }
      %>
      </td>
      </tr>
      
      <%
      z++;
    }
      %>
      
  </tbody>
</table>

	<div class="row justify-content-center">
		<input type="submit" class="btn btn-dark" value="Submit" >
	</div>
</div>
</form>
<!-- 
<div>
        <label><input id="customerId" type="radio" name="colorRadio" value="red"> red</label>
        <label id="customerId1"><input id="companyId" type="radio" name="colorRadio" value="green"> green</label>
        <label><input id="customerId2" type="radio" name="colorRadio" value="blue"> blue</label>
        <label id="customerId3" style="display:none"><input type="radio" name="colorRadio" value="blue"> green</label>
    </div> -->

</body>
</html>