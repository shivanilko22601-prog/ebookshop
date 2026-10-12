package com.app;

import java.sql.Connection;
import java.sql.DriverManager;

import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;

public class DatabaseConnection implements ServletContextListener{
	
	
	Connection cn;
	
	@Override
	public void contextInitialized(ServletContextEvent sce) {
		try
			{
			String url = setting(sce, "DB_URL", "jdbc:h2:mem:ebookshop;MODE=MySQL;DATABASE_TO_LOWER=TRUE;DB_CLOSE_DELAY=-1");
			String user = setting(sce, "DB_USER", url.startsWith("jdbc:h2:") ? "sa" : "root");
			String password = setting(sce, "DB_PASSWORD", "");
				Class.forName(url.startsWith("jdbc:h2:") ? "org.h2.Driver" : "com.mysql.cj.jdbc.Driver");
				cn=DriverManager.getConnection(url, user, password);
				if (url.startsWith("jdbc:h2:")) initializeDemoDatabase(cn);
				sce.getServletContext().setAttribute("CONN", cn);
				sce.getServletContext().removeAttribute("DB_ERROR");
			
			}
		catch (Exception e) {
			sce.getServletContext().setAttribute("DB_ERROR", e.getMessage());
			sce.getServletContext().log("Could not connect to the e-book shop database", e);
		}
	}
	
	
	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		try
		{
			if(cn != null && !cn.isClosed())
				{
					cn.close();
				}
		}
	catch (Exception e) {
		sce.getServletContext().log("Could not close the e-book shop database connection", e);
	}
	}

	private void initializeDemoDatabase(Connection connection) throws Exception {
		try (java.sql.Statement statement = connection.createStatement()) {
			statement.execute("CREATE TABLE IF NOT EXISTS user_info (emailid VARCHAR(190) PRIMARY KEY, name VARCHAR(120) NOT NULL, address VARCHAR(255) NOT NULL, security_quest VARCHAR(255) NOT NULL, security_ans VARCHAR(255) NOT NULL)");
			statement.execute("CREATE TABLE IF NOT EXISTS login (userid VARCHAR(190) PRIMARY KEY, password VARCHAR(255) NOT NULL, usertype VARCHAR(20) NOT NULL, FOREIGN KEY (userid) REFERENCES user_info(emailid) ON DELETE CASCADE)");
			statement.execute("CREATE TABLE IF NOT EXISTS cat_subcat (category_name VARCHAR(80) NOT NULL, scategory_name VARCHAR(100) NOT NULL, PRIMARY KEY (category_name, scategory_name))");
			statement.execute("CREATE TABLE IF NOT EXISTS books (bid INTEGER AUTO_INCREMENT PRIMARY KEY, bname VARCHAR(180) NOT NULL, bpublication VARCHAR(180) NOT NULL, bdetail CLOB NOT NULL, bcost DECIMAL(10,2) NOT NULL, cover_image BLOB, bcategory VARCHAR(80) NOT NULL, bsubcategory VARCHAR(100) NOT NULL)");
			statement.executeUpdate("INSERT INTO user_info(emailid,name,address,security_quest,security_ans) SELECT 'admin@ebookshop.local','Demo Administrator','College Demo','What is your first school name?','demo' WHERE NOT EXISTS (SELECT 1 FROM user_info WHERE emailid='admin@ebookshop.local')");
			statement.executeUpdate("INSERT INTO login(userid,password,usertype) SELECT 'admin@ebookshop.local','admin123','Admin' WHERE NOT EXISTS (SELECT 1 FROM login WHERE userid='admin@ebookshop.local')");
			statement.executeUpdate("INSERT INTO cat_subcat(category_name,scategory_name) SELECT 'Engineering','Civil Engineering' WHERE NOT EXISTS (SELECT 1 FROM cat_subcat WHERE category_name='Engineering' AND scategory_name='Civil Engineering')");
			statement.executeUpdate("INSERT INTO cat_subcat(category_name,scategory_name) SELECT 'Engineering','Computer Engineering' WHERE NOT EXISTS (SELECT 1 FROM cat_subcat WHERE category_name='Engineering' AND scategory_name='Computer Engineering')");
			statement.executeUpdate("INSERT INTO cat_subcat(category_name,scategory_name) SELECT 'Engineering','Mechanical Engineering' WHERE NOT EXISTS (SELECT 1 FROM cat_subcat WHERE category_name='Engineering' AND scategory_name='Mechanical Engineering')");
			statement.executeUpdate("INSERT INTO cat_subcat(category_name,scategory_name) SELECT 'Magazines','General' WHERE NOT EXISTS (SELECT 1 FROM cat_subcat WHERE category_name='Magazines' AND scategory_name='General')");
			addSampleBook(statement, "Introduction to Computer Science", "Engineering", "Computer Engineering", 450.00, "A sample catalog entry for the college presentation.");
			addSampleBook(statement, "Engineering Mechanics", "Engineering", "Mechanical Engineering", 520.00, "A sample mechanics book for the college presentation.");
			addSampleBook(statement, "Basics of Civil Engineering", "Engineering", "Civil Engineering", 390.00, "A sample civil engineering book for the college presentation.");
			addSampleBook(statement, "Campus Science Monthly", "Magazines", "General", 90.00, "A sample magazine for the college presentation.");
		}
	}

	private void addSampleBook(java.sql.Statement statement, String name, String category, String subcategory, double cost, String details) throws Exception {
		String sql = "INSERT INTO books(bname,bpublication,bdetail,bcost,bcategory,bsubcategory) SELECT '" + name + "','Demo Publications','" + details + "'," + cost + ",'" + category + "','" + subcategory + "' WHERE NOT EXISTS (SELECT 1 FROM books WHERE bname='" + name + "')";
		statement.executeUpdate(sql);
	}

	private String setting(ServletContextEvent sce, String name, String fallback) {
		String value = sce.getServletContext().getInitParameter(name);
		if (value == null || value.isBlank()) value = System.getenv(name);
		return value == null || value.isBlank() ? fallback : value;
	}

}
