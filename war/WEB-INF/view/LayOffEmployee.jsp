<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
         <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
    
            <%@ page import="java.util.List" %>
<%@ page import="com.google.appengine.api.datastore.Entity" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>LayOff employee</title>



<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="resources/stylesheet/Layoff.css">

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
  			<center><h2>Prodigy Software Solution</h2></center>
  			<center><p><strong><em>Innovation starts from you.</em></strong></p></center>
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

  			<div class="col-sm-10" id="topinnerright">
  				 	<h3>LayOff Employee</h3>
  				
  				<center><table class="layOff">
  					<tbody>
  						<tr>
  							<th>EmployeeId </th>
  							<th>First Name</th>
  							<th>Last Name</th>
  							<th> Email </th>
  							<th>DateOfBirth</th>
   							<th>Designation </th>
  					 		<th colspan="2">LayOff </th>
  				  		</tr>
  					 
  				
  				
  						   <c:set var="entity" value="${requestScope.layOffEmployee}"></c:set>
 
 						   <c:choose>
 						    <c:when test="${entity==null}">
 	 							<p style="color:red">There is no Records Found</p>
 							</c:when>
 	
 							<c:otherwise>
 						 	<tr>	 
 								<td><c:out value="${entity.properties.EmployeeId}"></c:out></td>
 								<td><c:out value="${entity.properties.FirstName}"></c:out></td>
 								<td><c:out value="${entity.properties.LastName}"></c:out></td>
 								<td><c:out value="${entity.properties.Email}"></c:out></td>
 								<td><c:out value="${entity.properties.DateOfBirth}"></c:out></td>
 								<td><c:out value="${entity.properties.FirstName}"></c:out></td>
 								<td><a href="layoff/<c:out value="${entity.properties.EmployeeId}"></c:out>">LayOff</a></td>
 							</tr>				
  							</c:otherwise>
 	 
 			    </c:choose>
   	
  	 				
  				 	</tbody>
  				</table></center>
  				 
  				   				 	
  			</div>
 
		</div>

		<div class="container" id="bottomcenter">
 

     		<div class="col-sm-2" id="bottominnerleft">
  	
  			</div>

  			<div class="col-sm-10" id="bottominnerright">
  			<center><p>&copy; 2015 Prodigy Software Solution</p></center>	
  			</div>
 
		</div>


</div>

</body>
 
</html>