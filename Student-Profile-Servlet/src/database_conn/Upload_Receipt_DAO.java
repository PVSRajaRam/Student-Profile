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


public class Upload_Receipt_DAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/student_profile";
    private String jdbcUsername = "root";
    private String jdbcPassword = "password";

    private static final String INSERT_APPROVALS_SQL = "insert into Payment_history(txn_number,bank,roll_number,txn_date,txn_purpose,txn_amount,payment_mode,approved) " + " VALUES" +
        " (?, ?, ?, ?, ?, ?, ?, ?);";
    private static final String SELECT_APPROVALS_BY_ROLL_NUMBER = "select * from Payment_history where ROLL_NUMBER =? and approved=false;";
    private static final String SELECT_ALL_APPROVALS = "select * from Payment_history where approved=false;";
    private static final String UPDATE_APPROVALS_SQL = "UPDATE Payment_history set approved=true, staff=? where txn_number = ? and bank = ?;";
    private static final String DELETE_APPROVALS_SQL = "delete from Payment_history where txn_number = ? and bank = ?;";
    
    public Upload_Receipt_DAO() {}

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

    public void insertApproval(FeeTxnHistory txn) throws SQLException {
        System.out.println(INSERT_APPROVALS_SQL);
        // try-with-resource statement will auto close the connection.
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(INSERT_APPROVALS_SQL)) {
            preparedStatement.setString(1, txn.getTxn_number());
            preparedStatement.setString(2, txn.getBank());
            preparedStatement.setString(3, txn.getRoll_number());
            preparedStatement.setDate(4, txn.getTxn_date());
            preparedStatement.setString(5, txn.getTxn_purpose());
            preparedStatement.setFloat(6, txn.getTxn_amt());
            preparedStatement.setString(7, txn.getPayment_mode());
            preparedStatement.setBoolean(8, false);
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    public FeeTxnHistory selectAprrovalByRollNumber(String roll_number) {
    	FeeTxnHistory txn = null;
        // Step 1: Establishing a Connection
        try (Connection connection = getConnection();
            // Step 2:Create a statement using connection object
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_APPROVALS_BY_ROLL_NUMBER);) {
            preparedStatement.setString(1, roll_number);
            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();

            // Step 4: Process the ResultSet object.
            while (rs.next()) {
                txn = new FeeTxnHistory(rs.getString(1),
                							rs.getString(2),
                							rs.getString(3),
                							rs.getDate(4),
                							rs.getString(5),
                							rs.getFloat(6),
                							rs.getString(9),
                							rs.getBoolean(11));
            }
                   
        } 
        catch (SQLException e) {
            printSQLException(e);
        }
        return txn;
    }

    public List < FeeTxnHistory > selectAllApprovals() {

        // using try-with-resources to avoid closing resources (boiler plate code)
        List < FeeTxnHistory > approvals = new ArrayList < > ();
        // Step 1: Establishing a Connection
        try (Connection connection = getConnection();

            // Step 2:Create a statement using connection object
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_APPROVALS);) {
            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();

            // Step 4: Process the ResultSet object.
            while (rs.next()) {
                approvals.add(new FeeTxnHistory(rs.getString(1),
						rs.getString(2),
						rs.getString(3),
						rs.getDate(4),
						rs.getString(5),
						rs.getFloat(6),
						rs.getString(9),
						rs.getBoolean(11)));
               
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return approvals;
    }

        
    public boolean updateReceipt(String staff,String txn_number, String bank) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(UPDATE_APPROVALS_SQL);) {
            
        	statement.setString(1, staff);
            statement.setString(2, txn_number);
            statement.setString(3, bank);
            System.out.println(statement);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    public boolean deleteReceipt(String txn_number, String bank) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(DELETE_APPROVALS_SQL);) {
            statement.setString(1, txn_number);
            statement.setString(2, bank);
            System.out.println(statement);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
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