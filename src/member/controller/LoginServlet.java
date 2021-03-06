package member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.service.ManagerService;
import member.model.service.MemberService;
import member.model.vo.Manager;
import member.model.vo.Member;
import notice.model.service.NoticeService;
import notice.model.vo.Notice;
/*현호*/
import payment.model.vo.PayMent;
import payment.model.service.PaymentService;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet(name="LoginServlet", urlPatterns="/login.me")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String user_id = request.getParameter("user_id");
		String userPwd = request.getParameter("user_password");
		
		System.out.println(user_id + "/" + userPwd);
		
		Member member = new Member(user_id, userPwd);
		Member loginUser = new MemberService().loginMember(member);
		
		Manager manager = new Manager(user_id, userPwd);
		Manager loginManager = new ManagerService().loginManager(manager);
		
		int result = new MemberService().banlogin(user_id);
		
		/*현호*/
		PayMent payment = null;
		/*if(loginUser.getUserCode().substring(0, 1).equals("UC")) {
		payment = new PaymentService().selectPayment(loginUser);
		}*/
		
		
		
		response.setContentType("text/html; charset=UTF-8");
		
		
		if(result > 0) {
			request.setAttribute("msgA", "금지된 회원입니다.");
			RequestDispatcher view = request.getRequestDispatcher("views/member/ssj_loginForm.jsp");
			view.forward(request, response);
		} else if(loginUser != null) {
			HttpSession session = request.getSession();
			session = request.getSession();
			session.setMaxInactiveInterval(2400);  // 로그인 40분 유지
			session.setAttribute("loginUser", loginUser);
			/*현호*/
			payment = new PaymentService().selectPayment(loginUser);
			session.setAttribute("payment", payment);
			
			
			System.out.println("페이먼트가 제대로 들어옵니까?"+payment);
			
			
			
			
			String userCode = ((Member)session.getAttribute("loginUser")).getUserCode();
			NoticeService service = new NoticeService();
			
			
			ArrayList<Notice> list = service.selectNoticeListtwo(userCode);
			
			session.setAttribute("list", list);
			
			response.sendRedirect("index.jsp");
		} else if(loginManager != null) {
			HttpSession session = request.getSession();
			session.setMaxInactiveInterval(2400);  // 로그인 40분 유지
			session.setAttribute("loginManager", loginManager);
			
			response.sendRedirect("index.jsp");
		} else {
			request.setAttribute("msg", "가입하지 않은 아이디이거나, 잘못된 비밀번호입니다.");
			RequestDispatcher view = request.getRequestDispatcher("views/member/ssj_loginForm.jsp");
			view.forward(request, response);
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
