package festival.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import festival.model.service.FestivalService;
import festival.model.vo.Festival;
import festival.model.vo.FestivalApply;

/**
 * Servlet implementation class FestivalApplyServlet
 */
@WebServlet("/festivalapply.me")
public class FestivalApplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FestivalApplyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		FestivalService service = new FestivalService();
		ArrayList<Festival> sList = service.selectFList();
		
		ArrayList<FestivalApply> apList = service.selectapplyList();   
		
		String page = null;
		if(sList != null) {
			request.setAttribute("apList", apList);
			page = "views/planner/PlannerOnepage.jsp";
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
