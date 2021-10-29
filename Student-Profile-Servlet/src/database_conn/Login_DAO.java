package database_conn;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.sql.DataSource;
import models.User;


public class Login_DAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/student_profile";
    private String jdbcUsername = DBCredentials.getUsername();
    private String jdbcPassword = DBCredentials.getPassword();

    private static final String INSERT_USERS_SQL = "INSERT INTO login" + " VALUES" +
        " (?, ?, ?, ?);";

    private static final String SELECT_USER_BY_ID = "select * from login where email =?";
    private static final String SELECT_ALL_USERS = "select * from login";
    private static final String DELETE_USERS_SQL = "delete from login where email = ?;";
    private static final String SELECT_ROLLNO_BY_EMAIL = "select roll_number from student where email= ?;";
    public Login_DAO() {}

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

    public void insertUser(User user) throws SQLException {
        System.out.println(INSERT_USERS_SQL);
        // try-with-resource statement will auto close the connection.
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL)) {
            preparedStatement.setString(1, user.getEmail());
            preparedStatement.setString(2, user.getPwd());
            preparedStatement.setBoolean(3, user.isAdmin());
            preparedStatement.setString(4, user.getDept());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    public User selectUser(String email) {
        User user = null;
        // Step 1: Establishing a Connection
        try (Connection connection = getConnection();
            // Step 2:Create a statement using connection object
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_ID);) {
            preparedStatement.setString(1, email);
            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();

            // Step 4: Process the ResultSet object.
            while (rs.next()) {
                String pwd = rs.getString("password");
                boolean isAdmin  = rs.getBoolean("is_admin");
                String dept=rs.getString("admin_type");
                user = new User(email, pwd,isAdmin,dept);
            }
            System.out.println(user.getEmail());        
            } 
        catch (SQLException e) {
            printSQLException(e);
        }
        return user;
    }

    public List < User > selectAllUsers() {

        // using try-with-resources to avoid closing resources (boiler plate code)
        List < User > users = new ArrayList < > ();
        // Step 1: Establishing a Connection
        try (Connection connection = getConnection();

            // Step 2:Create a statement using connection object
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USERS);) {
            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();

            // Step 4: Process the ResultSet object.
            while (rs.next()) {
            	String email=rs.getString("email");
            	String pwd = rs.getString("password");
                boolean isAdmin  = rs.getBoolean("is_admin");
                String dept=rs.getString("admin_type");
                users.add(new User(email, pwd,isAdmin,dept));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return users;
    }

    public String selectRollNoFromEmail(String email) {
    	String roll_number="";
    	try (Connection connection = getConnection();
                // Step 2:Create a statement using connection object
                PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ROLLNO_BY_EMAIL);) {
                preparedStatement.setString(1, email);
                System.out.println(preparedStatement);
                // Step 3: Execute the query or update query
                ResultSet rs = preparedStatement.executeQuery();

                // Step 4: Process the ResultSet object.
                while (rs.next()) {
                    roll_number=rs.getString("roll_number");
                }      
                } 
            catch (SQLException e) {
                printSQLException(e);
            }
    	return roll_number;
    }
    
    public boolean deleteUser(int id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(DELETE_USERS_SQL);) {
            statement.setInt(1, id);
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