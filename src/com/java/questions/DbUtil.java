package com.java.questions;

import java.sql.Connection;
import java.sql.SQLException;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DbUtil {

	static Connection con=null;
	static {
		try {
			InitialContext context=new InitialContext();
			DataSource ds=(DataSource) context.lookup("java:comp/env/jdbc/UsersDB");
			con=ds.getConnection();
			
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public static Connection getConnection() {
		return con;
	}
}
