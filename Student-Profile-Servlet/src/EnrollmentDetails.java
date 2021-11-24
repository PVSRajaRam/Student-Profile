
import java.io.*;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database_conn.EnrollmentDAO;

import models.Enrollment;

/**
 * Servlet implementation class EnrollmentDetails
 */
@WebServlet("/EnrollmentDetails")
public class EnrollmentDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private EnrollmentDAO enrDAO;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
	public void init() {
        enrDAO = new EnrollmentDAO();
    }
    

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession(false);
		String rollno=(String)session.getAttribute("rollno");
		System.out.println(rollno);
		
		Enrollment enr = enrDAO.selectEnrollment(rollno);
		request.setAttribute("enr", enr);
		
        RequestDispatcher dispatcher;
        dispatcher = request.getRequestDispatcher("./jsp/profile-enrollment-details.jsp");
        dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
