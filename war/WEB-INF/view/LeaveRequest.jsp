<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
         <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Leave request</title>


<script  src="resources/employee-script/LeaveRequest.js"></script>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="resources/employee-stylesheet/LeaveRequest.css">

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

					 <c:set var="LeaveError" value="${requestScope.LeaveApplyError}"></c:set>
					 <c:set var="leaveRequest" value="${requestScope.leaveRequestSuccess}"></c:set>
					 
  					 <center><p style="color:red"><c:out value="${LeaveError}"></c:out></p></center>
  					 <center><p style="color:red"><c:out value="${leaveRequest}"></c:out></p></center>
				      	


            <!-- <div class="bs-example" id="formalign"> -->
               <form class="form-horizontal" name="leave" action="lrequest" method="post" onsubmit="return validateUserData()">
                  <!-- <div class="form-group">
                    <label for="employeeId" class="control-label col-xs-4">Employee Id</label>
                        <div class="col-xs-6">
                            <input type="text" class="form-control" name="employeeId" id="employeeId" placeholder="Employee Id">
                        </div>
                  </div>
        
             
                  <div class="form-group">
                      <label for="email" class="control-label col-xs-4">Email</label>
                      <div class="col-xs-6">
                          <input type="text" class="form-control" name="email" id="email" placeholder="Ex:steve@gmail.com">
                      </div>
                  </div>
         -->
                  <div class="form-group">
                      <label for="fromDate" class="control-label col-xs-4">From Date</label>
                      <div class="col-xs-6">
                          <input type="date" class="form-control" name="fromDate" id="fromDate" >
                      </div>
                  </div>
          
                  <div class="form-group">
                      <label for="toDate" class="control-label col-xs-4">To Date</label>
                          <div class="col-xs-6">
                            <input type="date" class="form-control" name="toDate" id="toDate" >
                          </div>
                  </div>
          
                  <!-- <div class="form-group">
                      <label for="leaveType" class="control-label col-xs-4">Leave Type</label>
                          <div class="col-xs-6">
                            <input type="leaveType" class="form-control" name="leaveType" id="leaveType" placeholder="leaveType">
                          </div>
                  </div>
           -->


              <div class="form-group">
                      <label for="leaveType" class="control-label col-xs-4">Leave Type</label>
                      <div class="col-xs-6">
                           <select class="form-control" id="LeaveType" name="LeaveType">
                                <option value="" selected>Select Leave Type</option>
                                <option value="Casual Leave">Casual Leave</option>
                                <option value="Sick Leave">Sick Leave</option>
                                <option value="Maternity Leave">Maternity Leave</option>
                                <option value="Paternity Leave">Paternity Leave</option>
                          </select>
                      </div>
                  </div>
          



                  <div class="form-group">
                      <div class="col-xs-offset-4 col-xs-10">
                          <button type="submit" class="btn btn-primary">Apply</button>
                          <button type="reset" class="btn btn-primary">Reset</button>
                      </div>
                  </div>
         
              </form>
          </div>

   				<!-- <p><b>Note: </b>im middle inner right</p> -->	
  			</div>
 
		

		    <div class="container" id="bottomcenter">
      		  <div class="col-sm-2" id="bottominnerleft">

  	
  			   </div>

  			   <div class="col-sm-10" id="bottominnerright">
  				    <center><p id="comp">&copy; 2015 Prodigy Software Solution</p></center>
  			   </div>
 
		  </div>
 

  </div>

 
<p id="fnameerr"></p> 
<p id="mailerr"></p>
<p id="fdateerr"></p>
<p id="tdateerr"></p>
<p id="leavtypeerr"></p>
 




</body>


</html>