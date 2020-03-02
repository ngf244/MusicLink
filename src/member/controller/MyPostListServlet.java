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

import QNA.model.service.QNAService;
import QNA.model.vo.QnA;
import community.model.service.CommunityService;
import community.model.vo.Community;
import festival.model.vo.PageInfo;
import gallery.model.service.GalleryService;
import gallery.model.vo.Gallery;
import member.model.vo.Member;

/**
 * Servlet implementation class MyPostListServlet
 */
@WebServlet("/list.mPost")
public class MyPostListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPostListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String userCode = ((Member)session.getAttribute("loginUser")).getUserCode();
		
		// 갤러리 게시판에 작성한 나의 게시물 가져오기
		GalleryService service = new GalleryService();
		
		int listCount = service.getMyPostListCount(userCode);
		
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

		limit = 3;
		
		maxPage = (int)((double)listCount/limit + 0.9);
		startPage = (((int)((double)currentPage/limit + 0.9)) - 1) * limit + 1;
		endPage = startPage + limit - 1;
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		PageInfo pigal = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
		ArrayList<Gallery> gList = service.selectMyGalleryList(currentPage, userCode);

		
		// QNA 게시판에 작성한 나의 게시물 가져오기
		QNAService qnaservice = new QNAService();
		
		int listCountqna = qnaservice.getMyQNAListCount(userCode);
		
		int currentPageqna; //현재 페이지 표시
		int limitqna; 		 //한 페이지에 표시될 페이지 수
		int maxPageqna; 	 //전체 페이지 중 가장 마지막 페이지
		int startPageqna; 	 //페이징 된 페이지 중 시작 페이지
		int endPageqna; 	 //페이징 된 페이지 중 마지막 페이지
		
		currentPageqna = 1;
		if(request.getParameter("currentPageqna") != null) {
			currentPageqna = Integer.parseInt(request.getParameter("currentPageqna"));
			//페이지 전환 시 전달 받은 페이지로 currentPage 적용
		}

		limitqna = 3;
		
		maxPageqna = (int)((double)listCountqna/limitqna + 0.9);
		startPageqna = (((int)((double)currentPageqna/limitqna + 0.9)) - 1) * limitqna + 1;
		endPageqna = startPageqna + limitqna - 1;
		if(maxPageqna < endPageqna) {
			endPageqna = maxPageqna;
		}
		
		PageInfo piqna = new PageInfo(currentPageqna, listCountqna, limitqna, maxPageqna, startPageqna, endPageqna);
		ArrayList<QnA> qList = qnaservice.selectMyQNAList(currentPageqna, userCode);

		// 소통 게시판에 작성한 나의 게시물 가져오기
		CommunityService commservice = new CommunityService();
		
		int listCountcomm = commservice.getMyCOMMListCount(userCode);
		
		int currentPagecomm; //현재 페이지 표시
		int limitcomm; 		 //한 페이지에 표시될 페이지 수
		int maxPagecomm; 	 //전체 페이지 중 가장 마지막 페이지
		int startPagecomm; 	 //페이징 된 페이지 중 시작 페이지
		int endPagecomm; 	 //페이징 된 페이지 중 마지막 페이지
		
		currentPagecomm = 1;
		if(request.getParameter("currentPagecomm") != null) {
			currentPagecomm = Integer.parseInt(request.getParameter("currentPagecomm"));
			//페이지 전환 시 전달 받은 페이지로 currentPage 적용
		}

		limitcomm = 3;
		
		maxPagecomm = (int)((double)listCountcomm/limitcomm + 0.9);
		startPagecomm = (((int)((double)currentPagecomm/limitcomm + 0.9)) - 1) * limitcomm + 1;
		endPagecomm = startPagecomm + limitcomm - 1;
		if(maxPagecomm < endPagecomm) {
			endPagecomm = maxPagecomm;
		}
		
		PageInfo picomm = new PageInfo(currentPagecomm, listCountcomm, limitcomm, maxPagecomm, startPagecomm, endPagecomm);
		ArrayList<Community> commList = commservice.selectMyCOMMList(currentPagecomm, userCode);
		
		String page = null;
		
		if(gList != null) {
			page = "views/member/MyPostView.jsp";
			request.setAttribute("gList", gList);
			request.setAttribute("pigal", pigal);
			request.setAttribute("qList", qList);
			request.setAttribute("piqna", piqna);
			request.setAttribute("commList", commList);
			request.setAttribute("picomm", picomm);
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "나의 게시물 조회에 실패하였습니다.");
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
