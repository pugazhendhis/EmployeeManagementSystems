function validateUserData()
{

			var employeeId,lastName,mail,toDate,fromDate,i,convert,dateManipulation,toDateManipulation;
			/*var today = new Date();
			var cdd = today.getDate();
			var cmm = today.getMonth()+1;  
			var cyyyy = today.getFullYear();
			*/
			/*employeeId=document.getElementById("employeeId").value;
	 		email=document.getElementById("email").value;
			*/
			fromDate=document.getElementById("fromDate").value;
			toDate=document.getElementById("toDate").value;
			i=document.getElementById("LeaveType").selectedIndex;
		 	
			/*var fromDay,fromMonth,fromYear,toDay,toMonth,toYear;
			fromDateManipulation=fromDate.split("-");
			
			fromYear=fromDateManipulation[0];
			fromMonth=fromDateManipulation[1];
			fromDay=fromDateManipulation[2];
			
			toDateManipulation=toDate.split("-");
			toYear=toDateManipulation[0];
			toMonth=toDateManipulation[1];
			toDay=toDateManipulation[2];
			*/
			
			
			/*if(employeeId=="")
			{
				document.getElementById("fnameerr").innerHTML="Employee Id shouldn't be empty";
				return false;
			}
			else if(!employeeId.match(/^[e|t|E|T][0-9]{4}$/))
			{
				document.getElementById("fnameerr").innerHTML="Employee Id should number values";
				flag=1
				return false;
			}
			else
			{
				document.getElementById("fnameerr").innerHTML="";
				 
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
*/
			if(fromDate=="")
			{
				document.getElementById("fdateerr").innerHTML="Date shouldn't be empty";
				return false;
			}
 			else
			{
				document.getElementById("fdateerr").innerHTML="";
				 
			}

			if(toDate=="")
			{
				document.getElementById("tdateerr").innerHTML="Date shouldn't be empty";
				return false;
			}
 			else
			{
				document.getElementById("tdateerr").innerHTML="";
				 

			}

			if(document.getElementsByTagName("option")[i].value=="")
			{
				document.getElementById("leavtypeerr").innerHTML="Select Leave Type";
				return false;
			}
	 		else
			{
				document.getElementById("leavtypeerr").innerHTML="";
			 
			}
 
			return true;


}