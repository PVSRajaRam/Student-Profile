package database_conn;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import models.bonafide;

public class bonafidedao {
	public int bonafidedetalis(bonafide bonafide) throws ClassNotFoundException {
        String INSERT_USERS_SQL = "INSERT INTO bonafide" +
            "  (sno, applied_date, purpose, Status, approved_staff, approved_time, prepared_staff, prepared_time, action) VALUES " +
            " (?, ?, ?, ?,?,?,?,?,?);";

        int result = 0;

        Class.forName("com.mysql.jdbc.Driver");

        try (Connection connection = DriverManager
            .getConnection("jdbc:mysql://localhost/student_profile", "root", "password");

            // Step 2:Create a statement using connection object
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL)) {
            preparedStatement.setInt(1, 1);
            preparedStatement.setString(2, bonafide.getApplieddate());
            preparedStatement.setString(3, bonafide.getPurpose());
            preparedStatement.setString(4, bonafide.getStatus());
            preparedStatement.setString(5, bonafide.getApprovedstaff());
            preparedStatement.setString(6, bonafide.getApprovedtime());
            preparedStatement.setString(7, bonafide.getPreparedstaff());
            preparedStatement.setString(8, bonafide.getPreparedtime());
            preparedStatement.setString(9, bonafide.getAction());

            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            result = preparedStatement.executeUpdate();

        } catch (SQLException e) {
            // process sql exception
            e.printStackTrace();
        }
        return result;
    }
}