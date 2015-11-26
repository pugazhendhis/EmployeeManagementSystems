function validateLogin()
{
	 
	var userName,password;
	userName=document.getElementById("userName").value;
	password=document.getElementById("password").value;
 	 
	if((userName=="")||(userName==null)
	{
		document.getElementById("user").innerHTML="User Id shouldn't be empty";
		return false;
	}
	else if((!userName.match(/^[0-9]+$/)||(!userName.match(/^[\w\-\.\+]+\@[a-zA-Z0-9\.\-]+\.[a-zA-z0-9]{2,4}$/))
 	{
		document.getElementById("user").innerHTML="User Id should be your mail id";
 		return false;
	}
	else
	{
		document.getElementById("user").innerHTML="";
		 
	}
	return true;

}
