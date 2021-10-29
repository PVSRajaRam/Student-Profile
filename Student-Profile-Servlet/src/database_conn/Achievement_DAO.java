package database_conn;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import models.Achievement;

public class Achievement_DAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/student_profile";
    private String jdbcUsername = DBCredentials.getUsername();
    private String jdbcPassword = DBCredentials.getPassword();
//    private static final String SELECT_TXN_BY_TXNNO = "select * from Payment_history where txn_number =?";

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException e) {
        	System.out.println("sql exception");
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
        	System.out.println("class exception");
            e.printStackTrace();
        }
        return connection;
    }

	public List<Achievement> getAchievements() throws Exception {
		List<Achievement> achievements = new ArrayList<>();

		Connection myConn = null;
		Statement myStmt = null;
		ResultSet myRs = null;

		try {
            myConn = getConnection();
            System.out.println("Connection established......");

			// String sql = "SELECT achievement_id,student_id,title FROM achievement";
			String sql = "SELECT A.achievement_id, A.student_id, B.achievement_type_description, A.title, A.proof_date " +
					        "FROM achievement A, achievement_types B " +
                            "WHERE A.achievement_type = B.achievement_type_id;";
			myStmt = myConn.createStatement();
			myRs = myStmt.executeQuery(sql);

			while (myRs.next()) {
				int id = myRs.getInt("achievement_id");
				String student_id = myRs.getString("student_id");
				String achievement_type = myRs.getString("achievement_type_description");
				String title = myRs.getString("title");
				Date proof_date = myRs.getDate("proof_date");
                // TODO : FILE

				Achievement achievement = new Achievement(id, student_id, achievement_type, title, proof_date);
				achievements.add(achievement);
                System.out.println(achievement);
			}
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
			close(myConn, myStmt, myRs);
		}
		return achievements;
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

	public void addAchievement(Achievement achv) throws Exception {
		Connection myConn = null;
		PreparedStatement myStmt = null;

		try {
			myConn = getConnection();
            System.out.println("Connection established......");

			String sql = "insert into achievement "
					   + "(achievement_type, title, proof_date, student_id) "
					   + "values (?, ?, ?, ?);";
			myStmt = myConn.prepareStatement(sql);

			myStmt.setInt(1, achv.getAchievement_type_id());
			myStmt.setString(2, achv.getTitle());
			myStmt.setDate(3, (java.sql.Date) achv.getProof_date());
			myStmt.setString(4, achv.getStudent_id());

			myStmt.execute();
            System.out.println("Achievement Added");

		}
		finally {
			// clean up JDBC objects
			close(myConn, myStmt, null);
		}
	}

	public void deleteAchievement(int achievement_id) throws Exception {
		Connection myConn = null;
		PreparedStatement myStmt = null;
        System.out.println("My a" + achievement_id);
		try {
			myConn = getConnection();
            System.out.println("Connection established......");

			String sql = "DELETE FROM achievement WHERE achievement_id = ?";
			myStmt = myConn.prepareStatement(sql);

			myStmt.setInt(1, achievement_id);
			myStmt.execute();
            System.out.println("Achievement Deleted");
		}
		finally {
			close(myConn, myStmt, null);
		}

	}

	// public Student getStudent(String theStudentId) throws Exception {

	// 	Student theStudent = null;

	// 	Connection myConn = null;
	// 	PreparedStatement myStmt = null;
	// 	ResultSet myRs = null;
	// 	int studentId;

	// 	try {
	// 		// convert student id to int
	// 		studentId = Integer.parseInt(theStudentId);

	// 		// get connection to database
	// 		myConn = dataSource.getConnection();

	// 		// create sql to get selected student
	// 		String sql = "select * from student where id=?";

	// 		// create prepared statement
	// 		myStmt = myConn.prepareStatement(sql);

	// 		// set params
	// 		myStmt.setInt(1, studentId);

	// 		// execute statement
	// 		myRs = myStmt.executeQuery();

	// 		// retrieve data from result set row
	// 		if (myRs.next()) {
	// 			String firstName = myRs.getString("first_name");
	// 			String lastName = myRs.getString("last_name");
	// 			String email = myRs.getString("email");

	// 			// use the studentId during construction
	// 			theStudent = new Student(studentId, firstName, lastName, email);
	// 		}
	// 		else {
	// 			throw new Exception("Could not find student id: " + studentId);
	// 		}

	// 		return theStudent;
	// 	}
	// 	finally {
	// 		// clean up JDBC objects
	// 		close(myConn, myStmt, myRs);
	// 	}
	// }

	// public void updateAchievement(Student theStudent) throws Exception {

	// 	Connection myConn = null;
	// 	PreparedStatement myStmt = null;

	// 	try {
	// 		// get db connection
	// 		myConn = dataSource.getConnection();

	// 		// create SQL update statement
	// 		String sql = "update student "
	// 					+ "set first_name=?, last_name=?, email=? "
	// 					+ "where id=?";

	// 		// prepare statement
	// 		myStmt = myConn.prepareStatement(sql);

	// 		// set params
	// 		myStmt.setString(1, theStudent.getFirstName());
	// 		myStmt.setString(2, theStudent.getLastName());
	// 		myStmt.setString(3, theStudent.getEmail());
	// 		myStmt.setInt(4, theStudent.getId());

	// 		// execute SQL statement
	// 		myStmt.execute();
	// 	}
	// 	finally {
	// 		// clean up JDBC objects
	// 		close(myConn, myStmt, null);
	// 	}
	// }

	// public void deleteAchievement(String theStudentId) throws Exception {

	// 	Connection myConn = null;
	// 	PreparedStatement myStmt = null;

	// 	try {
	// 		// convert student id to int
	// 		int studentId = Integer.parseInt(theStudentId);

	// 		// get connection to database
	// 		myConn = dataSource.getConnection();

	// 		// create sql to delete student
	// 		String sql = "delete from student where id=?";

	// 		// prepare statement
	// 		myStmt = myConn.prepareStatement(sql);

	// 		// set params
	// 		myStmt.setInt(1, studentId);

	// 		// execute sql statement
	// 		myStmt.execute();
	// 	}
	// 	finally {
	// 		// clean up JDBC code
	// 		close(myConn, myStmt, null);
	// 	}
	// }

}
