<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
         <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Trainee Salary</title>



<script>
function validateData()
{
  
   
      var flag=0,convert;
      var basicSalary,incent,providentFund;
     
 
    convert=document.getElementById("basicSalary").value;
    basicSalary=convert.toString();
    
/*    convert=document.getElementById("incentives").value;
    incent=convert.toString();
    
     convert=document.getElementById("providentFund").value;
    providentFund=convert.toString();
   */  
    if((basicSalary=="")||(basicSalary==null))
    {
       
      
       document.getElementById("basicErr").innerHTML="basicSalary shouldn't be empty";
      return false; 
    }
    else if(!basicSalary.match(/^[0-9]+$/))
    {
      document.getElementById("basicErr").innerHTML="basicSalary should number values";
      flag=1
      return false;
    }
    else
    {
      document.getElementById("basicErr").innerHTML="";
       
    }
  
    
          
         return true; 
 
}
        
</script>


<style>

#basicErr 
{
  color: red;
  position: absolute;
  top: 639px;
  left: 810px;

}

#incentErr 
{
  color: red;
  position: absolute;
  top: 685px;
  left: 810px;

}

/* #pfErr 
{
  color: red;
  position: absolute;
  top: 738px;
  left: 810px;

}
 */
 

</style>




<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="resources/stylesheet/traineeSalary.css">

</head>
<body>


<div class="container" id="center">
 

     	<div class="col-sm-2" id="topleft">
  			<img src="resources/images/mylogo.png" height="150" width="200px"/>	
  		</div>

  		<div class="col-sm-10" id="topright">
  			 <%-- <div id="employee"><%="Welcome, "+session.getAttribute("user") %></div> --%>
  			  <div id="employee" style="color:#F0FFF0">Welcome, <c:set var="userName" value="${sessionScope.user}" />
  				<c:out value="${userName}" />
   			</div>
  			<center><h2 id="comp">Prodigy Software Solution</h2></center>
  			<center><p id="comp"><strong><em>Innovation starts from you.</em></strong></p></center>
  		</div>

 		
		<div class="col-sm-12" id="topest">
	  		<div  id="top">
        		  
      		</div>
      </div>
		
		
  		<div class="container" id="innercenter">
 

     		<div class="col-sm-2" id="topinnerleft">
  					
  					<ul class="nav-stacked">
              <li class="active"><a href="/login">Home</a></li>
              <li class="dropdown">
                  <a class="dropdown-toggle" data-toggle="dropdown" href="#">Recruitment <span class="caret"></span></a>
                  <ul class="dropdown-menu">
                    <li><a href="/hireemployee">Employee</a></li>
                    <li><a href="/hiretrainee">Trainee</a></li>
                  </ul>
            </li>
            <li><a href="/layoffemployee">LayOff</a></li>
            <li><a href="/manpower">All Employee</a></li>
            <li><a href="/leaveapprove">Leave Approval</a></li>
            <li class="dropdown">
                  <a class="dropdown-toggle" data-toggle="dropdown" href="#">Generate Salary <span class="caret"></span></a>
                  <ul class="dropdown-menu">
                    <li><a href="/employeesalary">Employee</a></li>
                    <li><a href="/traineesalary">Trainee</a></li>
                  </ul>
            </li>
            <li><a href="/homePage">LogOut</a></li>
        </ul>
        		 
  			</div>

  			<div class="col-sm-10" id="topinnerright">
  				 
  				
  			 <form id="salary" class="form-horizontal" action="computetraineesalary" method="post" onsubmit="return validateData()">
  				     
  				     
  				  <div class="form-group">
                    <label for="basicSalary" class="control-label col-xs-4">Basic Pay</label>
                        <div class="col-xs-6">
                            <input type="text" class="form-control" name="basicSalary" id="basicSalary" placeholder="BasicSalary">
                        </div>
                  </div>
        
                  <div class="form-group">
                    <label for="incentives" class="control-label col-xs-4">Incentives</label>
                        <div class="col-xs-6">
                            <input type="text" class="form-control" name="incentives" id="incentives" placeholder="Incentives">
                        </div>
                  </div>
                   
<!--                    <div class="form-group">
                    <label for="ProvidentFund" class="control-label col-xs-4">Provident Fund Rate</label>
                        <div class="col-xs-6">
                            <input type="text" class="form-control" name="providentFund" id="providentFund" placeholder="Provident Fund Rate">
                        </div>
                  </div>
 -->                  
        		<div class="form-group">
                      <div class="col-xs-offset-4 col-xs-10">
                          <button type="submit" class="btn btn-primary">Generate</button>
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

<p id="basicErr"></p>
<p id="incentErr"></p>
<p id="pfErr"></p>


</body>



</html>