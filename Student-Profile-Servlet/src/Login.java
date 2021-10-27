

import java.io.*;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import database_conn.Login_DAO;
import models.User;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Login_DAO loginDAO;

    /**
     * Default constructor. 
     */
	public void init() {
        loginDAO = new Login_DAO();
    }

    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    	    throws ServletException, IOException {
    	        doGet(request, response);
    	    }
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
		checkUser(request,response);
		}
		catch (SQLException e) {
            // TODO Auto-generated catch block
        	System.out.println("sql exception");
            e.printStackTrace();
        }
	}
	private void checkUser(HttpServletRequest request, HttpServletResponse response)
		    throws SQLException, IOException, ServletException {
		        String em=request.getParameter("email");
		        String pwd=request.getParameter("pwd");
		        User u = loginDAO.selectUser(em);
		        RequestDispatcher dispatcher;
		        
		        if(u.getPwd().compareTo(pwd)==0) {
		        	request.setAttribute("User", u);
		        	dispatcher = request.getRequestDispatcher("./jsp/index.jsp");
		        }
		        else {
		        	request.setAttribute("Error", "No account found");
		        	dispatcher = request.getRequestDispatcher("./jsp/login-error.jsp");
		        }
		        dispatcher.forward(request, response);
		    }
}
