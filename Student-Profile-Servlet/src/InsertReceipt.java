import java.io.*;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.sql.Date;
import java.util.Enumeration;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

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
 * Servlet implementation class InsertReceipt
 */
@WebServlet("/InsertReceipt")
public class InsertReceipt extends HttpServlet {
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
		try {
			
			HttpSession session=request.getSession(false);
			String rollno=(String)session.getAttribute("rollno");
			System.out.println(rollno);
			String txnno=(String)request.getParameter("uploadtxnno");
			System.out.println(txnno);
			String txndatestr=request.getParameter("uploadtxndate");
			Date txndate=Date.valueOf(txndatestr);		
			String purp = (String)request.getParameter("uploadtxnpurpose");
			System.out.println(purp);
			String amtstr = (String) request.getParameter("uploadtxnamount");
			System.out.println(amtstr);
			Float amt =Float.parseFloat(amtstr);
			String bank = (String)request.getParameter("uploadtxnbank");
			System.out.println(bank);
			String mode = (String)request.getParameter("uploadtxnmode");
			System.out.println(mode);
			FeeTxnHistory appr = new FeeTxnHistory(txnno,bank,rollno,txndate,purp,amt,mode,false);
			approvalDAO.insertApproval(appr);
			List<FeeTxnHistory> approvals = approvalDAO.selectAllApprovals();
			request.setAttribute("approvals", approvals);	
	        RequestDispatcher dispatcher;
	        dispatcher = request.getRequestDispatcher("./jsp/uploadreceipts.jsp");
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
