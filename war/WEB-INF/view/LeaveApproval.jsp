<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
         <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
    
        <%@ page import="java.util.List" %>
<%@ page import="com.google.appengine.api.datastore.Entity" %>
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<style>


body
{
  padding: 80px;  
}

#comp
{
  color: #F0FFF0;
}


#employee
{
	float:right;
}

   
#center
{
  padding: 0px;
  border: 2px solid #a1a1a1;   
}


 #topleft
 {
  padding: 0px;
  height:150px;   
  background-color: #FFFFFF;   
   
 }

#topright
{
  height:150px;   
  background-color: #A52A2A ;   
}


#topest
{
	height:300px;
	 
	background-image: url("http://goo.gl/SSq4BU");
}

 
#topinnerleft
{
  height: 600px;
  background-color: #DCDCDC;   
} 

#topinnerright 
{
 
 width: 972px;
 height: 600px;
 padding-top:100px;
 background-color: #FFFFFF;
 border: 2px solid #a1a1a1;   

}

#innercenter
{
  padding: 0px;
}


#bottominnerleft
{
  height:50px; 
  background-color: #080000;   
} 

#bottominnerright
{
  width: 972px;	     
  height:50px;   
  background-color: #080000;    
}

#bottomcenter
{
  padding: 0px;
}

ul li
{
  line-height: 40px;
  list-style-type: none;
  
}

ul li a
{
  text-decoration: none;
  color: #FFFFFF;
  color: black;
}


.leaveapproved {
font-family: sans-serif;
-webkit-font-smoothing: antialiased;
font-size: 115%;
width: auto;
overflow: auto;
display: block;
}
.leaveapproved th {
background-color: rgb(112, 196, 105);
font-weight: normal;
color: white;
padding: 5px 5px;
text-align: center;
}
.leaveapproved td {
background-color: rgb(238, 238, 238);
padding: 5px 5px;
color: rgb(111, 111, 111);
}
 
</style>


<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Leave Approval</title>
 
 
 <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
 
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
  				<!-- <p><b>Note: </b>im at inner right</p> -->
  				
  				
  				
  			<!-- <form id="leaveForm" method="post" action="onsubmit="redirect()""> -->
  				<h3>Employee Leave Requests</h3>
  				
  				<center><table class="leaveapproved">
  					<tbody>
  						<tr>
  							<th><center>EmployeeId</center></th>
  							<th><center>Email</center></th>
  							<th><center>From Date</center></th>
  							<th><center>To Date</center></th>
  							<th><center>Leave Type</center></th>
  							<th colspan="2"><center>Action</center></th>
  				  		</tr>
  
							 		<c:set var="leave" value="${requestScope.leaveRequest}"></c:set>
 
									<c:choose>
 										<c:when test="${leave==null}">
 	 										<p style="color:red">There is no leave Request</p>
 										</c:when>
 	
 										<c:otherwise>
 										
 										
 					<c:forEach items="${leave}"  var="entity">
 
 					<tr>
 					 <td><c:out value="${entity.properties.EmployeeId}"></c:out></td>
 				     <td><c:out value="${entity.properties.Email}"></c:out></td>
   					 <td><c:out value="${entity.properties.FromDate}"></c:out></td>
 					 <td><c:out value="${entity.properties.ToDate}"></c:out></td>
 					 <td><c:out value="${entity.properties.LeaveType}"></c:out></td>
   					<td><a href="leaveRequestApproved/<c:out value="${entity.properties.Email}"></c:out>/<c:out value="${entity.properties.EmployeeId}"></c:out>">Approve</a></td>
  					<%-- <td><a href="leaveDeclined/<c:out value="${entity.properties.Email}"></c:out>/<c:out value="${entity.properties.EmployeeId}"></c:out>">Decline</a></td> --%>
  					<td><a href="/leaveDeclined/<c:out value="${entity.properties.Email}"></c:out>/<c:out value="${entity.properties.EmployeeId}"></c:out>">Decline</a></td>
  					  				
 					</tr>
 					
 					</c:forEach>
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
  	<center><p id="comp">&copy; 2015 Prodigy Software Solution</p></center>	
  			</div>
 
		</div>


</div>

</body>
  
</html>