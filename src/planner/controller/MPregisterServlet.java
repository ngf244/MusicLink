package planner.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import artist.model.vo.Artist;
import festival.model.service.FestivalService;
import festival.model.vo.Festival;
import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class MPregisterServlet
 */
@WebServlet("/register.me")
public class MPregisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MPregisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		FestivalService service = new FestivalService();
		/*String usercode = request.getParameter("user_code");
		String userid = request.getParameter("user_id");
		String userpwd = request.getParameter("user_password");
		String userclass = request.getParameter("user_class");*/
		/*Member member = new Member(usercode, userid, userpwd, userclass);*/
		
		/*String user_id = request.getParameter("user_id");
		String userPwd = request.getParameter("user_password");*/
		
	/*	Member loginuser = new Member(usercode, userid, userpwd, userclass);
		
		Member member = new MemberService().loginMember(loginuser);*/
		
		ArrayList<Festival> fList = service.selectFList();
		
		
		String page = null;
		if(fList != null) {
			request.setAttribute("fList", fList);
			page = "views/planner/MaPage_Planner_1.jsp";
		} else {
			request.setAttribute("msg", "행사등록페이지 조회에실패하였습니다.");
			page = "views/common/errorPage.jsp";
		}
		
		request.getRequestDispatcher(page).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
