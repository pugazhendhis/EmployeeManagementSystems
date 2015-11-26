package pugazh.employee.controller;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.jdo.PersistenceManager;
import javax.servlet.http.*;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.FetchOptions;
import com.google.appengine.api.datastore.PreparedQuery;
import com.google.appengine.api.datastore.Query;
import com.google.appengine.api.datastore.Query.Filter;
import com.google.appengine.api.datastore.Query.FilterOperator; 
import com.google.appengine.api.datastore.Query.FilterPredicate;
import com.google.appengine.api.datastore.Entity;

import pugazh.employee.bean.Address;
import pugazh.employee.bean.DataHandler;
import pugazh.employee.bean.Employee;
import pugazh.employee.bean.NewEmployee;
import pugazh.employee.bean.NewTrainee;
import pugazh.employee.bean.Trainee;
import com.google.appengine.api.datastore.Query.CompositeFilterOperator;

@Controller
public class EmployeeManagementSystemServlet
{
	
	@RequestMapping("/")
	public String homePage()
	{
		return "index";
	}
	 
	@RequestMapping("/homePage")
	public String goHomePage(HttpServletRequest req,HttpSession session)
	{
		session=req.getSession();
		session.invalidate();
 		return "index";
	}
	 
	 @RequestMapping(value="/login", method=RequestMethod.POST)
	 public String goHomePage(HttpServletRequest req,ModelMap model)
	 {
		     String userName=req.getParameter("userName");
		     String password=req.getParameter("password");
		     
	 
		    DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
		    
		    Filter userNameFilter = new FilterPredicate("UserName",FilterOperator.EQUAL,userName);
		    Filter passwordFilter=new FilterPredicate("Password", FilterOperator.EQUAL, password);
		    
		    Filter firstNameFilter=new FilterPredicate("Email",FilterOperator.EQUAL,userName);
		    Filter validateFilter =
		    		  CompositeFilterOperator.and(userNameFilter, passwordFilter);
		    
    		Query query = new Query("Login").setFilter(validateFilter);
    	    PreparedQuery preparedQueryObject = datastore.prepare(query);
    	    Entity employeeEntity=preparedQueryObject.asSingleEntity();
    	     
    	    Query employeeQuery = new Query("Employee").setFilter(firstNameFilter);
    	    PreparedQuery employeePreparedQuery = datastore.prepare(employeeQuery);
    	    Entity employeeEntityRecord=employeePreparedQuery.asSingleEntity();
    	    
    	    Query traineeQuery = new Query("Trainee").setFilter(firstNameFilter);
    	    PreparedQuery traineePreparedQuery  = datastore.prepare(traineeQuery);
    	    Entity traineeEntityRecord=traineePreparedQuery.asSingleEntity();
    	    
    	    
    	    
    	     
    	    
		    HttpSession session=req.getSession();
		     
		    
	        if((userName.equals("Admin"))&&(password.equals("Admin")))
	        {
	         	session.setAttribute("user","Admin");
	        	return "Home";
	        }
	        else if(employeeEntity!=null)
	    	    {
	        	  
	        	     String employeeIdProperty=null;
	        	     String employeeName=null;
	        		 if(employeeEntityRecord!=null)
	        		 {
	        			 employeeIdProperty=employeeEntityRecord.getProperty("EmployeeId").toString();
	        			 employeeName=employeeEntityRecord.getProperty("FirstName").toString();
	        		 }
	        			 
	        		 if(traineeEntityRecord!=null)
	        		 {
	        			 employeeIdProperty=traineeEntityRecord.getProperty("EmployeeId").toString();
	        			 employeeName=traineeEntityRecord.getProperty("FirstName").toString();
	        		 }
	        			 
	        		String employeeUserName=employeeEntity.getProperty("UserName").toString();
	        		//String employeePassword=employeeEntity.getProperty("Password").toString();
	        		session.setAttribute("user",employeeName);
			        if((employeeIdProperty!=null)||(employeeUserName!=null))
			        {	 
			        	session.setAttribute("employeeId", employeeIdProperty);
			        	session.setAttribute("email",employeeUserName);
			        }
	        		//session.setAttribute("user", employeePassword.replaceAll("\\d",""));
        		 
	    	    	return "EmployeeHomePage";
	    	    }
	    	     
	            model.addAttribute("loginError", "UserName or Password Mismatch");
	            return "index";
	 }
	 
	 
	 @RequestMapping("/login")
	 public String goHomePageAgain()
	 {	
		 System.out.println("in admin go home");
		 return "Home";
	 }
	 
	 @RequestMapping("/hireemployee")
	 public String recruitEmployee()
	 {
		 return "Recruitment";
	 }
	 
	 @RequestMapping(value="/addemployee",method=RequestMethod.POST)
	 public String addNewEmployee(@ModelAttribute("employee") Employee employee,ModelMap model)
	 {
		  
		 NewEmployee employeeObject=new NewEmployee();
		 boolean result=employeeObject.addEmployee(employee);
		 if(result)
		 {
			 return "Recruitment";
		 }
 		 model.addAttribute("createError","Record Already Exist");
 		 return "Recruitment";
 	 	 
	 }
	
	 
	 @RequestMapping("/hiretrainee")
	 public String recruitTrainee(HttpServletRequest req)
	 {
		 if(req.getSession(false)!=null)
			 return "RecruitTrainee";
		 else
			 return "Exception";
	 }
	 
	 @RequestMapping(value="/addtrainee",method=RequestMethod.POST)
	 public String addNewTrainee(@ModelAttribute("employee") Trainee trainee,ModelMap model)
	 {
		  int duration=trainee.getDuration(); 
		  NewTrainee employeeObject=new NewTrainee();
		  boolean result=employeeObject.addEmployee(trainee,duration);
		  if(result)
		  {
			  return "RecruitTrainee";
		  }
		  model.addAttribute("traineeEntityError","Record Already Exist");
		  return "RecruitTrainee";
	 	  
	 }
	
	
	 @RequestMapping("/layoffemployee")
	 public String layOffEmployee()
	 {
		  
		    return "LayOff";
	 }
	 
	
	 @RequestMapping(value="/layoffemp",method=RequestMethod.POST)
	 public String laidOffEmployee(HttpServletRequest req,ModelMap model)
	 {
		   String employee=req.getParameter("searchEmployee");
		   Entity layOffEntity=DataHandler.layOffEmployee(employee);
		   if(layOffEntity!=null)
		   {
			   model.addAttribute("layOffEmployee", layOffEntity);
		   	   return "LayOffEmployee";
		   }
		    
			   model.addAttribute("searchError"," No employee  exist with this Id");
			   return "LayOff";
		    
			   
			   
		   	  
		   
	 }
	
	@RequestMapping(value="/layoff/{id}")
	public String layOff(@PathVariable String id)
	{
		String employeeId=id;
		DataHandler.deleteEmployeeRecord(employeeId);
  		return "LayOff";
	}
	
	 @RequestMapping("/manpower")
	 public String getAllEmployee(ModelMap model)
	 {
		    DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
		    
		    Query employeeQuery = new Query("Employee").addSort("EmployeeId", Query.SortDirection.ASCENDING);
	        List<Entity> employeeEntity =datastore.prepare(employeeQuery).asList(FetchOptions.Builder.withLimit(10));
	        
	        Query traineeQuery=new Query("Trainee").addSort("EmployeeId", Query.SortDirection.ASCENDING);
	        List<Entity> traineeEntity =datastore.prepare(traineeQuery).asList(FetchOptions.Builder.withLimit(10));
		      
		    model.addAttribute("employeeRecord", employeeEntity);
		    model.addAttribute("traineeRecord",traineeEntity);
		    
		    return "AllEmployee";
	 }

	 @RequestMapping("/leaveapprove")
	 public String approveLeave(ModelMap model)
	 {
		  	DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
		    
		    Query leaveRequestQuery = new Query("LeaveApplication").addSort("EmployeeId", Query.SortDirection.ASCENDING);
	        List<Entity> leaveRequestEntity =datastore.prepare(leaveRequestQuery).asList(FetchOptions.Builder.withLimit(10));
	      
		    model.addAttribute("leaveRequest",leaveRequestEntity);
		 
		 return "LeaveApproval";
	 }
	 
	 
	 @RequestMapping("/leaveRequestApproved/{mail}/{employeeId}")
	 public String leaveApproved(@PathVariable String employeeId,@PathVariable String mail,ModelMap model)
	 {
		 DataHandler.leaveApproved(mail, employeeId);
 		 //return "LeaveApproval";
  		  return "redirect:/leaveapprove";
		  		
	 }
	
	  
	 @RequestMapping("/traineesalary")
	 public String getTraineeSalary()
	 {
		 return "traineeSalary";
	 }
	 
	 @RequestMapping(value="/computetraineesalary",method=RequestMethod.POST)
	 public String processTraineeSalary(HttpServletRequest req)
	 {
		 NewEmployee traineeObject=new NewTrainee();
		
		 System.out.println("in ");
		 if((req.getParameter("incentives").equals(""))||(req.getParameter("incentives")==null))
		 {
			 long basicPay=Long.valueOf(req.getParameter("basicSalary"));
			 
			 traineeObject.computeEmployeeSalary(basicPay);
	     }
		 else  
		 {
			 long basicPay=Long.valueOf(req.getParameter("basicSalary"));
			 long incentive=Long.valueOf(req.getParameter("incentives"));
			 traineeObject.computeEmployeeSalary(basicPay,incentive);
		 }
		 return "traineeSalary";
	 }
	
	 
	 @RequestMapping("/employeesalary")
	 public String getEmployeeSalary()
	 {
		 return "Salary";
	 }
	
	 
	 @RequestMapping(value="/computeemployeesalary",method=RequestMethod.POST)
	 public String processEmployeeSalary(HttpServletRequest req,HttpSession session)
	 {
		 long PF=0;
		 System.out.println("in compute employee salary controll");
		 NewEmployee employeeObject=new NewEmployee();
		  
		 if((req.getParameter("incentives").equals(""))||(req.getParameter("incentives")==null))
		 {
			 System.out.println("in compute empl empty incentives");
			 long basicPay=Long.valueOf(req.getParameter("basicSalary"));
			 employeeObject.computeEmployeeSalary(basicPay);
			 /*session=req.getSession(false);
			 System.out.println("my pf "+PF);
			 if(session!=null)
			 {
				 session.setAttribute("myPF", PF);
			 }*/
	     }
		 else 
		 {
			 System.out.println("in compute empl data incentives");
			 long basicPay=Long.valueOf(req.getParameter("basicSalary"));
			 long incentive=Long.valueOf(req.getParameter("incentives"));
			 employeeObject.computeEmployeeSalary(basicPay,incentive);
		 }
		 return "Salary";
	 }
	
	 
	 
}

