package projects;

import projects.dao.DbConnection;

/*
 * @author angeluz
 * 
 */
public class ProjectsApp {
	
	/*
	 * @param args
	 */
	public ProjectsApp() {
		// TODO Auto-generated constructor stub
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		DbConnection.getConnection();
	}

}
