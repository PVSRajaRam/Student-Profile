

import java.io.IOException;
import java.sql.Blob;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import database_conn.Achievement_DAO;
import models.Achievement;

/**
 * Servlet implementation c lass AchievementController
 */
//@WebServlet(description = "AchievementController", urlPatterns = { "/AchievementController" })
// @MultipartConfig
@WebServlet("/AchievementController")
public class AchievementController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Achievement_DAO dao;
		RequestDispatcher dispatcher;
        dao = new Achievement_DAO();

        if(request.getParameter("achievement_to_del") != null) {
            try {
				deleteAchievementReq(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
        }
        else{
		try {
            HttpSession session=request.getSession(false);
            String rollno=(String)session.getAttribute("rollno");
            System.out.println(rollno);

			List<Achievement> achievements = dao.getAchievements(rollno);
			request.setAttribute("achievements", achievements);
			request.setAttribute("test", "test_Value");

	        dispatcher = request.getRequestDispatcher("./jsp/achievements.jsp");
	        dispatcher.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		getAchievementData(request, response);
	}

	// protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	// 	try {
	// 		deleteAchievementReq(request, response);
	// 	} catch (Exception e) {
	// 		e.printStackTrace();
	// 	}
	// }

	private void deleteAchievementReq(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int achievement_id = Integer.parseInt(request.getParameter("achievement_to_del"));
		Achievement_DAO dao = new Achievement_DAO();
		// RequestDispatcher dispatcher;

		dao.deleteAchievement(achievement_id);
		response.sendRedirect(getServletName());
	}

	private void getAchievementData(HttpServletRequest request, HttpServletResponse response) {
		try {
			String title = request.getParameter("achievement_title");
			int achievement_type_id = Integer.parseInt(request.getParameter("achievement_type"));

			String proof_date_str = request.getParameter("achievement_date");
			SimpleDateFormat formatter = new SimpleDateFormat("dd-mm-yyyy", Locale.ENGLISH);
			Date proof_date = formatter.parse(proof_date_str);
			Date proof_date_sql = new java.sql.Date(proof_date.getTime());

			// Part proof_file_part = getPart("file");
            HttpSession session=request.getSession(false);
            String rollno=(String)session.getAttribute("rollno");
            // System.out.println(rollno);

			Achievement_DAO dao;
			RequestDispatcher dispatcher;

			Achievement achv = new Achievement(rollno, achievement_type_id, title, proof_date_sql);
			dao = new Achievement_DAO();
			dao.addAchievement(achv);

//	        dispatcher = request.getRequestDispatcher("./jsp/achievements.jsp");
//	        dispatcher.forward(request, response);
			doGet(request, response);

		} catch (NumberFormatException e) {
			e.printStackTrace();
		} catch (ParseException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}
