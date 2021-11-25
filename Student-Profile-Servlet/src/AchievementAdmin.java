import java.io.IOException;
import java.sql.Blob;
import java.sql.SQLException;
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

@WebServlet("/AchievementAdmin")
public class AchievementAdmin extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Achievement_DAO dao;
        RequestDispatcher dispatcher;
        dao = new Achievement_DAO();

        if (request.getParameter("achievement_to_del") != null) {
            try {
                deleteAchievementReq(request, response);
                // deleteAllAchievementReq(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else if (request.getParameter("achievement_to_acc") != null) {
            try {
                acceptAchievement(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else if (request.getParameter("achievement_to_rej") != null) {
            try {
                rejectAchievement(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            try {
                // HttpSession session=request.getSession(false);
                // String rollno=(String)session.getAttribute("rollno");
                // System.out.println(rollno);

                List<Achievement> achievements = dao.getAllAchievements();
                request.setAttribute("achievements", achievements);

                dispatcher = request.getRequestDispatcher("./jsp/achievements_admin.jsp");
                dispatcher.forward(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    private void acceptAchievement(HttpServletRequest request, HttpServletResponse response)
            throws IOException, SQLException {
        int achievement_id = Integer.parseInt(request.getParameter("achievement_to_acc"));
        Achievement_DAO dao = new Achievement_DAO();

        dao.changeVerifiedStatus(achievement_id, 1);
        response.sendRedirect(getServletName());

    }

    private void rejectAchievement(HttpServletRequest request, HttpServletResponse response)
            throws IOException, SQLException {
        int achievement_id = Integer.parseInt(request.getParameter("achievement_to_rej"));
        Achievement_DAO dao = new Achievement_DAO();

        dao.changeVerifiedStatus(achievement_id, -1);
        response.sendRedirect(getServletName());

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        getAchievementData(request, response);
    }

    private void deleteAchievementReq(HttpServletRequest request, HttpServletResponse response) throws Exception {
        int achievement_id = Integer.parseInt(request.getParameter("achievement_to_del"));
        Achievement_DAO dao = new Achievement_DAO();

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

            HttpSession session = request.getSession(false);
            String rollno = (String) session.getAttribute("rollno");

            Achievement_DAO dao;
            // RequestDispatcher dispatcher;

            Achievement achv = new Achievement(rollno, achievement_type_id, title, proof_date_sql);
            dao = new Achievement_DAO();
            dao.addAchievement(achv);

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
