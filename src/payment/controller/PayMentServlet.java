package payment.controller;

import java.io.IOException;
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
 * Servlet implementation class PayMent
 */
@WebServlet("/payment.me")
public class PayMentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PayMentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pay = request.getParameter("price");
		
		HttpSession session = request.getSession();
	    String userCode = ((Member)session.getAttribute("loginUser")).getUserCode();
	    
	    PaymentService service = new PaymentService();
	    
	    PayMent pm1 = service.selectPayment(userCode);
	    
	    PayMent pm2 = service.UpdatePayment();
	    
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
