package artist.controller;

import java.io.IOException;
import java.util.LinkedHashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import festival.model.service.FestivalService;
import festival.model.vo.Festival;
import member.model.vo.Member;

/**
 * Servlet implementation class ArtistMyScheduleListServlet
 */
@WebServlet("/list.mSche")
public class ArtistMyScheduleListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ArtistMyScheduleListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String userCode = ((Member)session.getAttribute("loginUser")).getUserCode();
		FestivalService service = new FestivalService();
		LinkedHashMap<Festival, Member> map = service.selectMySchedule(userCode);
		
		String page = null;
		if(map != null) {
			page = "views/artist/MySchedule.jsp";
			request.setAttribute("map", map);
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "나의 스케줄 조회에 실패하였습니다.");
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
