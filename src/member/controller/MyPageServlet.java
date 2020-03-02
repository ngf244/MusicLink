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
import artist.model.service.ArtistService;
import artist.model.vo.Artist;
import artist.model.vo.FollowArtist;
import festival.model.vo.PageInfo;
import gallery.model.service.GalleryService;
import gallery.model.vo.Gallery;
import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class MyPageServlet
 */
@WebServlet("/myPage.me")
public class MyPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String loginUserId = ((Member)session.getAttribute("loginUser")).getUserId();
		String userCode = ((Member)session.getAttribute("loginUser")).getUserCode();
		
		Member member = new MemberService().selectMember(loginUserId);
		Artist artist = new ArtistService().selectArtist(userCode);
		//String fileName = (String)session.getAttribute("atFileName");
		String fileName = new ArtistService().selectArtistImg(userCode);
				
		System.out.println(member);
		// 메인뷰의 아티스트 리스트 
		ArtistService service = new ArtistService();
		
		int listCount = service.getFollowListCount(userCode);
		
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
		ArrayList<FollowArtist> list = service.selectFollowList(currentPage, userCode);
		
		ArrayList<Gallery> gList = new GalleryService().selectRecentMyGalList(userCode);		
		ArrayList<QnA> qList = new QNAService().selectRecentMyQnAList(userCode);
		System.out.println("나의 최근 qna리스트 : " + qList);
		String page = null;
		if(member != null) {
			page = "views/member/MypageMainView.jsp";
			request.setAttribute("member", member);
			request.setAttribute("artist", artist);
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);
			session.setAttribute("atFileName", fileName);
			request.setAttribute("gList", gList);
			request.setAttribute("qList", qList);
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "회원조회에 실패하였습니다.");
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
