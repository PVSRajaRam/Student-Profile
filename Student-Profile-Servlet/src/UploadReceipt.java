
import java.io.*;
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
 * Servlet implementation class UploadReceipt
 */
@WebServlet("/UploadReceipt")
public class UploadReceipt extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Upload_Receipt_DAO approvalDAO; 
    /**
     * @see HttpServlet#HttpServlet()
     */
	public void init() {
        approvalDAO = new Upload_Receipt_DAO();
    }
    

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<FeeTxnHistory> approvals = approvalDAO.selectAllApprovals();
		request.setAttribute("approvals", approvals);	
        RequestDispatcher dispatcher;
        dispatcher = request.getRequestDispatcher("./jsp/uploadreceipts.jsp");
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
