package pugazh.employee.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.appengine.api.datastore.Entity;

import pugazh.employee.bean.DataHandler;
import pugazh.employee.bean.EmployeeUtility;

@Controller
public class EmployeeController
{

	@RequestMapping("/myhome")
	public String viewhomePage()
	{
		return "EmployeeHomePage";
	}
	
	@RequestMapping("/myprofile")
	public String viewMyPprofile(HttpServletRequest request,HttpSession session,ModelMap model)
	{
		session=request.getSession(false); 
		if(session==null)
		{
			model.addAttribute("sessionError", "Login to access this application");
			return "index";
		}
		String email=session.getAttribute("email").toString();
	 	Entity profileEntity=DataHandler.getMyProfile(email);
  		model.addAttribute("myProfile",  profileEntity); 
		return "Profile";
	}
	
	@RequestMapping("/applyleave")
	public String applyLeaveRequest()
	{
		
		return "LeaveRequest";
		
	}
	
	
	@RequestMapping(value="/lrequest",method=RequestMethod.POST)
	public String approveLeaveRequest(HttpSession session,HttpServletRequest request,@RequestParam Map<String,String> leaveApplication,ModelMap model)
	{
		session=request.getSession(false);
		String email=null,employeeId=null;
 		if(session!=null)
 			employeeId=session.getAttribute("employeeId").toString();
 			email=session.getAttribute("email").toString(); 
			boolean result=DataHandler.leaveRequestApplication(leaveApplication,email,employeeId);
		if(result)
		{
			model.addAttribute("leaveRequestSuccess", "Your Leave request has been sent for an approval");
			return "LeaveRequest";
		}
			
		model.addAttribute("LeaveApplyError", "Not valid employee");
		return "LeaveRequest";
	}
	
	@RequestMapping("/myleavedetails")
	public String viewMyLeaveDetails(HttpServletRequest request,HttpSession session,ModelMap model)
	{
		 
		String email=session.getAttribute("email").toString();
	 	HashMap leaveDetailsEntity=DataHandler.getMyLeaveDetails(email);
		model.addAttribute("employeeEntity", leaveDetailsEntity.get("employee"));
		model.addAttribute("leaveEntity", leaveDetailsEntity.get("leave"));
 		if(request.getSession(false)!=null)
	 		return "LeaveDetails";
 		return "index";
	}
	
	@RequestMapping("/forgotpassword")
	public String resetPassword()
	{
	 	return "ResetPassword";
		
	}
	
	@RequestMapping("/PasswordReset")
	public String recoveryPassword(HttpServletRequest request,ModelMap model,HttpSession session)
	{
 		String email=request.getParameter("email");
  		String result=DataHandler.resetPassword(email);
		if(result!=null)
		{
			session.setAttribute("loginUserName",email);
			model.addAttribute("resetLink","password Reset link has been sent to your mail id");
			EmployeeUtility.passwordResetLinkMail(email);
			return "ResetPassword";
		}
			
	 	model.addAttribute("recoveryError","Please enter valid email id");  
		return "ResetPassword";
		
	}
	
	@RequestMapping("/passwordResetLink")
	public String resetLink()
	{
		return "ChangePassword";
	}
	
	@RequestMapping("/Resetsuccess")
	public String resetSuccess(ModelMap model,HttpSession session,HttpServletRequest request)
	{
		String email=null; 
		session=request.getSession(false);
		String password=request.getParameter("newPassword");
		String confirmPassword=request.getParameter("confirmPassword");
		if(password.equals(confirmPassword))
		{
			 
			if(session!=null)
			{
				 
				email=session.getAttribute("loginUserName").toString();
			}
		}
		else
		{
			 
			model.addAttribute("mismatch", "Password Didn't match");
			return "ChangePassword";
			
		}
			
		 
		
	 	boolean changed=DataHandler.resetSuccess(email,password);
		if(changed)
	 		return "index";
	 
		model.addAttribute("success", "Your new Password failed to update");
		return "ChangePassword";
	}
	
	@RequestMapping("/leaveDeclined/{email}/{employeeId}")
	public String leaveDeclined(@PathVariable String email,@PathVariable String employeeId)
	{
		EmployeeUtility.leaveDeclinedMail(email,employeeId);
		return "LeaveApproval";
	}
	
	@RequestMapping("/salary")
	public String employeeSalary(HttpSession session,HttpServletRequest request,ModelMap model)
	{
		String employeeId=null;
		if(request.getSession(false)!=null)
			employeeId=session.getAttribute("employeeId").toString();
		Entity salaryEntity=EmployeeUtility.employeeSalaryRecord(employeeId);
		if(salaryEntity!=null)
		{
			model.addAttribute("salaryEntity", salaryEntity);
			return "EmployeeSalaryRecord";
		}
		model.addAttribute("salaryError", "Salary Not yet Generated");
		return "EmployeeSalaryRecord";
	}
	
}
