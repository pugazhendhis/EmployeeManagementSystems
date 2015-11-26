<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
         <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
    
    <%@ page import="com.google.appengine.api.datastore.Entity" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My Profile</title>


<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="resources/employee-stylesheet/Profile.css">

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
		
				<c:set var="myProfile" value="${requestScope.myProfile}"></c:set>		
				 
  				 
                <center><table class="myprofile">
  				<tbody>
  					<tr>
  				 		<th colspan="2"><center>Employee Profile </center></th>
  				  	</tr>
  		 		
  		 		
  		 			<tr><td>Employee Id</td><td><c:out value="${myProfile.properties.EmployeeId}"></c:out></td></tr>
  					<tr><td>First Name</td><td><c:out value="${myProfile.properties.FirstName}"></c:out></td></tr>
  					<tr><td>Last Name</td><td><c:out value="${myProfile.properties.LastName}"></c:out></td></tr>
  				    <tr><td>Date Of Birth</td><td><c:out value="${myProfile.properties.DateOfBirth}"></c:out></td></tr>
  					<tr><td>Date Of Join</td><td><c:out value="${myProfile.properties.DateOfJoin}"></c:out></td></tr>
  					<tr><td>Designation</td><td><c:out value="${myProfile.properties.Designation}"></c:out></td></tr>
  			 		<tr><td>Email Id</td><td><c:out value="${myProfile.properties.Email}"></c:out></td></tr>
  					<tr><td>Mobile</td><td><c:out value="${myProfile.properties.Mobile}"></c:out></td></tr>
  					
  		 		 	
  					
  					 
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