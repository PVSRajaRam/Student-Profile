import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database_conn.Upload_Receipt_DAO;
import database_conn.Fee_Payment_History_DAO;
import models.FeeTxnHistory;

/**
 * Servlet implementation class ChangeReceipt
 */
@WebServlet("/ChangeReceipt")
public class ChangeReceipt extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Upload_Receipt_DAO approvalDAO; 
	private Fee_Payment_History_DAO payDAO;
    /**
     * @see HttpServlet#HttpServlet()
     */
	public void init() {
        approvalDAO = new Upload_Receipt_DAO();
        payDAO = new Fee_Payment_History_DAO();
    }
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
		HttpSession session=request.getSession(false);
		String email=(String)session.getAttribute("email");
		String[] arrOfStr = email.split("@", 2);
		String staff=arrOfStr[0];
		String txnno=(String)request.getParameter("uploadtxnno");
		System.out.println(txnno);
		String txndatestr=request.getParameter("uploadtxndate");
		Date txndate=Date.valueOf(txndatestr);	
		String rollno = request.getParameter("uploadrollno");
		String purp = (String)request.getParameter("uploadtxnpurpose");
		System.out.println(purp);
		String amtstr = (String) request.getParameter("uploadtxnamount");
		System.out.println(amtstr);
		Float amt =Float.parseFloat(amtstr);
		String bank = (String)request.getParameter("uploadtxnbank");
		System.out.println(bank);
		String mode = (String)request.getParameter("uploadtxnmode");
		System.out.println(mode);
		
		approvalDAO.updateReceipt(staff,txnno, bank);
		List<FeeTxnHistory> approvals = approvalDAO.selectAllApprovals();
		request.setAttribute("approvals", approvals);	
        RequestDispatcher dispatcher;
        dispatcher = request.getRequestDispatcher("./jsp/financeadmin.jsp");
        dispatcher.forward(request, response);
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
