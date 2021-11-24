
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
import database_conn.Remaining_Fees_DAO;
import models.FeeTxnHistory;
import models.Remaining_Fees;

/**
 * Servlet implementation class PaymentHistory
 */
@WebServlet("/PaymentHistory")
public class PaymentHistory extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Fee_Payment_History_DAO payDAO; 
	private Remaining_Fees_DAO remDAO;
    /**
     * @see HttpServlet#HttpServlet()
     */
	public void init() {
        payDAO = new Fee_Payment_History_DAO();
        remDAO=new Remaining_Fees_DAO();
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
		Remaining_Fees rem=remDAO.selectRecordByRollno(rollno);
		request.setAttribute("remfee", rem);
        RequestDispatcher dispatcher;
        dispatcher = request.getRequestDispatcher("./jsp/paymenthistory.jsp");
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
