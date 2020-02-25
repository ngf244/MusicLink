package member.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;

/**
 * Servlet implementation class UpdateMemberServlet
 */
@WebServlet(name="UpdateMemberServlet", urlPatterns="/update.me")
public class UpdateMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateMemberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		System.out.println("이전 비밀번호 : " + userPwd);
		String newPwd = request.getParameter("newPwd");
		System.out.println("changePwd = " + newPwd);
		String userName = request.getParameter("userName");
		String userBirth = request.getParameter("userBirth");
		String gender = request.getParameter("gender");
		String userEmail = request.getParameter("userEmail");
		String userPhone = request.getParameter("userPhone");
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("id", userId);
		//map.put("old", userPwd);
		map.put("new", newPwd);
		map.put("name", userName);
		map.put("birth", userBirth);
		map.put("gender", gender);
		map.put("email", userEmail);
		map.put("phone", userPhone);
		
		int result = new MemberService().updateMember(map);
		
		if(result > 0) {
			response.sendRedirect("myPage.me");
		} else {
			request.setAttribute("msg", "회원정보 수정에 실패하였습니다.");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
