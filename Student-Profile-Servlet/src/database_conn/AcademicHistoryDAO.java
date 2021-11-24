package database_conn;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.sql.DataSource;
import models.AcademicHistory;


public class AcademicHistoryDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/student_profile";
    private String jdbcUsername = DBCredentials.getUsername();
    private String jdbcPassword = DBCredentials.getPassword();

    private static final String SELECT_AcademicHistory = "select * from academic_history where roll_number =?;";
    
    public AcademicHistoryDAO() {}

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

    public List<AcademicHistory> selectAcademicHistory(String _roll_number) {
    	List<AcademicHistory> ah = new ArrayList < > ();
        
        Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		
        // Step 1: Establishing a Connection
        try {connection = getConnection();
            // Step 2:Create a statement using connection object
            preparedStatement = connection.prepareStatement(SELECT_AcademicHistory);
            preparedStatement.setString(1, _roll_number);
            System.out.println(preparedStatement);
            
            // Step 3: Execute the query or update query
            rs = preparedStatement.executeQuery();

            // Step 4: Process the ResultSet object.
            while (rs.next()) {
                ah.add( new AcademicHistory(rs.getString(1),
                					  rs.getString(2),
                					  rs.getString(3),
                					  rs.getString(4),
                					  rs.getInt(5),
                					  rs.getFloat(6),
                					  rs.getString(7)
                					  ));
                System.out.println(rs);
            }
            
            
               
            } 
        catch (SQLException e) {
            printSQLException(e);
        } finally {
			close(connection, preparedStatement, rs);
		}
        
        return ah;
    }

    private void close(Connection myConn, Statement myStmt, ResultSet myRs) {

		try {
			if (myRs != null) {
				myRs.close();
			}
			if (myStmt != null) {
				myStmt.close();
			}
			if (myConn != null) {
				myConn.close();   // doesn't really close it ... just puts back in connection pool
			}
		}
		catch (Exception exc) {
			exc.printStackTrace();
		}
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
