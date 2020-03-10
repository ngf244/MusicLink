package authorPage.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import authorPage.model.service.AuthorService;

/**
 * Servlet implementation class requestAccept_artist
 */
@WebServlet("/accept.at")
public class requestAccept extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public requestAccept() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userCode = request.getParameter("userCode");
		String where = request.getParameter("where");
		
		int result = new AuthorService().acceptJoin(userCode);
		int result2 = new AuthorService().changeUserClass(userCode, where);
		
		String page = "";
		
		if(result>0 && result2>0) {
			if(where.equals("art")) {
				page = "requestList.at";
			}
			else if(where.equals("com")) {
				page = "requestList.co";
			}
		} else {
			System.out.println("committed 변경 실패");
		}
		
		response.sendRedirect(page);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
