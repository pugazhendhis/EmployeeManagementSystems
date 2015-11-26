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
	 
	    var flag=0,convert;
		var newPassword,confirmPassword;
 		 
		newPassword=document.getElementById("newPassword").value;
		 
		confirmPassword=document.getElementById("confirmPassword").value;
		
		var loginPassword,conformLoginPassword;
		loginPassword=newPassword.toString();
		conformLoginPassword=confirmPassword.toString();
		if((newPassword=="")||(newPassword==null))
		{
			document.getElementById("pass").innerHTML="Password shouldn't be empty";
			return false;
		}
		else
		{
			document.getElementById("pass").innerHTML="";
			 
		}
 		if((confirmPassword=="")||(confirmPassword==null))
 		{
 			document.getElementById("conformpass").innerHTML="Confirm Password shouldn't be empty";
 			return false;
 		}
 		else
		{
			document.getElementById("conformpass").innerHTML="";
			 
		}
        if(loginPassword.equals(conformLoginPassword)==true)
        {
        	document.getElementById("passequal").innerHTML="";
        }
        else
        {
        	document.getElementById("passequal").innerHTML="Password didn't match";
        	return false;
        }
 		return true;

}
</script>


 	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	<link rel="stylesheet" type="text/css" href="resources/employee-stylesheet/ResetPassword.css">
  
  <title>Change Password</title>
  
</head>
<body>


<div class="container" id="center">
 

     	<div class="col-sm-2" id="topleft">
     	   <div id="innertopleft">
  			<img src="resources/images/mylogo.png" height="150" width="200px"/>
  			</div>	
  		</div>

  		<div class="col-sm-10" id="topright">
   			<center><h2 id="comp">Prodigy Software Solution</h2> </center>
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
  				 
  				 
  				  <c:set var="passwordUpdate" value="${requestScope.success}"></c:set>
  				  <center><p style="color:red"><c:out value="${passwordUpdate}"></c:out></p></center>
  				  
  				  <c:set var="passwordmismatch" value="${requestScope.mismatch}"></c:set>
  				  <center><p style="color:red"><c:out value="${passwordmismatch}"></c:out></p></center>
  				 
  				 
  			<form class="form-horizontal" action="/Resetsuccess"  method="post" onsubmit="return validateUserData()">

                  <div class="form-group">
                    <label for="newPassword" class="control-label col-xs-4">New Password</label>
                        <div class="col-xs-6">
                            <input type="password" class="form-control" name="newPassword" id="newPassword" placeholder="Enter New Password">
                        </div>
                  </div>
        
  		           
                  <div class="form-group">
                    <label for="confirmPassword" class="control-label col-xs-4">Confirm Password</label>
                        <div class="col-xs-6">
                            <input type="password" class="form-control" name="confirmPassword" id="confirmPassword" placeholder="Confirm Passsword">
                        </div>
                  </div>
        
                   <div class="form-group">
                      <div class="col-xs-offset-4 col-xs-10">
                          <button type="submit" class="btn btn-primary">Change Password</button>
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
<p id="pass"></p>
<p id="conformpass"></p>
</body>


</html>