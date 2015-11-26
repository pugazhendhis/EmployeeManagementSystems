package pugazh.employee.bean;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.ModelMap;

import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.EntityNotFoundException;
import com.google.appengine.api.datastore.FetchOptions;
import com.google.appengine.api.datastore.KeyFactory;
import com.google.appengine.api.datastore.PreparedQuery;
import com.google.appengine.api.datastore.Query;
import com.google.appengine.api.datastore.Query.FilterOperator;
import com.google.appengine.api.datastore.Query.Filter;
import com.google.appengine.api.datastore.Query.FilterPredicate; 
import com.google.appengine.api.datastore.Query.CompositeFilter;
import com.google.appengine.api.datastore.Query.CompositeFilterOperator;
 

public class DataHandler
{
	static private DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
	
	
	static public String resetPassword(String email)
	{
		Filter employeeEmailFilter = new FilterPredicate("UserName",FilterOperator.EQUAL,email);
	 	
	 
		Query query = new Query("Login").setFilter(employeeEmailFilter);
		
	    PreparedQuery preparedQueryObject = datastore.prepare(query);
	    Entity loginEntity=preparedQueryObject.asSingleEntity();

	     
	    if(loginEntity!=null)
	    	return loginEntity.getProperty("UserName").toString();
	    
	    	    
		return null;
	}
	
	
	static public boolean resetSuccess(String email,String password)
	{
		Filter profileFilter = new FilterPredicate("UserName",FilterOperator.EQUAL,email);
		Query query = new Query("Login").setFilter(profileFilter);
	    PreparedQuery preparedQueryObject = datastore.prepare(query);
	    Entity employeeEntity=preparedQueryObject.asSingleEntity();
	    
	    
	    
	      
 	   
 	   if(employeeEntity!=null)
 	   {
 		    
 		  String empId=employeeEntity.getProperty("EmployeeId").toString();
 		  boolean employee=DataHandler.resetEmployeeTableSuccess(empId, password);
 		  return employee; 
 	   }
 	     	   
 	   return false;
 	  	 
	}
	
	
	static public boolean resetEmployeeTableSuccess(String employeeId,String password)
	{
			Entity employeeTable=null;
 	    
			 
			    try
			    {
			    	employeeTable = datastore.get(KeyFactory.createKey("Login", employeeId));
			    	employeeTable.setProperty("Password", password);
					datastore.put(employeeTable);
					return true;
			    	
				} 
			    catch (EntityNotFoundException e)
			    {
					 
					e.printStackTrace();
				}

		return false;
	}
	
 
	static public HashMap getMyLeaveDetails(String email)
 	{
		HashMap<String,Object> data=new HashMap<String,Object>(); 
		Filter profileFilter = new FilterPredicate("Email",FilterOperator.EQUAL,email);
		Query query = new Query("Employee").setFilter(profileFilter);
	    PreparedQuery preparedQueryObject = datastore.prepare(query);
	    Entity employeeEntity=preparedQueryObject.asSingleEntity();
	       
		Filter traineeprofileFilter = new FilterPredicate("Email",FilterOperator.EQUAL,email);
		Query traineequery = new Query("Trainee").setFilter(traineeprofileFilter);
	    PreparedQuery traineePreparedQuery = datastore.prepare(traineequery);
	    Entity traineeEntity=traineePreparedQuery.asSingleEntity();
	    
	    Filter leaveFilter = new FilterPredicate("Email",FilterOperator.EQUAL,email);
		Query leaveQuery = new Query("Leave").setFilter(leaveFilter);
	    PreparedQuery preparedQuery = datastore.prepare(leaveQuery);
	    Entity leaveEntity=preparedQuery.asSingleEntity();
	      
	    if(employeeEntity!=null)
	    {
	    	data.put("employee", employeeEntity);
	    	data.put("leave", leaveEntity);
	    }
	    if(traineeEntity!=null)
	    {
	    	data.put("employee", traineeEntity);
	    	data.put("leave", leaveEntity);
	    }
	    
	    return data;
		
	}
	static public Entity getMyProfile(String email)
	{
		Filter profileFilter = new FilterPredicate("Email",FilterOperator.EQUAL,email);
		Query query = new Query("Employee").setFilter(profileFilter);
	    PreparedQuery preparedQueryObject = datastore.prepare(query);
	    Entity employeeProfileEntity=preparedQueryObject.asSingleEntity();
	    
	    
	    if(employeeProfileEntity!=null)
	    	return employeeProfileEntity;
	    else
	    {
	    	Filter traineeProfileFilter = new FilterPredicate("Email",FilterOperator.EQUAL,email);
			Query traineeMailquery = new Query("Trainee").setFilter(traineeProfileFilter);
		    PreparedQuery preparedQuery = datastore.prepare(traineeMailquery);
		    Entity traineeProfileEntity=preparedQuery.asSingleEntity();
		     
		    return traineeProfileEntity;
	    }
	}
	static public void deleteEmployeeRecord(String employeeId)
	{
		
		String employeeName=null;
	    String email=null;
	    String designation=null;
	
		  	Filter layOffFilter = new FilterPredicate("EmployeeId",FilterOperator.EQUAL,employeeId);
			Query query = new Query("Employee").setFilter(layOffFilter);
		    PreparedQuery preparedQueryObject = datastore.prepare(query);
		    Entity layOffEntity=preparedQueryObject.asSingleEntity();
		     
		    if(layOffEntity!=null)
		    {
		    	employeeName=layOffEntity.getProperty("FirstName").toString();
		    	email=layOffEntity.getProperty("Email").toString();
		    	designation=layOffEntity.getProperty("Designation").toString();
		    	datastore.delete(layOffEntity.getKey());
		    	
		    }
		    	
	        
		    Filter layOffTrainee = new FilterPredicate("EmployeeId",FilterOperator.EQUAL,employeeId);
			Query traineequery = new Query("Trainee").setFilter(layOffTrainee);
		    PreparedQuery preparedQuery = datastore.prepare(traineequery);
		    Entity traineelayOffEntity=preparedQuery.asSingleEntity();
		    
		    if(traineelayOffEntity!=null)
		    {
		    	employeeName=traineelayOffEntity.getProperty("FirstName").toString();
		    	email=traineelayOffEntity.getProperty("Email").toString();
		    	designation=traineelayOffEntity.getProperty("Designation").toString();
		    	datastore.delete(traineelayOffEntity.getKey());
		    	
		    
		    }
		    	
		    
	    	Filter layOffAddressFilter = new FilterPredicate("EmployeeId",FilterOperator.EQUAL,employeeId);
			Query addressQuery = new Query("Address").setFilter(layOffAddressFilter);
		    PreparedQuery addressPreparedQueryObject = datastore.prepare(addressQuery);
		    Entity layOffAddressEntity=addressPreparedQueryObject.asSingleEntity();
		    if(layOffAddressEntity!=null)
		    datastore.delete(layOffAddressEntity.getKey());
		    
		    Filter layOffSalaryFilter = new FilterPredicate("EmployeeId",FilterOperator.EQUAL,employeeId);
			Query salaryQuery = new Query("Salary").setFilter(layOffSalaryFilter);
		    PreparedQuery salaryPreparedQueryObject = datastore.prepare(salaryQuery);
		    Entity layOffSalaryEntity=salaryPreparedQueryObject.asSingleEntity();
		    if(layOffSalaryEntity!=null)
		    datastore.delete(layOffSalaryEntity.getKey());
		    
		    Filter loginFilter = new FilterPredicate("EmployeeId",FilterOperator.EQUAL,employeeId);
			Query loginQuery = new Query("Login").setFilter(loginFilter);
		    PreparedQuery loginPreparedQuery= datastore.prepare(loginQuery);
		    Entity loginEntity=loginPreparedQuery.asSingleEntity();
		    if(loginEntity!=null)
		    datastore.delete(loginEntity.getKey());
		    
		    Filter leaveFilter = new FilterPredicate("EmployeeId",FilterOperator.EQUAL,employeeId);
			Query leaveQuery = new Query("Leave").setFilter(leaveFilter);
		    PreparedQuery leavePreparedQuery= datastore.prepare(leaveQuery);
		    Entity leaveEntity=leavePreparedQuery.asSingleEntity();
		    if(leaveEntity!=null)
		    datastore.delete(leaveEntity.getKey());
		    
		     regretMail(employeeName,email,designation);
	    
 	     	
	       
 		  
	}
	
	static public void regretMail(String userName,String mail,String designation)
	{
		Properties props = new Properties();
		 Session session = Session.getDefaultInstance(props, null);

		 String msgBody =   
	
				 "Hello "+userName.toUpperCase()+ 
				 
		
				 		"This is indeed matter of huge sadness that\n"+
				 "we are going to start your retirement process on which is according to the policies of our company.\n"+
				 
				 "I would like to acknowledge the invaluable services that you have provided to the company\n"+
				 "in the past years. You have been one of the most sincere, devoted and \n"+
				 "hardworking individuals of the company.\n"+ 
				 "You have given your precious contribution in the growth of the company.\n"+
				 
				 "We are definitely going to miss an individual with a stature like you in the future.\n"+
 				 "I would also like to wish you all the very best, happy, and peaceful retired life.\n"+

				 "With warm regards and best wishes.\n"+

				 "Yours sincerely,\n"+

				 "Chairperson & Managing Director\n"+
				   "Prodigy Software Solution";
		 	try
		 	{
		 		Message msg = new MimeMessage(session);
		 		msg.setFrom(new InternetAddress("pugazh.sadasivam@a-cti.com", "HR Manager"));
		 		msg.addRecipient(Message.RecipientType.TO,
		 				new InternetAddress(mail,userName));
		 		msg.setSubject("LayOff Regret Mail");
		 		msg.setText(msgBody);
		 		Transport.send(msg);

		 	}
		 	catch (Exception e)
		 	{
		     
		 		 
		 	} 

	}
	 
  //leaverequest
	static public boolean leaveRequestApplication(Map<String,String> leaveApplication,String email,String employeeId)
	{
		
		/*Filter employeeIdFilter = new FilterPredicate("EmployeeId",FilterOperator.EQUAL,leaveApplication.get("employeeId"));
		Filter employeeMailFilter = new FilterPredicate("Email",FilterOperator.EQUAL, leaveApplication.get("email"));
		*/
		Filter employeeIdFilter = new FilterPredicate("EmployeeId",FilterOperator.EQUAL,employeeId);
		Filter employeeMailFilter = new FilterPredicate("Email",FilterOperator.EQUAL, email);
	    
	    Filter employeeRangeFilter =
	    		  CompositeFilterOperator.and(employeeIdFilter, employeeMailFilter);

		Query query = new Query("Employee").setFilter(employeeRangeFilter);
	    PreparedQuery preparedQueryObject = datastore.prepare(query);
	    Entity employeeEntity=preparedQueryObject.asSingleEntity();
	       
	   /* Filter traineeIdFilter = new FilterPredicate("EmployeeId",FilterOperator.EQUAL,leaveApplication.get("employeeId"));
		Filter traineeeMailFilter = new FilterPredicate("Email",FilterOperator.EQUAL, leaveApplication.get("email"));
*/
	    
	    Filter traineeIdFilter = new FilterPredicate("EmployeeId",FilterOperator.EQUAL,employeeId);
		Filter traineeeMailFilter = new FilterPredicate("Email",FilterOperator.EQUAL, email);

		Filter traineeRangeFilter =
	    		  CompositeFilterOperator.and(traineeIdFilter, traineeeMailFilter);

		Query traineequery = new Query("Trainee").setFilter(traineeRangeFilter);
	    PreparedQuery traineePreparedQuery = datastore.prepare(traineequery);
	    Entity traineeEntity=traineePreparedQuery.asSingleEntity();
	    
	    
        if((employeeEntity!=null)||(traineeEntity!=null))
        {
        	//Key leaveEntity = KeyFactory.createKey("LeaveApplication", leaveApplication.get("employeeId"));
        	/*Entity leaveApplicationObject=new Entity("LeaveApplication",leaveApplication.get("employeeId"));
    		leaveApplicationObject.setProperty("EmployeeId", leaveApplication.get("employeeId"));
    		leaveApplicationObject.setProperty("Email", leaveApplication.get("email"));
    		*/
        	Entity leaveApplicationObject=new Entity("LeaveApplication",employeeId);
    		leaveApplicationObject.setProperty("EmployeeId", employeeId);
    		leaveApplicationObject.setProperty("Email", email);
    		
        	leaveApplicationObject.setProperty("FromDate", leaveApplication.get("fromDate"));
    		leaveApplicationObject.setProperty("ToDate", leaveApplication.get("toDate"));
    		leaveApplicationObject.setProperty("LeaveType", leaveApplication.get("LeaveType"));
    		datastore.put(leaveApplicationObject);
    		return true; 
    		
        }
	    return false;
		  
	}
	
	 
	static public void leaveApproved(String mail,String employeeId)
	{
		 
		Filter LeaveApplicationFilter = new FilterPredicate("EmployeeId",FilterOperator.EQUAL,employeeId);
		Query LeaveApplicationQuery = new Query("LeaveApplication").setFilter(LeaveApplicationFilter);
	    PreparedQuery leavePreparedQueryObject = datastore.prepare(LeaveApplicationQuery);
	    Entity leaveApplicationEntity=leavePreparedQueryObject.asSingleEntity();
	     
 	    if(leaveApplicationEntity!=null)
 	    {
 	    	String fromDay=leaveApplicationEntity.getProperty("FromDate").toString();
 		    String toDay=leaveApplicationEntity.getProperty("ToDate").toString();
 		    String email=leaveApplicationEntity.getProperty("Email").toString();
 		    String fday[]=fromDay.split("-"); 
 		    String tday[]=toDay.split("-"); 
 	 	    
 		    int startDay=Integer.valueOf(fday[2]);
 		    int endDay=Integer.valueOf(tday[2]);
 		    int numberOfDays=endDay-startDay;
 	 	    
 		    employeeLeaveApproved(mail,employeeId,numberOfDays,fromDay,toDay,email);

 	    }
	    	      
	}
	
	static public void employeeLeaveApproved(String mail,String employeeId,int numberOfDays,String fromDay,String toDay,String email)
	{
		
	 	Filter leaveApprovedFilter = new FilterPredicate("EmployeeId",FilterOperator.EQUAL,employeeId);
		Query query = new Query("Leave").setFilter(leaveApprovedFilter);
	    PreparedQuery preparedQueryObject = datastore.prepare(query);
	    Entity leaveEntity=preparedQueryObject.asSingleEntity();
	    
	    String leaveBalance=leaveEntity.getProperty("LeaveBalance").toString();
	    int balanceLeave=Integer.valueOf(leaveBalance);
	    ++numberOfDays;
	    
	    if(balanceLeave>numberOfDays)
	    {
	    	balanceLeave-=numberOfDays;
            Entity updateEntity=null;
            try
            {
				updateEntity = datastore.get(KeyFactory.createKey("Leave", employeeId));
			}
            catch (EntityNotFoundException e)
            {
				 
				e.printStackTrace();
			}
            updateEntity.setProperty("LeaveBalance", balanceLeave);
			datastore.put(updateEntity);
	      	
	    }
	    else
	    {
	    	numberOfDays-=balanceLeave;
	    	
	    	Entity updateEntity=null;
            try
            {
				updateEntity = datastore.get(KeyFactory.createKey("Leave", employeeId));
			}
            catch (EntityNotFoundException e)
            {
				 
				e.printStackTrace();
			}
            updateEntity.setProperty("LeaveBalance", 0);
            updateEntity.setProperty("LOPDays", numberOfDays);
		    
			datastore.put(updateEntity);
	  	 
	    }
	    String employeeName=null;
	    
	    Filter employeeFilter = new FilterPredicate("EmployeeId",FilterOperator.EQUAL,employeeId);
		Query employeequery = new Query("Employee").setFilter(employeeFilter);
	    PreparedQuery employeepreparedQuery  = datastore.prepare(employeequery);
	    Entity employeeEntity=employeepreparedQuery.asSingleEntity();
	    if(employeeEntity!=null)
	      employeeName=employeeEntity.getProperty("FirstName").toString();
	    
	    Filter traineeFilter = new FilterPredicate("EmployeeId",FilterOperator.EQUAL,employeeId);
		Query traineequery = new Query("Trainee").setFilter(traineeFilter);
	    PreparedQuery traineepreparedQuery  = datastore.prepare(traineequery);
	    Entity traineeEntity=traineepreparedQuery.asSingleEntity();
	    
	    if(traineeEntity!=null)
	    	employeeName=employeeEntity.getProperty("FirstName").toString();
	   
	    EmployeeUtility.leaveApprovedMail(employeeName, fromDay, toDay,email);
	    deleteLeaveApprovedRecord(mail,employeeId);
	    
	}
 	 
	static public void deleteLeaveApprovedRecord(String mail,String employeeId)
	{
		
		Filter LeaveApplicationFilter = new FilterPredicate("EmployeeId",FilterOperator.EQUAL,employeeId);
		Query LeaveApplicationQuery = new Query("LeaveApplication").setFilter(LeaveApplicationFilter);
	    PreparedQuery leavePreparedQueryObject = datastore.prepare(LeaveApplicationQuery);
	    Entity leaveApplicationEntity=leavePreparedQueryObject.asSingleEntity();
	    datastore.delete(leaveApplicationEntity.getKey());
	     
	    
	}
	
	static public Entity layOffEmployee(String employeeId)
	{
		Filter layOffFilter = new FilterPredicate("EmployeeId",FilterOperator.EQUAL,employeeId);
		Query query = new Query("Employee").setFilter(layOffFilter);
	    PreparedQuery preparedQueryObject = datastore.prepare(query);
	    Entity layOffEmployeeEntity=preparedQueryObject.asSingleEntity();
	    
	    Filter traineeLayOffFilter = new FilterPredicate("EmployeeId",FilterOperator.EQUAL,employeeId);
		Query traineeQuery = new Query("Trainee").setFilter(traineeLayOffFilter);
	    PreparedQuery traineePreparedQueryObject = datastore.prepare(traineeQuery);
	    Entity traineelayOffEntity=traineePreparedQueryObject.asSingleEntity();
	
	    
	    if(layOffEmployeeEntity!=null)
	    {
	    	return  layOffEmployeeEntity;
	    }
	    else if(traineelayOffEntity!=null)
	    	return traineelayOffEntity;
	    else
	    	return null;
	}
	
	/*static public Entity getMyLeaveDetails(String email)
	{
		Entity myLeaveEntity=DataHandler.getMyProfile(email);
			return myLeaveEntity;
	}*/
	
}
