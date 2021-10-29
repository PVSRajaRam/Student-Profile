package database_conn;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.sql.DataSource;
import models.FeeTxnHistory;


public class Fee_Payment_History_DAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/student_profile";
    private String jdbcUsername = "root";
    private String jdbcPassword = "password";

    private static final String SELECT_TXN_BY_TXNNO = "select * from Payment_history where txn_number =? and approved=true;";
    private static final String SELECT_ALL_TXNS_BY_ROLLNO = "select * from Payment_history where roll_number =? and approved=true;";
    
    public Fee_Payment_History_DAO() {}

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

    public FeeTxnHistory selectTxnByTxnNo(String txnno) {
        FeeTxnHistory txn = null;
        // Step 1: Establishing a Connection
        try (Connection connection = getConnection();
            // Step 2:Create a statement using connection object
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_TXN_BY_TXNNO);) {
            preparedStatement.setString(1, txnno);
            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();

            // Step 4: Process the ResultSet object.
            while (rs.next()) {
                txn=new FeeTxnHistory(rs.getString(1),
                					  rs.getString(2),
                					  rs.getString(3),
                					  rs.getDate(4),
                					  rs.getString(5),
                					  rs.getFloat(6),
                					  rs.getInt(7),
                					  rs.getString(8));
            }
               
            } 
        catch (SQLException e) {
            printSQLException(e);
        }
        return txn;
    }

    public List < FeeTxnHistory > selectAllTxnByRollNumber(String rollno) {

        // using try-with-resources to avoid closing resources (boiler plate code)
        List < FeeTxnHistory > txns = new ArrayList < > ();
        // Step 1: Establishing a Connection
        try (Connection connection = getConnection();

            // Step 2:Create a statement using connection object
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_TXNS_BY_ROLLNO);) {
        	preparedStatement.setString(1, rollno);
            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();

            // Step 4: Process the ResultSet object.
            while (rs.next()) {
                txns.add(new FeeTxnHistory(rs.getString(1),
                						   rs.getString(2),
                						   rs.getString(3),
                						   rs.getDate(4),
                						   rs.getString(5),
                						   rs.getFloat(6),
                						   rs.getInt(7),
                						   rs.getString(8)));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return txns;
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