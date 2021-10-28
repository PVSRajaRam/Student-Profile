

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database_conn.Achievement_DAO;
import models.Achievement;

/**
 * Servlet implementation class AchievementController
 */
//@WebServlet(description = "AchievementController", urlPatterns = { "/AchievementController" })
@WebServlet("/AchievementController")
public class AchievementController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Achievement_DAO dao;
		RequestDispatcher dispatcher;
		try {
//			HttpSession session=request.getSession(false);

			dao = new Achievement_DAO();
			List<Achievement> achievements = dao.getAchievements();
			request.setAttribute("achievements", achievements);
			request.setAttribute("test", "test_Value");

	        dispatcher = request.getRequestDispatcher("./jsp/achievements.jsp");
	        dispatcher.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
