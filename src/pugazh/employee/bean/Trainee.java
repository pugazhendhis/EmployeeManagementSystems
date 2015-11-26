package pugazh.employee.bean;

import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;

 
public class Trainee extends Employee
{
	 
	private int duration;

	public int getDuration()
	{
		return duration;
	}

	public void setDuration(int duration)
	{
		this.duration = duration;
	}

}
