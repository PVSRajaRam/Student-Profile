

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database_conn.Remaining_Fees_DAO;
import models.Remaining_Fees;

/**
 * Servlet implementation class ChangeScholarship
 */
@WebServlet("/ChangeScholarship")
public class ChangeScholarship extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Remaining_Fees_DAO recordDAO; 
    /**
     * @see HttpServlet#HttpServlet()
     */
	public void init() {
        recordDAO = new Remaining_Fees_DAO();
    }
    

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<Remaining_Fees> fees = recordDAO.selectAllRecords();
		request.setAttribute("fees", fees);
        RequestDispatcher dispatcher;
        dispatcher = request.getRequestDispatcher("./jsp/ChangeScholarship.jsp");
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
