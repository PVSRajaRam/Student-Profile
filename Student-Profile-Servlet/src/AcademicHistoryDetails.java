
import java.io.*;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database_conn.AcademicHistoryDAO;
import models.FeeTxnHistory;
import models.AcademicHistory;

/**
 * Servlet implementation class ParentDetails
 */
@WebServlet("/AcademicHistoryDetails")
public class AcademicHistoryDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AcademicHistoryDAO pDAO;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
	public void init() {
        pDAO = new AcademicHistoryDAO();
    }
    

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession(false);
		String rollno=(String)session.getAttribute("rollno");
		System.out.println(rollno);
		
		List<AcademicHistory> ps = pDAO.selectAcademicHistory(rollno);
		
		request.setAttribute("ahs", ps);
		
        RequestDispatcher dispatcher;
        dispatcher = request.getRequestDispatcher("./jsp/profile-academic-history.jsp");
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
