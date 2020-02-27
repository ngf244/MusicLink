package festival.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import festival.model.service.FestivalService;

/**
 * Servlet implementation class FestivalApproachServlet
 */
@WebServlet("/approachFes.do")
public class FestivalApproachServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FestivalApproachServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String usercode = request.getParameter("usercode");
		String fescode = request.getParameter("fescode");
		
		int result = new FestivalService().approachFestival(usercode, fescode);
		
		if(result > 0) {
			System.out.println(usercode + "님 " + fescode + "행사에 지원 완료");
		} else {
			System.out.println(usercode + "님 " + fescode + "행사에 지원 실패");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
