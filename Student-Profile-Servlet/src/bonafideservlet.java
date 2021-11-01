
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database_conn.bonafidedao;
import models.bonafide;

/**
 * Servlet implementation class bonafideservlet
 */
@WebServlet("/bonafideservlet")
public class bonafideservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private bonafidedao Bonafidedao = new bonafidedao();
	
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public bonafideservlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("./jsp/bonafide.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String applieddate = request.getParameter("applieddate");
		String purpose = request.getParameter("purpose");
		String status = request.getParameter("status");
		String approvedstaff = request.getParameter("approvedstaff");
		String approvedtime = request.getParameter("approvedtime");
		String preparedstaff = request.getParameter("preparedstaff");
		String preparedtime = request.getParameter("preparedtime");
		String action = request.getParameter("action");
		
		bonafide bonafide = new bonafide();
		bonafide.setApplieddate(applieddate);
		bonafide.setPurpose(purpose);
		bonafide.setStatus(status);
		bonafide.setApprovedstaff(approvedstaff);
		bonafide.setApprovedtime(approvedtime);
		bonafide.setPreparedstaff(preparedstaff);
		bonafide.setPreparedtime(preparedtime);
		bonafide.setAction(action);
		
		try {
			Bonafidedao.bonafidedetalis(bonafide);	
			doGet(request,response);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		
	}

}