package database_conn;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import java.sql.Blob;

import java.util.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import models.Course;

public class Courses_DAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/student_profile";
    private String jdbcUsername = DBCredentials.getUsername();
    private String jdbcPassword = DBCredentials.getPassword();

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

    public List<Course> getCourses(String rollno, int semester, int dept_fk) throws Exception {
        List<Course> courses = new ArrayList<>();

        Connection myConn = null;
        PreparedStatement myStmt = null;
        ResultSet myRs = null;

        try {
            myConn = getConnection();
            System.out.println("Connection established......");

            // String sql = "SELECT A.courses_id, A.course_code, A.course_name, A.credits,
            // B.dept_name, C.verified "
            // + "FROM courses A, department B, courses_enroll "
            // + "WHERE A.semester = ? AND A.dept_fk = ? AND A.dept_fk = B.dept_id "
            // + "ORDER BY A.courses_id ASC; ";

            String sql = "SELECT X.courses_id, X.course_code, X.course_name, X.credits, X.dept_name, Y.verified, Y.applied "
                    + "FROM (SELECT A.courses_id, A.course_code, A.course_name, A.credits, B.dept_name "
                    + "	  FROM courses A, department B "
                    + "	  WHERE A.semester = ? AND A.dept_fk = ? AND A.dept_fk = B.dept_id "
                    + "	  ORDER BY A.courses_id ASC) X  " + "LEFT OUTER JOIN courses_enroll Y "
                    + "ON X.courses_id = Y.courses_fk; ";

            myStmt = myConn.prepareStatement(sql);
            myStmt.setInt(1, semester);
            myStmt.setInt(2, dept_fk);
            myRs = myStmt.executeQuery();

            while (myRs.next()) {
                int courses_id = myRs.getInt("courses_id");
                String course_code = myRs.getString("course_code");
                String course_name = myRs.getString("course_name");
                String dept_name = myRs.getString("dept_name");
                int credits = myRs.getInt("credits");
                int verified = myRs.getInt("verified");
                int applied = myRs.getInt("applied");

                Course course = new Course(courses_id, course_code, course_name, credits, dept_name, applied, verified);
                courses.add(course);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(myConn, myStmt, myRs);
        }
        return courses;
    }

    public List<Course> getAllCourses() throws Exception {
        List<Course> courses = new ArrayList<>();

        Connection myConn = null;
        PreparedStatement myStmt = null;
        ResultSet myRs = null;

        try {
            myConn = getConnection();
            System.out.println("Connection established......");

            String sql = "SELECT X.courses_id, X.course_code, X.course_name, X.credits, X.dept_name, Y.student_fk, Y.verified, Y.applied "
                    + "                    FROM (SELECT A.courses_id, A.course_code, A.course_name, A.credits, B.dept_name "
                    + "                    	  FROM courses A, department B  "
                    + "                          WHERE A.dept_fk = B.dept_id "
                    + "                    	  ORDER BY A.courses_id ASC) X JOIN courses_enroll Y "
                    + "                    ON X.courses_id = Y.courses_fk "
                    + "                    WHERE Y.applied = 1;";

            myStmt = myConn.prepareStatement(sql);
            myRs = myStmt.executeQuery();

            while (myRs.next()) {
                String student_id = myRs.getString("student_fk");
                int id = myRs.getInt("courses_id");
                int credits = myRs.getInt("credits");
                String course_code = myRs.getString("course_code");
                String course_name = myRs.getString("course_name");
                int verified = myRs.getInt("verified");
                int applied = myRs.getInt("applied");

                Course course = new Course(student_id, id, course_code, course_name, credits, applied, verified);
                courses.add(course);

                System.out.println("COURSE: " + course);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(myConn, myStmt, myRs);
        }
        return courses;
    }

    public void changeVerifiedStatus(String rollno, int courses_fk, int verified_status) throws Exception {
        Connection myConn = null;
        PreparedStatement myStmt = null;

        try {
            myConn = getConnection();
            System.out.println("Connection established......");

            String sql = "INSERT INTO courses_enroll " + "(student_fk, courses_fk, verified, applied) " + "VALUES "
                    + "(?, ?, ?, 1); ";
            myStmt = myConn.prepareStatement(sql);

            myStmt.setString(1, rollno);
            myStmt.setInt(2, courses_fk);
            myStmt.setInt(3, verified_status);

            myStmt.execute();
            System.out.println("Course Enrolled: " + courses_fk);

        } finally {
            // clean up JDBC objects
            close(myConn, myStmt, null);
        }
    }

    public void addCourse(Course crs) throws Exception {
        Connection myConn = null;
        PreparedStatement myStmt = null;

        try {
            myConn = getConnection();
            System.out.println("Connection established......");

            String sql = "insert into course " + "(course_type, title, proof_date, student_id) "
                    + "values (?, ?, ?, ?); ";
            myStmt = myConn.prepareStatement(sql);

            // myStmt.setInt(1, crs.getCourse_type_id());
            // myStmt.setString(2, crs.getTitle());
            // myStmt.setDate(3, (java.sql.Date) crs.getProof_date());
            // myStmt.setString(4, crs.getStudent_id());

            myStmt.execute();
            System.out.println("Course Added");

        } finally {
            // clean up JDBC objects
            close(myConn, myStmt, null);
        }
    }

    public void deleteCourse(String rollno, int course_id) throws Exception {
        Connection myConn = null;
        PreparedStatement myStmt = null;
        try {
            myConn = getConnection();
            System.out.println("Connection established......");

            String sql = "DELETE FROM courses_enroll WHERE courses_fk = ? AND student_fk = ?";
            myStmt = myConn.prepareStatement(sql);

            myStmt.setInt(1, course_id);
            myStmt.setString(2, rollno);
            myStmt.execute();
            System.out.println("Course Deleted");
        } finally {
            close(myConn, myStmt, null);
        }
    }

    // public void changeVerifiedStatus(int courses_id, int applied_status) throws
    // SQLException {
    // Connection myConn = null;
    // PreparedStatement myStmt = null;
    // try {
    // myConn = getConnection();
    // System.out.println("Connection established......");

    // String sql = "UPDATE courses_enroll " + " SET applied = ? " + " WHERE
    // courses_fk = ?;";

    // myStmt = myConn.prepareStatement(sql);
    // myStmt.setInt(1, applied_status);
    // myStmt.setInt(2, courses_id);
    // myStmt.execute();
    // System.out.println("Course Updated: " + courses_id);
    // } finally {
    // close(myConn, myStmt, null);
    // }
    // }

    public void applyCourse(String rollno, int courses_id) throws SQLException {
        Connection myConn = null;
        PreparedStatement myStmt = null;
        try {
            myConn = getConnection();
            System.out.println("Connection established......");

            String sql = "INSERT INTO courses_enroll (student_fk, courses_fk, verified, applied) " + "VALUES "
                    + "(?, ? , 0, 1);";

            myStmt = myConn.prepareStatement(sql);
            myStmt.setString(1, rollno);
            myStmt.setInt(2, courses_id);
            myStmt.execute();
            System.out.println("Course Updated: " + courses_id);
        } finally {
            close(myConn, myStmt, null);
        }
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
                myConn.close(); // doesn't really close it ... just puts back in connection pool
            }
        } catch (Exception exc) {
            exc.printStackTrace();
        }
    }

}
