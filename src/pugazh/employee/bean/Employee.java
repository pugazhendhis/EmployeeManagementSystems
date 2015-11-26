package pugazh.employee.bean;

import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

import com.google.appengine.api.datastore.Key;

 
public class Employee
{
	 
 	private Address address;
	
 	 
	private String employeeId;
	
	 
	
	private String firstName;
	 
	private String lastName;
 	 
	private String dateOfBirth;
	 
	private String email;
	 
	private String mobile;
	  
	private String dateOfJoin;
	 
	private String designation;
	
	 
	private String gender; 
	
	 
	private String leaveBalance;
 	
	public Address getAddress()
	{
		return address;
	}
	
	public String getLastName()
	{
		return lastName;
	}

	public void setLastName(String lastName)
	{
		this.lastName = lastName;
	}


	public String getEmployeeId()
	{
		return employeeId;
	}

	public void setEmployeeId(String employeeId)
	{
		this.employeeId = employeeId;
	}

	
	
	public void setAddress(Address address)
	{
		this.address = address;
	}

	
	 
	
	public String getFirstName()
	{
		return firstName;
	}
	
	public void setFirstName(String firstName) 
	{
		this.firstName = firstName;
	}
	
	 
	
	public String getDateOfBirth() 
	{
		return dateOfBirth;
	}
	
	public void setDateOfBirth(String dateOfBirth)
	{
		this.dateOfBirth = dateOfBirth;
	}
	
	public String getEmail()
	{
		return email;
	}
	
	public void setEmail(String email)
	{
		this.email = email;
	}
	
	public String getMobile()
	{
		return mobile;
	}
	
	public void setMobile(String mobile)
	{
		this.mobile = mobile;
	}
	
	public String getDateOfJoin()
	{
		return dateOfJoin;
	}
	
	public void setDateOfJoin(String dateOfJoin)
	{
		this.dateOfJoin = dateOfJoin;
	}
	
	
	public String getDesignation()
	{
		return designation;
	}

	public void setDesignation(String designation)
	{
		this.designation = designation;
	}

	public String getLeaveBalance()
	{
		return leaveBalance;
	}

	public void setLeaveBalance(String leaveBalance)
	{
		this.leaveBalance = leaveBalance;
	}
 
	 
	
	public String getGender()
	{
		return gender;
	}

	public void setGender(String gender)
	{
		this.gender = gender;
	}

	

}
