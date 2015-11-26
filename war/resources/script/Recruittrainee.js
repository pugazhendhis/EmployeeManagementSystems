 
function validateUserData()
{
	    var flag=0,convert;
		var employeeId,firstName,lastName,gender,dateOfBirth,dateOfJoin,salary,email,leave,designation,gender,mobile;
 		var city,state,duration;
 
 		convert=document.getElementById("employeeId").value;
		employeeId=convert.toString();
		firstName=document.getElementById("firstName").value;
		lastName=document.getElementById("lastName").value;
		dateOfBirth=document.getElementById("dateOfBirth").value;
		mobile=document.getElementById("mobile").value;
		email=document.getElementById("email").value;
		dateOfJoin=document.getElementById("dateOfJoin").value;
		convert=document.getElementById("leaveBalance").value;
	 	leaveBalance=convert.toString();
 		designation=document.getElementById("designation").value;
 		gender=document.getElementsByName("gender");
 		city=document.getElementById("city").value;
 		state=document.getElementById("state").value;
 		convert=document.getElementById("duration").value;
 		duration=convert.toString();
 		
  		if(employeeId=="")
		{
			document.getElementById("iderr").innerHTML="Employee Id shouldn't be empty";
			return false;
		}
  		else if(!employeeId.match(/^[t|T][0-9]{4}$/)) 
		{
			document.getElementById("iderr").innerHTML="Employee Id should Ex: TXXXX/tXXXX X=>digits";
			flag=1
			return false;
		}
		else
		{
			document.getElementById("iderr").innerHTML="";
			 
		}
 
		if(firstName=="")
			{
				document.getElementById("fnameerr").innerHTML="First Name shouldn't be empty";
				return false;
			}
			else if(!firstName.match(/^[A-Za-z\s]+$/))
			{
				document.getElementById("fnameerr").innerHTML="First Name should be character values";
				flag=1
				return false;
			}
			else
			{
				document.getElementById("fnameerr").innerHTML="";
				 
			}

			if(lastName=="")
			{
				document.getElementById("lnameerr").innerHTML="Last Name shouldn't be empty";
				return false;
			}
			else if(!lastName.match(/^[A-Za-z\s]+$/))
			{
				document.getElementById("lnameerr").innerHTML="Last Name should be character values";
				flag=1
				return false;
			}
			else
			{
				document.getElementById("lnameerr").innerHTML="";
				 
			}

			if(dateOfBirth=="")
			{
				document.getElementById("doberr").innerHTML="Date shouldn't be empty";
				return false;
			}
 			else
			{
				document.getElementById("doberr").innerHTML="";
				 
			}

			if((gender[0].checked!=true)&&(gender[1].checked!=true)) 
			{
				document.getElementById("gendererr").innerHTML="Select Gender";
				return false;
			}
	  		else
			{
				document.getElementById("gendererr").innerHTML="";		 
			}
		  
		  if(mobile=="")
				{
					document.getElementById("moberr").innerHTML="Mobile number shouldn't be empty";
					return false;
				}
				else if(!mobile.match(/^[0]?[789]\d{9}$/))
				{
					document.getElementById("moberr").innerHTML="Enter Proper Mobile Numeber";
					flag=1
					return false;
				}
				else
				{
					document.getElementById("moberr").innerHTML="";
					 
				}

			if(email=="")
			{
				document.getElementById("mailerr").innerHTML="Email id shouldn't be empty";
				return false;
			}
			else if(!email.match(/^[\w\-\.\+]+\@[a-zA-Z0-9\.\-]+\.[a-zA-z0-9]{2,4}$/))
			{
				document.getElementById("mailerr").innerHTML="Enter Proper Email Id ex:something@somthing.com";
				flag=1
				return false;
			}
			else
			{
				document.getElementById("mailerr").innerHTML="";
				 
			}
			
			if((city=="")&&(city==null))
			{
				document.getElementById("cityerr").innerHTML="City Name shouldn't be empty";
				return false;
			}
			else if(!city.match(/^[A-Za-z\s]+$/))
			{
				document.getElementById("cityerr").innerHTML="City Name should be character values";
				flag=1
				return false;
			}
			else
			{
				document.getElementById("cityerr").innerHTML="";
				 
			}

			
			if(state=="")
			{
				document.getElementById("stateerr").innerHTML="State Name shouldn't be empty";
				return false;
			}
			else if(!state.match(/^[A-Za-z\s]+$/))
			{
				document.getElementById("stateerr").innerHTML="State Name should be character values";
				flag=1
				return false;
			}
			else
			{
				document.getElementById("stateerr").innerHTML="";
				 
			}


			if(designation=="")
			{
				document.getElementById("desigerr").innerHTML="designation shouldn't be empty";
				return false;
			}
			else if(!designation.match(/^[A-Za-z\s]+$/))
			{
				document.getElementById("desigerr").innerHTML="designation should be character values";
				flag=1
				return false;
			}
			else
			{
				document.getElementById("desigerr").innerHTML="";
				 
			}


			if(dateOfJoin=="")
			{
				document.getElementById("dojerr").innerHTML="Date shouldn't be empty";
				return false;
			}
 			else
			{
				document.getElementById("dojerr").innerHTML="";
				 
			}
	 		 
			 
			 if(duration=="")
				{
					document.getElementById("durationerr").innerHTML="Duration shouldn't be empty";
					return false;
				}
				else if(!duration.match(/^[0-9]+$/))
				{
					document.getElementById("durationerr").innerHTML="Duration should be number values";
					flag=1
					return false;
				}
				else
				{
					document.getElementById("durationerr").innerHTML="";
					 
				}
			 
			 if(leaveBalance=="")
				{
					document.getElementById("leaverr").innerHTML="Leave shouldn't be empty";
					return false;
				}
				else if(!leaveBalance.match(/^[0-9]+$/))
				{
					document.getElementById("leaverr").innerHTML="Leave should be number values";
					flag=1
					return false;
				}
				else
				{
					document.getElementById("leaverr").innerHTML="";
					 
				}
			
 		
	 		return true;


		 
		 
}