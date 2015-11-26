package pugazh.employee.bean;

 
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.Properties;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.FetchOptions;
import com.google.appengine.api.datastore.PreparedQuery;
import com.google.appengine.api.datastore.Query;

 


import com.google.appengine.api.datastore.Query.Filter;
import com.google.appengine.api.datastore.Query.FilterOperator;
import com.google.appengine.api.datastore.Query.FilterPredicate;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
 

public class NewEmployee
{
	public boolean addEmployee(Employee employee)
	{
		 
		DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
		
		Filter employeeFilter = new FilterPredicate("EmployeeId",FilterOperator.EQUAL,employee.getEmployeeId());
		Query query = new Query("Employee").setFilter(employeeFilter);
	    PreparedQuery preparedQueryObject = datastore.prepare(query);
	    Entity validateEntity=preparedQueryObject.asSingleEntity();
	     
	    if(validateEntity==null)
	    {     
	      
		Entity employeeEntity=new Entity("Employee",employee.getEmployeeId());
		employeeEntity.setProperty("EmployeeId",employee.getEmployeeId());
		employeeEntity.setProperty("FirstName",employee.getFirstName());
		employeeEntity.setProperty("LastName", employee.getLastName());
		employeeEntity.setProperty("DateOfBirth", employee.getDateOfBirth());
		employeeEntity.setProperty("Email", employee.getEmail());
		employeeEntity.setProperty("Mobile", employee.getMobile());
		employeeEntity.setProperty("DateOfJoin", employee.getDateOfJoin());
		employeeEntity.setProperty("Designation", employee.getDesignation());
		employeeEntity.setProperty("Gender", employee.getGender());
		datastore.put(employeeEntity);
		
		 
		EmployeeUtility.employeeAddress(employee); 
		
		EmployeeUtility.employeeLogin(employee);
		
		EmployeeUtility.employeeLeave(employee);
 		
 		 
 		welcomeMail(employee.getFirstName(),employee.getEmail(),employee.getDesignation());
 		return true;
	    }
	    
   		
		return false;
	}
	
	public void welcomeMail(String userName,String mail,String designation)
	{
		 Properties props = new Properties();
		 Session session = Session.getDefaultInstance(props, null);

		 String msgBody =   
	
				 "Hello "+userName.toUpperCase()+ 
 				 
					"We are delighted you have joined us as "+designation+" !\n"+
			 "Your contribution is important to ensure our sustained success and growth.\n"+
			 "We hope that your career here will be a gratifying one.\n"+
			 "You would get maximum support from the whole of our team\n"+
			 "and we look forward to having the best relations with you.\n"+

			 "I welcome to u on the behalf of Prodigy Software Solution\n"+
			 "I hope you will find Prodigy Software Solution as a cool place to work with !!!\n"+
 
			  " Thanks and Regards,\n"+
			   "       HR.... ";

		 	try
		 	{
		 		Message msg = new MimeMessage(session);
		 		msg.setFrom(new InternetAddress("pugazh.sadasivam@a-cti.com", "HR Manager"));
		 		msg.addRecipient(Message.RecipientType.TO,
		 				new InternetAddress(mail, userName));
		 		msg.setSubject("Welcome Letter from PRODIGY");
		 		msg.setText(msgBody);
		 		Transport.send(msg);

		 	}
		 	catch (Exception e)
		 	{
		     
		 		 
		 	} 
		 	 

	}
 
	
				
	public void computeEmployeeSalary(long basicPay)
	{
		double PF=0;
		 try
		 {
			 if(basicPay<0)
				{
					throw new SalaryException();
				} 
		 }
		 catch(Exception exception)
		 {
			 
		 }
			
	  	
		
		DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
		
		  DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
		  Calendar currentDate = Calendar.getInstance();
		  String date= dateFormat.format(currentDate.getTime());
		
		  Query employeeQuery = new Query("Leave").addSort("EmployeeId", Query.SortDirection.ASCENDING);
	      List<Entity> employeeEntity =datastore.prepare(employeeQuery).asList(FetchOptions.Builder.withLimit(10));
	       
	      
 		  for(Entity employee:employeeEntity)
		  {
 			  String empId=employee.getProperty("EmployeeId").toString();
 			  
 			  if( (empId.contains("E"))||(empId.contains("e")))
 					  {
 				  			int LOPDays=Integer.valueOf(employee.getProperty("LOPDays").toString());
 				  			PF=(basicPay*(0.12));
 				  			System.out.println("my PF is "+PF+" basic pay is "+basicPay);
 				  			double netPay=(basicPay-(LOPDays*200))-PF;
 				  
 				  			String employeeId=employee.getProperty("EmployeeId").toString();
 				  
 				  			Entity employeeSalaryEntity=new Entity("Salary",employeeId);
 				  			employeeSalaryEntity.setProperty("EmployeeId", employee.getProperty("EmployeeId"));
 				  			employeeSalaryEntity.setProperty("Email", employee.getProperty("Email"));
 				  			employeeSalaryEntity.setProperty("Date",date);
 				  			employeeSalaryEntity.setProperty("BasicPay", basicPay );
  				  			employeeSalaryEntity.setProperty("NetPay", netPay);
  				  			employeeSalaryEntity.setProperty("PF",  PF);
 				  			employeeSalaryEntity.setProperty("LOPDays", LOPDays);
 				  			datastore.put(employeeSalaryEntity);

 					  }
  			 }
 		   
	      
		
	}

	public void computeEmployeeSalary(long basicPay,long incentive)
	{
		
		double PF=0;
		 try
		 {
			 if((basicPay<0)||(incentive<0))
				{
					throw new SalaryException();
				} 
		 }
		 catch(Exception exception)
		 {
			 
		 }
		
		
		
		DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
		
		  DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
		  Calendar currentDate = Calendar.getInstance();
		  String date= dateFormat.format(currentDate.getTime()); 
		  
		  Query employeeQuery = new Query("Leave").addSort("EmployeeId", Query.SortDirection.ASCENDING);
	      List<Entity> employeeEntity =datastore.prepare(employeeQuery).asList(FetchOptions.Builder.withLimit(10));
	        
		  for(Entity employee:employeeEntity)
		  {
			  String empId=employee.getProperty("EmployeeId").toString();
 			  
 			  if( (empId.contains("E"))||(empId.contains("e")))
 			   {
 				
 				  int LOPDays=Integer.valueOf(employee.getProperty("LOPDays").toString());
 				  PF=(basicPay*(0.12));
 				  System.out.println("my PF is "+PF+" basic Pay is "+basicPay);
 				  double netPay=((basicPay+incentive)-(LOPDays*200))-PF;
			  
 				  String employeeId=employee.getProperty("EmployeeId").toString();
			  
 				  Entity employeeSalaryEntity=new Entity("Salary", employeeId);
 				  employeeSalaryEntity.setProperty("EmployeeId", employee.getProperty("EmployeeId"));
 				  employeeSalaryEntity.setProperty("Email", employee.getProperty("Email"));
 				  employeeSalaryEntity.setProperty("Date",date);
 				  employeeSalaryEntity.setProperty("BasicPay", basicPay );
		  		  employeeSalaryEntity.setProperty("NetPay", netPay);
 				  employeeSalaryEntity.setProperty("PF",  PF);
		  		  employeeSalaryEntity.setProperty("LOPDays", LOPDays);
 				  datastore.put(employeeSalaryEntity);
 			   }
		 }
	      
	       
	}
 
}
