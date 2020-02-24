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

/**
 * Servlet implementation class FestivalDetailServlet
 */
@WebServlet("/detail.fes")
public class FestivalDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FestivalDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String fcode = request.getParameter("fcode");
		String status = request.getParameter("status");
		System.out.println(fcode);
		System.out.println(status);
		
		FestivalService service = new FestivalService();
		
		Festival festival = service.selectFestival(fcode);
		ArrayList<String> artistArr = service.findArtist(fcode);
		
		String page = null;
		if(festival != null) {
			request.setAttribute("festival", festival);
			request.setAttribute("artistArr", artistArr);
			
			if(status.equals("아티스트 모집 중")) {
				page = "views/festival/FestivalDetail_approach.jsp";
			} else {
				page = "views/festival/FestivalDetail_end.jsp";
			}
		} else {
			request.setAttribute("msg", "행사 상세보기에 실패하였습니다.");
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
