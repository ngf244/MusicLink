package artist.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import artist.model.service.ArtistService;
import artist.model.vo.Artist;

/**
 * Servlet implementation class ArtistDetailServlet
 */
@WebServlet("/detail.artist")
public class ArtistDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ArtistDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String atCode = request.getParameter("atCode");
		
		Artist artist = new ArtistService().selectArtistDetail(atCode);
		int count = new ArtistService().selectFollowCount(atCode);
		
		String page = null;
		if(artist != null) {
			page = "views/artist/ArtistDetail.jsp";
			request.setAttribute("artist", artist);
			request.setAttribute("count", count);
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "아티스트 상세 페이지 조회에 실패하였습니다.");
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
