
import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database_conn.Courses_DAO;
import models.Course;

@WebServlet("/CoursesController")
public class CoursesController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Courses_DAO dao;
        RequestDispatcher dispatcher;
        dao = new Courses_DAO();

       /* if (request.getParameter("course_to_del") != null) {
            try {
                // deleteCourseReq(request, response);

            } catch (Exception e) {
                e.printStackTrace();
            }
        } else if (request.getParameter("semester") != null) {
            try {
                HttpSession session = request.getSession(false);
                String rollno = (String) session.getAttribute("rollno");

                int semester = Integer.parseInt(request.getParameter("semester"));
                List<Course> courses = dao.getCourses(rollno, semester, 1);
                request.setAttribute("courses", courses);
                request.setAttribute("semester", semester);

                dispatcher = request.getRequestDispatcher("./jsp/courses.jsp");
                dispatcher.forward(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else if (request.getParameter("courses_id") != null) {
            try {
                HttpSession session = request.getSession(false);
                String rollno = (String) session.getAttribute("rollno");

                int courses_id = Integer.parseInt(request.getParameter("courses_id"));

                dao.deleteCourse(rollno, courses_id);
                dao.applyCourse(rollno, courses_id);
                // request.setAttribute("courses", courses);
                // request.setAttribute("semester", semester);

                // dispatcher = request.getRequestDispatcher("./jsp/courses.jsp");
                // dispatcher.forward(request, response);
                response.sendRedirect(getServletName());
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            try {
                HttpSession session = request.getSession(false);
                String rollno = (String) session.getAttribute("rollno");

                // int semester = Integer.parseInt(request.getParameter("semester"));
                List<Course> courses = dao.getCourses(rollno, 1, 1);
                request.setAttribute("courses", courses);
                request.setAttribute("semester", 1);

                dispatcher = request.getRequestDispatcher("./jsp/courses.jsp");
                dispatcher.forward(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }*/
    }

    // protected void doPost(HttpServletRequest request, HttpServletResponse
    // response)
    // throws ServletException, IOException {
    // getCourseData(request, response);
    // }

    // protected void doDelete(HttpServletRequest request, HttpServletResponse
    // response) throws ServletException, IOException {
    // try {
    // deleteCourseReq(request, response);
    // } catch (Exception e) {
    // e.printStackTrace();
    // }
    // }

    // private void deleteCourseReq(HttpServletRequest request, HttpServletResponse
    // response) throws Exception {
    // int achievement_id = Integer.parseInt(request.getParameter("course_to_del"));
    // Courses_DAO dao = new Courses_DAO();
    // // RequestDispatcher dispatcher;
    //
    // dao.deleteCourse(achievement_id);
    // response.sendRedirect(getServletName());
    // }

    // private void getCourseData(HttpServletRequest request, HttpServletResponse
    // response) {
    // try {
    // String title = request.getParameter("achievement_title");
    // int achievement_type_id =
    // Integer.parseInt(request.getParameter("achievement_type"));
    //
    // String proof_date_str = request.getParameter("achievement_date");
    // SimpleDateFormat formatter = new SimpleDateFormat("dd-mm-yyyy",
    // Locale.ENGLISH);
    // Date proof_date = formatter.parse(proof_date_str);
    // Date proof_date_sql = new java.sql.Date(proof_date.getTime());
    //
    // // Part proof_file_part = getPart("file");
    // HttpSession session = request.getSession(false);
    // String rollno = (String) session.getAttribute("rollno");
    // // System.out.println(rollno);
    //
    // Courses_DAO dao;
    // RequestDispatcher dispatcher;
    //
    // Course achv = new Course(rollno, achievement_type_id, title, proof_date_sql);
    // dao = new Course_DAO();
    // dao.addCourse(achv);
    //
    // // dispatcher = request.getRequestDispatcher("./jsp/courses.jsp");
    // // dispatcher.forward(request, response);
    // doGet(request, response);
    //
    // } catch (NumberFormatException e) {
    // e.printStackTrace();
    // } catch (ParseException e) {
    // e.printStackTrace();
    // } catch (Exception e) {
    // e.printStackTrace();
    // }
    //
    // }
}
