package artist.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import artist.model.service.ArtistService;
import artist.model.vo.ArtistRank;
import festival.model.vo.PageInfo;

/**
 * Servlet implementation class ArtistRankList
 */
@WebServlet("/list.atrank")
public class ArtistRankListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ArtistRankListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArtistService service = new ArtistService();
		
		int listCount = service.getArtistRankListCount();
		
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
		
		PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
		
		String genre = "전체 순위";
		if(request.getParameter("genre")!= null) {
			genre = request.getParameter("genre");
		}
		
		request.setAttribute("genre", genre);
		
		switch(genre) {
		case "전체 순위" : genre = "%%"; break;
		case "발라드 순위" : genre = "%발라드%"; break;
		case "댄스 순위" : genre = "%댄스%"; break;
		case "랩/힙합 순위" : genre = "%랩/힙합%"; break;
		case "ROCK 순위" : genre = "%ROCK%"; break;
		case "트로트 순위" : genre = "%트로트%"; break;
		case "기타 순위" : genre = "%기타%"; break;
		}
		
		ArrayList<ArtistRank> rList = service.selectAtRankList(currentPage, genre); 
		
		System.out.println("pi" + pi);
		System.out.println("rList" + rList);
		
		String page = null;
		if(rList != null) {
			page = "views/artist/ArtistRank.jsp";
			request.setAttribute("rList", rList);
			request.setAttribute("pi", pi);
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "아티스트 랭킹 조회에 실패하였습니다.");
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
