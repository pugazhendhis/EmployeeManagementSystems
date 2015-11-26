<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
             <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>


<head>

<script>


function validateUserData()
{
	 
	    var flag=0; 
		var  email;
 		 
  		email=document.getElementById("email").value;

		if((email=="")||(email==null))
		{
			document.getElementById("mailerr").innerHTML="Email id shouldn't be empty";
			return false;
		}
		else if(!email.match(/^[\w\-\.\+]+\@[a-zA-Z0-9\.\-]+\.[a-zA-z0-9]{2,4}$/))
		{
			document.getElementById("mailerr").innerHTML="Enter valid Email Id ex:something@somthing.com";
			flag=1
			return false;
		}
		else
		{
			document.getElementById("mailerr").innerHTML="";
	 
		}
	  		
		return true;
}
 
</script>

 
 <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	<link rel="stylesheet" type="text/css" href="resources/employee-stylesheet/ResetPassword.css">
  
  <title>Reset Password</title>
  
</head>
<body>


<div class="container" id="center">
 

     	<div class="col-sm-2" id="topleft">
     	   <div id="innertopleft">
  			<img src="resources/images/mylogo.png" height="150" width="200px"/>
  			</div>	
  		</div>

  		<div class="col-sm-10" id="topright">
   			<center><h2 id="comp">Prodigy Software Solution</h2></center>
  			<center><p id="comp"><strong><em>Innovation starts from you.</em></strong></p></center>
  		</div>

 		<div class="col-sm-12" id="topest">
	  		<div  id="top">
        		<!-- <p ><b>Note: </b>im at top</p> --> 
      		</div>
      </div>
		

  		<div class="container" id="innercenter">
 

     		<div class="col-sm-2" id="topinnerleft">
  	 
  	   		</div>

  			<div class="col-sm-10" id="topinnerright">
  				
  				  <c:set var="passwordReset" value="${requestScope.recoveryError}"></c:set>
  				  <center><p style="color:red"><c:out value="${passwordReset}"></c:out></p></center>
  				  <c:set var="resetLink" value="${requestScope.resetLink}"></c:set>
  				  <center><p style="color:red"><c:out value="${resetLink}"></c:out></p></center>		 
  				  		 
  			<form class="form-horizontal" action="/PasswordReset"  method="post" onsubmit="return validateUserData()">

                 <!--  <div class="form-group">
                    <label for="employeeId" class="control-label col-xs-4">Employee Id</label>
                        <div class="col-xs-6">
                            <input type="text" class="form-control" name="employeeId" id="employeeId" placeholder="EmployeeId">
                        </div>
                  </div>
        
  						<center><h3><em>OR</em></h3></center>        
         -->          
                  <div class="form-group">
                      <label for="email" class="control-label col-xs-4">Email</label>
                      <div class="col-xs-6">
                          <input type="text" class="form-control" name="email" id="email" placeholder="Email">
                      </div>
                  </div>
 
                   <div class="form-group">
                      <div class="col-xs-offset-4 col-xs-10">
                          <button type="submit" class="btn btn-primary">Recovery</button>
                          <button type="reset" class="btn btn-primary">Reset</button>
                          
                      </div>
                  </div>
         
              </form>
  				 
  				 	
  			</div>
 
		</div>

		<div class="container" id="bottomcenter">
 

     		<div class="col-sm-2" id="bottominnerleft">
  				 	
  			</div>

  			<div class="col-sm-10" id="bottominnerright">
  				<center><p id="comp">&copy; 2015 Prodigy Software Solution</p></center>	
  			</div>
 
		</div>


</div>

<p id="mailerr"></p>
</body>


</html>