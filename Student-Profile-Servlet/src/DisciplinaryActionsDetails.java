
import java.io.*;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database_conn.DisciplinaryActionsDAO;
import models.DisciplinaryActions;


/**
 * Servlet implementation class DisciplinaryActionsDetails
 */
@WebServlet("/DisciplinaryActionsDetails")
public class DisciplinaryActionsDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DisciplinaryActionsDAO pDAO;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
	public void init() {
        pDAO = new DisciplinaryActionsDAO();
    }
    

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession(false);
		String rollno=(String)session.getAttribute("rollno");
		System.out.println(rollno);
		
		List<DisciplinaryActions> ps = pDAO.selectDisciplinaryActions(rollno);
		
		request.setAttribute("das", ps);
		
        RequestDispatcher dispatcher;
        dispatcher = request.getRequestDispatcher("./jsp/profile-disciplinary-actions.jsp");
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
