package festival.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import festival.model.service.FestivalService;
import festival.model.vo.Festival;

/**
 * Servlet implementation class FestivalUpdateServlet
 */
@WebServlet("/update.fes")
public class FestivalUpdateDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FestivalUpdateDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String fcode = request.getParameter("fcode");
		
		FestivalService service = new FestivalService();
		Festival festival = service.selectFestival(fcode);
		int artcount = service.selectArtistCount(fcode);

		String page = null;
		if(festival != null) {
			request.setAttribute("festival", festival);
			request.setAttribute("artcount", artcount);
			
			page = "views/festival/FestivalUpdate.jsp";
		} else {
			request.setAttribute("msg", "행사 수정의 데이터 조회에 실패하였습니다.");
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
