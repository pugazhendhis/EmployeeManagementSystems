<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

	    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
  
  
<html lang="en">
<head>
    <title>Login</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="resources/stylesheet/index.css">
<!--     <script src="testlogin.js"></script>
 -->
</head>
<body>


  <div class="wrapper" id="wrapper" >
    <form id="form" method="post" action="/login" class="form-signin col-md-3">       
      <fieldset>
          <legend>Login</legend>
         	      <input type="text" class="form-control" name="userName" id="userName" placeholder="Email Address" autofocus="" />&nbsp;&nbsp;
      		      <input type="password" class="form-control" name="password" id="password"  placeholder="Password" />&nbsp;&nbsp;      
      	 	       <button id="buttoncolor" class="btn btn-lg btn-primary btn-block" type="submit">Login</button>   
                 <p id="link"><a href="/forgotpassword">Forgot Password?</a></p>
                <p id="link" style="color:red">
                
                 <c:set var	="Error" value="${requestScope.loginError}"></c:set>
 				 <c:out value="${Error}"></c:out></p>
 
                 <%-- <%if(request.getAttribute("loginError")!=null)
                   {
                      out.print(request.getAttribute("loginError"));
                   }
                                      %></p> --%>
      </fieldset>  
    </form>
  </div>



 
</body>
</html>
 
 
 
   
  

 
 
 
 
  