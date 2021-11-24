package database_conn;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import models.FeeTxnHistory;
import models.Remaining_Fees;
import models.TxnYear;

public class Remaining_Fees_DAO {
	private String jdbcURL = "jdbc:mysql://localhost:3306/student_profile";
    private String jdbcUsername = DBCredentials.getUsername();
    private String jdbcPassword = DBCredentials.getPassword();

    private static final String SELECT_ALL_RECORDS = "select * from Remaining_Fees;";
    private static final String SELECT_RECORD_BY_ROLL_NO = "select * from Remaining_Fees where roll_number=?;";
    private static final String UPDATE_FEE_RECORD = "update Remaining_Fees set tuition_fee_payable=((100 - ?)*3000) where roll_number=?;";
    private static final String UPDATE_SLAB_RECORD = "update Remaining_Fees set scholarship=? where roll_number=?;";
    
    public Remaining_Fees_DAO() {}

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
        	System.out.println("sql exception");
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
        	System.out.println("class exception");
            e.printStackTrace();
        }
        return connection;
    }

    public List < Remaining_Fees > selectAllRecords() {

        // using try-with-resources to avoid closing resources (boiler plate code)
        List < Remaining_Fees > records = new ArrayList < > ();
        // Step 1: Establishing a Connection
        try (Connection connection = getConnection();

            // Step 2:Create a statement using connection object
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_RECORDS);) {
        	System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();

            // Step 4: Process the ResultSet object.
            while (rs.next()) {
                records.add(new Remaining_Fees(rs.getString(1),
                						   rs.getInt(3),
                						   rs.getFloat(2)));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return records;
    }    

    public void updateFees(int scholarship,String rollno) throws SQLException {
        System.out.println( UPDATE_FEE_RECORD);
        // try-with-resource statement will auto close the connection.
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement( UPDATE_FEE_RECORD)) {
            preparedStatement.setInt(1, scholarship);
            preparedStatement.setString(2, rollno);
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }   
    
    public void updateSlab(int scholarship,String rollno) throws SQLException {
        System.out.println( UPDATE_SLAB_RECORD);
        // try-with-resource statement will auto close the connection.
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement( UPDATE_SLAB_RECORD)) {
            preparedStatement.setInt(1, scholarship);
            preparedStatement.setString(2, rollno);
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }  
    
    public Remaining_Fees selectRecordByRollno(String rollno) {
    	Remaining_Fees  record = new Remaining_Fees();
        // Step 1: Establishing a Connection
        try (Connection connection = getConnection();

            // Step 2:Create a statement using connection object
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_RECORD_BY_ROLL_NO);) {
        	preparedStatement.setString(1, rollno);
        	System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
        	
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
            // Step 4: Process the ResultSet object.
           record = new Remaining_Fees(rs.getString(1),rs.getInt(3),rs.getFloat(2));
            }
           return record;
        } catch (SQLException e) {
            printSQLException(e);
        }
        return record;
    	
    }
    
    private void printSQLException(SQLException ex) {
        for (Throwable e: ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
	

}
