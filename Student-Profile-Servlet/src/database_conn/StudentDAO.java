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
import models.Student;


public class StudentDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/student_profile";
    private String jdbcUsername = DBCredentials.getUsername();
    private String jdbcPassword = DBCredentials.getPassword();

    private static final String SELECT_STUDENT = "select * from Student where roll_number =?;";
    
    public StudentDAO() {}

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

    public Student selectStudent(String _roll_number) {
        Student stu = null;
        
        Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		
        // Step 1: Establishing a Connection
        try {connection = getConnection();
            // Step 2:Create a statement using connection object
            preparedStatement = connection.prepareStatement(SELECT_STUDENT);
            preparedStatement.setString(1, _roll_number);
            System.out.println(preparedStatement);
            
            // Step 3: Execute the query or update query
            rs = preparedStatement.executeQuery();

            // Step 4: Process the ResultSet object.
            while (rs.next()) {
                stu=new Student(rs.getString(1),
                					  rs.getString(2),
                					  rs.getString(3),
                					  rs.getString(4),
                					  rs.getString(5),
                					  rs.getString(6),
                					  rs.getInt(7),
                					  rs.getString(8),
                					  rs.getDate(9),
                					  rs.getString(10),
                					  rs.getString(11),
                					  rs.getString(12),
                					  rs.getString(13),
                					  rs.getString(14),
                					  rs.getString(15),
                					  rs.getString(16)
                					  );
            }
               
            } 
        catch (SQLException e) {
            printSQLException(e);
        } finally {
			close(connection, preparedStatement, rs);
		}
        
        return stu;
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