package com.pr.search.test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBHelper {

	public static Connection getConn() throws ClassNotFoundException, SQLException {
		String url = "jdbc:oracle:thin:@10.110.1.108:1521:orcl";
		String user = "gcloud_name";
		String passwd = "gcloud_name";
		Connection conn = null;
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url, user, passwd);
		return conn;
	}
}
