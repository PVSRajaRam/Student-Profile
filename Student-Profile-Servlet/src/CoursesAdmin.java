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

import database_conn.Courses_DAO;
import models.Course;

@WebServlet("/CoursesAdmin")
public class CoursesAdmin extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Courses_DAO dao;
        RequestDispatcher dispatcher;
        dao = new Courses_DAO();

        if (request.getParameter("course_to_del") != null) {
            try {
                deleteCourseReq(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else if (request.getParameter("course_to_acc") != null) {
            try {
                acceptCourse(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else if (request.getParameter("course_to_rej") != null) {
            try {
                rejectCourse(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            try {
//                 HttpSession session=request.getSession(false);
//                 String rollno=(String)session.getAttribute("rollno");
//                 System.out.println(rollno);

                List<Course> courses = dao.getAllCourses();
                request.setAttribute("courses", courses);

                dispatcher = request.getRequestDispatcher("./jsp/courses_admin.jsp");
                dispatcher.forward(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    private void acceptCourse(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        int course_id = Integer.parseInt(request.getParameter("course_to_acc"));
        String rollno = request.getParameter("rollno");
        Courses_DAO dao = new Courses_DAO();

        dao.changeVerifiedStatus(rollno, course_id, 1);
        response.sendRedirect(getServletName());

    }

    private void rejectCourse(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
    	String rollno = request.getParameter("rollno");
        int course_id = Integer.parseInt(request.getParameter("course_to_rej"));
        Courses_DAO dao = new Courses_DAO();

        dao.changeVerifiedStatus(rollno, course_id, -1);
        response.sendRedirect(getServletName());

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    private void deleteCourseReq(HttpServletRequest request, HttpServletResponse response) throws Exception {
        int course_id = Integer.parseInt(request.getParameter("course_to_del"));
        Courses_DAO dao = new Courses_DAO();

        dao.deleteCourse(course_id);
        response.sendRedirect(getServletName());
    }

//    private void getCourseData(HttpServletRequest request, HttpServletResponse response) {
//        try {
//            String title = request.getParameter("course_title");
//            int course_type_id = Integer.parseInt(request.getParameter("course_type"));
//
//            String proof_date_str = request.getParameter("course_date");
//            SimpleDateFormat formatter = new SimpleDateFormat("dd-mm-yyyy", Locale.ENGLISH);
//            Date proof_date = formatter.parse(proof_date_str);
//            Date proof_date_sql = new java.sql.Date(proof_date.getTime());
//
//            HttpSession session = request.getSession(false);
//            String rollno = (String) session.getAttribute("rollno");
//
//            Courses_DAO dao;
//            RequestDispatcher dispatcher;
//
//            Course achv = new Course(rollno, course_type_id, title, proof_date_sql);
//            dao = new Courses_DAO();
//            dao.addCourse(achv);
//
//            doGet(request, response);
//
//        } catch (NumberFormatException e) {
//            e.printStackTrace();
//        } catch (ParseException e) {
//            e.printStackTrace();
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//
//    }
}
