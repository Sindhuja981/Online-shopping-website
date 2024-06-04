package dbutils;

import java.sql.Connection;
import java.sql.DriverManager;

public class DbConnection {
	Connection conn = null;

	public Connection getConnection() {
	try {
		//Step 1
		Class.forName("com.mysql.jdbc.Driver");
		
		//Step 2
		conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/e-commercedb?autoReconnect=true&useSSL=false","root","");
	}catch(Exception e) {
		conn=null;
	}
	return conn;
}

}