
import java.io.*;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database_conn.StudentDAO;
import database_conn.DayscholarDAO;
import database_conn.HosteliteDAO;
import database_conn.HealthDAO;

import models.Student;
import models.Dayscholar;
import models.Hostelite;
import models.Health;

/**
 * Servlet implementation class PersonalDetails
 */
@WebServlet("/PersonalDetails")
public class PersonalDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private StudentDAO stuDAO;
	private DayscholarDAO dsrDAO;
	private HosteliteDAO htDAO;
	private HealthDAO hDAO;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
	public void init() {
        stuDAO = new StudentDAO();
        dsrDAO = new DayscholarDAO();
        htDAO = new HosteliteDAO();
        hDAO = new HealthDAO();
    }
    

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession(false);
		String rollno=(String)session.getAttribute("rollno");
		System.out.println(rollno);
		
		Student stu = stuDAO.selectStudent(rollno);
		request.setAttribute("stu", stu);
		
		Health h = hDAO.selectHealth(rollno);
		request.setAttribute("health", h);
		
		Dayscholar dsr = dsrDAO.selectDayscholar(rollno);
		
		if(dsr != null) {
			request.setAttribute("dsr", dsr);
		}
		else {
			Hostelite ht = htDAO.selectHostelite(rollno);
			request.setAttribute("ht", ht);
		}
		
		
        RequestDispatcher dispatcher;
        dispatcher = request.getRequestDispatcher("./jsp/profile-personal-details.jsp");
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
