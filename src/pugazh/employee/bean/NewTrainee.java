package pugazh.employee.bean;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.FetchOptions;
import com.google.appengine.api.datastore.PreparedQuery;
import com.google.appengine.api.datastore.Query;
import com.google.appengine.api.datastore.Query.Filter;
import com.google.appengine.api.datastore.Query.FilterOperator;
import com.google.appengine.api.datastore.Query.FilterPredicate;

public class NewTrainee extends NewEmployee 
{

	 
	public boolean addEmployee(Employee trainee,int duration)
	{
		System.out.println("in new trainee add method");
		DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();

		Filter traineeFilter = new FilterPredicate("EmployeeId",FilterOperator.EQUAL,trainee.getEmployeeId());
		Query query = new Query("Trainee").setFilter(traineeFilter);
	    PreparedQuery preparedQueryObject = datastore.prepare(query);
	    Entity validateEntity=preparedQueryObject.asSingleEntity();
	     
	    if(validateEntity==null)
	    {
		Entity traineeEntity=new Entity("Trainee",trainee.getEmployeeId());
		traineeEntity.setProperty("EmployeeId",trainee.getEmployeeId());
		traineeEntity.setProperty("FirstName",trainee.getFirstName());
		traineeEntity.setProperty("LastName", trainee.getLastName());
		traineeEntity.setProperty("DateOfBirth", trainee.getDateOfBirth());
		traineeEntity.setProperty("Email", trainee.getEmail());
		traineeEntity.setProperty("Mobile", trainee.getMobile());
		traineeEntity.setProperty("DateOfJoin", trainee.getDateOfJoin());
		traineeEntity.setProperty("Designation", trainee.getDesignation());
 		traineeEntity.setProperty("Gender", trainee.getGender());
	 	traineeEntity.setProperty("Duration", duration);
  		 
		datastore.put(traineeEntity);
		 
		
		EmployeeUtility.employeeAddress(trainee);
		
		EmployeeUtility.employeeLogin(trainee);
	 	
		EmployeeUtility.employeeLeave(trainee);
	 	
		welcomeMail(trainee.getFirstName(),trainee.getEmail(),trainee.getDesignation());
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
 

	
	@Override
	public void computeEmployeeSalary(long basicPay)
	{
		  long netPay=0;
		
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
		  String date=dateFormat.format(currentDate.getTime());
		  
		  Query traineeQuery=new Query("Leave").addSort("EmployeeId", Query.SortDirection.ASCENDING);
	      List<Entity> traineeEntity =datastore.prepare(traineeQuery).asList(FetchOptions.Builder.withLimit(10));
		    
	       
		  for(Entity trainee:traineeEntity)
		  {
			  String traineeId=trainee.getProperty("EmployeeId").toString();
			  if((traineeId.contains("T"))||(traineeId.contains("t")))
			  {
				  
				  int LOPDays=Integer.valueOf(trainee.getProperty("LOPDays").toString());
				  netPay=(basicPay-(LOPDays*200));
				  
				  String employeeId=trainee.getProperty("EmployeeId").toString();
				  
				  Entity traineeSalaryEntity=new Entity("Salary", employeeId);
				  traineeSalaryEntity.setProperty("EmployeeId", trainee.getProperty("EmployeeId"));
				  traineeSalaryEntity.setProperty("Email", trainee.getProperty("Email"));
				  traineeSalaryEntity.setProperty("Date",date);
				  traineeSalaryEntity.setProperty("BasicPay", basicPay );
				  traineeSalaryEntity.setProperty("NetPay", netPay);
				  traineeSalaryEntity.setProperty("PF", 0);
				  traineeSalaryEntity.setProperty("LOPDays", LOPDays);
			 	  datastore.put(traineeSalaryEntity);   
			  }
			  
		  }
	       
		
	}

	@Override
	public  void computeEmployeeSalary(long basicPay,long incentive)
	{
		  
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
		  String date=dateFormat.format(currentDate.getTime());
			  
		  Query traineeQuery=new Query("Leave").addSort("EmployeeId", Query.SortDirection.ASCENDING);
	      List<Entity> traineeEntity =datastore.prepare(traineeQuery).asList(FetchOptions.Builder.withLimit(10));
		    
		  for(Entity trainee:traineeEntity)
		  {
			  String traineeId=trainee.getProperty("EmployeeId").toString();
			  if((traineeId.contains("T"))||(traineeId.contains("t")))
			  {
				  int LOPDays=Integer.valueOf(trainee.getProperty("LOPDays").toString());
				  long netPay=((basicPay+incentive)-(LOPDays*200));
			  
				  String employeeId=trainee.getProperty("EmployeeId").toString();
			  
				  Entity traineeSalaryEntity=new Entity("Salary", employeeId);
				  traineeSalaryEntity.setProperty("EmployeeId", trainee.getProperty("EmployeeId"));
				  traineeSalaryEntity.setProperty("Email", trainee.getProperty("Email"));
				  traineeSalaryEntity.setProperty("Date",date);
				  traineeSalaryEntity.setProperty("BasicPay", basicPay );
				  traineeSalaryEntity.setProperty("NetPay", netPay);
				  traineeSalaryEntity.setProperty("PF", 0);
				  traineeSalaryEntity.setProperty("LOPDays", LOPDays);
			 	  datastore.put(traineeSalaryEntity);
			  }
	      
	
		  }
	    

	}
}
