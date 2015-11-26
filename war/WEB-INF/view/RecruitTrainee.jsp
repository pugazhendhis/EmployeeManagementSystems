<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
         <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Recruit trainee</title>

 <script  src="resources/script/Recruittrainee.js"></script>

  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

	<link rel="stylesheet" type="text/css" href="resources/stylesheet/Recruittrainee.css">

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
  			<center><p  id="comp"><strong><em>Innovation starts from you.</em></strong></p></center>
  		</div>

 		
 		<div class="col-sm-12" id="topest">
	  		<div  id="top">
<!--         		<p ><b>Note: </b>im at top</p> --> 
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


                 <div class="col-sm-10 bs-example" id="topinnerright">
                 
 
                 <c:set var="traineeEntity" value="${requestScope.traineeEntityError}"></c:set>
  		           	<c:choose>
 						<c:when test="${traineeEntity!=null}">
 	 						<center><p style="color:red"><c:out value="${traineeEntity}"></c:out></p></center>
 						</c:when>
 	 
 					<c:otherwise>
 						 
 					</c:otherwise>
 	
 				</c:choose>
 


            <!-- <div class="bs-example" id="formalign"> -->
               <form class="form-horizontal" action="/addtrainee" name="recruit" method="post" onsubmit="return validateUserData()">

                  <div class="form-group">
                    <label for="employeeId" class="control-label col-xs-4">Employee Id</label>
                        <div class="col-xs-6">
                            <input type="text" class="form-control" name="employeeId" id="employeeId" placeholder="EmployeeId">
                        </div>
                  </div>
        
                  <div class="form-group">
                    <label for="firstName" class="control-label col-xs-4">First Name</label>
                        <div class="col-xs-6">
                            <input type="text" class="form-control" name="firstName" id="firstName" placeholder="FirstName">
                        </div>
                  </div>
        
                  <div class="form-group">
                      <label for="lastName" class="control-label col-xs-4">Last Name</label>
                          <div class="col-xs-6">
                              <input type="text" class="form-control" name="lastName" id="lastName" placeholder="LastName">
                          </div>
                  </div>


                  <div class="form-group">
                      <label for="dateOfBirth" class="control-label col-xs-4">Date Of Birth</label>
                          <div class="col-xs-6">
                            <input type="date" class="form-control" name="dateOfBirth" id="dateOfBirth" placeholder="Date Of Birth">
                          </div>
                  </div>
          
                  <div class="form-group">
                      <label for="gender" class="control-label col-xs-4">Gender</label>
                      <div class="col-sm-1" >
                           
                          <input type="radio" class="form-control" name="gender" id="gender" value="Male">Male<br>
                          
                      </div>

                      <div class="col-sm-1">
                           
                          <input type="radio" class="form-control" name="gender" id="gender" value="Female">Female<br>
                          
                      </div>


                  </div>
                  
                  

                  <div class="form-group">
                      <label for="mobile" class="control-label col-xs-4">Mobile</label>
                      <div class="col-xs-6">
                          <input type="text" class="form-control" name="mobile" id="mobile" placeholder="Mobile">
                      </div>
                  </div>
        

                  <div class="form-group">
                      <label for="email" class="control-label col-xs-4">Email</label>
                      <div class="col-xs-6">
                          <input type="text" class="form-control" name="email" id="email" placeholder="Email">
                      </div>
                  </div>

					
					
				<div class="form-group">
                    <label for="city" class="control-label col-xs-4">City</label>
                        <div class="col-xs-6">
                            <input type="text" class="form-control" name="address.city" id="city" placeholder="City">
                        </div>
                  </div>
        	
				<div class="form-group">
                    <label for="state" class="control-label col-xs-4">State</label>
                        <div class="col-xs-6">
                            <input type="text" class="form-control" name="address.state" id="state" placeholder="State">
                        </div>
                  </div>
        		
					
					
					
						
                  <div class="form-group">
                      <label for="designation" class="control-label col-xs-4">Designation</label>
                      <div class="col-xs-6">
                          <input type="text" class="form-control" name="designation" id="designation" placeholder="Designation">
                      </div>
                  </div>
        

                  <div class="form-group">
                      <label for="dateOfJoin" class="control-label col-xs-4">Date Of Join</label>
                      <div class="col-xs-6">
                          <input type="date" class="form-control" name="dateOfJoin" id="dateOfJoin" placeholder="Date Of Join">
                      </div>
                  </div>
                  
                  <div class="form-group">
                      <label for="duration" class="control-label col-xs-4">Duration</label>
                      <div class="col-xs-6">
                          <input type="text" class="form-control" name="duration" id="duration" placeholder="Duration">
                      </div>
                  </div>
          
                  <div class="form-group">
                      <label for="leaveBalance" class="control-label col-xs-4">Leave Balance</label>
                      <div class="col-xs-6">
                          <input type="text" class="form-control" name="leaveBalance" id="leaveBalance" placeholder="Leave Balance">
                      </div>
                  </div>
        
                
                  <div class="form-group">
                      <div class="col-xs-offset-4 col-xs-10">
                          <button type="submit" class="btn btn-primary">Hire</button>
                          <button type="reset" class="btn btn-primary">Reset</button>
                      </div>
                  </div>
         
              </form>
          </div>




  			<!-- <div class="col-sm-10" id="topinnerright">
  				<p><b>Note: </b>im at inner right</p>	
  			</div>
  -->
		</div>

		<div class="container" id="bottomcenter">
 

     		<div class="col-sm-2" id="bottominnerleft">
 	
  			</div>

  			<div class="col-sm-10" id="bottominnerright">
 <center><p id="comp">&copy; 2015 Prodigy Software Solution</p></center>	
  			</div>
 
		</div>


</div>



<p id="iderr"></p>
<p id="fnameerr"></p>
<p id="lnameerr"></p>
<p id="doberr"></p>
<p id="dojerr"></p>
<p id="gendererr"></p>
<p id="salerr"></p>
<p id="mailerr"></p>
<p id="leaverr"></p>
<p id="moberr"></p>
<p id="cityerr"></p>
<p id="stateerr"></p>
<p id="desigerr"></p> 
<p id="durationerr"></p>


</body>
 
 
 


</html>