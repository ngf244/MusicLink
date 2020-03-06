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
import member.model.vo.Member;

/**
 * Servlet implementation class FestivalApproachListServlet
 */
@WebServlet("/aplist.fes")
public class FestivalApproachListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FestivalApproachListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String searchType = "";
		String searchText = "";
		if(request.getParameter("searchText") != null) {
			searchType = request.getParameter("searchType");
			searchText = request.getParameter("searchText");
		}
		
		int category = 1;
		if(request.getParameter("category") != null) {
			category = Integer.parseInt(request.getParameter("category"));
		}
		
		FestivalService service = new FestivalService();
		
		int listCount = 0;
		if(searchText.equals("")) {
			listCount = service.getApListCount();
		} else {
			listCount = service.getApSearchListCount(searchType, searchText);
		}
		
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
		
		ArrayList<Festival> fArr = null;
		if(searchText.equals("")) {
			fArr = service.selectApList(currentPage, category);
		} else {
			fArr = service.selectApSearchList(currentPage, category, searchType, searchText);
		}
		
		String usercode = ((Member)request.getSession().getAttribute("loginUser")).getUserCode();
		ArrayList<String> userApList = service.selectUserApList(usercode);
		
		String page = null;
		if(fArr != null) {
			page = "views/festival/FestivalApproach.jsp";
			request.setAttribute("fArr", fArr);
			request.setAttribute("userApList", userApList);
			request.setAttribute("pi", pi);

			request.setAttribute("searchType", searchType);
			request.setAttribute("searchText", searchText);
			
			request.setAttribute("category", category);
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "행사 지원 리스트 조회에 실패하였습니다.");
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
