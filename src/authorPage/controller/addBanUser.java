package authorPage.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.mail.Session;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import authorPage.model.service.AuthorService;

/**
 * Servlet implementation class addBanUser
 */
@WebServlet("/addBanUser.ban")
public class addBanUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addBanUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		String restrictReason = request.getParameter("restrictReason");
		String restrictReasonDetail = request.getParameter("restrictReasonDetail");
		
		HttpSession session = request.getSession();
		String adminCode = (String)session.getAttribute("USER_CODE");
		
		String userCode = new AuthorService().getUserCode(userId);
		System.out.println("userCode : " + userCode);
		
		int result = new AuthorService().addBanUser(userCode, restrictReason, restrictReasonDetail, adminCode);
		System.out.println("result : " + result);
		int result2 = new AuthorService().changeUserStatus(userCode);
		System.out.println("result2 : " + result2);
		
		
		if(result > 0 && result2 > 0) {
			new AuthorService().deleteReport(userCode);
			response.sendRedirect("userBan.do");
		} else {
			System.out.println("ban 실패");
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
