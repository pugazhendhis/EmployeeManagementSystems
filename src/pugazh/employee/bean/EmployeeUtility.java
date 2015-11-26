package pugazh.employee.bean;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.PreparedQuery;
import com.google.appengine.api.datastore.Query;
import com.google.appengine.api.datastore.Query.Filter;
import com.google.appengine.api.datastore.Query.FilterOperator;
import com.google.appengine.api.datastore.Query.FilterPredicate;

public class EmployeeUtility
{
	static DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
	static public void leaveApprovedMail(String employeeName,String fromDate,String toDate,String email)
	{
		
		 Properties props = new Properties();
		 Session session = Session.getDefaultInstance(props, null);

		 String msgBody =   
	
				 "Hi "+employeeName.toUpperCase()+
				 
				 		"In response to your request for leave on date from "+fromDate+" to "+toDate+" \n"+ 
				 "the management pleased to inform you that your leave request is approved.\n"+
 
				 "Also, do delegate your daily work responsibilities to your assistants\n"+
				 "and subordinates well to ensure a smooth flow of operation in your absence.\n"+

				 "For your information, with these approved  days of leave,\n"+
				 "We wish you a good rest on your off days.\n"+
				 
				  "Regards,\n"+
				   "  HR  ";

		 try
		 {
		     Message msg = new MimeMessage(session);
		     msg.setFrom(new InternetAddress("pugazh.sadasivam@a-cti.com", "HR Manager"));
		     msg.addRecipient(Message.RecipientType.TO,
		      new InternetAddress(email,  employeeName));
		     msg.setSubject("Leave Request Approved");
		     msg.setText(msgBody);
		     Transport.send(msg);

		 } catch (Exception e)
		 {
		     
		     
		 } 
		  
	 }
	 
	static public void leaveDeclinedMail(String email,String employeeId)
	{
		Properties props = new Properties();
		 Session session = Session.getDefaultInstance(props, null);

		 String msgBody =   
	
				      "Dear Employee"+


					 "This letter is in response to your request for a leave of absence beginning"
					 +" through   Although we make every effort"
					 + " to accommodate employees with a need for time off, unfortunately,"
					 + " your leave request is not approved due to Project deadLine to complete"
					  
 					 + "If you feel that this decision is made in error or that extenuating circumstances warrant"
 					 + "further review of your request, please feel free to contact me with more information or"
 					 + "additional details surrounding your need for leave."
 			 				 
   				  + "Regards,\n"
				  + "  HR  ";

		 try
		 {
		     Message msg = new MimeMessage(session);
		     msg.setFrom(new InternetAddress("pugazh.sadasivam@a-cti.com", "HR Manager"));
		     msg.addRecipient(Message.RecipientType.TO,
		      new InternetAddress(email, "Hi prodigy"));
		     msg.setSubject("Leave Request Declined");
		     msg.setText(msgBody);
		     Transport.send(msg);

		 } catch (Exception e)
		 {
		     
		     
		 } 

	}
	
	public static void employeeAddress(Employee employee)
	{
		Entity  addressEntity=new Entity("Address",employee.getEmployeeId());
		addressEntity.setProperty("EmployeeId",  employee.getEmployeeId());
		addressEntity.setProperty("Email",employee.getEmail() );
 		addressEntity.setProperty("City",employee.getAddress().getCity());
		addressEntity.setProperty("State", employee.getAddress().getState());
		datastore.put(addressEntity);
		
	}
	
	public static void employeeLogin(Employee employee)
	{
		Entity loginEntity=new Entity("Login",employee.getEmployeeId());
		loginEntity.setProperty("EmployeeId",  employee.getEmployeeId());
		loginEntity.setProperty("UserName",employee.getEmail());
		loginEntity.setProperty("Password",employee.getFirstName()+123);
		
 		datastore.put(loginEntity);
 		
	}
	
	public static void employeeLeave(Employee employee)
	{
		final int LOPDays=0;
		Entity leaveEntity=new Entity("Leave",employee.getEmployeeId());
		leaveEntity.setProperty("EmployeeId",  employee.getEmployeeId());
		leaveEntity.setProperty("Email",employee.getEmail());
		leaveEntity.setProperty("LeaveBalance", employee.getLeaveBalance());
		leaveEntity.setProperty("LOPDays",LOPDays);
		
 		datastore.put(leaveEntity);
 		
	}
	
	public static void passwordResetMail()
	{
		
		
		 Properties props = new Properties();
		 Session session = Session.getDefaultInstance(props, null);

		 String msgBody =   
	
				      "Dear Employee"+


					 "This letter is in response to your request for a leave of absence beginning"
					 +" through   Although we make every effort"
					 + " to accommodate employees with a need for time off, unfortunately,"
					 + " your leave request is not approved due to Project deadLine to complete"
					  
					 + "If you feel that this decision is made in error or that extenuating circumstances warrant"
					 + "further review of your request, please feel free to contact me with more information or"
					 + "additional details surrounding your need for leave."
			 				 
  				  + "Regards,\n"
				  + "  HR  ";

		 try
		 {
		     Message msg = new MimeMessage(session);
		     msg.setFrom(new InternetAddress("pugazh.sadasivam@a-cti.com", "HR Manager"));
		     msg.addRecipient(Message.RecipientType.TO,
		      new InternetAddress("pugazhmy2@gmail.com", "Hi prodigy"));
		     msg.setSubject("Leave Request Declined");
		     msg.setText(msgBody);
		     Transport.send(msg);

		 } catch (Exception e)
		 {
		     
		     
		 } 

	}
	
	public static void passwordResetLinkMail(String email)
	{
		System.out.println("in password reset link");
		System.out.println("email is "+ email);
		 Properties props = new Properties();
		 Session session = Session.getDefaultInstance(props, null);

		 String msgBody =   
	
				      "Dear Employee"+
				      "As your request we've sent you a password reset link\n"+
				      "Past this link to address-bar or click on this link to reset your password\n"+
				      "Link is [http://prodigy-software.appspot.com/passwordResetLink]"+"\n"+
   				       
				      "Regards,\n"+
				        "  HR  ";

		 try
		 {
		     Message msg = new MimeMessage(session);
		     msg.setFrom(new InternetAddress("pugazh.sadasivam@a-cti.com", "HR Manager"));
		     msg.addRecipient(Message.RecipientType.TO,
		      new InternetAddress(email, "Hi prodigy"));
		     msg.setSubject("Password Reset Link");
		     msg.setText(msgBody);
		     Transport.send(msg);

		 } catch (Exception e)
		 {
		     
		     
		 } 

	}
	
	public static Entity employeeSalaryRecord(String employeeId)
	{
		Filter employeeIdFilter = new FilterPredicate("EmployeeId",FilterOperator.EQUAL,employeeId);
		Query salaryQuery = new Query("Salary").setFilter(employeeIdFilter);
	    PreparedQuery salaryPreparedQueryObject = datastore.prepare(salaryQuery);
	    Entity  salaryEntity=salaryPreparedQueryObject.asSingleEntity();
	    if(salaryEntity!=null)
	           return salaryEntity;
	   
	    return null;
	}


}


