package pugazh.employee.controller;

import javax.jdo.JDOHelper;
import javax.jdo.PersistenceManagerFactory;

public class Persistence
{
	private static final PersistenceManagerFactory pmfInstance = JDOHelper
			.getPersistenceManagerFactory("transactions-optional");

		private  Persistence()
		{
			 
		} 

		public static PersistenceManagerFactory get()
		{
			return pmfInstance;
		}

}
