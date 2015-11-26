<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
         <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
    
    <%@ page import="java.util.List" %>
<%@ page import="com.google.appengine.api.datastore.Entity" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<head>

<title>All Employee</title>
 

<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="resources/stylesheet/AllEmployee.css">

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
  			<center><p id="comp"><strong><em>Innovation starts from you.</em></strong><p></center>
  		</div>

 		<div class="col-sm-12" id="topest">
	  		<div  id="top">
        		<!-- <p ><b>Note: </b>im at top</p> --> 
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

			<!-- <div style="background-color: #ADD8E6"><a href="">Trainee Records</a><a href="">Employee Records</a></div> -->
  			<div class="col-sm-10" id="topinnerright">
  				<!-- <p><b>Note: </b>im at inner right</p> -->
  				
  				<h3>Employee Records</h3>
  				
  				<table class="employee">
  					<tbody>
  						<tr>
  							<th>EmployeeId</th>
  							<th>FirstName</th>
  							<th>LastName</th>
  							<th>DOB</th>
  							<th>Gender</th>
  							<th>Mobile</th>
  							<th>Email</th>
  							<th>Designation</th>
  							<th>DOJ</th>
  							<!-- <th>LeaveBalance</th> 
  							<th>LOP</th> --> 
  							
  						</tr>
  					 
  				 	<c:forEach items="${requestScope.employeeRecord}" var="entity">
 
 					<tr>
 					<td><c:out value="${entity.properties.EmployeeId}"></c:out></td>
 					<td><c:out value="${entity.properties.FirstName}"></c:out></td>
  					<td><c:out value="${entity.properties.LastName}"></c:out></td>
 					<td><c:out value="${entity.properties.DateOfBirth}"></c:out></td>
   					<td><c:out value="${entity.properties.Gender}"></c:out></td>
 					<td><c:out value="${entity.properties.Mobile}"></c:out></td>
                    <td><c:out value="${entity.properties.Email}"></c:out></td>
   					<td><c:out value="${entity.properties.Designation}"></c:out></td>
 					<td><c:out value="${entity.properties.DateOfJoin}"></c:out></td>
 					
 					 				
 					</tr>
 					
 					</c:forEach>
  	
   				</tbody>
  				</table>
  				
  					<h3>Trainee Records</h3>
  					
  					
  					
  				 <table class="trainee">
  					<tbody>
  						<tr>
  							<th>EmployeeId</th>
  							<th>FirstName</th>
  							<th>LastName</th>
  							<th>DOB</th>
  							<th>Gender</th>
  							<th>Mobile</th>
  							<th>Email</th>
  							<th>Designation</th>
  							<th>Date of join</th>
  							<th>Duration</th>
   							
  						</tr>
  					
  					 
    			
  				<c:forEach items="${requestScope.traineeRecord}" var="traineeEntity">
 
 					<tr>
 					<td><c:out value="${traineeEntity.properties.EmployeeId}"></c:out></td>
  			 		<td><c:out value="${traineeEntity.properties.FirstName}"></c:out></td>
  					<td><c:out value="${traineeEntity.properties.LastName}"></c:out></td>
 					<td><c:out value="${traineeEntity.properties.DateOfBirth}"></c:out></td>
   					<td><c:out value="${traineeEntity.properties.Gender}"></c:out></td>
 					<td><c:out value="${traineeEntity.properties.Mobile}"></c:out></td>
                    <td><c:out value="${traineeEntity.properties.Email}"></c:out></td>
   					<td><c:out value="${traineeEntity.properties.Designation}"></c:out></td>
 					<td><c:out value="${traineeEntity.properties.DateOfJoin}"></c:out></td>
 					<td><c:out value="${traineeEntity.properties.Duration}"></c:out></td>
 					
  					</tr>
  				</c:forEach>	
  	 	</tbody>
  				</table>
  					
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

</body>



 </html>