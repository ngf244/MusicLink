package artist.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import artist.model.service.ArtistService;
import member.model.vo.Member;

/**
 * Servlet implementation class AddArtistFollowServlet
 */
@WebServlet("/artistFollow.do")
public class AddArtistFollowServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddArtistFollowServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String artistCode = request.getParameter("artistCode");
		
		HttpSession session = request.getSession();
		
		Member m = (Member)session.getAttribute("loginUser");
		
		String followerCode = m.getUserCode();
		
		int result = new ArtistService().addArtistFollower(artistCode, followerCode);
		
		response.setCharacterEncoding("UTF-8");
		response.getWriter().println("팔로잉 성공");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
