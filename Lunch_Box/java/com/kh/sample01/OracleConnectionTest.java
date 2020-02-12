package com.kh.sample01;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

public class OracleConnectionTest {

	private static final String DRIVER = "oracle.jdbc.driver.OracleDriver";
	private static final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
	private static final String ID = "spring";
	private static final String PW = "1234";
	
	
	public void main(String[] args) {
		try {
			testConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void testConnection() throws Exception {
		Class.forName(DRIVER);
		Connection conn = DriverManager.getConnection(URL, ID, PW);
		System.out.println("conn:" + conn);
	}
}
