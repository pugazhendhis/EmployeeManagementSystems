<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
         <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
        <%@ page import="com.google.appengine.api.datastore.Entity" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Leave Details</title>
 
 
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="resources/employee-stylesheet/LeaveDetails.css">

</head>
<body>


<div class="container" id="center">
 

     	<div class="col-sm-2" id="topleft">
  			<img src="resources/images/mylogo.png" height="150" width="200px"/>	
  		</div>

  		<div class="col-sm-10" id="topright">
  			<%-- <div id="employee"><%="Welcome, "+session.getAttribute("user") %></div> --%>
  			  <div id="employee" style="color:#F0FFF0">Welcome, <c:set var="userName" value="${sessionScope.user}" />
  				<c:out value="${userName}"/> 
 			</div>  			
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
  				 
  				        <ul>
  					         <li><a href="/myhome">Home</a></li>
  					         <li><a href="/myprofile">Profile</a></li>
  					         <li><a href="/applyleave">Leave Request</a></li>
  					         <li><a href="/myleavedetails">Leave Details</a></li>
  					         <li><a href="/salary">MySalary</a>
  					         <li><a href="/homePage">LogOut</a></li>
  	 	 		        </ul>
  			       </div>

  			       <div class="col-sm-10 bs-example" id="topinnerright">
                 
                 <div id="tableview">
                 
                 <c:set var="leaveRecord" value="${requestScope.leaveEntity}"></c:set>
                 <c:set var="employeeRecord" value="${requestScope.employeeEntity}"></c:set>
 				
                 
     			<center><table class="LeaveDetails">
  				<tbody>
  					
  					<tr>
  				 		<th colspan="2"><center>Employee Leave Details </center></th></tr>
  				 		
  				 		
  				 	
  						<tr><td>Employee Id</td><td><c:out value="${employeeRecord.properties.EmployeeId}"></c:out></td></tr>
 						<tr><td>First Name</td><td><c:out value="${employeeRecord.properties.FirstName}"></c:out></td></tr>
  						<tr><td>Last Name</td><td><c:out value="${employeeRecord.properties.LastName}"></c:out></td></tr>
 						<tr><td>Leave Balance</td><td><c:out value="${leaveRecord.properties.LeaveBalance}"></c:out></td></tr>
  						<tr><td>LOP Days</td><td><c:out value="${leaveRecord.properties.LOPDays}"></c:out></td></tr>	
   			 	 	
  				</tbody>
  				</table></center>
    					       	
  			</div>
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