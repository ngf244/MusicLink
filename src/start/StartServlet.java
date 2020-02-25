package start;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import artist.model.service.ArtistService;
import artist.model.vo.Artist;

/**
 * Servlet implementation class StartServlet
 */
@WebServlet("/start.do")
public class StartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
  
	 /* @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArtistService service = new ArtistService();
		
		ArrayList<Artist> aList = service.selectAList();
		System.out.println(aList);
		String page = null;
		if(aList != null) {
			request.setAttribute("aList", aList);
			page = "index.jsp";
		} else {
			request.setAttribute("msg", "메인 조회에 실패하였습니다.");
			page = "views/common/errorPage.jsp";
		}
		
		
		request.getRequestDispatcher(page).forward(request, response);
		
		/*new Gson().toJson(aList, response.getWriter());*/
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
