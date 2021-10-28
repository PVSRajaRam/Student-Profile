
import java.io.*;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database_conn.Fee_Payment_History_DAO;
import models.FeeTxnHistory;

/**
 * Servlet implementation class GenerateReceipt
 */
@WebServlet("/GenerateReceipt")
public class GenerateReceipt extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Fee_Payment_History_DAO payDAO; 
    /**
     * @see HttpServlet#HttpServlet()
     */
	public void init() {
        payDAO = new Fee_Payment_History_DAO();
    }
    

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession(false);
		String rollno=(String)session.getAttribute("rollno");
		System.out.println(rollno);
		List<FeeTxnHistory> txns = payDAO.selectAllTxnByRollNumber(rollno);
		request.setAttribute("txns", txns);
        RequestDispatcher dispatcher;
        dispatcher = request.getRequestDispatcher("./jsp/generatereceipt.jsp");
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
