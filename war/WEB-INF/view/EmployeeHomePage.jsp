<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
         <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>


<head>

<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="resources/stylesheet/Home.css">
  
  <title>Home Page</title>
  
</head>
<body>


<div class="container" id="center">
 

     	<div class="col-sm-2" id="topleft">
     	   <div id="innertopleft">
  			<img src="resources/images/mylogo.png" height="150" width="200px"/>
  			</div>	
  		</div>

  		<div class="col-sm-10" id="topright">
  		 
  		    <div id="employee" style="color:#F0FFF0">Welcome, <c:set var="userName" value="${sessionScope.user}" />
  				<c:out value="${userName}" />
   	 	    </div>
  			
  			<center><h2 id="comp">Prodigy Software Solution</h2></center>
  			<center><p id="comp"><strong><em>Innovation starts from you.</em></strong></p></center>
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

  			<div class="col-sm-10" id="topinnerright">
  				 <!-- topinnerStart -->




           <div class="container" id="leftimage">
  <br>
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
      <div class="item active">
        <img src="http://goo.gl/dK92ke" alt="Chania" width="10" height="50">
      </div>

      <div class="item">
        <img src="http://goo.gl/W18BZo" alt="Chania" width="10" height="50">
      </div>
    
      <div class="item">
        <img src="http://goo.gl/nlZemd" alt="Flower" width="10" height="50">
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
      <pre style= "font-family:Arial Black">
        prodigy employee can view
        and download the monthly
        pay slip at one go</pre>
    </div>




<div class="container" id="middleimage">
  <br>
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel2" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel2" data-slide-to="1"></li>
     </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
      <div class="item active">
        <img src="http://goo.gl/tUDNB3" alt="Chania" width="10" height="50">
      </div>

      <div class="item">
        <img src="http://goo.gl/e6nyBF" alt="Chania" width="10" height="50">
      </div>
        
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel2" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel2" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
    
    <pre style= "font-family:Arial Black">
       Human resources(HR)
       managers have a wide 
       range of duties such as
       recruiting,interviewing,
       hiring and training.
       but this application simplify
       them with no hassle.
   </pre>  
</div>


<div class="container" id="rightimage">
  <br>
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel2" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel2" data-slide-to="1"></li>
      <li data-target="#myCarousel2" data-slide-to="2"></li>
     </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
      <div class="item active">
        <img src="https://goo.gl/Huwy4f" alt="Chania" width="10" height="50">
      </div>

      <div class="item">
        <img src="http://goo.gl/MQ6uRe" alt="Chania" width="10" height="50">
      </div>
    
      <div class="item">
        <img src="http://goo.gl/GKE5La" alt="Flower" width="10" height="50">
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel2" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel2" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
  <pre style= "font-family:Arial Black">
     with this application 
     employees can apply leave
     at anywhere and can query 
     related to leave pending.
  </pre>
</div>

 




           <!-- topinnerends -->
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