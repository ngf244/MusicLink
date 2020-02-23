package artist.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import artist.model.service.ArtistService;

/**
 * Servlet implementation class ArtistUnFollowServlet
 */
@WebServlet("/unfollow.at")
public class ArtistUnFollowServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ArtistUnFollowServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userCode = request.getParameter("userCode");
		System.out.println("언팔기능을 수행할 아이디" + userCode);
		String[] atCodes = request.getParameterValues("atCode[]");
        
		int result = 0;
		
		for(String atCode : atCodes){
            System.out.println("언팔할 아티스트 코드" + atCode);
            result = new ArtistService().unfollowArtist(userCode, atCode);
        }
		
		String page = null;
		if(result > 0) {
			page = "/myPage.me";
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "게시판 수정에 실패하였습니다.");
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
