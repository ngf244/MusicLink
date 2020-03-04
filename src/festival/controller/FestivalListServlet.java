package festival.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedHashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import festival.model.service.FestivalService;
import festival.model.vo.Festival;
import festival.model.vo.PageInfo;

/**
 * Servlet implementation class FestivalListServlet
 */
@WebServlet("/list.fes")
public class FestivalListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FestivalListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int category = 0;
		if(request.getParameter("category") != null) {
			category = Integer.parseInt(request.getParameter("category"));
		}
		
		FestivalService service = new FestivalService();
		
		int listCount = service.getListCount(category);
		
		int currentPage; //현재 페이지 표시
		int limit; 		 //한 페이지에 표시될 페이지 수
		int maxPage; 	 //전체 페이지 중 가장 마지막 페이지
		int startPage; 	 //페이징 된 페이지 중 시작 페이지
		int endPage; 	 //페이징 된 페이지 중 마지막 페이지
		
		currentPage = 1;
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
			//페이지 전환 시 전달 받은 페이지로 currentPage 적용
		}
		
		limit = 10;
		
		maxPage = (int)((double)listCount/limit + 0.9);
		startPage = (((int)((double)currentPage/limit + 0.9)) - 1) * limit + 1;
		endPage = startPage + limit - 1;
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
		LinkedHashMap<Festival, ArrayList<String>> map = service.selectList(currentPage, category);
		
		LinkedHashMap<Festival, ArrayList<String>> banmap = service.selectRandomList(0);
		LinkedHashMap<Festival, ArrayList<String>> fulmap = service.selectRandomList(1);
		LinkedHashMap<Festival, ArrayList<String>> ingmap = service.selectRandomList(2);
		
		String page = null;
		if(map != null && banmap!= null) {
			page = "views/festival/FestivalList.jsp";
			request.setAttribute("map", map);
			request.setAttribute("pi", pi);
			
			request.setAttribute("banmap", banmap);
			request.setAttribute("fulmap", fulmap);
			request.setAttribute("ingmap", ingmap);
			request.setAttribute("category", category);
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "행사 리스트 조회에 실패하였습니다.");
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
