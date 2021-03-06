package com.flynntown.utils;

import java.sql.*;
import java.util.Date;

public class DbUtils {
	private Connection connect = null;
	private Statement statement = null;
	private PreparedStatement preparedStatement = null;
	private ResultSet resultSet = null;
	
	public static boolean testConnection(String user, String pw) throws Exception{
		DbUtils dbu = new DbUtils();
		dbu.readDataBase(user,pw);
		return true;
	}
	
	  public void readDataBase(String user,String pw) throws Exception {
		    try {
		      // This will load the MySQL driver, each DB has its own driver
		      Class.forName("com.mysql.jdbc.Driver");
		      // Setup the connection with the DB
		      connect = DriverManager
		          .getConnection("jdbc:mysql://localhost/flynntownjukebox?"
		              + "user="+user+"&password="+pw);
		      
		    } catch (Exception e) {
		      throw e;
		    } finally {
		      close();
		    }

		  }

		  private void writeMetaData(ResultSet resultSet) throws SQLException {
		    //   Now get some metadata from the database
		    // Result set get the result of the SQL query
		    
		    System.out.println("The columns in the table are: ");
		    
		    System.out.println("Table: " + resultSet.getMetaData().getTableName(1));
		    for  (int i = 1; i<= resultSet.getMetaData().getColumnCount(); i++){
		      System.out.println("Column " +i  + " "+ resultSet.getMetaData().getColumnName(i));
		    }
		  }

		  private void writeResultSet(ResultSet resultSet) throws SQLException {
		    // ResultSet is initially before the first data set
		    while (resultSet.next()) {
		      // It is possible to get the columns via name
		      // also possible to get the columns via the column number
		      // which starts at 1
		      // e.g. resultSet.getSTring(2);
		      String user = resultSet.getString("myuser");
		      String website = resultSet.getString("webpage");
		      String summery = resultSet.getString("summery");
		      Date date = resultSet.getDate("datum");
		      String comment = resultSet.getString("comments");
		      System.out.println("User: " + user);
		      System.out.println("Website: " + website);
		      System.out.println("Summery: " + summery);
		      System.out.println("Date: " + date);
		      System.out.println("Comment: " + comment);
		    }
		  }

		  // You need to close the resultSet
		  private void close() {
		    try {
		      if (resultSet != null) {
		        resultSet.close();
		      }

		      if (statement != null) {
		        statement.close();
		      }

		      if (connect != null) {
		        connect.close();
		      }
		    } catch (Exception e) {

		    }
		  }
	
}
