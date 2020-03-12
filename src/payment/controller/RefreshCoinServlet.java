package payment.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.vo.Member;
import payment.model.service.PaymentService;
import payment.model.vo.PayMent;

/**
 * Servlet implementation class RefreshCoinServlet
 */
@WebServlet("/RefreshCoin.me")
public class RefreshCoinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RefreshCoinServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		Member loginUser = ((Member)session.getAttribute("loginUser"));
		String userCode = ((Member)session.getAttribute("loginUser")).getUserCode();
		PayMent payment1 = new PayMent(userCode);
		payment1 = new PaymentService().selectPayment(loginUser);
		
		
		response.setContentType("application/json; charset=UTF-8");
	    PrintWriter out = response.getWriter();
	    out.print(payment1.getPayAmount());
	    
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
