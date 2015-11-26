
function validateUserData()
{
	 
	    var flag=0,convert;
		var employeeId,email;
 		 
 		convert=document.getElementById("employeeId").value;
		employeeId=convert.toString();
 		email=document.getElementById("email").value;
  
 		if(employeeId=="")
		{
			document.getElementById("iderr").innerHTML="Employee Id shouldn't be empty";
			return false;
		}
		else if(!employeeId.match(/^[e|E][0-9]{4}$/))
		{
			document.getElementById("iderr").innerHTML="Employee Id should be number values";
			flag=1
			return false;
		}
		else
		{
			document.getElementById("iderr").innerHTML="";
			 
		}
 		
 		if(email=="")
			{
				document.getElementById("mailerr").innerHTML="Email id shouldn't be empty";
				return false;
			}
			else if(!email.match(/^[\w\-\.\+]+\@[a-zA-Z0-9\.\-]+\.[a-zA-z0-9]{2,4}$/))
			{
				document.getElementById("mailerr").innerHTML="Enter valid Email Id ex:something@somthing.com";
				flag=1
				return false;
			}
			else
			{
				document.getElementById("mailerr").innerHTML="";
				 
			}
	 		  		
	 		return true;

*/
		 
		 
}