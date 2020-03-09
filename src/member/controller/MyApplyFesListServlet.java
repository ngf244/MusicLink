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

import festival.model.service.FestivalService;
import festival.model.vo.AppFestival;
import member.model.vo.Member;

/**
 * Servlet implementation class MyApplyFesListServlet
 */
@WebServlet("/list.mAppF")
public class MyApplyFesListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyApplyFesListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String userCode = ((Member)session.getAttribute("loginUser")).getUserCode();
		
		ArrayList<AppFestival> afList = new FestivalService().selectMyAppFesList(userCode);
		
		String page = null;
		if(afList != null) {
			page = "views/artist/ApplyFestival.jsp";
			request.setAttribute("afList", afList);
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "지원한 행사 리스트 조회에 실패하였습니다.");
		}
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
