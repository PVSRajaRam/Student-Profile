

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
import models.FeeTxnHistory;

/**
 * Servlet implementation class DeleteReceipt
 */
@WebServlet("/DeleteReceipt")
public class DeleteReceipt extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Upload_Receipt_DAO approvalDAO;   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteReceipt() {
        super();
        // TODO Auto-generated constructor stub
        approvalDAO = new Upload_Receipt_DAO();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			System.out.println("Delete");
			
			String txnno=(String)request.getParameter("uploadtxnno");
			System.out.println(txnno);
			String bank = (String)request.getParameter("uploadtxnbank");
			System.out.println(bank);
			
			approvalDAO.deleteReceipt(txnno, bank);
			List<FeeTxnHistory> approvals = approvalDAO.selectAllApprovals();
			request.setAttribute("approvals", approvals);	
	        RequestDispatcher dispatcher;
	        dispatcher = request.getRequestDispatcher("./jsp/financeadmin.jsp");
	        dispatcher.forward(request, response);
		}
		catch(SQLException e)
		{
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
