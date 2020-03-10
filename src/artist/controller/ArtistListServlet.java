package artist.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import artist.model.service.ArtistService;
import artist.model.vo.Artist;
import festival.model.vo.PageInfo;

/**
 * Servlet implementation class ArtistListServlet
 */
@WebServlet("/ArtistList.go")
public class ArtistListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ArtistListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArtistService service = new ArtistService(); // 두 개의 서비스를 호출할 것이기 때문에 참조변수로 생성
		
		int listCount = service.getListCount(); // 게시판 리스트 개수
		
		int currentPage;	// 현재 페이지 표시
		int limit;			// 한 페이지에 표시될 페이징 수
		int maxPage;		// 전체 페이지 중 가장 마지막 페이지
		int startPage;		// 페이징 된 페이지 중 시작 페이지
		int endPage;		// 페이징 된 페이지 중 마지막 페이지
		
		currentPage = 1;
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
			// 페이지 전환 시 전달 받은 페이지로 currentPage 적용
		}
		
		limit = 5;
		
		maxPage = (int)((double)listCount/limit + 0.9);
		startPage = (((int)((double)currentPage/limit + 0.9)) - 1) * limit + 1;
		endPage = startPage + limit - 1;
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
		
		String Genre = "전체";
		if(request.getParameter("Genre")!=null) {
			Genre = request.getParameter("Genre");
		}
		
		switch(Genre) {
		case "전체" : Genre = "%%"; break;
		case "댄스" : Genre = "%댄스%"; break;
		case "발라드" : Genre = "%발라드%"; break;
		case "랩/힙합" : Genre = "%랩/힙합%"; break;
		case "락" : Genre = "%락%"; break;
		case "트로트" : Genre = "%트로트%"; break;
		case "기타" : Genre = "%기타%"; break;
		}
		ArrayList<Artist> arr = service.getArtistList(currentPage, Genre);
		
		System.out.println(arr);
		
		String page = "views/artist/ArtistList.jsp";
		request.setAttribute("arr", arr);
		request.setAttribute("pi", pi);
		
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
